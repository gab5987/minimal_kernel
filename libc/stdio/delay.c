#include <stdio.h>

void delay(unsigned long ticks) {
    for (unsigned long i = 0 ; i < ticks ; i++) {
        asm("nop");
    }
}