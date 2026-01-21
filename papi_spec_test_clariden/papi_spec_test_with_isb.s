	.arch armv8-a
	.file	"papi_spec_test.cpp"
	.text
	.section	.text._ZnwmPv,"axG",@progbits,_ZnwmPv,comdat
	.align	2
	.weak	_ZnwmPv
	.type	_ZnwmPv, %function
_ZnwmPv:
.LFB41:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp]
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE41:
	.size	_ZnwmPv, .-_ZnwmPv
	.section	.text._ZdlPvS_,"axG",@progbits,_ZdlPvS_,comdat
	.align	2
	.weak	_ZdlPvS_
	.type	_ZdlPvS_, %function
_ZdlPvS_:
.LFB43:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE43:
	.size	_ZdlPvS_, .-_ZdlPvS_
	.section	.text._ZNSt11char_traitsIcE6lengthEPKc,"axG",@progbits,_ZNSt11char_traitsIcE6lengthEPKc,comdat
	.align	2
	.weak	_ZNSt11char_traitsIcE6lengthEPKc
	.type	_ZNSt11char_traitsIcE6lengthEPKc, %function
_ZNSt11char_traitsIcE6lengthEPKc:
.LFB116:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	mov	w0, 0
	and	w0, w0, 1
	cmp	w0, 0
	beq	.L6
	ldr	x0, [sp, 24]
	bl	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	b	.L7
.L6:
	ldr	x0, [sp, 24]
	bl	strlen
	nop
.L7:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE116:
	.size	_ZNSt11char_traitsIcE6lengthEPKc, .-_ZNSt11char_traitsIcE6lengthEPKc
	.section	.text._ZSt17__size_to_integerm,"axG",@progbits,_ZSt17__size_to_integerm,comdat
	.align	2
	.weak	_ZSt17__size_to_integerm
	.type	_ZSt17__size_to_integerm, %function
_ZSt17__size_to_integerm:
.LFB659:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE659:
	.size	_ZSt17__size_to_integerm, .-_ZSt17__size_to_integerm
	.section	.text._ZStanSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStanSt13_Ios_FmtflagsS_,comdat
	.align	2
	.weak	_ZStanSt13_Ios_FmtflagsS_
	.type	_ZStanSt13_Ios_FmtflagsS_, %function
_ZStanSt13_Ios_FmtflagsS_:
.LFB1596:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]
	str	w1, [sp, 8]
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 8]
	and	w0, w1, w0
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1596:
	.size	_ZStanSt13_Ios_FmtflagsS_, .-_ZStanSt13_Ios_FmtflagsS_
	.section	.text._ZStorSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStorSt13_Ios_FmtflagsS_,comdat
	.align	2
	.weak	_ZStorSt13_Ios_FmtflagsS_
	.type	_ZStorSt13_Ios_FmtflagsS_, %function
_ZStorSt13_Ios_FmtflagsS_:
.LFB1597:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]
	str	w1, [sp, 8]
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 8]
	orr	w0, w1, w0
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1597:
	.size	_ZStorSt13_Ios_FmtflagsS_, .-_ZStorSt13_Ios_FmtflagsS_
	.section	.text._ZStcoSt13_Ios_Fmtflags,"axG",@progbits,_ZStcoSt13_Ios_Fmtflags,comdat
	.align	2
	.weak	_ZStcoSt13_Ios_Fmtflags
	.type	_ZStcoSt13_Ios_Fmtflags, %function
_ZStcoSt13_Ios_Fmtflags:
.LFB1599:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]
	ldr	w0, [sp, 12]
	mvn	w0, w0
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1599:
	.size	_ZStcoSt13_Ios_Fmtflags, .-_ZStcoSt13_Ios_Fmtflags
	.section	.text._ZStoRRSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStoRRSt13_Ios_FmtflagsS_,comdat
	.align	2
	.weak	_ZStoRRSt13_Ios_FmtflagsS_
	.type	_ZStoRRSt13_Ios_FmtflagsS_, %function
_ZStoRRSt13_Ios_FmtflagsS_:
.LFB1600:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	str	w1, [sp, 20]
	ldr	x0, [sp, 24]
	ldr	w0, [x0]
	ldr	w1, [sp, 20]
	bl	_ZStorSt13_Ios_FmtflagsS_
	mov	w1, w0
	ldr	x0, [sp, 24]
	str	w1, [x0]
	ldr	x0, [sp, 24]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1600:
	.size	_ZStoRRSt13_Ios_FmtflagsS_, .-_ZStoRRSt13_Ios_FmtflagsS_
	.section	.text._ZStaNRSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStaNRSt13_Ios_FmtflagsS_,comdat
	.align	2
	.weak	_ZStaNRSt13_Ios_FmtflagsS_
	.type	_ZStaNRSt13_Ios_FmtflagsS_, %function
_ZStaNRSt13_Ios_FmtflagsS_:
.LFB1601:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	str	w1, [sp, 20]
	ldr	x0, [sp, 24]
	ldr	w0, [x0]
	ldr	w1, [sp, 20]
	bl	_ZStanSt13_Ios_FmtflagsS_
	mov	w1, w0
	ldr	x0, [sp, 24]
	str	w1, [x0]
	ldr	x0, [sp, 24]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1601:
	.size	_ZStaNRSt13_Ios_FmtflagsS_, .-_ZStaNRSt13_Ios_FmtflagsS_
	.section	.text._ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_,"axG",@progbits,_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_,comdat
	.align	2
	.weak	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_
	.type	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_, %function
_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_:
.LFB1630:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	w1, [sp, 20]
	str	w2, [sp, 16]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 24]
	str	w0, [sp, 44]
	ldr	w0, [sp, 16]
	bl	_ZStcoSt13_Ios_Fmtflags
	mov	w1, w0
	ldr	x0, [sp, 24]
	add	x0, x0, 24
	bl	_ZStaNRSt13_Ios_FmtflagsS_
	ldr	w1, [sp, 16]
	ldr	w0, [sp, 20]
	bl	_ZStanSt13_Ios_FmtflagsS_
	mov	w1, w0
	ldr	x0, [sp, 24]
	add	x0, x0, 24
	bl	_ZStoRRSt13_Ios_FmtflagsS_
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1630:
	.size	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_, .-_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_
	.section	.text._ZSt5fixedRSt8ios_base,"axG",@progbits,_ZSt5fixedRSt8ios_base,comdat
	.align	2
	.weak	_ZSt5fixedRSt8ios_base
	.type	_ZSt5fixedRSt8ios_base, %function
_ZSt5fixedRSt8ios_base:
.LFB1660:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	mov	w2, 260
	mov	w1, 4
	ldr	x0, [sp, 24]
	bl	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_
	ldr	x0, [sp, 24]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1660:
	.size	_ZSt5fixedRSt8ios_base, .-_ZSt5fixedRSt8ios_base
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.section	.text._ZSt3loge,"axG",@progbits,_ZSt3loge,comdat
	.align	2
	.weak	_ZSt3loge
	.type	_ZSt3loge, %function
_ZSt3loge:
.LFB2432:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	q0, [sp, 16]
	ldr	q0, [sp, 16]
	bl	logl
	mov	v30.16b, v0.16b
	mov	v0.16b, v30.16b
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2432:
	.size	_ZSt3loge, .-_ZSt3loge
	.section	.text._ZSt12setprecisioni,"axG",@progbits,_ZSt12setprecisioni,comdat
	.align	2
	.weak	_ZSt12setprecisioni
	.type	_ZSt12setprecisioni, %function
_ZSt12setprecisioni:
.LFB4070:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]
	ldr	w0, [sp, 12]
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4070:
	.size	_ZSt12setprecisioni, .-_ZSt12setprecisioni
	.text
	.align	2
	.type	_ZZ4mainENKUlmmE_clEmm, %function
_ZZ4mainENKUlmmE_clEmm:
.LFB4089:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	str	x2, [sp, 8]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [sp, 16]
	mul	x1, x1, x0
	ldr	x0, [sp, 8]
	add	x0, x1, x0
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4089:
	.size	_ZZ4mainENKUlmmE_clEmm, .-_ZZ4mainENKUlmmE_clEmm
	.section	.rodata
	.align	3
.LC0:
	.string	"PAPI library version mismatch: "
	.align	3
.LC1:
	.string	"PAPI_library_init error: "
	.align	3
.LC2:
	.string	"PAPI_FP_OPS"
	.align	3
.LC3:
	.string	"=========== Total ("
	.align	3
.LC4:
	.string	"threads): "
	.align	3
.LC5:
	.string	"=========== expected total:"
	.align	3
.LC6:
	.string	"=========== Total (single threaded): "
	.align	3
.LC7:
	.string	"\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB4088:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4088
	mov	x12, 5552
	sub	sp, sp, x12
	.cfi_def_cfa_offset 5552
	stp	x29, x30, [sp]
	.cfi_offset 29, -5552
	.cfi_offset 30, -5544
	mov	x29, sp
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	d15, [sp, 96]
	.cfi_offset 19, -5536
	.cfi_offset 20, -5528
	.cfi_offset 21, -5520
	.cfi_offset 22, -5512
	.cfi_offset 23, -5504
	.cfi_offset 24, -5496
	.cfi_offset 25, -5488
	.cfi_offset 26, -5480
	.cfi_offset 27, -5472
	.cfi_offset 28, -5464
	.cfi_offset 79, -5456
	str	w0, [x29, 124]
	str	x1, [x29, 112]
	mov	x0, sp
	mov	x28, x0
	mov	w0, 117637120
.LEHB0:
	bl	PAPI_library_init
	str	w0, [x29, 5532]
	ldr	w1, [x29, 5532]
	mov	w0, 117637120
	cmp	w1, w0
	beq	.L31
	ldr	w0, [x29, 5532]
	cmp	w0, 0
	ble	.L31
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [x29, 5532]
	bl	_ZNSolsEi
	mov	x2, x0
	adrp	x0, _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	add	x1, x0, :lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w19, 1
	b	.L32
.L31:
	ldr	w0, [x29, 5532]
	cmp	w0, 0
	bge	.L33
	adrp	x0, .LC1
	add	x1, x0, :lo12:.LC1
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldr	w0, [x29, 5532]
	bl	PAPI_strerror
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	add	x1, x0, :lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w19, 1
	b	.L32
.L33:
	adrp	x0, omp_get_thread_num
	add	x0, x0, :lo12:omp_get_thread_num
	bl	PAPI_thread_init
.LEHE0:
	mov	x0, 1024
	str	x0, [x29, 5520]
	ldr	x0, [x29, 5520]
	mul	x0, x0, x0
	mov	x3, x0
	add	x0, x29, 4096
	add	x0, x0, 1288
	str	x0, [x29, 5464]
	nop
	nop
	add	x1, x29, 4096
	add	x1, x1, 1288
	add	x0, x29, 4096
	add	x0, x0, 1136
	mov	x2, x1
	mov	x1, x3
.LEHB1:
	bl	_ZNSt6vectorIdSaIdEEC1EmRKS0_
.LEHE1:
	add	x0, x29, 4096
	add	x0, x0, 1288
	bl	_ZNSt15__new_allocatorIdED2Ev
	nop
	ldr	x0, [x29, 5520]
	mul	x0, x0, x0
	mov	x3, x0
	add	x0, x29, 4096
	add	x0, x0, 1296
	str	x0, [x29, 5456]
	nop
	nop
	add	x1, x29, 4096
	add	x1, x1, 1296
	add	x0, x29, 4096
	add	x0, x0, 1112
	mov	x2, x1
	mov	x1, x3
.LEHB2:
	bl	_ZNSt6vectorIdSaIdEEC1EmRKS0_
.LEHE2:
	add	x0, x29, 4096
	add	x0, x0, 1296
	bl	_ZNSt15__new_allocatorIdED2Ev
	nop
	ldr	x0, [x29, 5520]
	mul	x0, x0, x0
	mov	x3, x0
	add	x0, x29, 4096
	add	x0, x0, 1304
	str	x0, [x29, 5448]
	nop
	nop
	add	x1, x29, 4096
	add	x1, x1, 1304
	add	x0, x29, 4096
	add	x0, x0, 1088
	mov	x2, x1
	mov	x1, x3
.LEHB3:
	bl	_ZNSt6vectorIdSaIdEEC1EmRKS0_
.LEHE3:
	add	x0, x29, 4096
	add	x0, x0, 1304
	bl	_ZNSt15__new_allocatorIdED2Ev
	nop
	ldr	x0, [x29, 5520]
	str	x0, [x29, 5176]
	add	x0, x29, 176
	mov	x1, 42
.LEHB4:
	bl	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEC1Em
	add	x0, x29, 160
	fmov	d1, 1.0e+0
	movi	d0, #0
	bl	_ZNSt25uniform_real_distributionIdEC1Edd
	str	xzr, [x29, 5544]
	b	.L34
.L37:
	str	xzr, [x29, 5536]
	b	.L35
.L36:
	add	x1, x29, 176
	add	x0, x29, 160
	bl	_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_
	fmov	d15, d0
	add	x0, x29, 4096
	add	x0, x0, 1080
	ldr	x2, [x29, 5536]
	ldr	x1, [x29, 5544]
	bl	_ZZ4mainENKUlmmE_clEmm
	mov	x1, x0
	add	x0, x29, 4096
	add	x0, x0, 1136
	bl	_ZNSt6vectorIdSaIdEEixEm
	str	d15, [x0]
	add	x1, x29, 176
	add	x0, x29, 160
	bl	_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_
	fmov	d15, d0
	add	x0, x29, 4096
	add	x0, x0, 1080
	ldr	x2, [x29, 5536]
	ldr	x1, [x29, 5544]
	bl	_ZZ4mainENKUlmmE_clEmm
	mov	x1, x0
	add	x0, x29, 4096
	add	x0, x0, 1112
	bl	_ZNSt6vectorIdSaIdEEixEm
	str	d15, [x0]
	add	x1, x29, 176
	add	x0, x29, 160
	bl	_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_
.LEHE4:
	fmov	d15, d0
	add	x0, x29, 4096
	add	x0, x0, 1080
	ldr	x2, [x29, 5536]
	ldr	x1, [x29, 5544]
	bl	_ZZ4mainENKUlmmE_clEmm
	mov	x1, x0
	add	x0, x29, 4096
	add	x0, x0, 1088
	bl	_ZNSt6vectorIdSaIdEEixEm
	str	d15, [x0]
	ldr	x0, [x29, 5536]
	add	x0, x0, 1
	str	x0, [x29, 5536]
.L35:
	ldr	x0, [x29, 5520]
	ldr	x1, [x29, 5536]
	cmp	x1, x0
	bcc	.L36
	ldr	x0, [x29, 5544]
	add	x0, x0, 1
	str	x0, [x29, 5544]
.L34:
	ldr	x0, [x29, 5520]
	ldr	x1, [x29, 5544]
	cmp	x1, x0
	bcc	.L37
	mov	w0, 8
	str	w0, [x29, 5516]
	ldr	w0, [x29, 5516]
	sxtw	x1, w0
	sub	x1, x1, #1
	str	x1, [x29, 5504]
	sxtw	x1, w0
	mov	x22, x1
	mov	x23, 0
	lsr	x1, x22, 59
	lsl	x27, x23, 5
	orr	x27, x1, x27
	lsl	x26, x22, 5
	sxtw	x1, w0
	mov	x20, x1
	mov	x21, 0
	lsr	x1, x20, 59
	lsl	x25, x21, 5
	orr	x25, x1, x25
	lsl	x24, x20, 5
	sxtw	x0, w0
	lsl	x0, x0, 2
	add	x0, x0, 15
	lsr	x0, x0, 4
	lsl	x0, x0, 4
	sub	sp, sp, x0
	mov	x0, sp
	add	x0, x0, 3
	lsr	x0, x0, 2
	lsl	x0, x0, 2
	str	x0, [x29, 5496]
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	str	x0, [x29, 5408]
	add	x0, x29, 4096
	add	x0, x0, 1312
	add	x0, x0, 8
	add	x1, x29, 4096
	add	x1, x1, 1320
	str	x1, [x29, 5440]
	nop
	nop
	add	x2, x29, 4096
	add	x2, x2, 1320
	add	x1, x29, 4096
	add	x1, x1, 1312
	add	x4, x29, 136
	mov	x3, x2
	mov	x2, x0
	mov	x0, x4
.LEHB5:
	bl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_
