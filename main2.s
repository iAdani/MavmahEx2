	.file	"main2.c"
	.text
	.globl	even
	.type	even, @function
	jmp main
even:
	movb	%sil, %cl
	shll    %cl, %edi
    movl  %edi, %eax
    ret
.LFE0:
	.size	even, .-even
	.globl	go
	.type	go, @function
go:
    xorq    %r8, %r8      # sum
    xorq    %r9, %r9      # i

.L2:                      # while
    leaq    (%rdi, %r9, 4), %rcx
	movl	(%rcx), %ecx
    movb    %cl, %dl      # from here we check if LS bit is 1
    andb    $1, %dl
    cmpb    $1, %dl
    js      .L3           # if % 2 == 0 goto .L3
    
    addl    %ecx, %r8d
    jmp     .L4  

.L3:
    movq    %r9, %rsi
	movq	%rdi, %r15	  # save %rdi for later use
	movl	%ecx, %edi
    call    even
	movq	%r15, %rdi
    addl    %eax, %r8d

.L4:
    incb    %r9b          # i++
    cmpb    $10, %r9b     # if i < 10, go back
    js .L2

    movq  %r8, %rax
    ret
.LFE1:
	.size	go, .-go
	.section	.rodata
.LC0:
	.string	"this is you answer: %d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$2, -48(%rbp)
	movl	$1, -44(%rbp)
	movl	$2, -40(%rbp)
	movl	$1, -36(%rbp)
	movl	$1, -32(%rbp)
	movl	$1, -28(%rbp)
	movl	$1, -24(%rbp)
	movl	$1, -20(%rbp)
	movl	$1, -16(%rbp)
	movl	$1, -12(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	go
	movl	%eax, -52(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
