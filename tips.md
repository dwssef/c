# Variadic function
`myprintf`函数参数入栈顺序为从右到左，`rdx` ：第3个参数, `esi`：第2个参数, `rdi`：第1个参数
```shell
myprintf("c\ts\n", '1', "hello");
1355:	48 8d 15 a8 0c 00 00 	lea    0xca8(%rip),%rdx        # 2004 <_IO_stdin_used+0x4>
135c:	be 31 00 00 00       	mov    $0x31,%esi
1361:	48 8d 3d a2 0c 00 00 	lea    0xca2(%rip),%rdi        # 200a <_IO_stdin_used+0xa>
368:	b8 00 00 00 00       	mov    $0x0,%eax
```

# Reference
[6. 可变参数]( https://akaedu.github.io/book/ch24s06.html )

[Variable Number of Arguments (GNU C Language Manual)]( https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Variable-Number-of-Arguments.html )