.LEHE5:
	add	x0, x29, 4096
	add	x0, x0, 1320
	bl	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED2Ev
	nop
	add	x0, x29, 136
	bl	_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE4sizeEv
	str	w0, [x29, 5492]
	ldr	w1, [x29, 5516]
	ldr	x0, [x29, 5496]
	str	x0, [x29, 5264]
	ldr	w0, [x29, 5492]
	str	w0, [x29, 5272]
	add	x0, x29, 136
	str	x0, [x29, 5256]
	add	x0, x29, 4096
	add	x0, x0, 1160
	mov	w3, 0
	mov	w2, w1
	mov	x1, x0
	adrp	x0, main._omp_fn.0
	add	x0, x0, :lo12:main._omp_fn.0
	bl	GOMP_parallel
	ldr	w1, [x29, 5516]
	ldr	x0, [x29, 5496]
	str	x0, [x29, 5280]
	add	x0, x29, 4096
	add	x0, x0, 1184
	mov	w3, 0
	mov	w2, w1
	mov	x1, x0
	adrp	x0, main._omp_fn.1
	add	x0, x0, :lo12:main._omp_fn.1
	bl	GOMP_parallel
	ldr	x0, [x29, 5520]
	mov	w3, w0
	add	x2, x29, 4096
	add	x2, x2, 1088
	add	x1, x29, 4096
	add	x1, x1, 1112
	add	x0, x29, 4096
	add	x0, x0, 1136
	ldr	w4, [x29, 5516]
	bl	_Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii
	str	xzr, [x29, 5480]
	ldr	w1, [x29, 5516]
	ldr	x0, [x29, 5496]
	str	x0, [x29, 5304]
	ldr	w0, [x29, 5492]
	str	w0, [x29, 5312]
	add	x0, x29, 136
	str	x0, [x29, 5288]
	ldr	x0, [x29, 5480]
	str	x0, [x29, 5296]
	add	x0, x29, 4096
	add	x0, x0, 1192
	mov	w3, 0
	mov	w2, w1
	mov	x1, x0
	adrp	x0, main._omp_fn.2
	add	x0, x0, :lo12:main._omp_fn.2
	bl	GOMP_parallel
	ldr	x0, [x29, 5296]
	str	x0, [x29, 5480]
	adrp	x0, _ZSt5fixedRSt8ios_base
	add	x1, x0, :lo12:_ZSt5fixedRSt8ios_base
	adrp	x0, _ZSt4cout
	add	x0, x0, :lo12:_ZSt4cout
.LEHB6:
	bl	_ZNSolsEPFRSt8ios_baseS0_E
	mov	x19, x0
	mov	w0, 6
	bl	_ZSt12setprecisioni
	mov	w1, w0
	mov	x0, x19
	bl	_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St13_Setprecision
	adrp	x0, .LC3
	add	x1, x0, :lo12:.LC3
	adrp	x0, _ZSt4cout
	add	x0, x0, :lo12:_ZSt4cout
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [x29, 5516]
	bl	_ZNSolsEi
	mov	x2, x0
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	x1, [x29, 5480]
	bl	_ZNSolsEx
	mov	x2, x0
	adrp	x0, _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	add	x1, x0, :lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	adrp	x0, _ZSt4cout
	add	x0, x0, :lo12:_ZSt4cout
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	ldr	x0, [x29, 5520]
	mul	x1, x0, x0
	ldr	x0, [x29, 5520]
	mul	x0, x1, x0
	lsl	x0, x0, 1
	mov	x1, x0
	mov	x0, x2
	bl	_ZNSolsEl
	mov	x2, x0
	adrp	x0, _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	add	x1, x0, :lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	ldr	w1, [x29, 5516]
	ldr	x0, [x29, 5496]
	str	x0, [x29, 5328]
	ldr	w0, [x29, 5492]
	str	w0, [x29, 5336]
	add	x0, x29, 136
	str	x0, [x29, 5320]
	add	x0, x29, 4096
	add	x0, x0, 1224
	mov	w3, 0
	mov	w2, w1
	mov	x1, x0
	adrp	x0, main._omp_fn.3
	add	x0, x0, :lo12:main._omp_fn.3
	bl	GOMP_parallel
	ldr	w1, [x29, 5516]
	ldr	x0, [x29, 5496]
	str	x0, [x29, 5344]
	add	x0, x29, 4096
	add	x0, x0, 1248
	mov	w3, 0
	mov	w2, w1
	mov	x1, x0
	adrp	x0, main._omp_fn.4
	add	x0, x0, :lo12:main._omp_fn.4
	bl	GOMP_parallel
	ldr	x0, [x29, 5520]
	mov	w3, w0
	add	x2, x29, 4096
	add	x2, x2, 1088
	add	x1, x29, 4096
	add	x1, x1, 1112
	add	x0, x29, 4096
	add	x0, x0, 1136
	bl	_Z29matmul_kernel_single_threadedRSt6vectorIdSaIdEES2_S2_i
	str	xzr, [x29, 5480]
	ldr	w1, [x29, 5516]
	ldr	x0, [x29, 5496]
	str	x0, [x29, 5368]
	ldr	w0, [x29, 5492]
	str	w0, [x29, 5376]
	add	x0, x29, 136
	str	x0, [x29, 5352]
	ldr	x0, [x29, 5480]
	str	x0, [x29, 5360]
	add	x0, x29, 4096
	add	x0, x0, 1256
	mov	w3, 0
	mov	w2, w1
	mov	x1, x0
	adrp	x0, main._omp_fn.5
	add	x0, x0, :lo12:main._omp_fn.5
	bl	GOMP_parallel
	ldr	x0, [x29, 5360]
	str	x0, [x29, 5480]
	adrp	x0, .LC6
	add	x1, x0, :lo12:.LC6
	adrp	x0, _ZSt4cout
	add	x0, x0, :lo12:_ZSt4cout
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	x1, [x29, 5480]
	bl	_ZNSolsEx
	mov	x2, x0
	adrp	x0, _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	add	x1, x0, :lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	adrp	x0, _ZSt4cout
	add	x0, x0, :lo12:_ZSt4cout
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	ldr	x0, [x29, 5520]
	mul	x1, x0, x0
	ldr	x0, [x29, 5520]
	mul	x0, x1, x0
	lsl	x0, x0, 1
	mov	x1, x0
	mov	x0, x2
	bl	_ZNSolsEl
	mov	x2, x0
	adrp	x0, _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	add	x1, x0, :lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	bl	PAPI_shutdown
	str	xzr, [x29, 5472]
	ldr	d31, [x29, 5472]
	fcmp	d31, #0.0
	bne	.L38
	adrp	x0, .LC7
	add	x1, x0, :lo12:.LC7
	adrp	x0, _ZSt4cout
	add	x0, x0, :lo12:_ZSt4cout
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
.LEHE6:
.L38:
	mov	w19, 0
	add	x0, x29, 136
	bl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
	add	x0, x29, 4096
	add	x0, x0, 1088
	bl	_ZNSt6vectorIdSaIdEED1Ev
	add	x0, x29, 4096
	add	x0, x0, 1112
	bl	_ZNSt6vectorIdSaIdEED1Ev
	add	x0, x29, 4096
	add	x0, x0, 1136
	bl	_ZNSt6vectorIdSaIdEED1Ev
.L32:
	mov	sp, x28
	mov	w0, w19
	b	.L54
.L48:
	mov	x19, x0
	add	x0, x29, 4096
	add	x0, x0, 1288
	bl	_ZNSt15__new_allocatorIdED2Ev
	nop
	mov	x0, x19
.LEHB7:
	bl	_Unwind_Resume
.L49:
	mov	x19, x0
	add	x0, x29, 4096
	add	x0, x0, 1296
	bl	_ZNSt15__new_allocatorIdED2Ev
	nop
	b	.L42
.L50:
	mov	x19, x0
	add	x0, x29, 4096
	add	x0, x0, 1304
	bl	_ZNSt15__new_allocatorIdED2Ev
	nop
	b	.L44
.L52:
	mov	x19, x0
	add	x0, x29, 4096
	add	x0, x0, 1320
	bl	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED2Ev
	nop
	b	.L46
.L53:
	mov	x19, x0
	add	x0, x29, 136
	bl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
	b	.L46
.L51:
	mov	x19, x0
.L46:
	add	x0, x29, 4096
	add	x0, x0, 1088
	bl	_ZNSt6vectorIdSaIdEED1Ev
.L44:
	add	x0, x29, 4096
	add	x0, x0, 1112
	bl	_ZNSt6vectorIdSaIdEED1Ev
.L42:
	add	x0, x29, 4096
	add	x0, x0, 1136
	bl	_ZNSt6vectorIdSaIdEED1Ev
	mov	x0, x19
	bl	_Unwind_Resume
.LEHE7:
.L54:
	mov	sp, x29
	.cfi_def_cfa_register 31
	ldr	d15, [sp, 96]
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	mov	x12, 5552
	add	sp, sp, x12
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 79
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4088:
	.section	.gcc_except_table,"a",@progbits
.LLSDA4088:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4088-.LLSDACSB4088
.LLSDACSB4088:
	.uleb128 .LEHB0-.LFB4088
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB4088
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L48-.LFB4088
	.uleb128 0
	.uleb128 .LEHB2-.LFB4088
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L49-.LFB4088
	.uleb128 0
	.uleb128 .LEHB3-.LFB4088
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L50-.LFB4088
	.uleb128 0
	.uleb128 .LEHB4-.LFB4088
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L51-.LFB4088
	.uleb128 0
	.uleb128 .LEHB5-.LFB4088
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L52-.LFB4088
	.uleb128 0
	.uleb128 .LEHB6-.LFB4088
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L53-.LFB4088
	.uleb128 0
	.uleb128 .LEHB7-.LFB4088
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
.LLSDACSE4088:
	.text
	.size	main, .-main
	.align	2
	.global	_Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii
	.type	_Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii, %function
_Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii:
.LFB4090:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	str	w3, [sp, 20]
	str	w4, [sp, 16]
	ldr	w1, [sp, 16]
	ldr	w0, [sp, 20]
	str	w0, [sp, 72]
	ldr	x0, [sp, 40]
	str	x0, [sp, 48]
	ldr	x0, [sp, 32]
	str	x0, [sp, 56]
	ldr	x0, [sp, 24]
	str	x0, [sp, 64]
	add	x0, sp, 48
	mov	w3, 0
	mov	w2, w1
	mov	x1, x0
	adrp	x0, _Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii._omp_fn.0
	add	x0, x0, :lo12:_Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii._omp_fn.0
	bl	GOMP_parallel
	nop
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4090:
	.size	_Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii, .-_Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii
	.align	2
	.global	_Z29matmul_kernel_single_threadedRSt6vectorIdSaIdEES2_S2_i
	.type	_Z29matmul_kernel_single_threadedRSt6vectorIdSaIdEES2_S2_i, %function
_Z29matmul_kernel_single_threadedRSt6vectorIdSaIdEES2_S2_i:
.LFB4091:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	str	d15, [sp, 16]
	.cfi_offset 79, -96
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	str	w3, [sp, 36]
	str	wzr, [sp, 108]
	b	.L57
.L62:
	str	wzr, [sp, 104]
	b	.L58
.L61:
	ldrsw	x1, [sp, 108]
	ldrsw	x0, [sp, 36]
	mul	x1, x1, x0
	ldrsw	x0, [sp, 104]
	add	x0, x1, x0
	mov	x1, x0
	ldr	x0, [sp, 56]
	bl	_ZNSt6vectorIdSaIdEEixEm
	ldr	d31, [x0]
	str	d31, [sp, 88]
	ldrsw	x1, [sp, 108]
	ldrsw	x0, [sp, 36]
	mul	x0, x1, x0
	str	x0, [sp, 80]
	ldrsw	x1, [sp, 104]
	ldrsw	x0, [sp, 36]
	mul	x0, x1, x0
	str	x0, [sp, 72]
	str	wzr, [sp, 100]
	b	.L59
.L60:
	ldrsw	x1, [sp, 100]
	ldr	x0, [sp, 72]
	add	x0, x1, x0
	mov	x1, x0
	ldr	x0, [sp, 48]
	bl	_ZNSt6vectorIdSaIdEEixEm
	ldr	d30, [x0]
	ldr	d31, [sp, 88]
	isb
	fmul	d15, d30, d31
	ldrsw	x1, [sp, 100]
	ldr	x0, [sp, 80]
	add	x0, x1, x0
	mov	x1, x0
	ldr	x0, [sp, 40]
	bl	_ZNSt6vectorIdSaIdEEixEm
	ldr	d31, [x0]
	isb
	fadd	d31, d15, d31
	str	d31, [x0]
	ldr	w0, [sp, 100]
	add	w0, w0, 1
	str	w0, [sp, 100]
.L59:
	ldr	w1, [sp, 100]
	ldr	w0, [sp, 36]
	cmp	w1, w0
	blt	.L60
	ldr	w0, [sp, 104]
	add	w0, w0, 1
	str	w0, [sp, 104]
.L58:
	ldr	w1, [sp, 104]
	ldr	w0, [sp, 36]
	cmp	w1, w0
	blt	.L61
	ldr	w0, [sp, 108]
	add	w0, w0, 1
	str	w0, [sp, 108]
.L57:
	ldr	w1, [sp, 108]
	ldr	w0, [sp, 36]
	cmp	w1, w0
	blt	.L62
	nop
	nop
	ldr	d15, [sp, 16]
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 79
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4091:
	.size	_Z29matmul_kernel_single_threadedRSt6vectorIdSaIdEES2_S2_i, .-_Z29matmul_kernel_single_threadedRSt6vectorIdSaIdEES2_S2_i
	.section	.text._ZN9__gnu_cxx11char_traitsIcE6lengthEPKc,"axG",@progbits,_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc,comdat
	.align	2
	.weak	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	.type	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc, %function
_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc:
.LFB4092:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	xzr, [sp, 40]
	b	.L64
.L65:
	ldr	x0, [sp, 40]
	add	x0, x0, 1
	str	x0, [sp, 40]
.L64:
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 40]
	add	x0, x1, x0
	strb	wzr, [sp, 39]
	add	x1, sp, 39
	bl	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	and	w0, w0, 255
	eor	w0, w0, 1
	and	w0, w0, 255
	and	w0, w0, 1
	cmp	w0, 0
	bne	.L65
	ldr	x0, [sp, 40]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4092:
	.size	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc, .-_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD5Ev,comdat
	.align	2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, %function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev:
.LFB4190:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4190:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.section	.rodata
	.align	3
.LC8:
	.string	"basic_string: construction from null is not valid"
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.align	2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, %function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_:
.LFB4417:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4417
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	ldr	x19, [sp, 56]
	ldr	x0, [sp, 56]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv
	ldr	x2, [sp, 40]
	mov	x1, x0
	mov	x0, x19
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC1EPcRKS3_
	ldr	x0, [sp, 48]
	cmp	x0, 0
	bne	.L69
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
.LEHB8:
	bl	_ZSt19__throw_logic_errorPKc
.L69:
	ldr	x0, [sp, 48]
	bl	_ZNSt11char_traitsIcE6lengthEPKc
	mov	x1, x0
	ldr	x0, [sp, 48]
	add	x0, x0, x1
	str	x0, [sp, 72]
	mov	w3, w20
	ldr	x2, [sp, 72]
	ldr	x1, [sp, 48]
	ldr	x0, [sp, 56]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
.LEHE8:
	b	.L72
.L71:
	mov	x19, x0
	ldr	x0, [sp, 56]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev
	mov	x0, x19
.LEHB9:
	bl	_Unwind_Resume
.LEHE9:
.L72:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4417:
	.section	.gcc_except_table
.LLSDA4417:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4417-.LLSDACSB4417
.LLSDACSB4417:
	.uleb128 .LEHB8-.LFB4417
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L71-.LFB4417
	.uleb128 0
	.uleb128 .LEHB9-.LFB4417
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
.LLSDACSE4417:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.section	.text._ZNSt6vectorIdSaIdEEC2EmRKS0_,"axG",@progbits,_ZNSt6vectorIdSaIdEEC5EmRKS0_,comdat
	.align	2
	.weak	_ZNSt6vectorIdSaIdEEC2EmRKS0_
	.type	_ZNSt6vectorIdSaIdEEC2EmRKS0_, %function
_ZNSt6vectorIdSaIdEEC2EmRKS0_:
.LFB4484:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4484
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -48
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	ldr	x19, [sp, 56]
	ldr	x1, [sp, 40]
	ldr	x0, [sp, 48]
.LEHB10:
	bl	_ZNSt6vectorIdSaIdEE17_S_check_init_lenEmRKS0_
	ldr	x2, [sp, 40]
	mov	x1, x0
	mov	x0, x19
	bl	_ZNSt12_Vector_baseIdSaIdEEC2EmRKS0_
.LEHE10:
	ldr	x1, [sp, 48]
	ldr	x0, [sp, 56]
.LEHB11:
	bl	_ZNSt6vectorIdSaIdEE21_M_default_initializeEm
.LEHE11:
	b	.L76
.L75:
	mov	x19, x0
	ldr	x0, [sp, 56]
	bl	_ZNSt12_Vector_baseIdSaIdEED2Ev
	mov	x0, x19
.LEHB12:
	bl	_Unwind_Resume
.LEHE12:
.L76:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4484:
	.section	.gcc_except_table
.LLSDA4484:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4484-.LLSDACSB4484
.LLSDACSB4484:
	.uleb128 .LEHB10-.LFB4484
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB11-.LFB4484
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L75-.LFB4484
	.uleb128 0
	.uleb128 .LEHB12-.LFB4484
	.uleb128 .LEHE12-.LEHB12
	.uleb128 0
	.uleb128 0
