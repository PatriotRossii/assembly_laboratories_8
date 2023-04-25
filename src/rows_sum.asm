global RowsSum_

RowsSum_:
        test    edx, edx
        je      .LBB0_6
        mov     eax, ecx
        movsxd  r8, ecx
        mov     edx, edx
        shl     r8, 2
        xor     r9d, r9d
        jmp     .LBB0_2
.LBB0_5:
        inc     r9
        add     rdi, r8
        cmp     r9, rdx
        je      .LBB0_6
.LBB0_2:
        test    ecx, ecx
        je      .LBB0_5
        mov     r10d, [rsi + 4*r9]
        xor     r11d, r11d
.LBB0_4:
        add     r10d, [rdi + 4*r11]
        mov     [rsi + 4*r9], r10d
        inc     r11
        cmp     rax, r11
        jne     .LBB0_4
        jmp     .LBB0_5
.LBB0_6:
        ret
