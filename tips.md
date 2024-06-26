# Pointer

初始化指针值为`NULLL`, 以避免`Unbound Pointer`

```c
int i = 103;
int *p = &i;
printf("p: %p\n", p);
printf("p: %d\n", *p);
// p: 0x7ffeb320412c
// p: 103
```

## *运算符
`*`这个符号除了表示指针以外，还可以作为运算符，用来取出指针变量所指向的内存地址里面的值。

## 利用指针传参
避免为大型变量创建副本
```c
#include <stdio.h>

// 定义一个处理数组的函数
void processArray(int *arr, int size) {
    for(int i = 0; i < size; i++) {
        arr[i] *= 2;  // 将数组中的每个元素乘以2
    }
}

int main() {
    int largeArray[1000];

    // 初始化数组
    for(int i = 0; i < 1000; i++) {
        largeArray[i] = i;
    }

    // 打印处理前的数组
    printf("Before processing:\n");
    for(int i = 0; i < 10; i++) {  // 只打印前10个元素
        printf("%d ", largeArray[i]);
    }
    printf("\n");

    // 传递数组的地址和大小给函数
    processArray(largeArray, 1000);

    // 打印处理后的数组
    printf("After processing:\n");
    for(int i = 0; i < 10; i++) {  // 只打印前10个元素
        printf("%d ", largeArray[i]);
    }
    printf("\n");

    return 0;
}
```
## [指针变量的初始化]( https://wangdoc.com/clang/pointer#%E6%8C%87%E9%92%88%E5%8F%98%E9%87%8F%E7%9A%84%E5%88%9D%E5%A7%8B%E5%8C%96 )

# Reference

[1. 指针的基本概念]( https://akaedu.github.io/book/ch23s01.html )

[指针 - C 语言教程 - 网道]( https://wangdoc.com/clang/pointer )

[2. 传入参数与传出参数]( https://akaedu.github.io/book/ch24s02.html )