.LLSDACSE4484:
	.section	.text._ZNSt6vectorIdSaIdEEC2EmRKS0_,"axG",@progbits,_ZNSt6vectorIdSaIdEEC5EmRKS0_,comdat
	.size	_ZNSt6vectorIdSaIdEEC2EmRKS0_, .-_ZNSt6vectorIdSaIdEEC2EmRKS0_
	.weak	_ZNSt6vectorIdSaIdEEC1EmRKS0_
	.set	_ZNSt6vectorIdSaIdEEC1EmRKS0_,_ZNSt6vectorIdSaIdEEC2EmRKS0_
	.section	.text._ZNSt6vectorIdSaIdEED2Ev,"axG",@progbits,_ZNSt6vectorIdSaIdEED5Ev,comdat
	.align	2
	.weak	_ZNSt6vectorIdSaIdEED2Ev
	.type	_ZNSt6vectorIdSaIdEED2Ev, %function
_ZNSt6vectorIdSaIdEED2Ev:
.LFB4487:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4487
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	ldr	x20, [x0]
	ldr	x0, [sp, 40]
	ldr	x19, [x0, 8]
	ldr	x0, [sp, 40]
	bl	_ZNSt12_Vector_baseIdSaIdEE19_M_get_Tp_allocatorEv
	str	x20, [sp, 72]
	str	x19, [sp, 64]
	str	x0, [sp, 56]
	ldr	x1, [sp, 64]
	ldr	x0, [sp, 72]
	bl	_ZSt8_DestroyIPdEvT_S1_
	nop
	ldr	x0, [sp, 40]
	bl	_ZNSt12_Vector_baseIdSaIdEED2Ev
	nop
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4487:
	.section	.gcc_except_table
.LLSDA4487:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4487-.LLSDACSB4487
.LLSDACSB4487:
.LLSDACSE4487:
	.section	.text._ZNSt6vectorIdSaIdEED2Ev,"axG",@progbits,_ZNSt6vectorIdSaIdEED5Ev,comdat
	.size	_ZNSt6vectorIdSaIdEED2Ev, .-_ZNSt6vectorIdSaIdEED2Ev
	.weak	_ZNSt6vectorIdSaIdEED1Ev
	.set	_ZNSt6vectorIdSaIdEED1Ev,_ZNSt6vectorIdSaIdEED2Ev
	.section	.text._ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEC2Em,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEC5Em,comdat
	.align	2
	.weak	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEC2Em
	.type	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEC2Em, %function
_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEC2Em:
.LFB4490:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x1, [sp, 16]
	ldr	x0, [sp, 24]
	bl	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE4seedEm
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4490:
	.size	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEC2Em, .-_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEC2Em
	.weak	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEC1Em
	.set	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEC1Em,_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEC2Em
	.section	.text._ZNSt25uniform_real_distributionIdEC2Edd,"axG",@progbits,_ZNSt25uniform_real_distributionIdEC5Edd,comdat
	.align	2
	.weak	_ZNSt25uniform_real_distributionIdEC2Edd
	.type	_ZNSt25uniform_real_distributionIdEC2Edd, %function
_ZNSt25uniform_real_distributionIdEC2Edd:
.LFB4493:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 40]
	str	d0, [sp, 32]
	str	d1, [sp, 24]
	ldr	x0, [sp, 40]
	ldr	d1, [sp, 24]
	ldr	d0, [sp, 32]
	bl	_ZNSt25uniform_real_distributionIdE10param_typeC1Edd
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4493:
	.size	_ZNSt25uniform_real_distributionIdEC2Edd, .-_ZNSt25uniform_real_distributionIdEC2Edd
	.weak	_ZNSt25uniform_real_distributionIdEC1Edd
	.set	_ZNSt25uniform_real_distributionIdEC1Edd,_ZNSt25uniform_real_distributionIdEC2Edd
	.section	.text._ZNSt6vectorIdSaIdEEixEm,"axG",@progbits,_ZNSt6vectorIdSaIdEEixEm,comdat
	.align	2
	.weak	_ZNSt6vectorIdSaIdEEixEm
	.type	_ZNSt6vectorIdSaIdEEixEm, %function
_ZNSt6vectorIdSaIdEEixEm:
.LFB4495:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp, 8]
	ldr	x1, [x0]
	ldr	x0, [sp]
	lsl	x0, x0, 3
	add	x0, x1, x0
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4495:
	.size	_ZNSt6vectorIdSaIdEEixEm, .-_ZNSt6vectorIdSaIdEEixEm
	.section	.text._ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_,"axG",@progbits,_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_,comdat
	.align	2
	.weak	_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_
	.type	_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_, %function
_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_:
.LFB4496:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 24]
	mov	x2, x0
	ldr	x1, [sp, 16]
	ldr	x0, [sp, 24]
	bl	_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_RKNS0_10param_typeE
	fmov	d31, d0
	fmov	d0, d31
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4496:
	.size	_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_, .-_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2IPKPKcvEET_SD_RKS6_,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC5IPKPKcvEET_SD_RKS6_,comdat
	.align	2
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2IPKPKcvEET_SD_RKS6_
	.type	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2IPKPKcvEET_SD_RKS6_, %function
_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2IPKPKcvEET_SD_RKS6_:
.LFB4504:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4504
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -64
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	str	x3, [sp, 32]
	ldr	x0, [sp, 56]
	ldr	x1, [sp, 32]
	bl	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ERKS6_
	ldr	x0, [sp, 48]
	nop
	mov	w3, w19
	ldr	x2, [sp, 40]
	mov	x1, x0
	ldr	x0, [sp, 56]
.LEHB13:
	bl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_range_initializeIPKPKcEEvT_SD_St20forward_iterator_tag
.LEHE13:
	b	.L88
.L87:
	mov	x19, x0
	ldr	x0, [sp, 56]
	bl	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev
	mov	x0, x19
.LEHB14:
	bl	_Unwind_Resume
.LEHE14:
.L88:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4504:
	.section	.gcc_except_table
.LLSDA4504:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4504-.LLSDACSB4504
.LLSDACSB4504:
	.uleb128 .LEHB13-.LFB4504
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L87-.LFB4504
	.uleb128 0
	.uleb128 .LEHB14-.LFB4504
	.uleb128 .LEHE14-.LEHB14
	.uleb128 0
	.uleb128 0
.LLSDACSE4504:
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2IPKPKcvEET_SD_RKS6_,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC5IPKPKcvEET_SD_RKS6_,comdat
	.size	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2IPKPKcvEET_SD_RKS6_, .-_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2IPKPKcvEET_SD_RKS6_
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_
	.set	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1IPKPKcvEET_SD_RKS6_,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2IPKPKcvEET_SD_RKS6_
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED5Ev,comdat
	.align	2
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev
	.type	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev, %function
_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev:
.LFB4507:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4507
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	ldr	x20, [x0]
	ldr	x0, [sp, 40]
	ldr	x19, [x0, 8]
	ldr	x0, [sp, 40]
	bl	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_get_Tp_allocatorEv
	str	x20, [sp, 72]
	str	x19, [sp, 64]
	str	x0, [sp, 56]
	ldr	x1, [sp, 64]
	ldr	x0, [sp, 72]
	bl	_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvT_S7_
	nop
	ldr	x0, [sp, 40]
	bl	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev
	nop
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4507:
	.section	.gcc_except_table
.LLSDA4507:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4507-.LLSDACSB4507
.LLSDACSB4507:
.LLSDACSE4507:
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED5Ev,comdat
	.size	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev, .-_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
	.set	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev
	.section	.text._ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE4sizeEv,"axG",@progbits,_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE4sizeEv,comdat
	.align	2
	.weak	_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE4sizeEv
	.type	_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE4sizeEv, %function
_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE4sizeEv:
.LFB4509:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	ldr	x1, [x0, 8]
	ldr	x0, [sp, 8]
	ldr	x0, [x0]
	sub	x0, x1, x0
	asr	x0, x0, 5
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4509:
	.size	_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE4sizeEv, .-_ZNKSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE4sizeEv
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEixEm,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEixEm,comdat
	.align	2
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEixEm
	.type	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEixEm, %function
_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEixEm:
.LFB4510:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp, 8]
	ldr	x1, [x0]
	ldr	x0, [sp]
	lsl	x0, x0, 5
	add	x0, x1, x0
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4510:
	.size	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEixEm, .-_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEixEm
	.section	.text._ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_,"axG",@progbits,_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_,comdat
	.align	2
	.weak	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	.type	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_, %function
_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_:
.LFB4516:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp, 8]
	ldrb	w1, [x0]
	ldr	x0, [sp]
	ldrb	w0, [x0]
	cmp	w1, w0
	cset	w0, eq
	and	w0, w0, 255
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4516:
	.size	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_, .-_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	.section	.text._ZNSt15__new_allocatorIcED2Ev,"axG",@progbits,_ZNSt15__new_allocatorIcED5Ev,comdat
	.align	2
	.weak	_ZNSt15__new_allocatorIcED2Ev
	.type	_ZNSt15__new_allocatorIcED2Ev, %function
_ZNSt15__new_allocatorIcED2Ev:
.LFB4570:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4570:
	.size	_ZNSt15__new_allocatorIcED2Ev, .-_ZNSt15__new_allocatorIcED2Ev
	.weak	_ZNSt15__new_allocatorIcED1Ev
	.set	_ZNSt15__new_allocatorIcED1Ev,_ZNSt15__new_allocatorIcED2Ev
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC5EPS4_,comdat
	.align	2
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.type	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_, %function
_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_:
.LFB4577:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp, 8]
	ldr	x1, [sp]
	str	x1, [x0]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4577:
	.size	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_, .-_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_
	.set	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD5Ev,comdat
	.align	2
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.type	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev, %function
_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev:
.LFB4580:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4580
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	cmp	x0, 0
	beq	.L100
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L100:
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4580:
	.section	.gcc_except_table
.LLSDA4580:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4580-.LLSDACSB4580
.LLSDACSB4580:
.LLSDACSE4580:
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD5Ev,comdat
	.size	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev, .-_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev
	.set	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,comdat
	.align	2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, %function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag:
.LFB4575:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4575
	stp	x29, x30, [sp, -128]!
	.cfi_def_cfa_offset 128
	.cfi_offset 29, -128
	.cfi_offset 30, -120
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -112
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	strb	w3, [sp, 32]
	ldr	x0, [sp, 48]
	str	x0, [sp, 72]
	ldr	x0, [sp, 40]
	str	x0, [sp, 120]
	ldr	x0, [sp, 72]
	nop
	str	x0, [sp, 112]
	ldr	x0, [sp, 120]
	str	x0, [sp, 104]
	ldr	x1, [sp, 104]
	ldr	x0, [sp, 112]
	sub	x0, x1, x0
	nop
	str	x0, [sp, 88]
	ldr	x0, [sp, 88]
	cmp	x0, 15
	bls	.L105
	add	x0, sp, 88
	mov	x2, 0
	mov	x1, x0
	ldr	x0, [sp, 56]
.LEHB15:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
.LEHE15:
	mov	x1, x0
	ldr	x0, [sp, 56]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc
	ldr	x0, [sp, 88]
	mov	x1, x0
	ldr	x0, [sp, 56]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm
	b	.L106
.L105:
	ldr	x0, [sp, 56]
	str	x0, [sp, 96]
	nop
.L106:
	add	x0, sp, 80
	ldr	x1, [sp, 56]
	bl	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_
	ldr	x0, [sp, 56]
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv
	ldr	x2, [sp, 40]
	ldr	x1, [sp, 48]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcPKcS7_
	str	xzr, [sp, 80]
	ldr	x0, [sp, 88]
	mov	x1, x0
	ldr	x0, [sp, 56]
.LEHB16:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm
.LEHE16:
	add	x0, sp, 80
	bl	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev
	b	.L109
.L108:
	mov	x19, x0
	add	x0, sp, 80
	bl	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev
	mov	x0, x19
.LEHB17:
	bl	_Unwind_Resume
.LEHE17:
.L109:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 128
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4575:
	.section	.gcc_except_table
.LLSDA4575:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4575-.LLSDACSB4575
.LLSDACSB4575:
	.uleb128 .LEHB15-.LFB4575
	.uleb128 .LEHE15-.LEHB15
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB16-.LFB4575
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L108-.LFB4575
	.uleb128 0
	.uleb128 .LEHB17-.LFB4575
	.uleb128 .LEHE17-.LEHB17
	.uleb128 0
	.uleb128 0
.LLSDACSE4575:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,comdat
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.section	.text._ZNSt15__new_allocatorIdED2Ev,"axG",@progbits,_ZNSt15__new_allocatorIdED5Ev,comdat
	.align	2
	.weak	_ZNSt15__new_allocatorIdED2Ev
	.type	_ZNSt15__new_allocatorIdED2Ev, %function
_ZNSt15__new_allocatorIdED2Ev:
.LFB4708:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4708:
	.size	_ZNSt15__new_allocatorIdED2Ev, .-_ZNSt15__new_allocatorIdED2Ev
	.weak	_ZNSt15__new_allocatorIdED1Ev
	.set	_ZNSt15__new_allocatorIdED1Ev,_ZNSt15__new_allocatorIdED2Ev
	.section	.rodata
	.align	3
.LC9:
	.string	"cannot create std::vector larger than max_size()"
	.section	.text._ZNSt6vectorIdSaIdEE17_S_check_init_lenEmRKS0_,"axG",@progbits,_ZNSt6vectorIdSaIdEE17_S_check_init_lenEmRKS0_,comdat
	.align	2
	.weak	_ZNSt6vectorIdSaIdEE17_S_check_init_lenEmRKS0_
	.type	_ZNSt6vectorIdSaIdEE17_S_check_init_lenEmRKS0_, %function
_ZNSt6vectorIdSaIdEE17_S_check_init_lenEmRKS0_:
.LFB4710:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -64
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	ldr	x0, [sp, 32]
	str	x0, [sp, 72]
	add	x0, sp, 48
	str	x0, [sp, 64]
	ldr	x0, [sp, 72]
	str	x0, [sp, 56]
	nop
	nop
	add	x0, sp, 48
	bl	_ZNSt6vectorIdSaIdEE11_S_max_sizeERKS0_
	mov	x1, x0
	ldr	x0, [sp, 40]
	cmp	x0, x1
	cset	w0, hi
	and	w19, w0, 255
	add	x0, sp, 48
	bl	_ZNSt15__new_allocatorIdED2Ev
	nop
	and	w0, w19, 1
	cmp	w0, 0
	beq	.L112
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
.L112:
	ldr	x0, [sp, 40]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4710:
	.size	_ZNSt6vectorIdSaIdEE17_S_check_init_lenEmRKS0_, .-_ZNSt6vectorIdSaIdEE17_S_check_init_lenEmRKS0_
	.section	.text._ZNSt12_Vector_baseIdSaIdEE12_Vector_implD2Ev,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEE12_Vector_implD5Ev,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implD2Ev
	.type	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implD2Ev, %function
_ZNSt12_Vector_baseIdSaIdEE12_Vector_implD2Ev:
.LFB4713:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	bl	_ZNSt15__new_allocatorIdED2Ev
	nop
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4713:
	.size	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implD2Ev, .-_ZNSt12_Vector_baseIdSaIdEE12_Vector_implD2Ev
	.weak	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implD1Ev
	.set	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implD1Ev,_ZNSt12_Vector_baseIdSaIdEE12_Vector_implD2Ev
	.section	.text._ZNSt12_Vector_baseIdSaIdEEC2EmRKS0_,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEEC5EmRKS0_,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIdSaIdEEC2EmRKS0_
	.type	_ZNSt12_Vector_baseIdSaIdEEC2EmRKS0_, %function
_ZNSt12_Vector_baseIdSaIdEEC2EmRKS0_:
.LFB4715:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4715
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -48
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	ldr	x0, [sp, 56]
	ldr	x1, [sp, 40]
	bl	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implC1ERKS0_
	ldr	x1, [sp, 48]
	ldr	x0, [sp, 56]
.LEHB18:
	bl	_ZNSt12_Vector_baseIdSaIdEE17_M_create_storageEm
.LEHE18:
	b	.L118
.L117:
	mov	x19, x0
	ldr	x0, [sp, 56]
	bl	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implD1Ev
	mov	x0, x19
.LEHB19:
	bl	_Unwind_Resume
.LEHE19:
.L118:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4715:
	.section	.gcc_except_table
.LLSDA4715:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4715-.LLSDACSB4715
.LLSDACSB4715:
	.uleb128 .LEHB18-.LFB4715
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L117-.LFB4715
	.uleb128 0
	.uleb128 .LEHB19-.LFB4715
	.uleb128 .LEHE19-.LEHB19
	.uleb128 0
	.uleb128 0
.LLSDACSE4715:
	.section	.text._ZNSt12_Vector_baseIdSaIdEEC2EmRKS0_,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEEC5EmRKS0_,comdat
	.size	_ZNSt12_Vector_baseIdSaIdEEC2EmRKS0_, .-_ZNSt12_Vector_baseIdSaIdEEC2EmRKS0_
	.weak	_ZNSt12_Vector_baseIdSaIdEEC1EmRKS0_
	.set	_ZNSt12_Vector_baseIdSaIdEEC1EmRKS0_,_ZNSt12_Vector_baseIdSaIdEEC2EmRKS0_
	.section	.text._ZNSt12_Vector_baseIdSaIdEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEED5Ev,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIdSaIdEED2Ev
	.type	_ZNSt12_Vector_baseIdSaIdEED2Ev, %function
