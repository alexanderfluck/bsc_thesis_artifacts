// matmul_papi.cpp
// Compile: g++ -O3 -fopenmp matmul_papi.cpp -lpapi -o matmul_papi
// Run: ./matmul_papi [N] [num_threads]
// Example: ./matmul_papi 1500 8

#include <iostream>
#include <vector>
#include <random>
#include <cstdlib>
#include <chrono>
#include <cstring>
#include <iomanip>
#include <unistd.h>

#include <papi.h>
#include <omp.h>

#include <pthread.h>
#include <sched.h>

void matmul_kernel(std::vector<double>&, std::vector<double>&, std::vector<double>&, int, int);
void matmul_kernel_single_threaded(std::vector<double>&, std::vector<double>&, std::vector<double>&, int);

int main(int argc, char** argv) {

    // Initialize PAPI
    int retval = PAPI_library_init(PAPI_VER_CURRENT);
    if (retval != PAPI_VER_CURRENT && retval > 0) {
        std::cerr << "PAPI library version mismatch: " << retval << std::endl;
        return 1;
    } else if (retval < 0) {
        std::cerr << "PAPI_library_init error: " << PAPI_strerror(retval) << std::endl;
        return 1;
    }

    // Register OpenMP thread id function (cast is safe for this purpose)
    (void)PAPI_thread_init((unsigned long (*)(void)) (uintptr_t) omp_get_thread_num);

    // Events: floating point ops, total instructions, total cycles
    long N = 1024;

       // Contiguous matrices (row-major)
    std::vector<double> A(N * N);
    std::vector<double> B(N * N);
    std::vector<double> C(N * N);

    auto idx = [N](std::size_t i, std::size_t j) {
        return i * N + j;
    };

    // Random generator
    std::mt19937 rng(42);
    std::uniform_real_distribution<double> dist(0.0, 1.0);

    // Fill matrices
    for (std::size_t i = 0; i < N; ++i) {
        for (std::size_t j = 0; j < N; ++j) {
            A[idx(i,j)] = dist(rng);
            B[idx(i,j)] = dist(rng);
            C[idx(i,j)] = dist(rng);
        }
    }

    int max_threads = 8;
    int event_sets[max_threads];
    std::vector<std::string> events = {"PAPI_FP_OPS"};
    int nevents = events.size();
    #pragma omp parallel num_threads(max_threads)
    {   
        int EventSet = PAPI_NULL;
        int tretval = PAPI_create_eventset(&EventSet);
        if (tretval != PAPI_OK){
            std::cerr << "PAPI error: " << "Create EventSet" << " -> " << PAPI_strerror(tretval) << std::endl;
            std::exit(EXIT_FAILURE);
        }
        event_sets[omp_get_thread_num()] = EventSet;
        for (int i = 0; i < nevents; ++i) {
            tretval = PAPI_add_named_event(EventSet, events[i].c_str());
            if (tretval != PAPI_OK) {
                // If some event isn't available, print a warning and continue (but exit if critical)
                std::cerr << "Warning: PAPI_add_event failed for event " << i
                        << " (" << PAPI_strerror(tretval) << ").\n";
            }
        }
    }
    #pragma omp parallel num_threads(max_threads)
    {
        PAPI_start(event_sets[omp_get_thread_num()]);
    }

    matmul_kernel(A, B, C, N, max_threads);

    long long sum = 0;
    // Stop counters
    #pragma omp parallel num_threads(max_threads)
    {
        int EventSet = event_sets[omp_get_thread_num()];
        long long counts[nevents];
        int tretval = PAPI_stop(EventSet, counts);
        if (tretval != PAPI_OK){
            std::cerr << "PAPI error: " << "Stop Counters" << " -> " << PAPI_strerror(tretval) << std::endl;
            std::exit(EXIT_FAILURE);
        }
        tretval = PAPI_cleanup_eventset(EventSet);
        if (tretval != PAPI_OK) {
            std::cerr << "Warning: PAPI_cleanup_eventset: " << PAPI_strerror(tretval) << "\\n";
        }
        tretval = PAPI_destroy_eventset(&EventSet);
        if (tretval != PAPI_OK) {
            std::cerr << "Warning: PAPI_destroy_eventset: " << PAPI_strerror(tretval) << "\\n";
        }
        #pragma omp critical
        {
            std::cout<< "Thread "<< omp_get_thread_num();
            for(int i = 0; i<nevents; i++){
                //char buff[1024] = {{0}}; 
                //PAPI_event_code_to_name(events[i], buff);
                //std::string event_name(buff);
                std::cout << " " << events[i] <<": "<< counts[i] <<"\n";
            }
            sum+=counts[0];

        }
    }

    std::cout << std::fixed << std::setprecision(6);
    std::cout << "=========== Total ("<< max_threads <<"threads): "<< sum<< std::endl;
    std::cout << "=========== expected total:" << N*N*N*2<< std::endl;

    /////////////////////////////////////////// SECOND RUN /////////////////////////////////////////////////////
    #pragma omp parallel num_threads(max_threads)
    {   
        int EventSet = PAPI_NULL;
        int tretval = PAPI_create_eventset(&EventSet);
        if (tretval != PAPI_OK){
            std::cerr << "PAPI error: " << "Create EventSet" << " -> " << PAPI_strerror(tretval) << std::endl;
            std::exit(EXIT_FAILURE);
        }
        event_sets[omp_get_thread_num()] = EventSet;
        for (int i = 0; i < nevents; ++i) {
            tretval = PAPI_add_named_event(EventSet, events[i].c_str());
            if (tretval != PAPI_OK) {
                // If some event isn't available, print a warning and continue (but exit if critical)
                std::cerr << "Warning: PAPI_add_event failed for event " << i
                        << " (" << PAPI_strerror(tretval) << ").\n";
            }
        }
    }
    
    #pragma omp parallel num_threads(max_threads)
    {
        PAPI_start(event_sets[omp_get_thread_num()]);
    }

    matmul_kernel_single_threaded(A, B, C, N);

    sum = 0;
    // Stop counters
    #pragma omp parallel num_threads(max_threads)
    {
        int EventSet = event_sets[omp_get_thread_num()];
        long long counts[nevents];
        int tretval = PAPI_stop(EventSet, counts);
        if (tretval != PAPI_OK){
            std::cerr << "PAPI error: " << "Stop Counters" << " -> " << PAPI_strerror(tretval) << std::endl;
            std::exit(EXIT_FAILURE);
        }
        tretval = PAPI_cleanup_eventset(EventSet);
        if (tretval != PAPI_OK) {
            std::cerr << "Warning: PAPI_cleanup_eventset: " << PAPI_strerror(tretval) << "\\n";
        }
        tretval = PAPI_destroy_eventset(&EventSet);
        if (tretval != PAPI_OK) {
            std::cerr << "Warning: PAPI_destroy_eventset: " << PAPI_strerror(tretval) << "\\n";
        }
        #pragma omp critical
        {
            std::cout<< "Thread "<< omp_get_thread_num();
            for(int i = 0; i<nevents; i++){
                //char buff[1024] = {{0}}; 
                //PAPI_event_code_to_name(events[i], buff);
                //std::string event_name(buff);
                std::cout << " " << events[i] <<": "<< counts[i] <<"\n";
            }
            sum+=counts[0];

        }
    }

    std::cout << "=========== Total (single threaded): "<< sum<< std::endl;
    std::cout << "=========== expected total:" << N*N*N*2 << std::endl;

    PAPI_shutdown();

    // Avoid optimizer removing C usage
    double check = 0.0;
    if (check == 0.0) std::cout << "\n"; // nothing

    return 0;
}


__attribute__((noinline))
void matmul_kernel(std::vector<double>& A, std::vector<double>& B, std::vector<double>& C, int N, int max_threads) {
    #pragma omp parallel for num_threads(max_threads)
    for (int i = 0; i < N; ++i) {
        for (int k = 0; k < N; ++k) {
            double a_ik = A[(size_t)i * N + k];
            size_t row_offset = (size_t)i * N;
            size_t b_offset   = (size_t)k * N;
            for (int j = 0; j < N; ++j) {
                C[row_offset + j] += a_ik * B[b_offset + j];
            }
        }
    }
}

__attribute__((noinline))
void matmul_kernel_single_threaded(std::vector<double>& A, std::vector<double>& B, std::vector<double>& C, int N) {
    for (int i = 0; i < N; ++i) {
        for (int k = 0; k < N; ++k) {
            double a_ik = A[(size_t)i * N + k];
            size_t row_offset = (size_t)i * N;
            size_t b_offset   = (size_t)k * N;
            for (int j = 0; j < N; ++j) {
                C[row_offset + j] += a_ik * B[b_offset + j];
            }
        }
    }
}