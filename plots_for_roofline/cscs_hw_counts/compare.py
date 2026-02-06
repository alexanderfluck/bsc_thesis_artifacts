import json
import sqlite3
from collections import defaultdict
from itertools import combinations
from pathlib import Path

JSON_FILE = Path(__file__).parent.resolve() / "bench_works.json"
EPYC_DB = Path(__file__).parent.resolve() /  "npbench_papi_metrics_epyc.db"
XEON_DB = Path(__file__).parent.resolve() /  "npbench_papi_metrics_xeon.db"

EPYC_EVENT = "PAPI_FP_OPS"
XEON_EVENT = "PAPI_DP_OPS"


def load_json_counts(path):
    with open(path, "r") as f:
        data = json.load(f)
    # Extract the "L" field
    return {bench: v["L"] for bench, v in data.items()}


def load_db_averages(db_path, event_name):
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    cur.execute(
        """
        SELECT benchmark, average
        FROM event_averages
        WHERE event_name = ?
        """,
        (event_name,),
    )

    results = {bench: avg for bench, avg in cur.fetchall()}
    conn.close()
    return results


def compare_values(json_counts, epyc_avgs, xeon_avgs):
    all_benchmarks = set(json_counts) | set(epyc_avgs) | set(xeon_avgs)

    all_three_equal = []
    two_equal = []
    all_different = []

    for bench in sorted(all_benchmarks):
        values = {
            "json": json_counts.get(bench),
            "epyc": epyc_avgs.get(bench),
            "xeon": xeon_avgs.get(bench),
        }

        # Skip if any value is missing
        if any(v is None for v in values.values()):
            continue

        unique_values = set(values.values())

        if len(unique_values) == 1:
            all_three_equal.append((bench, values))
        elif len(unique_values) == 2:
            two_equal.append((bench, values))
        else:
            all_different.append((bench, values))

    return all_three_equal, two_equal, all_different


def main():
    json_counts = load_json_counts(JSON_FILE)
    epyc_avgs = load_db_averages(EPYC_DB, EPYC_EVENT)
    xeon_avgs = load_db_averages(XEON_DB, XEON_EVENT)

    all_three_equal, two_equal, all_different = compare_values(
        json_counts, epyc_avgs, xeon_avgs
    )

    print("\n=== ALL THREE EQUAL (JSON = EPYC = XEON) ===")
    for bench, values in all_three_equal:
        print(f"{bench}: {values['json']}")

    print("\n=== TWO OF THREE EQUAL ===")
    for bench, values in two_equal:
        print(f"{bench}: json={values['json']}, epyc={values['epyc']}, xeon={values['xeon']}")

    print("\n=== ALL DIFFERENT ===")
    for bench, values in all_different:
        print(f"{bench}: json={values['json']}, epyc={values['epyc']}, xeon={values['xeon']}")

    print("\nSummary:")
    print(f"  All three equal: {len(all_three_equal)}")
    print(f"  Two equal:       {len(two_equal)}")
    print(f"  All different:   {len(all_different)}")


if __name__ == "__main__":
    main()