_ZNSt12_Vector_baseIdSaIdEED2Ev:
.LFB4718:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4718
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldr	x3, [x0]
	ldr	x0, [sp, 24]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	sub	x0, x1, x0
	asr	x0, x0, 3
	mov	x2, x0
	mov	x1, x3
	ldr	x0, [sp, 24]
	bl	_ZNSt12_Vector_baseIdSaIdEE13_M_deallocateEPdm
	ldr	x0, [sp, 24]
	bl	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implD1Ev
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4718:
	.section	.gcc_except_table
.LLSDA4718:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4718-.LLSDACSB4718
.LLSDACSB4718:
.LLSDACSE4718:
	.section	.text._ZNSt12_Vector_baseIdSaIdEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEED5Ev,comdat
	.size	_ZNSt12_Vector_baseIdSaIdEED2Ev, .-_ZNSt12_Vector_baseIdSaIdEED2Ev
	.weak	_ZNSt12_Vector_baseIdSaIdEED1Ev
	.set	_ZNSt12_Vector_baseIdSaIdEED1Ev,_ZNSt12_Vector_baseIdSaIdEED2Ev
	.section	.text._ZNSt6vectorIdSaIdEE21_M_default_initializeEm,"axG",@progbits,_ZNSt6vectorIdSaIdEE21_M_default_initializeEm,comdat
	.align	2
	.weak	_ZNSt6vectorIdSaIdEE21_M_default_initializeEm
	.type	_ZNSt6vectorIdSaIdEE21_M_default_initializeEm, %function
_ZNSt6vectorIdSaIdEE21_M_default_initializeEm:
.LFB4720:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -32
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	ldr	x0, [sp, 40]
	ldr	x19, [x0]
	ldr	x0, [sp, 40]
	bl	_ZNSt12_Vector_baseIdSaIdEE19_M_get_Tp_allocatorEv
	mov	x2, x0
	ldr	x1, [sp, 32]
	mov	x0, x19
	bl	_ZSt27__uninitialized_default_n_aIPdmdET_S1_T0_RSaIT1_E
	mov	x1, x0
	ldr	x0, [sp, 40]
	str	x1, [x0, 8]
	nop
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4720:
	.size	_ZNSt6vectorIdSaIdEE21_M_default_initializeEm, .-_ZNSt6vectorIdSaIdEE21_M_default_initializeEm
	.section	.text._ZNSt12_Vector_baseIdSaIdEE19_M_get_Tp_allocatorEv,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEE19_M_get_Tp_allocatorEv,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIdSaIdEE19_M_get_Tp_allocatorEv
	.type	_ZNSt12_Vector_baseIdSaIdEE19_M_get_Tp_allocatorEv, %function
_ZNSt12_Vector_baseIdSaIdEE19_M_get_Tp_allocatorEv:
.LFB4721:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4721:
	.size	_ZNSt12_Vector_baseIdSaIdEE19_M_get_Tp_allocatorEv, .-_ZNSt12_Vector_baseIdSaIdEE19_M_get_Tp_allocatorEv
	.section	.text._ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE4seedEm,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE4seedEm,comdat
	.align	2
	.weak	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE4seedEm
	.type	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE4seedEm, %function
_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE4seedEm:
.LFB4723:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 16]
	bl	_ZNSt8__detail5__modImLm4294967296ELm1ELm0EEET_S1_
	mov	x1, x0
	ldr	x0, [sp, 24]
	str	x1, [x0]
	mov	x0, 1
	str	x0, [sp, 40]
	b	.L124
.L125:
	ldr	x0, [sp, 40]
	sub	x1, x0, #1
	ldr	x0, [sp, 24]
	ldr	x0, [x0, x1, lsl 3]
	str	x0, [sp, 32]
	ldr	x0, [sp, 32]
	lsr	x0, x0, 30
	ldr	x1, [sp, 32]
	eor	x0, x1, x0
	str	x0, [sp, 32]
	ldr	x1, [sp, 32]
	mov	x0, 35173
	movk	x0, 0x6c07, lsl 16
	mul	x0, x1, x0
	str	x0, [sp, 32]
	ldr	x0, [sp, 40]
	bl	_ZNSt8__detail5__modImLm624ELm1ELm0EEET_S1_
	mov	x1, x0
	ldr	x0, [sp, 32]
	add	x0, x0, x1
	str	x0, [sp, 32]
	ldr	x0, [sp, 32]
	bl	_ZNSt8__detail5__modImLm4294967296ELm1ELm0EEET_S1_
	mov	x2, x0
	ldr	x0, [sp, 24]
	ldr	x1, [sp, 40]
	str	x2, [x0, x1, lsl 3]
	ldr	x0, [sp, 40]
	add	x0, x0, 1
	str	x0, [sp, 40]
.L124:
	ldr	x0, [sp, 40]
	cmp	x0, 623
	bls	.L125
	ldr	x0, [sp, 24]
	mov	x1, 624
	str	x1, [x0, 4992]
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4723:
	.size	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE4seedEm, .-_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE4seedEm
	.section	.text._ZNSt25uniform_real_distributionIdE10param_typeC2Edd,"axG",@progbits,_ZNSt25uniform_real_distributionIdE10param_typeC5Edd,comdat
	.align	2
	.weak	_ZNSt25uniform_real_distributionIdE10param_typeC2Edd
	.type	_ZNSt25uniform_real_distributionIdE10param_typeC2Edd, %function
_ZNSt25uniform_real_distributionIdE10param_typeC2Edd:
.LFB4725:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, 24]
	str	d0, [sp, 16]
	str	d1, [sp, 8]
	ldr	x0, [sp, 24]
	ldr	d31, [sp, 16]
	str	d31, [x0]
	ldr	x0, [sp, 24]
	ldr	d31, [sp, 8]
	str	d31, [x0, 8]
	mov	w0, 0
	and	w0, w0, 1
	cmp	w0, 0
	beq	.L129
	ldr	x0, [sp, 24]
	ldr	d30, [x0]
	ldr	x0, [sp, 24]
	ldr	d31, [x0, 8]
	fcmpe	d30, d31
	cset	w0, ls
	and	w0, w0, 255
	eor	w0, w0, 1
	and	w0, w0, 255
	and	x0, x0, 255
	cmp	x0, 0
.L129:
	nop
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4725:
	.size	_ZNSt25uniform_real_distributionIdE10param_typeC2Edd, .-_ZNSt25uniform_real_distributionIdE10param_typeC2Edd
	.weak	_ZNSt25uniform_real_distributionIdE10param_typeC1Edd
	.set	_ZNSt25uniform_real_distributionIdE10param_typeC1Edd,_ZNSt25uniform_real_distributionIdE10param_typeC2Edd
	.section	.text._ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_RKNS0_10param_typeE,"axG",@progbits,_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_RKNS0_10param_typeE,comdat
	.align	2
	.weak	_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_RKNS0_10param_typeE
	.type	_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_RKNS0_10param_typeE, %function
_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_RKNS0_10param_typeE:
.LFB4727:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	d14, d15, [sp, 16]
	.cfi_offset 78, -64
	.cfi_offset 79, -56
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	add	x0, sp, 72
	ldr	x1, [sp, 48]
	bl	_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEC1ERS2_
	add	x0, sp, 72
	bl	_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEclEv
	fmov	d15, d0
	ldr	x0, [sp, 40]
	bl	_ZNKSt25uniform_real_distributionIdE10param_type1bEv
	fmov	d14, d0
	ldr	x0, [sp, 40]
	bl	_ZNKSt25uniform_real_distributionIdE10param_type1aEv
	fmov	d31, d0
	isb
	fsub	d31, d14, d31
	isb
	fmul	d15, d15, d31
	ldr	x0, [sp, 40]
	bl	_ZNKSt25uniform_real_distributionIdE10param_type1aEv
	fmov	d31, d0
	isb
	fadd	d31, d15, d31
	fmov	d0, d31
	ldp	d14, d15, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 78
	.cfi_restore 79
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4727:
	.size	_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_RKNS0_10param_typeE, .-_ZNSt25uniform_real_distributionIdEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEdRT_RKNS0_10param_typeE
	.section	.text._ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED2Ev,"axG",@progbits,_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED5Ev,comdat
	.align	2
	.weak	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED2Ev
	.type	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED2Ev, %function
_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED2Ev:
.LFB4732:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4732:
	.size	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED2Ev, .-_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED2Ev
	.weak	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED1Ev
	.set	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED1Ev,_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED2Ev
	.section	.text._ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implD2Ev,"axG",@progbits,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implD5Ev,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implD2Ev
	.type	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implD2Ev, %function
_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implD2Ev:
.LFB4736:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	bl	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED2Ev
	nop
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4736:
	.size	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implD2Ev, .-_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implD2Ev
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implD1Ev
	.set	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implD1Ev,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implD2Ev
	.section	.text._ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ERKS6_,"axG",@progbits,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC5ERKS6_,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ERKS6_
	.type	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ERKS6_, %function
_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ERKS6_:
.LFB4738:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 24]
	ldr	x1, [sp, 16]
	bl	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implC1ERKS6_
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4738:
	.size	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ERKS6_, .-_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ERKS6_
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1ERKS6_
	.set	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC1ERKS6_,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEC2ERKS6_
	.section	.text._ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev,"axG",@progbits,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED5Ev,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev
	.type	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev, %function
_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev:
.LFB4741:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4741
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldr	x3, [x0]
	ldr	x0, [sp, 24]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	sub	x0, x1, x0
	asr	x0, x0, 5
	mov	x2, x0
	mov	x1, x3
	ldr	x0, [sp, 24]
	bl	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m
	ldr	x0, [sp, 24]
	bl	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implD1Ev
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4741:
	.section	.gcc_except_table
.LLSDA4741:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4741-.LLSDACSB4741
.LLSDACSB4741:
.LLSDACSE4741:
	.section	.text._ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev,"axG",@progbits,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED5Ev,comdat
	.size	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev, .-_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
	.set	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED2Ev
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_range_initializeIPKPKcEEvT_SD_St20forward_iterator_tag,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_range_initializeIPKPKcEEvT_SD_St20forward_iterator_tag,comdat
	.align	2
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_range_initializeIPKPKcEEvT_SD_St20forward_iterator_tag
	.type	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_range_initializeIPKPKcEEvT_SD_St20forward_iterator_tag, %function
_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_range_initializeIPKPKcEEvT_SD_St20forward_iterator_tag:
.LFB4744:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -96
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	strb	w3, [sp, 32]
	ldr	x0, [sp, 48]
	str	x0, [sp, 72]
	ldr	x0, [sp, 40]
	str	x0, [sp, 96]
	ldr	x0, [sp, 72]
	nop
	str	x0, [sp, 88]
	ldr	x0, [sp, 96]
	str	x0, [sp, 80]
	ldr	x1, [sp, 80]
	ldr	x0, [sp, 88]
	sub	x0, x1, x0
	asr	x0, x0, 3
	nop
	str	x0, [sp, 104]
	ldr	x19, [sp, 56]
	ldr	x0, [sp, 56]
	bl	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_get_Tp_allocatorEv
	mov	x1, x0
	ldr	x0, [sp, 104]
	bl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_S_check_init_lenEmRKS6_
	mov	x1, x0
	mov	x0, x19
	bl	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm
	mov	x1, x0
	ldr	x0, [sp, 56]
	str	x1, [x0]
	ldr	x0, [sp, 56]
	ldr	x1, [x0]
	ldr	x0, [sp, 104]
	lsl	x0, x0, 5
	add	x1, x1, x0
	ldr	x0, [sp, 56]
	str	x1, [x0, 16]
	ldr	x0, [sp, 56]
	ldr	x19, [x0]
	ldr	x0, [sp, 56]
	bl	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_get_Tp_allocatorEv
	mov	x3, x0
	mov	x2, x19
	ldr	x1, [sp, 40]
	ldr	x0, [sp, 48]
	bl	_ZSt22__uninitialized_copy_aIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES9_ET0_T_SC_SB_RSaIT1_E
	mov	x1, x0
	ldr	x0, [sp, 56]
	str	x1, [x0, 8]
	nop
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4744:
	.size	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_range_initializeIPKPKcEEvT_SD_St20forward_iterator_tag, .-_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_range_initializeIPKPKcEEvT_SD_St20forward_iterator_tag
	.section	.text._ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_get_Tp_allocatorEv,"axG",@progbits,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_get_Tp_allocatorEv,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_get_Tp_allocatorEv
	.type	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_get_Tp_allocatorEv, %function
_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_get_Tp_allocatorEv:
.LFB4746:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4746:
	.size	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_get_Tp_allocatorEv, .-_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE19_M_get_Tp_allocatorEv
	.section	.text._ZNSt6vectorIdSaIdEE11_S_max_sizeERKS0_,"axG",@progbits,_ZNSt6vectorIdSaIdEE11_S_max_sizeERKS0_,comdat
	.align	2
	.weak	_ZNSt6vectorIdSaIdEE11_S_max_sizeERKS0_
	.type	_ZNSt6vectorIdSaIdEE11_S_max_sizeERKS0_, %function
_ZNSt6vectorIdSaIdEE11_S_max_sizeERKS0_:
.LFB4846:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x0, [sp, 24]
	mov	x0, 1152921504606846975
	str	x0, [sp, 48]
	ldr	x0, [sp, 24]
	str	x0, [sp, 72]
	ldr	x0, [sp, 72]
	str	x0, [sp, 64]
	ldr	x0, [sp, 64]
	str	x0, [sp, 56]
	mov	x0, 1152921504606846975
	nop
	nop
	str	x0, [sp, 40]
	add	x1, sp, 40
	add	x0, sp, 48
	bl	_ZSt3minImERKT_S2_S2_
	ldr	x0, [x0]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4846:
	.size	_ZNSt6vectorIdSaIdEE11_S_max_sizeERKS0_, .-_ZNSt6vectorIdSaIdEE11_S_max_sizeERKS0_
	.section	.text._ZNSt12_Vector_baseIdSaIdEE12_Vector_implC2ERKS0_,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEE12_Vector_implC5ERKS0_,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implC2ERKS0_
	.type	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implC2ERKS0_, %function
_ZNSt12_Vector_baseIdSaIdEE12_Vector_implC2ERKS0_:
.LFB4851:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 24]
	str	x0, [sp, 56]
	ldr	x0, [sp, 16]
	str	x0, [sp, 48]
	ldr	x0, [sp, 56]
	str	x0, [sp, 40]
	ldr	x0, [sp, 48]
	str	x0, [sp, 32]
	nop
	nop
	ldr	x0, [sp, 24]
	bl	_ZNSt12_Vector_baseIdSaIdEE17_Vector_impl_dataC2Ev
	nop
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4851:
	.size	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implC2ERKS0_, .-_ZNSt12_Vector_baseIdSaIdEE12_Vector_implC2ERKS0_
	.weak	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implC1ERKS0_
	.set	_ZNSt12_Vector_baseIdSaIdEE12_Vector_implC1ERKS0_,_ZNSt12_Vector_baseIdSaIdEE12_Vector_implC2ERKS0_
	.section	.text._ZNSt12_Vector_baseIdSaIdEE17_M_create_storageEm,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEE17_M_create_storageEm,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIdSaIdEE17_M_create_storageEm
	.type	_ZNSt12_Vector_baseIdSaIdEE17_M_create_storageEm, %function
_ZNSt12_Vector_baseIdSaIdEE17_M_create_storageEm:
.LFB4853:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x1, [sp, 16]
	ldr	x0, [sp, 24]
	bl	_ZNSt12_Vector_baseIdSaIdEE11_M_allocateEm
	mov	x1, x0
	ldr	x0, [sp, 24]
	str	x1, [x0]
	ldr	x0, [sp, 24]
	ldr	x1, [x0]
	ldr	x0, [sp, 24]
	str	x1, [x0, 8]
	ldr	x0, [sp, 24]
	ldr	x1, [x0]
	ldr	x0, [sp, 16]
	lsl	x0, x0, 3
	add	x1, x1, x0
	ldr	x0, [sp, 24]
	str	x1, [x0, 16]
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4853:
	.size	_ZNSt12_Vector_baseIdSaIdEE17_M_create_storageEm, .-_ZNSt12_Vector_baseIdSaIdEE17_M_create_storageEm
	.section	.text._ZNSt12_Vector_baseIdSaIdEE13_M_deallocateEPdm,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEE13_M_deallocateEPdm,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIdSaIdEE13_M_deallocateEPdm
	.type	_ZNSt12_Vector_baseIdSaIdEE13_M_deallocateEPdm, %function
_ZNSt12_Vector_baseIdSaIdEE13_M_deallocateEPdm:
.LFB4854:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x0, [sp, 32]
	cmp	x0, 0
	beq	.L151
	ldr	x0, [sp, 40]
	str	x0, [sp, 72]
	ldr	x0, [sp, 32]
	str	x0, [sp, 64]
	ldr	x0, [sp, 24]
	str	x0, [sp, 56]
	ldr	x2, [sp, 56]
	ldr	x1, [sp, 64]
	ldr	x0, [sp, 72]
	bl	_ZNSt15__new_allocatorIdE10deallocateEPdm
	nop
