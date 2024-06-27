#include <stdio.h>

void test(int *p){
    printf("%d\n", p);
}

int main(int argc, char **argv)
{
    int i = 10;
    int *p = &i;
    int **q = &p;
    printf("%p\n", &i);
    printf("%p\n", p);
    printf("%p\n", &p);
    printf("%p\n", &q);
    printf("%d\n", **q);
    printf("%p\n", *q);
    test(&p);
    return 0;
}