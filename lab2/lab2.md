## lab 2

### ex2

1. How do you **pass command line arguments** to a program when using gdb?

   `run <arguments>`

2. How do you **set a breakpoint** which only occurs when a **set of conditions is true** (e.g. when certain variables are a certain value)?

   `break <line no.> if <expr>`

3. How do you **execute the next line of C code** in the program after stopping at a breakpoint?

   `next`

4. If the next line of code is a function call, you'll execute the whole function call at once if you use your answer to #3. (If not, consider a different command for #3!) How do you tell GDB that you **want to debug the code inside the function** instead? (If you changed your answer to #3, then that answer is most likely now applicable here.)

   `step`

5. How do you **resume the program after stopping** at a breakpoint?

   `continue`

6. How can you **see the value of a variable** (or even an expression like 1+2) in gdb?

   `print`

7. How do you configure gdb so it **prints the value of a variable after every step**?

   `display <variable>`

8. How do you **print a list of all variables and their values** in the current function?

   `info locals`

9. How do you **exit** out of gdb?

   `quit`



### ex3

1. Explain why `bad_vector_new()` and `also_bad_vector_new()` are bad.

bad_vector_new(): vector_t v in on stack.

also_bad_vector_new(): returning a whole struct, inefficient.

2. 

```
# output

Calling vector_new()
Calling vector_delete()
vector_new() again
These should all return 0 (vector_get()): 0 0 0
Doing a bunch of vector_set()s
These should be equal:
98 = 98
15 = 15
65 = 65
-123 = -123
21 = 21
43 = 43
0 = 0
0 = 0
0 = 0
3 = 3
Test complete.

# Memcheck output

valgrind --tool=memcheck --leak-check=full --track-origins=yes ./vector-test
==18644== Memcheck, a memory error detector
==18644== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==18644== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==18644== Command: ./vector-test
==18644==
Calling vector_new()
Calling vector_delete()
vector_new() again
These should all return 0 (vector_get()): 0 0 0
Doing a bunch of vector_set()s
These should be equal:
98 = 98
15 = 15
65 = 65
-123 = -123
21 = 21
43 = 43
0 = 0
0 = 0
0 = 0
3 = 3
Test complete.
==18644==
==18644== HEAP SUMMARY:
==18644==     in use at exit: 0 bytes in 0 blocks
==18644==   total heap usage: 9 allocs, 9 frees, 3,280 bytes allocated
==18644==
==18644== All heap blocks were freed -- no leaks are possible
==18644==
==18644== For counts of detected and suppressed errors, rerun with: -v
==18644== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
```

3. Explain to yourself what each of the flags mean.

```
$ valgrind --tool=memcheck --leak-check=full --track-origins=yes [OS SPECIFIC ARGS] ./<executable>
```

```
--tool=<name> 运行valgrind中名为toolname的工具，默认为memcheck
--leak-check=<no|summary|full> leak指存在一块没有被引用的内存空间或没有被释放的内存空间
--track-origins=<yes|no> 设置为yes的时候对于为初始化的变量(from stack or heap)能够定位到错误源，但也导致程序整体运行速度变慢和更大的内存开销
```



