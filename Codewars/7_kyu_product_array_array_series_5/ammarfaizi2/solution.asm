; SPDX-License-Identifier: GPL-2.0-only
;
; Copyright (C) 2021  Ammar Faizi <ammarfaizi2@gmail.com>
;

[section .text]

extern malloc
global product_array

; int *product_array(const int *, size_t);
product_array:
	push	rbp
	push	rbx
	sub	rsp, 8

	; Allocate a heap for the result here.
	mov	rbp, rdi
	mov	rbx, rsi
	lea	rdi, [rsi + 1]
	shl	rdi, 2
	call	malloc
	test	rax, rax

	; ENOMEM?
	jz	.l_out

	mov	rsi, rax
	mov	eax, 1
	xor	edi, edi

.l_loop:
	mov	ecx, [rbp + rdi * 4]
	mul	ecx
	add	rdi, 1
	cmp	rdi, rbx
	jb	.l_loop

	mov	r8d, eax
	xor	edi, edi
.l_loop:
	mov	ecx, [rbp + rdi * 4]
	xor	edx, edx
	mov	

.l_out:
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret


Okay, kalau butuh sesuatu yang bisa ku bantu bilang aja ya.