# 返回值是指针的情况
## Q&A
1. 这个程序的运行结果是Sunday Monday吗？ 

结果是:`Sunday Sunday`, 不是预期结果, 导致原因是：`strcpy`函数每次执行后`static缓冲区`
会被新的字符串覆盖, 且`printf`函数中参数入栈的顺序是从右到左，所以打印都是`Sunday`

以下为`printf`函数断点处反汇编指令（`%edi`指第1个入参）
```shell
(gdb) disass
Dump of assembler code for function main:
   0x0000555555555169 <+0>:     endbr64 
   0x000055555555516d <+4>:     push   %rbp
   0x000055555555516e <+5>:     mov    %rsp,%rbp
   0x0000555555555171 <+8>:     push   %rbx
   0x0000555555555172 <+9>:     sub    $0x8,%rsp
=> 0x0000555555555176 <+13>:    mov    $0x1,%edi
   0x000055555555517b <+18>:    callq  0x5555555551b0 <get_a_day>
   0x0000555555555180 <+23>:    mov    %rax,%rbx
   0x0000555555555183 <+26>:    mov    $0x0,%edi
   0x0000555555555188 <+31>:    callq  0x5555555551b0 <get_a_day>
   0x000055555555518d <+36>:    mov    %rbx,%rdx
   0x0000555555555190 <+39>:    mov    %rax,%rsi
   0x0000555555555193 <+42>:    lea    0xe6a(%rip),%rdi        # 0x555555556004
   0x000055555555519a <+49>:    mov    $0x0,%eax
   0x000055555555519f <+54>:    callq  0x555555555070 <printf@plt>
   0x00005555555551a4 <+59>:    mov    $0x0,%eax
   0x00005555555551a9 <+64>:    add    $0x8,%rsp
   0x00005555555551ad <+68>:    pop    %rbx
   0x00005555555551ae <+69>:    pop    %rbp
   0x00005555555551af <+70>:    retq   
End of assembler dump.
```

# Reference
[4. 返回值是指针的情况]( https://akaedu.github.io/book/ch24s04.html )