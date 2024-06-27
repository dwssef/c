# 两层指针的参数 - 传出参数
Q: 想一想，这里的参数指针是const int **，有const限定符，却不是传入参数而是传出参数，为什么？如果是传入参数应该怎么表示？
```c
#include <stdio.h>

void printValues(const int **ptr) {
    printf("Value: %d\n", **ptr);
}

int main() {
    int value = 10;
    int *ptr1 = &value;
    const int **ptr2 = (const int **)&ptr1;

    printValues(ptr2);

    return 0;
}
```

`const int **ptr` **ptr 指向 const int

优点：
- 内存效率
- 只读访问

# 用到指令
```bash
awk 'FNR==1 && NR!=1 {print "// -----------"} {print}' redirect_ptr.h redirect_ptr.c main.c | code -
```

# Reference
[9. 不完全类型和复杂声明]( https://akaedu.github.io/book/ch23s09.html )

[3. 两层指针的参数]( https://akaedu.github.io/book/ch24s03.html )