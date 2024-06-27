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
