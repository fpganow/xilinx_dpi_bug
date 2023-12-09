#include "svdpi.h"
#include <stdio.h>

DPI_DLLESPEC
int myFunction(int a, int b)
{
    int sum = 0;
    printf("STDOUT from C");
    printf("\n\n");
    sum = a + b;
    return sum;
}
