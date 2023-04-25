global ColumnsSum_

ColumnsSum_:
        test    edx, edx
        je      .LBB1_6
        mov     eax, ecx
        movsxd  r8, ecx
        mov     edx, edx
        shl     r8, 2
        xor     r9d, r9d
        jmp     .LBB1_2
.LBB1_5:
        inc     r9
        add     rdi, r8
        cmp     r9, rdx
        je      .LBB1_6
.LBB1_2:
        test    ecx, ecx
        je      .LBB1_5
        xor     r10d, r10d
.LBB1_4:
        mov     r11d, [rdi + 4*r10]
        add     [rsi + 4*r10], r11d
        inc     r10
        cmp     rax, r10
        jne     .LBB1_4
        jmp     .LBB1_5
.LBB1_6:
        ret