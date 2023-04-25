global ColumnsSum_

ColumnsSum_:
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
        ; Инициализация счетчика столбцов
        xor     r10d, r10d
body:
        ; Получение значения текущего элемента массива
        mov     r11d, [rdi + 4*r10]
        ; Обновление элемента выходного массива
        add     [rsi + 4*r10], r11d
        ; Инкремент счетчика столбцов
        inc     r10
        ; Если мы еще не перебрали все строки, то продолжаем
        cmp     rax, r10
        jne     body
        ; Иначе выходим во внешний цикл
        jmp     outer_loop
end:
        ret