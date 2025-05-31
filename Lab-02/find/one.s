	.file	"one.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "%d\0"
LC1:
	.ascii "Found\0"
LC2:
	.ascii "Not Found\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 64
	call	___main
	mov	DWORD PTR [esp+32], 10
	mov	DWORD PTR [esp+36], 30
	mov	DWORD PTR [esp+40], 50
	mov	DWORD PTR [esp+44], 40
	mov	DWORD PTR [esp+48], 90
	mov	DWORD PTR [esp+52], 80
	lea	eax, [esp+28]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_scanf
	mov	DWORD PTR [esp+60], 0
	mov	DWORD PTR [esp+56], 0
	jmp	L2
L4:
	mov	eax, DWORD PTR [esp+56]
	mov	edx, DWORD PTR [esp+32+eax*4]
	mov	eax, DWORD PTR [esp+28]
	cmp	edx, eax
	jne	L3
	mov	DWORD PTR [esp+60], 1
L3:
	add	DWORD PTR [esp+56], 1
L2:
	cmp	DWORD PTR [esp+56], 5
	jle	L4
	cmp	DWORD PTR [esp+60], 1
	jne	L5
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_printf
	jmp	L6
L5:
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
L6:
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
