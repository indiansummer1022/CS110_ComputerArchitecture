# Lab 3

### Exercise 1

1. What do the `.data`, `.word`, `.text` directives mean (i.e. what do you use them for)? **Hint**: think about the 4 sections of memory.

- `.text` is a read-only section containing executable code

- `.data` is a read-write section containing global or static variables

- `.word` indicates 32-bit comma separated words (naturally aligned)

  

2. Run the program to completion. What number did the program output? What does this number represent?

   Output 34

   the 9th Fibonacci number

   

3. At what address is `n` stored in memory? **Hint**: Look at the contents of the registers.

   ```
     la      t3, n
   ```

   n is stored at  0x10000010

   

4. Without using the “Edit” tab, have the program calculate the 13th fib number (0-indexed) by *manually* modifying the value of a register. You may find it helpful to first step through the code. If you prefer to look at decimal values, change the “Display Settings” option at the bottom.

   Modify `t3` to 13 when pc == 0x14 and the output is 233

   

### Exercise 2

Find/explain the following components of the assembly file and put your answers in a text file.

- The register representing the variable `k`.		`t0`

- The registers acting as pointers to the `source` and `dest` arrays.       `t1` `t2`

- The assembly code for the loop found in the C code.      

  ```
  loop:
  	slli t3, t0, 2
  	add t4, t1, t3
  	lw t5, 0(t4)
  	beq t5, x0, exit
  	add t6, t2, t3
  	sw t5, 0(t6)
  	addi t0, t0, 1
  	jal x0, loop
  ```
  

  
- How the pointers are manipulated in the assembly code.    

  1. store in registers
  2. adding immediate 1 to a pointer (i.e. `p+1`) means moving one byte forward. size 4 bytes




### Exercise 3

[Code]()

