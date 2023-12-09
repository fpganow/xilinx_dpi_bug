#include "svdpi.h"
#include <stdio.h>

DPI_DLLESPEC
int myFunction(const svOpenArrayHandle v)
{
    int sum = 0;
    printf("STDOUT from C");
    int l1 = svLow(v, 1);
    int h1 = svHigh(v, 1);
    for(int i = l1; i<= h1; i++) {
        printf("\t%d", *((char*)svGetArrElemPtr1(v, i)));
        sum += *((char*)svGetArrElemPtr1(v, i));
    }
    printf("\n\n");
    return sum;
}
