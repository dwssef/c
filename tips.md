# 通过两层指针参数分配内存
prerequisites: 
- `&`运算符用来取出一个变量所在的内存地址
- 理解什么是指向指针的指针
- 理解`const int **ptr`就是 指向`const int`类型的指针的指针
- 理解以下示例
```c
#include <stdio.h>
int main(int argc, char **argv)
{
    int i = 10;
    int *p = &i;
    int **q = &p;
    printf("%p\n", &i);     // 0x7ffe7e1e0834
    printf("%p\n", p);      // 0x7ffe7e1e0834
    printf("%p\n", &p);     // 0x7ffe7e1e0838
    printf("%p\n", &q);     // 0x7ffe7e1e0840
    printf("%d\n", **q);    // 10
    printf("%p\n", *q);     // 0x7ffe7e1e0834
    return 0;
}
```

# Q&A
1. 为什么在main函数中不能直接调用`free(p)`释放内存，而要调用`free_unit(p)`？

`p->msg` 通过`malloc`分配内存，需要先释放其内存，再释放整个`unit_t`结构体的内存，防止内存泄漏
参考[1. 本章的预备知识]( https://akaedu.github.io/book/ch24s01.html )中提及的野指针

2. 为什么一层指针的函数接口`void alloc_unit(unit_t *p)`j不能分配内存，而一定要用两层指针的函数接口？

`void alloc_unit(unit_t *p)` 只是将`p`做了一个副本，并不能修改`main函数`中的`p`值，但二层指针可以修改其指针本身，确保正确的将内存分配给调用者


# Reference
[& 运算符]( https://wangdoc.com/clang/pointer#-%E8%BF%90%E7%AE%97%E7%AC%A6-1 )

[3. 两层指针的参数]( https://akaedu.github.io/book/ch24s03.html )