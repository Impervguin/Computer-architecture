        .section .text
        .globl _start;
        len = 9 #Размер массива
        enroll = 2 #Количество обрабатываемых элементов за одну итерацию
        elem_sz = 4 #Размер одного элемента массива

_start:
        la x1, _x
        addi x20, x0, (len-1)/enroll
        lw x31, 0(x1)
        addi x1, x1, elem_sz*1
lp:
        lw x2, 0(x1)
        lw x3, 4(x1)
        add x1, x1, elem_sz*enroll
        
        sub x4, x31, x2
        slt x5, x2, x31 # x5 = 1 if x2 < x31
        addi x5, x5, -1 # x5 = 11.....11 if x2 > x31
        and x4, x4, x5  # x4 = 0 if x2 < x31
        sub x31, x31, x4
        
        sub x4, x31, x3
        slt x5, x3, x31 # x5 = 1 if x3 < x31
        addi x5, x5, -1 # x5 = 11.....11 if x3 > x31
        and x4, x4, x5  # x4 = 0 if x3 < x31
        sub x31, x31, x4

        addi x20, x20, -1
        bne x20, x0, lp
lp2: j lp2

        .section .data
_x:     .4byte 0x1
        .4byte 0x2
        .4byte 0x3
        .4byte 0x4
        .4byte 0x8
        .4byte 0x6
        .4byte 0x7
        .4byte 0x5
        .4byte 0x4