.L151:
	nop
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4854:
	.size	_ZNSt12_Vector_baseIdSaIdEE13_M_deallocateEPdm, .-_ZNSt12_Vector_baseIdSaIdEE13_M_deallocateEPdm
	.section	.text._ZSt27__uninitialized_default_n_aIPdmdET_S1_T0_RSaIT1_E,"axG",@progbits,_ZSt27__uninitialized_default_n_aIPdmdET_S1_T0_RSaIT1_E,comdat
	.align	2
	.weak	_ZSt27__uninitialized_default_n_aIPdmdET_S1_T0_RSaIT1_E
	.type	_ZSt27__uninitialized_default_n_aIPdmdET_S1_T0_RSaIT1_E, %function
_ZSt27__uninitialized_default_n_aIPdmdET_S1_T0_RSaIT1_E:
.LFB4855:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x1, [sp, 32]
	ldr	x0, [sp, 40]
	bl	_ZSt25__uninitialized_default_nIPdmET_S1_T0_
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4855:
	.size	_ZSt27__uninitialized_default_n_aIPdmdET_S1_T0_RSaIT1_E, .-_ZSt27__uninitialized_default_n_aIPdmdET_S1_T0_RSaIT1_E
	.section	.text._ZSt8_DestroyIPdEvT_S1_,"axG",@progbits,_ZSt8_DestroyIPdEvT_S1_,comdat
	.align	2
	.weak	_ZSt8_DestroyIPdEvT_S1_
	.type	_ZSt8_DestroyIPdEvT_S1_, %function
_ZSt8_DestroyIPdEvT_S1_:
.LFB4856:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x1, [sp, 16]
	ldr	x0, [sp, 24]
	bl	_ZNSt12_Destroy_auxILb1EE9__destroyIPdEEvT_S3_
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4856:
	.size	_ZSt8_DestroyIPdEvT_S1_, .-_ZSt8_DestroyIPdEvT_S1_
	.section	.text._ZNSt8__detail5__modImLm4294967296ELm1ELm0EEET_S1_,"axG",@progbits,_ZNSt8__detail5__modImLm4294967296ELm1ELm0EEET_S1_,comdat
	.align	2
	.weak	_ZNSt8__detail5__modImLm4294967296ELm1ELm0EEET_S1_
	.type	_ZNSt8__detail5__modImLm4294967296ELm1ELm0EEET_S1_, %function
_ZNSt8__detail5__modImLm4294967296ELm1ELm0EEET_S1_:
.LFB4858:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	bl	_ZNSt8__detail4_ModImLm4294967296ELm1ELm0ELb1ELb1EE6__calcEm
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4858:
	.size	_ZNSt8__detail5__modImLm4294967296ELm1ELm0EEET_S1_, .-_ZNSt8__detail5__modImLm4294967296ELm1ELm0EEET_S1_
	.section	.text._ZNSt8__detail5__modImLm624ELm1ELm0EEET_S1_,"axG",@progbits,_ZNSt8__detail5__modImLm624ELm1ELm0EEET_S1_,comdat
	.align	2
	.weak	_ZNSt8__detail5__modImLm624ELm1ELm0EEET_S1_
	.type	_ZNSt8__detail5__modImLm624ELm1ELm0EEET_S1_, %function
_ZNSt8__detail5__modImLm624ELm1ELm0EEET_S1_:
.LFB4859:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	bl	_ZNSt8__detail4_ModImLm624ELm1ELm0ELb1ELb1EE6__calcEm
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4859:
	.size	_ZNSt8__detail5__modImLm624ELm1ELm0EEET_S1_, .-_ZNSt8__detail5__modImLm624ELm1ELm0EEET_S1_
	.section	.text._ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEC2ERS2_,"axG",@progbits,_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEC5ERS2_,comdat
	.align	2
	.weak	_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEC2ERS2_
	.type	_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEC2ERS2_, %function
_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEC2ERS2_:
.LFB4861:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp, 8]
	ldr	x1, [sp]
	str	x1, [x0]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4861:
	.size	_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEC2ERS2_, .-_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEC2ERS2_
	.weak	_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEC1ERS2_
	.set	_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEC1ERS2_,_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEC2ERS2_
	.section	.text._ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEclEv,"axG",@progbits,_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEclEv,comdat
	.align	2
	.weak	_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEclEv
	.type	_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEclEv, %function
_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEclEv:
.LFB4863:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	bl	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	fmov	d31, d0
	fmov	d0, d31
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4863:
	.size	_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEclEv, .-_ZNSt8__detail8_AdaptorISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEdEclEv
	.section	.text._ZNKSt25uniform_real_distributionIdE10param_type1bEv,"axG",@progbits,_ZNKSt25uniform_real_distributionIdE10param_type1bEv,comdat
	.align	2
	.weak	_ZNKSt25uniform_real_distributionIdE10param_type1bEv
	.type	_ZNKSt25uniform_real_distributionIdE10param_type1bEv, %function
_ZNKSt25uniform_real_distributionIdE10param_type1bEv:
.LFB4864:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	ldr	d31, [x0, 8]
	fmov	d0, d31
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4864:
	.size	_ZNKSt25uniform_real_distributionIdE10param_type1bEv, .-_ZNKSt25uniform_real_distributionIdE10param_type1bEv
	.section	.text._ZNKSt25uniform_real_distributionIdE10param_type1aEv,"axG",@progbits,_ZNKSt25uniform_real_distributionIdE10param_type1aEv,comdat
	.align	2
	.weak	_ZNKSt25uniform_real_distributionIdE10param_type1aEv
	.type	_ZNKSt25uniform_real_distributionIdE10param_type1aEv, %function
_ZNKSt25uniform_real_distributionIdE10param_type1aEv:
.LFB4865:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	ldr	d31, [x0]
	fmov	d0, d31
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4865:
	.size	_ZNKSt25uniform_real_distributionIdE10param_type1aEv, .-_ZNKSt25uniform_real_distributionIdE10param_type1aEv
	.section	.text._ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implC2ERKS6_,"axG",@progbits,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implC5ERKS6_,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implC2ERKS6_
	.type	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implC2ERKS6_, %function
_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implC2ERKS6_:
.LFB4867:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 24]
	str	x0, [sp, 56]
	ldr	x0, [sp, 16]
	str	x0, [sp, 48]
	ldr	x0, [sp, 56]
	str	x0, [sp, 40]
	ldr	x0, [sp, 48]
	str	x0, [sp, 32]
	nop
	nop
	ldr	x0, [sp, 24]
	bl	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataC2Ev
	nop
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4867:
	.size	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implC2ERKS6_, .-_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implC2ERKS6_
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implC1ERKS6_
	.set	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implC1ERKS6_,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implC2ERKS6_
	.section	.text._ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m,"axG",@progbits,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m
	.type	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m, %function
_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m:
.LFB4869:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x0, [sp, 32]
	cmp	x0, 0
	beq	.L169
	ldr	x0, [sp, 40]
	str	x0, [sp, 72]
	ldr	x0, [sp, 32]
	str	x0, [sp, 64]
	ldr	x0, [sp, 24]
	str	x0, [sp, 56]
	ldr	x2, [sp, 56]
	ldr	x1, [sp, 64]
	ldr	x0, [sp, 72]
	bl	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10deallocateEPS5_m
	nop
.L169:
	nop
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4869:
	.size	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m, .-_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE13_M_deallocateEPS5_m
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_S_check_init_lenEmRKS6_,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_S_check_init_lenEmRKS6_,comdat
	.align	2
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_S_check_init_lenEmRKS6_
	.type	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_S_check_init_lenEmRKS6_, %function
_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_S_check_init_lenEmRKS6_:
.LFB4871:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -64
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	ldr	x0, [sp, 32]
	str	x0, [sp, 72]
	add	x0, sp, 48
	str	x0, [sp, 64]
	ldr	x0, [sp, 72]
	str	x0, [sp, 56]
	nop
	nop
	add	x0, sp, 48
	bl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_S_max_sizeERKS6_
	mov	x1, x0
	ldr	x0, [sp, 40]
	cmp	x0, x1
	cset	w0, hi
	and	w19, w0, 255
	add	x0, sp, 48
	bl	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEED2Ev
	nop
	and	w0, w19, 1
	cmp	w0, 0
	beq	.L171
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
.L171:
	ldr	x0, [sp, 40]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4871:
	.size	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_S_check_init_lenEmRKS6_, .-_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_S_check_init_lenEmRKS6_
	.section	.text._ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm,"axG",@progbits,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm
	.type	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm, %function
_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm:
.LFB4872:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 16]
	cmp	x0, 0
	beq	.L174
	ldr	x0, [sp, 24]
	str	x0, [sp, 40]
	ldr	x0, [sp, 16]
	str	x0, [sp, 32]
	mov	x2, 0
	ldr	x1, [sp, 32]
	ldr	x0, [sp, 40]
	bl	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE8allocateEmPKv
	nop
	b	.L176
.L174:
	mov	x0, 0
.L176:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4872:
	.size	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm, .-_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_M_allocateEm
	.section	.text._ZSt22__uninitialized_copy_aIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES9_ET0_T_SC_SB_RSaIT1_E,"axG",@progbits,_ZSt22__uninitialized_copy_aIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES9_ET0_T_SC_SB_RSaIT1_E,comdat
	.align	2
	.weak	_ZSt22__uninitialized_copy_aIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES9_ET0_T_SC_SB_RSaIT1_E
	.type	_ZSt22__uninitialized_copy_aIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES9_ET0_T_SC_SB_RSaIT1_E, %function
_ZSt22__uninitialized_copy_aIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES9_ET0_T_SC_SB_RSaIT1_E:
.LFB4873:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	str	x3, [sp, 16]
	ldr	x2, [sp, 24]
	ldr	x1, [sp, 32]
	ldr	x0, [sp, 40]
	bl	_ZSt18uninitialized_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4873:
	.size	_ZSt22__uninitialized_copy_aIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES9_ET0_T_SC_SB_RSaIT1_E, .-_ZSt22__uninitialized_copy_aIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES9_ET0_T_SC_SB_RSaIT1_E
	.section	.text._ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvT_S7_,"axG",@progbits,_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvT_S7_,comdat
	.align	2
	.weak	_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvT_S7_
	.type	_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvT_S7_, %function
_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvT_S7_:
.LFB4874:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x1, [sp, 16]
	ldr	x0, [sp, 24]
	bl	_ZNSt12_Destroy_auxILb0EE9__destroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvT_S9_
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4874:
	.size	_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvT_S7_, .-_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvT_S7_
	.section	.text._ZSt3minImERKT_S2_S2_,"axG",@progbits,_ZSt3minImERKT_S2_S2_,comdat
	.align	2
	.weak	_ZSt3minImERKT_S2_S2_
	.type	_ZSt3minImERKT_S2_S2_, %function
_ZSt3minImERKT_S2_S2_:
.LFB4945:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp]
	ldr	x1, [x0]
	ldr	x0, [sp, 8]
	ldr	x0, [x0]
	cmp	x1, x0
	bcs	.L182
	ldr	x0, [sp]
	b	.L183
.L182:
	ldr	x0, [sp, 8]
.L183:
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4945:
	.size	_ZSt3minImERKT_S2_S2_, .-_ZSt3minImERKT_S2_S2_
	.section	.text._ZNSt12_Vector_baseIdSaIdEE17_Vector_impl_dataC2Ev,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEE17_Vector_impl_dataC5Ev,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIdSaIdEE17_Vector_impl_dataC2Ev
	.type	_ZNSt12_Vector_baseIdSaIdEE17_Vector_impl_dataC2Ev, %function
_ZNSt12_Vector_baseIdSaIdEE17_Vector_impl_dataC2Ev:
.LFB4950:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	str	xzr, [x0]
	ldr	x0, [sp, 8]
	str	xzr, [x0, 8]
	ldr	x0, [sp, 8]
	str	xzr, [x0, 16]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4950:
	.size	_ZNSt12_Vector_baseIdSaIdEE17_Vector_impl_dataC2Ev, .-_ZNSt12_Vector_baseIdSaIdEE17_Vector_impl_dataC2Ev
	.weak	_ZNSt12_Vector_baseIdSaIdEE17_Vector_impl_dataC1Ev
	.set	_ZNSt12_Vector_baseIdSaIdEE17_Vector_impl_dataC1Ev,_ZNSt12_Vector_baseIdSaIdEE17_Vector_impl_dataC2Ev
	.section	.text._ZNSt12_Vector_baseIdSaIdEE11_M_allocateEm,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEE11_M_allocateEm,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseIdSaIdEE11_M_allocateEm
	.type	_ZNSt12_Vector_baseIdSaIdEE11_M_allocateEm, %function
_ZNSt12_Vector_baseIdSaIdEE11_M_allocateEm:
.LFB4952:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 16]
	cmp	x0, 0
	beq	.L186
	ldr	x0, [sp, 24]
	str	x0, [sp, 40]
	ldr	x0, [sp, 16]
	str	x0, [sp, 32]
	mov	x2, 0
	ldr	x1, [sp, 32]
	ldr	x0, [sp, 40]
	bl	_ZNSt15__new_allocatorIdE8allocateEmPKv
	nop
	b	.L188
.L186:
	mov	x0, 0
.L188:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4952:
	.size	_ZNSt12_Vector_baseIdSaIdEE11_M_allocateEm, .-_ZNSt12_Vector_baseIdSaIdEE11_M_allocateEm
	.section	.text._ZSt25__uninitialized_default_nIPdmET_S1_T0_,"axG",@progbits,_ZSt25__uninitialized_default_nIPdmET_S1_T0_,comdat
	.align	2
	.weak	_ZSt25__uninitialized_default_nIPdmET_S1_T0_
	.type	_ZSt25__uninitialized_default_nIPdmET_S1_T0_, %function
_ZSt25__uninitialized_default_nIPdmET_S1_T0_:
.LFB4954:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	mov	w0, 1
	strb	w0, [sp, 47]
	ldr	x1, [sp, 16]
	ldr	x0, [sp, 24]
	bl	_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPdmEET_S3_T0_
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4954:
	.size	_ZSt25__uninitialized_default_nIPdmET_S1_T0_, .-_ZSt25__uninitialized_default_nIPdmET_S1_T0_
	.section	.text._ZNSt12_Destroy_auxILb1EE9__destroyIPdEEvT_S3_,"axG",@progbits,_ZNSt12_Destroy_auxILb1EE9__destroyIPdEEvT_S3_,comdat
	.align	2
	.weak	_ZNSt12_Destroy_auxILb1EE9__destroyIPdEEvT_S3_
	.type	_ZNSt12_Destroy_auxILb1EE9__destroyIPdEEvT_S3_, %function
_ZNSt12_Destroy_auxILb1EE9__destroyIPdEEvT_S3_:
.LFB4955:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4955:
	.size	_ZNSt12_Destroy_auxILb1EE9__destroyIPdEEvT_S3_, .-_ZNSt12_Destroy_auxILb1EE9__destroyIPdEEvT_S3_
	.section	.text._ZNSt8__detail4_ModImLm4294967296ELm1ELm0ELb1ELb1EE6__calcEm,"axG",@progbits,_ZNSt8__detail4_ModImLm4294967296ELm1ELm0ELb1ELb1EE6__calcEm,comdat
	.align	2
	.weak	_ZNSt8__detail4_ModImLm4294967296ELm1ELm0ELb1ELb1EE6__calcEm
	.type	_ZNSt8__detail4_ModImLm4294967296ELm1ELm0ELb1ELb1EE6__calcEm, %function
_ZNSt8__detail4_ModImLm4294967296ELm1ELm0ELb1ELb1EE6__calcEm:
.LFB4956:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	and	x0, x0, 4294967295
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4956:
	.size	_ZNSt8__detail4_ModImLm4294967296ELm1ELm0ELb1ELb1EE6__calcEm, .-_ZNSt8__detail4_ModImLm4294967296ELm1ELm0ELb1ELb1EE6__calcEm
	.section	.text._ZNSt8__detail4_ModImLm624ELm1ELm0ELb1ELb1EE6__calcEm,"axG",@progbits,_ZNSt8__detail4_ModImLm624ELm1ELm0ELb1ELb1EE6__calcEm,comdat
	.align	2
	.weak	_ZNSt8__detail4_ModImLm624ELm1ELm0ELb1ELb1EE6__calcEm
	.type	_ZNSt8__detail4_ModImLm624ELm1ELm0ELb1ELb1EE6__calcEm, %function
_ZNSt8__detail4_ModImLm624ELm1ELm0ELb1ELb1EE6__calcEm:
.LFB4957:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	str	x0, [sp, 24]
	ldr	x2, [sp, 24]
	lsr	x1, x2, 4
	mov	x0, 3361
	movk	x0, 0x20d2, lsl 16
	movk	x0, 0xd20d, lsl 32
	movk	x0, 0xd20, lsl 48
	umulh	x0, x1, x0
	lsr	x1, x0, 1
	mov	x0, x1
	lsl	x0, x0, 2
	add	x0, x0, x1
	lsl	x0, x0, 3
	sub	x0, x0, x1
	lsl	x0, x0, 4
	sub	x0, x2, x0
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4957:
	.size	_ZNSt8__detail4_ModImLm624ELm1ELm0ELb1ELb1EE6__calcEm, .-_ZNSt8__detail4_ModImLm624ELm1ELm0ELb1ELb1EE6__calcEm
	.section	.text._ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE3minEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE3minEv,comdat
	.align	2
	.weak	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE3minEv
	.type	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE3minEv, %function
