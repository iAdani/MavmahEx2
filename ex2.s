# 208642884 Guy Adani

    .text                   # code starts here

# go function, A in %rdi
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

# even function
even:
    movb	%sil, %cl
	shll    %cl, %edi
    movl  %edi, %eax
    ret
