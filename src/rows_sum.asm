global RowsSum_

RowsSum_:
		; rdi = array, rsi = output
		; rdx = rows, rcx = columns

        mov     eax, ecx

        ; Смещение, необходимое для перехода к следующей строке
        movsxd  r8, ecx
        shl     r8, 2

        ; Инициализация счетчика строк
        xor     r9d, r9d
        jmp     inner_loop
outer_loop:
		; Увеличение счетчика текущей строки
        inc     r9
        ; Переход к следующей строке
        add     rdi, r8
        ; Конец программы, если мы перебрали все строки
        cmp     r9, rdx
        je      end
inner_loop:
		; Получение текущего значения
        mov     r10d, [rsi + 4*r9]
        ; Инициализация счетчика столбцов
        xor     r11d, r11d
body:
		; Обновление текущего значения
        add     r10d, [rdi + 4*r11]
        ; Сохранение результата в выходном массиве
        mov     [rsi + 4*r9], r10d
        ; Увеличение счетчика текущего столбца
        inc     r11
        ; Если мы еще не перебрали все строки, то продолжаем
        cmp     rax, r11
        jne     body
        ; Иначе выходим в внешний цикл
        jmp     outer_loop
end:
        ret