_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE3minEv:
.LFB4960:
	.cfi_startproc
	mov	x0, 0
	ret
	.cfi_endproc
.LFE4960:
	.size	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE3minEv, .-_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE3minEv
	.section	.text._ZSt3maxImERKT_S2_S2_,"axG",@progbits,_ZSt3maxImERKT_S2_S2_,comdat
	.align	2
	.weak	_ZSt3maxImERKT_S2_S2_
	.type	_ZSt3maxImERKT_S2_S2_, %function
_ZSt3maxImERKT_S2_S2_:
.LFB4961:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp, 8]
	ldr	x1, [x0]
	ldr	x0, [sp]
	ldr	x0, [x0]
	cmp	x1, x0
	bcs	.L200
	ldr	x0, [sp]
	b	.L201
.L200:
	ldr	x0, [sp, 8]
.L201:
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4961:
	.size	_ZSt3maxImERKT_S2_S2_, .-_ZSt3maxImERKT_S2_S2_
	.section	.text._ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_,"axG",@progbits,_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_,comdat
	.align	2
	.weak	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	.type	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_, %function
_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_:
.LFB4958:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -144
	str	x0, [sp, 56]
	mov	x0, 53
	str	x0, [sp, 120]
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	ldr	q30, [x0]
	str	q30, [sp, 96]
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	ldr	q0, [x0]
	bl	_ZSt3loge
	str	q0, [sp, 32]
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	ldr	q0, [x0]
	bl	_ZSt3loge
	mov	v30.16b, v0.16b
	mov	v1.16b, v30.16b
	ldr	q0, [sp, 32]
	bl	__divtf3
	mov	v30.16b, v0.16b
	mov	v0.16b, v30.16b
	bl	__fixunstfdi
	str	x0, [sp, 88]
	mov	x0, 1
	str	x0, [sp, 64]
	ldr	x0, [sp, 88]
	add	x1, x0, 52
	ldr	x0, [sp, 88]
	udiv	x0, x1, x0
	str	x0, [sp, 72]
	add	x1, sp, 72
	add	x0, sp, 64
	bl	_ZSt3maxImERKT_S2_S2_
	ldr	x0, [x0]
	str	x0, [sp, 80]
	str	xzr, [sp, 144]
	fmov	d31, 1.0e+0
	str	d31, [sp, 136]
	ldr	x0, [sp, 80]
	str	x0, [sp, 128]
	b	.L203
.L204:
	ldr	x0, [sp, 56]
	bl	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	mov	x19, x0
	bl	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE3minEv
	sub	x0, x19, x0
	fmov	d31, x0
	ucvtf	d30, d31
	ldr	d31, [sp, 136]
	isb
	fmul	d31, d30, d31
	ldr	d30, [sp, 144]
	isb
	fadd	d31, d30, d31
	str	d31, [sp, 144]
	ldr	d31, [sp, 136]
	mov	x0, 4751297606875873280
	fmov	d30, x0
	isb
	fmul	d31, d31, d30
	str	d31, [sp, 136]
	ldr	x0, [sp, 128]
	sub	x0, x0, #1
	str	x0, [sp, 128]
.L203:
	ldr	x0, [sp, 128]
	cmp	x0, 0
	bne	.L204
	ldr	d31, [sp, 136]
	ldr	d30, [sp, 144]
	isb
	fdiv	d31, d30, d31
	str	d31, [sp, 152]
	ldr	d30, [sp, 152]
	fmov	d31, 1.0e+0
	fcmpe	d30, d31
	cset	w0, ge
	and	w0, w0, 255
	and	x0, x0, 255
	cmp	x0, 0
	beq	.L205
	mov	x0, 4607182418800017407
	fmov	d31, x0
	str	d31, [sp, 152]
.L205:
	ldr	d31, [sp, 152]
	fmov	d0, d31
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 160
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4958:
	.size	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_, .-_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	.section	.text._ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataC2Ev,"axG",@progbits,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataC5Ev,comdat
	.align	2
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataC2Ev
	.type	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataC2Ev, %function
_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataC2Ev:
.LFB4966:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	str	xzr, [x0]
	ldr	x0, [sp, 8]
	str	xzr, [x0, 8]
	ldr	x0, [sp, 8]
	str	xzr, [x0, 16]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4966:
	.size	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataC2Ev, .-_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataC2Ev
	.weak	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataC1Ev
	.set	_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataC1Ev,_ZNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataC2Ev
	.section	.text._ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_S_max_sizeERKS6_,"axG",@progbits,_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_S_max_sizeERKS6_,comdat
	.align	2
	.weak	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_S_max_sizeERKS6_
	.type	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_S_max_sizeERKS6_, %function
_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_S_max_sizeERKS6_:
.LFB4969:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x0, [sp, 24]
	mov	x0, 288230376151711743
	str	x0, [sp, 48]
	ldr	x0, [sp, 24]
	str	x0, [sp, 72]
	ldr	x0, [sp, 72]
	str	x0, [sp, 64]
	ldr	x0, [sp, 64]
	str	x0, [sp, 56]
	mov	x0, 288230376151711743
	nop
	nop
	str	x0, [sp, 40]
	add	x1, sp, 40
	add	x0, sp, 48
	bl	_ZSt3minImERKT_S2_S2_
	ldr	x0, [x0]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4969:
	.size	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_S_max_sizeERKS6_, .-_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE11_S_max_sizeERKS6_
	.section	.text._ZSt18uninitialized_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_,"axG",@progbits,_ZSt18uninitialized_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_,comdat
	.align	2
	.weak	_ZSt18uninitialized_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_
	.type	_ZSt18uninitialized_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_, %function
_ZSt18uninitialized_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_:
.LFB4971:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	mov	w0, 1
	strb	w0, [sp, 63]
	strb	wzr, [sp, 62]
	ldr	x2, [sp, 24]
	ldr	x1, [sp, 32]
	ldr	x0, [sp, 40]
	bl	_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET0_T_SE_SD_
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4971:
	.size	_ZSt18uninitialized_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_, .-_ZSt18uninitialized_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_
	.section	.text._ZNSt12_Destroy_auxILb0EE9__destroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvT_S9_,"axG",@progbits,_ZNSt12_Destroy_auxILb0EE9__destroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvT_S9_,comdat
	.align	2
	.weak	_ZNSt12_Destroy_auxILb0EE9__destroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvT_S9_
	.type	_ZNSt12_Destroy_auxILb0EE9__destroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvT_S9_, %function
_ZNSt12_Destroy_auxILb0EE9__destroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvT_S9_:
.LFB4973:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	b	.L216
.L217:
	ldr	x0, [sp, 24]
	bl	_ZSt11__addressofINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEPT_RS6_
	bl	_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_
	ldr	x0, [sp, 24]
	add	x0, x0, 32
	str	x0, [sp, 24]
.L216:
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 16]
	cmp	x1, x0
	bne	.L217
	nop
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4973:
	.size	_ZNSt12_Destroy_auxILb0EE9__destroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvT_S9_, .-_ZNSt12_Destroy_auxILb0EE9__destroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEEvT_S9_
	.section	.text._ZNSt15__new_allocatorIdE10deallocateEPdm,"axG",@progbits,_ZNSt15__new_allocatorIdE10deallocateEPdm,comdat
	.align	2
	.weak	_ZNSt15__new_allocatorIdE10deallocateEPdm
	.type	_ZNSt15__new_allocatorIdE10deallocateEPdm, %function
_ZNSt15__new_allocatorIdE10deallocateEPdm:
.LFB4999:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x0, [sp, 24]
	lsl	x0, x0, 3
	mov	x1, x0
	ldr	x0, [sp, 32]
	bl	_ZdlPvm
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4999:
	.size	_ZNSt15__new_allocatorIdE10deallocateEPdm, .-_ZNSt15__new_allocatorIdE10deallocateEPdm
	.section	.text._ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPdmEET_S3_T0_,"axG",@progbits,_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPdmEET_S3_T0_,comdat
	.align	2
	.weak	_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPdmEET_S3_T0_
	.type	_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPdmEET_S3_T0_, %function
_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPdmEET_S3_T0_:
.LFB5000:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 16]
	cmp	x0, 0
	beq	.L221
	ldr	x0, [sp, 24]
	bl	_ZSt11__addressofIdEPT_RS0_
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	bl	_ZSt10_ConstructIdJEEvPT_DpOT0_
	ldr	x0, [sp, 24]
	add	x0, x0, 8
	str	x0, [sp, 24]
	ldr	x0, [sp, 16]
	sub	x0, x0, #1
	ldr	x2, [sp, 40]
	mov	x1, x0
	ldr	x0, [sp, 24]
	bl	_ZSt6fill_nIPdmdET_S1_T0_RKT1_
	str	x0, [sp, 24]
.L221:
	ldr	x0, [sp, 24]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5000:
	.size	_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPdmEET_S3_T0_, .-_ZNSt27__uninitialized_default_n_1ILb1EE18__uninit_default_nIPdmEET_S3_T0_
	.section	.text._ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv,comdat
	.align	2
	.weak	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	.type	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv, %function
_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv:
.LFB5001:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 4992]
	cmp	x0, 623
	bls	.L224
	ldr	x0, [sp, 24]
	bl	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
.L224:
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 4992]
	add	x2, x0, 1
	ldr	x1, [sp, 24]
	str	x2, [x1, 4992]
	ldr	x1, [sp, 24]
	ldr	x0, [x1, x0, lsl 3]
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	lsr	x0, x0, 11
	and	x0, x0, 4294967295
	ldr	x1, [sp, 40]
	eor	x0, x1, x0
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	lsl	x1, x0, 7
	mov	x0, 22144
	movk	x0, 0x9d2c, lsl 16
	and	x0, x1, x0
	ldr	x1, [sp, 40]
	eor	x0, x1, x0
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	lsl	x1, x0, 15
	mov	x0, 4022730752
	and	x0, x1, x0
	ldr	x1, [sp, 40]
	eor	x0, x1, x0
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	lsr	x0, x0, 18
	ldr	x1, [sp, 40]
	eor	x0, x1, x0
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5001:
	.size	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv, .-_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	.section	.text._ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10deallocateEPS5_m,"axG",@progbits,_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10deallocateEPS5_m,comdat
	.align	2
	.weak	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10deallocateEPS5_m
	.type	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10deallocateEPS5_m, %function
_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10deallocateEPS5_m:
.LFB5005:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x0, [sp, 24]
	lsl	x0, x0, 5
	mov	x1, x0
	ldr	x0, [sp, 32]
	bl	_ZdlPvm
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5005:
	.size	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10deallocateEPS5_m, .-_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10deallocateEPS5_m
	.section	.text._ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE8allocateEmPKv,"axG",@progbits,_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE8allocateEmPKv,comdat
	.align	2
	.weak	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE8allocateEmPKv
	.type	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE8allocateEmPKv, %function
_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE8allocateEmPKv:
.LFB5007:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x0, [sp, 40]
	str	x0, [sp, 56]
	mov	x0, 288230376151711743
	ldr	x1, [sp, 32]
	cmp	x1, x0
	cset	w0, hi
	and	w0, w0, 255
	and	x0, x0, 255
	cmp	x0, 0
	cset	w0, ne
	and	w0, w0, 255
	and	w0, w0, 1
	cmp	w0, 0
	beq	.L230
	ldr	x1, [sp, 32]
	mov	x0, 576460752303423487
	cmp	x1, x0
	bls	.L231
	bl	_ZSt28__throw_bad_array_new_lengthv
.L231:
	bl	_ZSt17__throw_bad_allocv
.L230:
	ldr	x0, [sp, 32]
	lsl	x0, x0, 5
	bl	_Znwm
	nop
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5007:
	.size	_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE8allocateEmPKv, .-_ZNSt15__new_allocatorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE8allocateEmPKv
	.section	.text._ZNSt20__uninitialized_copyILb0EE13__uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET0_T_SE_SD_,"axG",@progbits,_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET0_T_SE_SD_,comdat
	.align	2
	.weak	_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET0_T_SE_SD_
	.type	_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET0_T_SE_SD_, %function
_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET0_T_SE_SD_:
.LFB5009:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x2, [sp, 24]
	ldr	x1, [sp, 32]
	ldr	x0, [sp, 40]
	bl	_ZSt16__do_uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5009:
	.size	_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET0_T_SE_SD_, .-_ZNSt20__uninitialized_copyILb0EE13__uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEET0_T_SE_SD_
	.section	.text._ZSt11__addressofINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEPT_RS6_,"axG",@progbits,_ZSt11__addressofINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEPT_RS6_,comdat
	.align	2
	.weak	_ZSt11__addressofINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEPT_RS6_
	.type	_ZSt11__addressofINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEPT_RS6_, %function
_ZSt11__addressofINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEPT_RS6_:
.LFB5010:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5010:
	.size	_ZSt11__addressofINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEPT_RS6_, .-_ZSt11__addressofINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEPT_RS6_
	.section	.text._ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_,"axG",@progbits,_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_,comdat
	.align	2
	.weak	_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_
	.type	_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_, %function
_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_:
.LFB5011:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5011:
	.size	_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_, .-_ZSt8_DestroyINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvPT_
	.section	.text._ZNSt15__new_allocatorIdE8allocateEmPKv,"axG",@progbits,_ZNSt15__new_allocatorIdE8allocateEmPKv,comdat
	.align	2
	.weak	_ZNSt15__new_allocatorIdE8allocateEmPKv
	.type	_ZNSt15__new_allocatorIdE8allocateEmPKv, %function
_ZNSt15__new_allocatorIdE8allocateEmPKv:
.LFB5025:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x0, [sp, 40]
	str	x0, [sp, 56]
	mov	x0, 1152921504606846975
	ldr	x1, [sp, 32]
	cmp	x1, x0
	cset	w0, hi
	and	w0, w0, 255
	and	x0, x0, 255
	cmp	x0, 0
	cset	w0, ne
	and	w0, w0, 255
	and	w0, w0, 1
	cmp	w0, 0
	beq	.L240
	ldr	x1, [sp, 32]
	mov	x0, 2305843009213693951
	cmp	x1, x0
	bls	.L241
	bl	_ZSt28__throw_bad_array_new_lengthv
.L241:
	bl	_ZSt17__throw_bad_allocv
.L240:
	ldr	x0, [sp, 32]
	lsl	x0, x0, 3
	bl	_Znwm
	nop
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5025:
	.size	_ZNSt15__new_allocatorIdE8allocateEmPKv, .-_ZNSt15__new_allocatorIdE8allocateEmPKv
	.section	.text._ZSt11__addressofIdEPT_RS0_,"axG",@progbits,_ZSt11__addressofIdEPT_RS0_,comdat
	.align	2
	.weak	_ZSt11__addressofIdEPT_RS0_
	.type	_ZSt11__addressofIdEPT_RS0_, %function
_ZSt11__addressofIdEPT_RS0_:
.LFB5026:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5026:
	.size	_ZSt11__addressofIdEPT_RS0_, .-_ZSt11__addressofIdEPT_RS0_
	.section	.text._ZSt10_ConstructIdJEEvPT_DpOT0_,"axG",@progbits,_ZSt10_ConstructIdJEEvPT_DpOT0_,comdat
	.align	2
	.weak	_ZSt10_ConstructIdJEEvPT_DpOT0_
	.type	_ZSt10_ConstructIdJEEvPT_DpOT0_, %function
_ZSt10_ConstructIdJEEvPT_DpOT0_:
.LFB5027:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	mov	x1, x0
	mov	x0, 8
	bl	_ZnwmPv
	str	xzr, [x0]
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5027:
	.size	_ZSt10_ConstructIdJEEvPT_DpOT0_, .-_ZSt10_ConstructIdJEEvPT_DpOT0_
	.section	.text._ZSt6fill_nIPdmdET_S1_T0_RKT1_,"axG",@progbits,_ZSt6fill_nIPdmdET_S1_T0_RKT1_,comdat
	.align	2
	.weak	_ZSt6fill_nIPdmdET_S1_T0_RKT1_
	.type	_ZSt6fill_nIPdmdET_S1_T0_RKT1_, %function
_ZSt6fill_nIPdmdET_S1_T0_RKT1_:
.LFB5028:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	ldr	x19, [sp, 56]
	ldr	x0, [sp, 48]
	bl	_ZSt17__size_to_integerm
	nop
	mov	w3, w20
	ldr	x2, [sp, 40]
	mov	x1, x0
	mov	x0, x19
	bl	_ZSt10__fill_n_aIPdmdET_S1_T0_RKT1_St26random_access_iterator_tag
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5028:
	.size	_ZSt6fill_nIPdmdET_S1_T0_RKT1_, .-_ZSt6fill_nIPdmdET_S1_T0_RKT1_
	.section	.text._ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv,comdat
	.align	2
	.weak	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	.type	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv, %function
_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv:
.LFB5029:
	.cfi_startproc
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	str	x0, [sp, 8]
	mov	x0, -2147483648
	str	x0, [sp, 56]
	mov	x0, 2147483647
	str	x0, [sp, 48]
	str	xzr, [sp, 72]
	b	.L250
