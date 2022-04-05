.data
shouldben1:    .asciiz "Should be -1, and firstposshift and firstposmask returned: "
shouldbe0:    .asciiz "Should be 0 , and firstposshift and firstposmask returned: "
shouldbe16:    .asciiz "Should be 16, and firstposshift and firstposmask returned: "
shouldbe31:    .asciiz "Should be 31, and firstposshift and firstposmask returned: "

.text
main:
    la    a1, shouldbe31
    jal    print_str
    lui    a1, 0x80000    # should be 31
    jal    first1posshift
    mv    a1, a0
    jal    print_int
    jal    print_space

    lui    a1, 0x80000
    jal    first1posmask
    mv    a1, a0
    jal    print_int
    jal    print_newline

    la    a1, shouldbe16
    jal    print_str
    lui    a1, 0x0010    # should be 16
    jal    first1posshift
    mv    a1, a0
    jal    print_int
    jal    print_space

    lui    a1, 0x0010
    jal    first1posmask
    mv    a1, a0
    jal    print_int
    jal    print_newline

    la    a1, shouldbe0
    jal    print_str
    li    a1, 1        # should be 0
    jal    first1posshift
    mv    a1, a0
    jal    print_int
    jal    print_space

    li    a1, 1
    jal    first1posmask
    mv    a1, a0
    jal    print_int
    jal    print_newline

    la    a1, shouldben1
    jal    print_str
    mv    a1, zero        # should be -1
    jal    first1posshift
    mv    a1, a0
    jal    print_int
    jal    print_space

    mv    a1, zero
    jal    first1posmask
    mv    a1, a0
    jal    print_int
    jal    print_newline

    li    a0, 10
    ecall

first1posshift:
    ### YOUR CODE HERE ###
###右移，直到移到某一位上时a1变成0，左边就再也没有1了，刚刚那一位就是最左的1###
    li a0 -1
    j pos_loop
pos_loop:
    beqz a1, exit_pos
    srli a1,a1,1
    addi a0,a0,1
    jal x0,pos_loop
exit_pos:
    jalr ra

first1posmask:
    ### YOUR CODE HERE ###
###从左往右检查每一位，&t1之后是不是0，不是0就是最左的1##
    li t1 0x80000000
    li a0 31
    li t3 -1
    j mask_loop
mask_loop:
    and t2,t1,a1
    bnez t2,mask_exit
    beq a0,t3,mask_exit
    srli t1,t1,1
    addi a0,a0,-1
    jal x0,mask_loop
mask_exit:
    jalr ra
    

print_int:
    mv    a1, a0
    li    a0, 1
    ecall
    jr    ra

print_str:
    li    a0, 4
    ecall
    jr    ra

print_space:
    li    a1, ' '
    li    a0, 11
    ecall
    jr    ra

print_newline:
    li    a1, '\n'
    li    a0, 11
    ecall
    jr    ra