.L253:
	ldr	x0, [sp, 8]
	ldr	x1, [sp, 72]
	ldr	x0, [x0, x1, lsl 3]
	and	x1, x0, -2147483648
	ldr	x0, [sp, 72]
	add	x2, x0, 1
	ldr	x0, [sp, 8]
	ldr	x0, [x0, x2, lsl 3]
	and	x0, x0, 2147483647
	orr	x0, x1, x0
	str	x0, [sp, 24]
	ldr	x0, [sp, 72]
	add	x1, x0, 397
	ldr	x0, [sp, 8]
	ldr	x1, [x0, x1, lsl 3]
	ldr	x0, [sp, 24]
	lsr	x0, x0, 1
	eor	x1, x1, x0
	ldr	x0, [sp, 24]
	and	x0, x0, 1
	cmp	x0, 0
	beq	.L251
	mov	x0, 45279
	movk	x0, 0x9908, lsl 16
	b	.L252
.L251:
	mov	x0, 0
.L252:
	eor	x2, x0, x1
	ldr	x0, [sp, 8]
	ldr	x1, [sp, 72]
	str	x2, [x0, x1, lsl 3]
	ldr	x0, [sp, 72]
	add	x0, x0, 1
	str	x0, [sp, 72]
.L250:
	ldr	x0, [sp, 72]
	cmp	x0, 226
	bls	.L253
	mov	x0, 227
	str	x0, [sp, 64]
	b	.L254
.L257:
	ldr	x0, [sp, 8]
	ldr	x1, [sp, 64]
	ldr	x0, [x0, x1, lsl 3]
	and	x1, x0, -2147483648
	ldr	x0, [sp, 64]
	add	x2, x0, 1
	ldr	x0, [sp, 8]
	ldr	x0, [x0, x2, lsl 3]
	and	x0, x0, 2147483647
	orr	x0, x1, x0
	str	x0, [sp, 32]
	ldr	x0, [sp, 64]
	sub	x1, x0, #227
	ldr	x0, [sp, 8]
	ldr	x1, [x0, x1, lsl 3]
	ldr	x0, [sp, 32]
	lsr	x0, x0, 1
	eor	x1, x1, x0
	ldr	x0, [sp, 32]
	and	x0, x0, 1
	cmp	x0, 0
	beq	.L255
	mov	x0, 45279
	movk	x0, 0x9908, lsl 16
	b	.L256
.L255:
	mov	x0, 0
.L256:
	eor	x2, x0, x1
	ldr	x0, [sp, 8]
	ldr	x1, [sp, 64]
	str	x2, [x0, x1, lsl 3]
	ldr	x0, [sp, 64]
	add	x0, x0, 1
	str	x0, [sp, 64]
.L254:
	ldr	x0, [sp, 64]
	cmp	x0, 622
	bls	.L257
	ldr	x0, [sp, 8]
	ldr	x0, [x0, 4984]
	and	x1, x0, -2147483648
	ldr	x0, [sp, 8]
	ldr	x0, [x0]
	and	x0, x0, 2147483647
	orr	x0, x1, x0
	str	x0, [sp, 40]
	ldr	x0, [sp, 8]
	ldr	x1, [x0, 3168]
	ldr	x0, [sp, 40]
	lsr	x0, x0, 1
	eor	x1, x1, x0
	ldr	x0, [sp, 40]
	and	x0, x0, 1
	cmp	x0, 0
	beq	.L258
	mov	x0, 45279
	movk	x0, 0x9908, lsl 16
	b	.L259
.L258:
	mov	x0, 0
.L259:
	eor	x1, x0, x1
	ldr	x0, [sp, 8]
	str	x1, [x0, 4984]
	ldr	x0, [sp, 8]
	str	xzr, [x0, 4992]
	nop
	add	sp, sp, 80
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5029:
	.size	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv, .-_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	.section	.text._ZSt16__do_uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_,"axG",@progbits,_ZSt16__do_uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_,comdat
	.align	2
	.weak	_ZSt16__do_uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_
	.type	_ZSt16__do_uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_, %function
_ZSt16__do_uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_:
.LFB5031:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5031
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -64
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	ldr	x0, [sp, 40]
	str	x0, [sp, 72]
	b	.L261
.L262:
	ldr	x0, [sp, 72]
	bl	_ZSt11__addressofINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEPT_RS6_
	ldr	x1, [sp, 56]
.LEHB20:
	bl	_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJRKPKcEEvPT_DpOT0_
.LEHE20:
	ldr	x0, [sp, 56]
	add	x0, x0, 8
	str	x0, [sp, 56]
	ldr	x0, [sp, 72]
	add	x0, x0, 32
	str	x0, [sp, 72]
.L261:
	ldr	x1, [sp, 56]
	ldr	x0, [sp, 48]
	cmp	x1, x0
	bne	.L262
	ldr	x0, [sp, 72]
	b	.L268
.L266:
	bl	__cxa_begin_catch
	ldr	x1, [sp, 72]
	ldr	x0, [sp, 40]
.LEHB21:
	bl	_ZSt8_DestroyIPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEvT_S7_
	bl	__cxa_rethrow
.LEHE21:
.L267:
	mov	x19, x0
	bl	__cxa_end_catch
	mov	x0, x19
.LEHB22:
	bl	_Unwind_Resume
.LEHE22:
.L268:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5031:
	.section	.gcc_except_table
	.align	2
.LLSDA5031:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT5031-.LLSDATTD5031
.LLSDATTD5031:
	.byte	0x1
	.uleb128 .LLSDACSE5031-.LLSDACSB5031
.LLSDACSB5031:
	.uleb128 .LEHB20-.LFB5031
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L266-.LFB5031
	.uleb128 0x1
	.uleb128 .LEHB21-.LFB5031
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L267-.LFB5031
	.uleb128 0
	.uleb128 .LEHB22-.LFB5031
	.uleb128 .LEHE22-.LEHB22
	.uleb128 0
	.uleb128 0
.LLSDACSE5031:
	.byte	0x1
	.byte	0
	.align	2
	.4byte	0

.LLSDATT5031:
	.section	.text._ZSt16__do_uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_,"axG",@progbits,_ZSt16__do_uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_,comdat
	.size	_ZSt16__do_uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_, .-_ZSt16__do_uninit_copyIPKPKcPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEET0_T_SC_SB_
	.section	.text._ZSt10__fill_n_aIPdmdET_S1_T0_RKT1_St26random_access_iterator_tag,"axG",@progbits,_ZSt10__fill_n_aIPdmdET_S1_T0_RKT1_St26random_access_iterator_tag,comdat
	.align	2
	.weak	_ZSt10__fill_n_aIPdmdET_S1_T0_RKT1_St26random_access_iterator_tag
	.type	_ZSt10__fill_n_aIPdmdET_S1_T0_RKT1_St26random_access_iterator_tag, %function
_ZSt10__fill_n_aIPdmdET_S1_T0_RKT1_St26random_access_iterator_tag:
.LFB5036:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	strb	w3, [sp, 16]
	ldr	x0, [sp, 32]
	cmp	x0, 0
	bne	.L270
	ldr	x0, [sp, 40]
	b	.L271
.L270:
	ldr	x0, [sp, 32]
	lsl	x0, x0, 3
	ldr	x1, [sp, 40]
	add	x0, x1, x0
	ldr	x2, [sp, 24]
	mov	x1, x0
	ldr	x0, [sp, 40]
	bl	_ZSt8__fill_aIPddEvT_S1_RKT0_
	ldr	x0, [sp, 32]
	lsl	x0, x0, 3
	ldr	x1, [sp, 40]
	add	x0, x1, x0
.L271:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5036:
	.size	_ZSt10__fill_n_aIPdmdET_S1_T0_RKT1_St26random_access_iterator_tag, .-_ZSt10__fill_n_aIPdmdET_S1_T0_RKT1_St26random_access_iterator_tag
	.section	.text._ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJRKPKcEEvPT_DpOT0_,"axG",@progbits,_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJRKPKcEEvPT_DpOT0_,comdat
	.align	2
	.weak	_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJRKPKcEEvPT_DpOT0_
	.type	_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJRKPKcEEvPT_DpOT0_, %function
_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJRKPKcEEvPT_DpOT0_:
.LFB5037:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5037
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	ldr	x19, [sp, 56]
	mov	x1, x19
	mov	x0, 32
	bl	_ZnwmPv
	mov	x20, x0
	mov	w21, 1
	ldr	x0, [sp, 48]
	bl	_ZSt7forwardIRKPKcEOT_RNSt16remove_referenceIS4_E4typeE
	ldr	x0, [x0]
	add	x1, sp, 64
	str	x1, [sp, 72]
	nop
	nop
	add	x1, sp, 64
	mov	x2, x1
	mov	x1, x0
	mov	x0, x20
.LEHB23:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
.LEHE23:
	add	x0, sp, 64
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	b	.L276
.L275:
	mov	x22, x0
	add	x0, sp, 64
	bl	_ZNSt15__new_allocatorIcED2Ev
	nop
	and	w0, w21, 1
	cmp	w0, 0
	beq	.L274
	mov	x1, x19
	mov	x0, x20
	bl	_ZdlPvS_
.L274:
	mov	x0, x22
.LEHB24:
	bl	_Unwind_Resume
.LEHE24:
.L276:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5037:
	.section	.gcc_except_table
.LLSDA5037:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5037-.LLSDACSB5037
.LLSDACSB5037:
	.uleb128 .LEHB23-.LFB5037
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L275-.LFB5037
	.uleb128 0
	.uleb128 .LEHB24-.LFB5037
	.uleb128 .LEHE24-.LEHB24
	.uleb128 0
	.uleb128 0
.LLSDACSE5037:
	.section	.text._ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJRKPKcEEvPT_DpOT0_,"axG",@progbits,_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJRKPKcEEvPT_DpOT0_,comdat
	.size	_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJRKPKcEEvPT_DpOT0_, .-_ZSt10_ConstructINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJRKPKcEEvPT_DpOT0_
	.section	.text._ZSt8__fill_aIPddEvT_S1_RKT0_,"axG",@progbits,_ZSt8__fill_aIPddEvT_S1_RKT0_,comdat
	.align	2
	.weak	_ZSt8__fill_aIPddEvT_S1_RKT0_
	.type	_ZSt8__fill_aIPddEvT_S1_RKT0_, %function
_ZSt8__fill_aIPddEvT_S1_RKT0_:
.LFB5038:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 40]
	str	x1, [sp, 32]
	str	x2, [sp, 24]
	ldr	x2, [sp, 24]
	ldr	x1, [sp, 32]
	ldr	x0, [sp, 40]
	bl	_ZSt9__fill_a1IPddEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5038:
	.size	_ZSt8__fill_aIPddEvT_S1_RKT0_, .-_ZSt8__fill_aIPddEvT_S1_RKT0_
	.section	.text._ZSt7forwardIRKPKcEOT_RNSt16remove_referenceIS4_E4typeE,"axG",@progbits,_ZSt7forwardIRKPKcEOT_RNSt16remove_referenceIS4_E4typeE,comdat
	.align	2
	.weak	_ZSt7forwardIRKPKcEOT_RNSt16remove_referenceIS4_E4typeE
	.type	_ZSt7forwardIRKPKcEOT_RNSt16remove_referenceIS4_E4typeE, %function
_ZSt7forwardIRKPKcEOT_RNSt16remove_referenceIS4_E4typeE:
.LFB5039:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	ldr	x0, [sp, 8]
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5039:
	.size	_ZSt7forwardIRKPKcEOT_RNSt16remove_referenceIS4_E4typeE, .-_ZSt7forwardIRKPKcEOT_RNSt16remove_referenceIS4_E4typeE
	.section	.text._ZSt9__fill_a1IPddEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_,"axG",@progbits,_ZSt9__fill_a1IPddEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_,comdat
	.align	2
	.weak	_ZSt9__fill_a1IPddEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_
	.type	_ZSt9__fill_a1IPddEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_, %function
_ZSt9__fill_a1IPddEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_:
.LFB5040:
	.cfi_startproc
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	str	x2, [sp, 8]
	ldr	x0, [sp, 8]
	ldr	d31, [x0]
	str	d31, [sp, 40]
	b	.L281
.L282:
	ldr	x0, [sp, 24]
	ldr	d31, [sp, 40]
	str	d31, [x0]
	ldr	x0, [sp, 24]
	add	x0, x0, 8
	str	x0, [sp, 24]
.L281:
	ldr	x1, [sp, 24]
	ldr	x0, [sp, 16]
	cmp	x1, x0
	bne	.L282
	nop
	nop
	add	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5040:
	.size	_ZSt9__fill_a1IPddEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_, .-_ZSt9__fill_a1IPddEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_
	.section	.rodata
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, %object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, %object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, %object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
	.type	_ZSt12__is_ratio_vISt5ratioILl1ELl1000000000EEE, %object
	.size	_ZSt12__is_ratio_vISt5ratioILl1ELl1000000000EEE, 1
_ZSt12__is_ratio_vISt5ratioILl1ELl1000000000EEE:
	.byte	1
	.type	_ZSt12__is_ratio_vISt5ratioILl1ELl1EEE, %object
	.size	_ZSt12__is_ratio_vISt5ratioILl1ELl1EEE, 1
_ZSt12__is_ratio_vISt5ratioILl1ELl1EEE:
	.byte	1
	.type	_ZSt12__is_ratio_vISt5ratioILl1000000000ELl1EEE, %object
	.size	_ZSt12__is_ratio_vISt5ratioILl1000000000ELl1EEE, 1
_ZSt12__is_ratio_vISt5ratioILl1000000000ELl1EEE:
	.byte	1
	.align	3
.LC12:
	.string	"Warning: PAPI_add_event failed for event "
	.align	3
.LC13:
	.string	" ("
	.align	3
.LC14:
	.string	").\n"
	.align	3
.LC15:
	.string	"PAPI error: "
	.align	3
.LC16:
	.string	"Create EventSet"
	.align	3
.LC17:
	.string	" -> "
	.text
	.align	2
	.type	main._omp_fn.0, %function
main._omp_fn.0:
.LFB5041:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5041
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -64
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 8]
	str	x0, [sp, 64]
	ldr	x0, [sp, 40]
	ldr	w0, [x0, 16]
	str	w0, [sp, 60]
	mov	w0, -1
	str	w0, [sp, 52]
	add	x0, sp, 52
	bl	PAPI_create_eventset
	str	w0, [sp, 56]
	ldr	w0, [sp, 56]
	cmp	w0, 0
	bne	.L284
	ldr	w19, [sp, 52]
	bl	omp_get_thread_num
	mov	w1, w0
	ldr	x0, [sp, 64]
	sxtw	x1, w1
	str	w19, [x0, x1, lsl 2]
	str	wzr, [sp, 76]
	nop
.L287:
	ldr	w1, [sp, 76]
	ldr	w0, [sp, 60]
	cmp	w1, w0
	bge	.L290
	ldr	w19, [sp, 52]
	ldrsw	x1, [sp, 76]
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	bl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEixEm
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv
	mov	x1, x0
	mov	w0, w19
	bl	PAPI_add_named_event
	str	w0, [sp, 56]
	ldr	w0, [sp, 56]
	cmp	w0, 0
	bne	.L286
.L288:
	ldr	w0, [sp, 76]
	add	w0, w0, 1
	str	w0, [sp, 76]
	b	.L287
.L286:
	adrp	x0, .LC12
	add	x1, x0, :lo12:.LC12
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 76]
	bl	_ZNSolsEi
	mov	x2, x0
	adrp	x0, .LC13
	add	x1, x0, :lo12:.LC13
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldr	w0, [sp, 56]
	bl	PAPI_strerror
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC14
	add	x1, x0, :lo12:.LC14
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	b	.L288
.L284:
	adrp	x0, .LC15
	add	x1, x0, :lo12:.LC15
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC16
	add	x1, x0, :lo12:.LC16
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC17
	add	x1, x0, :lo12:.LC17
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldr	w0, [sp, 56]
	bl	PAPI_strerror
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	add	x1, x0, :lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 1
	bl	exit
.L290:
	nop
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5041:
	.section	.gcc_except_table
.LLSDA5041:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5041-.LLSDACSB5041
.LLSDACSB5041:
.LLSDACSE5041:
	.text
	.size	main._omp_fn.0, .-main._omp_fn.0
	.align	2
	.type	main._omp_fn.1, %function
main._omp_fn.1:
.LFB5042:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5042
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	str	x0, [sp, 40]
	bl	omp_get_thread_num
	mov	w1, w0
	ldr	x0, [sp, 40]
	sxtw	x1, w1
	ldr	w0, [x0, x1, lsl 2]
	bl	PAPI_start
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5042:
	.section	.gcc_except_table
.LLSDA5042:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5042-.LLSDACSB5042
.LLSDACSB5042:
.LLSDACSE5042:
	.text
	.size	main._omp_fn.1, .-main._omp_fn.1
	.section	.rodata
	.align	3
.LC18:
	.string	"Thread "
	.align	3
.LC19:
	.string	" "
	.align	3
.LC20:
	.string	": "
	.align	3
.LC21:
	.string	"Warning: PAPI_destroy_eventset: "
	.align	3
.LC22:
	.string	"\\n"
	.align	3
.LC23:
	.string	"Warning: PAPI_cleanup_eventset: "
	.align	3
.LC24:
	.string	"Stop Counters"
	.text
	.align	2
	.type	main._omp_fn.2, %function
main._omp_fn.2:
.LFB5043:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5043
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	mov	x29, sp
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	.cfi_offset 27, -80
	.cfi_offset 28, -72
	str	x0, [x29, 104]
	ldr	x0, [x29, 104]
	ldr	x0, [x0, 16]
	str	x0, [x29, 144]
	ldr	x0, [x29, 104]
	ldr	w0, [x0, 24]
	str	w0, [x29, 140]
	mov	x0, sp
	mov	x28, x0
	bl	omp_get_thread_num
	mov	w1, w0
	ldr	x0, [x29, 144]
	sxtw	x1, w1
	ldr	w0, [x0, x1, lsl 2]
	str	w0, [x29, 112]
	ldr	w0, [x29, 140]
	sxtw	x1, w0
	sub	x1, x1, #1
	str	x1, [x29, 128]
	sxtw	x1, w0
	mov	x22, x1
	mov	x23, 0
	lsr	x1, x22, 58
	lsl	x27, x23, 6
	orr	x27, x1, x27
	lsl	x26, x22, 6
	sxtw	x1, w0
	mov	x20, x1
	mov	x21, 0
	lsr	x1, x20, 58
	lsl	x25, x21, 6
	orr	x25, x1, x25
	lsl	x24, x20, 6
	sxtw	x0, w0
	lsl	x0, x0, 3
	add	x0, x0, 15
	lsr	x0, x0, 4
	lsl	x0, x0, 4
	sub	sp, sp, x0
	mov	x0, sp
	add	x0, x0, 7
	lsr	x0, x0, 3
	lsl	x0, x0, 3
	str	x0, [x29, 120]
	ldr	w0, [x29, 112]
	ldr	x1, [x29, 120]
	bl	PAPI_stop
	str	w0, [x29, 116]
	ldr	w0, [x29, 116]
	cmp	w0, 0
	bne	.L293
	ldr	w0, [x29, 112]
	bl	PAPI_cleanup_eventset
	str	w0, [x29, 116]
	ldr	w0, [x29, 116]
	cmp	w0, 0
	bne	.L294
.L299:
	add	x0, x29, 112
	bl	PAPI_destroy_eventset
	str	w0, [x29, 116]
	ldr	w0, [x29, 116]
	cmp	w0, 0
	bne	.L295
.L298:
	bl	GOMP_critical_start
	adrp	x0, .LC18
	add	x1, x0, :lo12:.LC18
	adrp	x0, _ZSt4cout
	add	x0, x0, :lo12:_ZSt4cout
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	bl	omp_get_thread_num
	mov	w1, w0
	mov	x0, x19
	bl	_ZNSolsEi
	str	wzr, [x29, 156]
	nop
.L297:
	ldr	w1, [x29, 156]
	ldr	w0, [x29, 140]
	cmp	w1, w0
	blt	.L296
	ldr	x0, [x29, 120]
	ldr	x1, [x0]
	ldr	x0, [x29, 104]
	ldr	x0, [x0, 8]
	add	x1, x1, x0
	ldr	x0, [x29, 104]
	str	x1, [x0, 8]
	bl	GOMP_critical_end
	mov	sp, x28
	b	.L300
.L296:
	adrp	x0, .LC19
	add	x1, x0, :lo12:.LC19
	adrp	x0, _ZSt4cout
	add	x0, x0, :lo12:_ZSt4cout
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldrsw	x1, [x29, 156]
	ldr	x0, [x29, 104]
	ldr	x0, [x0]
	bl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEixEm
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	mov	x2, x0
	adrp	x0, .LC20
	add	x1, x0, :lo12:.LC20
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	ldr	x0, [x29, 120]
	ldrsw	x1, [x29, 156]
	ldr	x0, [x0, x1, lsl 3]
	mov	x1, x0
	mov	x0, x2
	bl	_ZNSolsEx
	mov	x2, x0
	adrp	x0, .LC7
	add	x1, x0, :lo12:.LC7
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w0, [x29, 156]
	add	w0, w0, 1
	str	w0, [x29, 156]
	b	.L297
.L295:
	adrp	x0, .LC21
	add	x1, x0, :lo12:.LC21
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldr	w0, [x29, 116]
	bl	PAPI_strerror
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC22
	add	x1, x0, :lo12:.LC22
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	b	.L298
.L294:
	adrp	x0, .LC23
	add	x1, x0, :lo12:.LC23
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldr	w0, [x29, 116]
	bl	PAPI_strerror
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC22
	add	x1, x0, :lo12:.LC22
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	b	.L299
.L293:
	adrp	x0, .LC15
	add	x1, x0, :lo12:.LC15
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC24
	add	x1, x0, :lo12:.LC24
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC17
	add	x1, x0, :lo12:.LC17
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldr	w0, [x29, 116]
	bl	PAPI_strerror
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	add	x1, x0, :lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 1
	bl	exit
.L300:
	mov	sp, x29
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE5043:
	.section	.gcc_except_table
.LLSDA5043:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5043-.LLSDACSB5043
.LLSDACSB5043:
.LLSDACSE5043:
	.text
	.size	main._omp_fn.2, .-main._omp_fn.2
	.align	2
	.type	main._omp_fn.3, %function
main._omp_fn.3:
.LFB5044:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5044
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -64
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 8]
	str	x0, [sp, 64]
	ldr	x0, [sp, 40]
	ldr	w0, [x0, 16]
	str	w0, [sp, 60]
	mov	w0, -1
	str	w0, [sp, 52]
	add	x0, sp, 52
	bl	PAPI_create_eventset
	str	w0, [sp, 56]
	ldr	w0, [sp, 56]
	cmp	w0, 0
	bne	.L302
	ldr	w19, [sp, 52]
	bl	omp_get_thread_num
	mov	w1, w0
	ldr	x0, [sp, 64]
	sxtw	x1, w1
	str	w19, [x0, x1, lsl 2]
	str	wzr, [sp, 76]
	nop
.L305:
	ldr	w1, [sp, 76]
	ldr	w0, [sp, 60]
	cmp	w1, w0
	bge	.L308
	ldr	w19, [sp, 52]
	ldrsw	x1, [sp, 76]
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	bl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEixEm
	bl	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv
	mov	x1, x0
	mov	w0, w19
	bl	PAPI_add_named_event
	str	w0, [sp, 56]
	ldr	w0, [sp, 56]
	cmp	w0, 0
	bne	.L304
.L306:
	ldr	w0, [sp, 76]
	add	w0, w0, 1
	str	w0, [sp, 76]
	b	.L305
.L304:
	adrp	x0, .LC12
	add	x1, x0, :lo12:.LC12
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 76]
	bl	_ZNSolsEi
	mov	x2, x0
	adrp	x0, .LC13
	add	x1, x0, :lo12:.LC13
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldr	w0, [sp, 56]
	bl	PAPI_strerror
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC14
	add	x1, x0, :lo12:.LC14
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	b	.L306
.L302:
	adrp	x0, .LC15
	add	x1, x0, :lo12:.LC15
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC16
	add	x1, x0, :lo12:.LC16
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC17
	add	x1, x0, :lo12:.LC17
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldr	w0, [sp, 56]
	bl	PAPI_strerror
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	add	x1, x0, :lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 1
	bl	exit
.L308:
	nop
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5044:
	.section	.gcc_except_table
.LLSDA5044:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5044-.LLSDACSB5044
.LLSDACSB5044:
.LLSDACSE5044:
	.text
	.size	main._omp_fn.3, .-main._omp_fn.3
	.align	2
	.type	main._omp_fn.4, %function
main._omp_fn.4:
.LFB5045:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5045
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	str	x0, [sp, 40]
	bl	omp_get_thread_num
	mov	w1, w0
	ldr	x0, [sp, 40]
	sxtw	x1, w1
	ldr	w0, [x0, x1, lsl 2]
	bl	PAPI_start
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5045:
	.section	.gcc_except_table
.LLSDA5045:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5045-.LLSDACSB5045
.LLSDACSB5045:
.LLSDACSE5045:
	.text
	.size	main._omp_fn.4, .-main._omp_fn.4
	.align	2
	.type	main._omp_fn.5, %function
main._omp_fn.5:
.LFB5046:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA5046
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	mov	x29, sp
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	.cfi_offset 27, -80
	.cfi_offset 28, -72
	str	x0, [x29, 104]
	ldr	x0, [x29, 104]
	ldr	x0, [x0, 16]
	str	x0, [x29, 144]
	ldr	x0, [x29, 104]
	ldr	w0, [x0, 24]
	str	w0, [x29, 140]
	mov	x0, sp
	mov	x28, x0
	bl	omp_get_thread_num
	mov	w1, w0
	ldr	x0, [x29, 144]
	sxtw	x1, w1
	ldr	w0, [x0, x1, lsl 2]
	str	w0, [x29, 112]
	ldr	w0, [x29, 140]
	sxtw	x1, w0
	sub	x1, x1, #1
	str	x1, [x29, 128]
	sxtw	x1, w0
	mov	x22, x1
	mov	x23, 0
	lsr	x1, x22, 58
	lsl	x27, x23, 6
	orr	x27, x1, x27
	lsl	x26, x22, 6
	sxtw	x1, w0
	mov	x20, x1
	mov	x21, 0
	lsr	x1, x20, 58
	lsl	x25, x21, 6
	orr	x25, x1, x25
	lsl	x24, x20, 6
	sxtw	x0, w0
	lsl	x0, x0, 3
	add	x0, x0, 15
	lsr	x0, x0, 4
	lsl	x0, x0, 4
	sub	sp, sp, x0
	mov	x0, sp
	add	x0, x0, 7
	lsr	x0, x0, 3
	lsl	x0, x0, 3
	str	x0, [x29, 120]
	ldr	w0, [x29, 112]
	ldr	x1, [x29, 120]
	bl	PAPI_stop
	str	w0, [x29, 116]
	ldr	w0, [x29, 116]
	cmp	w0, 0
	bne	.L311
	ldr	w0, [x29, 112]
	bl	PAPI_cleanup_eventset
	str	w0, [x29, 116]
	ldr	w0, [x29, 116]
	cmp	w0, 0
	bne	.L312
.L317:
	add	x0, x29, 112
	bl	PAPI_destroy_eventset
	str	w0, [x29, 116]
	ldr	w0, [x29, 116]
	cmp	w0, 0
	bne	.L313
.L316:
	bl	GOMP_critical_start
	adrp	x0, .LC18
	add	x1, x0, :lo12:.LC18
	adrp	x0, _ZSt4cout
	add	x0, x0, :lo12:_ZSt4cout
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	bl	omp_get_thread_num
	mov	w1, w0
	mov	x0, x19
	bl	_ZNSolsEi
	str	wzr, [x29, 156]
	nop
.L315:
	ldr	w1, [x29, 156]
	ldr	w0, [x29, 140]
	cmp	w1, w0
	blt	.L314
	ldr	x0, [x29, 120]
	ldr	x1, [x0]
	ldr	x0, [x29, 104]
	ldr	x0, [x0, 8]
	add	x1, x1, x0
	ldr	x0, [x29, 104]
	str	x1, [x0, 8]
	bl	GOMP_critical_end
	mov	sp, x28
	b	.L318
.L314:
	adrp	x0, .LC19
	add	x1, x0, :lo12:.LC19
	adrp	x0, _ZSt4cout
	add	x0, x0, :lo12:_ZSt4cout
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldrsw	x1, [x29, 156]
	ldr	x0, [x29, 104]
	ldr	x0, [x0]
	bl	_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EEixEm
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE
	mov	x2, x0
	adrp	x0, .LC20
	add	x1, x0, :lo12:.LC20
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	ldr	x0, [x29, 120]
	ldrsw	x1, [x29, 156]
	ldr	x0, [x0, x1, lsl 3]
	mov	x1, x0
	mov	x0, x2
	bl	_ZNSolsEx
	mov	x2, x0
	adrp	x0, .LC7
	add	x1, x0, :lo12:.LC7
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w0, [x29, 156]
	add	w0, w0, 1
	str	w0, [x29, 156]
	b	.L315
.L313:
	adrp	x0, .LC21
	add	x1, x0, :lo12:.LC21
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldr	w0, [x29, 116]
	bl	PAPI_strerror
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC22
	add	x1, x0, :lo12:.LC22
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	b	.L316
.L312:
	adrp	x0, .LC23
	add	x1, x0, :lo12:.LC23
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldr	w0, [x29, 116]
	bl	PAPI_strerror
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC22
	add	x1, x0, :lo12:.LC22
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	b	.L317
.L311:
	adrp	x0, .LC15
	add	x1, x0, :lo12:.LC15
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC24
	add	x1, x0, :lo12:.LC24
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, .LC17
	add	x1, x0, :lo12:.LC17
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x19, x0
	ldr	w0, [x29, 116]
	bl	PAPI_strerror
	mov	x1, x0
	mov	x0, x19
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	add	x1, x0, :lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 1
	bl	exit
.L318:
	mov	sp, x29
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE5046:
	.section	.gcc_except_table
.LLSDA5046:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5046-.LLSDACSB5046
.LLSDACSB5046:
.LLSDACSE5046:
	.text
	.size	main._omp_fn.5, .-main._omp_fn.5
	.align	2
	.type	_Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii._omp_fn.0, %function
_Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii._omp_fn.0:
.LFB5047:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	str	d15, [sp, 32]
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	.cfi_offset 79, -80
	str	x0, [sp, 56]
	ldr	x0, [sp, 56]
	ldr	w0, [x0, 24]
	str	w0, [sp, 96]
	ldr	w19, [sp, 96]
	bl	omp_get_num_threads
	mov	w20, w0
	bl	omp_get_thread_num
	mov	w2, w0
	sdiv	w0, w19, w20
	sdiv	w1, w19, w20
	mul	w1, w1, w20
	sub	w1, w19, w1
	cmp	w2, w1
	blt	.L320
.L327:
	mul	w2, w0, w2
	add	w1, w2, w1
	add	w19, w1, w0
	cmp	w1, w19
	bge	.L328
	str	w1, [sp, 108]
.L323:
	str	wzr, [sp, 104]
	nop
.L325:
	ldr	w1, [sp, 104]
	ldr	w0, [sp, 96]
	cmp	w1, w0
	blt	.L322
	ldr	w0, [sp, 108]
	add	w0, w0, 1
	str	w0, [sp, 108]
	ldr	w0, [sp, 108]
	cmp	w0, w19
	blt	.L323
	b	.L328
.L322:
	ldrsw	x1, [sp, 108]
	ldrsw	x0, [sp, 96]
	mul	x1, x1, x0
	ldrsw	x0, [sp, 104]
	add	x1, x1, x0
	ldr	x0, [sp, 56]
	ldr	x0, [x0]
	bl	_ZNSt6vectorIdSaIdEEixEm
	ldr	d31, [x0]
	str	d31, [sp, 88]
	ldrsw	x1, [sp, 108]
	ldrsw	x0, [sp, 96]
	mul	x0, x1, x0
	str	x0, [sp, 80]
	ldrsw	x1, [sp, 104]
	ldrsw	x0, [sp, 96]
	mul	x0, x1, x0
	str	x0, [sp, 72]
	str	wzr, [sp, 100]
	nop
.L326:
	ldr	w1, [sp, 100]
	ldr	w0, [sp, 96]
	cmp	w1, w0
	blt	.L324
	ldr	w0, [sp, 104]
	add	w0, w0, 1
	str	w0, [sp, 104]
	b	.L325
.L324:
	ldrsw	x1, [sp, 100]
	ldr	x0, [sp, 72]
	add	x1, x1, x0
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 8]
	bl	_ZNSt6vectorIdSaIdEEixEm
	ldr	d30, [x0]
	ldr	d31, [sp, 88]
	isb
	fmul	d15, d30, d31
	ldrsw	x1, [sp, 100]
	ldr	x0, [sp, 80]
	add	x1, x1, x0
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 16]
	bl	_ZNSt6vectorIdSaIdEEixEm
	ldr	d31, [x0]
	isb
	fadd	d31, d31, d15
	str	d31, [x0]
	ldr	w0, [sp, 100]
	add	w0, w0, 1
	str	w0, [sp, 100]
	b	.L326
.L320:
	mov	w1, 0
	add	w0, w0, 1
	b	.L327
.L328:
	nop
	ldr	d15, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 79
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5047:
	.size	_Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii._omp_fn.0, .-_Z13matmul_kernelRSt6vectorIdSaIdEES2_S2_ii._omp_fn.0
	.section	.rodata
	.align	4
.LC10:
	.word	0
	.word	0
	.word	0
	.word	1075773440
	.align	4
.LC11:
	.word	0
	.word	0
	.word	0
	.word	1073741824
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align	3
	.type	DW.ref.__gxx_personality_v0, %object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.xword	__gxx_personality_v0
	.global	__fixunstfdi
	.global	__divtf3
	.global	__gxx_personality_v0
	.ident	"GCC: (Spack GCC) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
