#include <stdio.h>

#include <kernel/tty.h>

void kernel_main(void) {
	terminal_initialize();
	// printf("Hello World!\n");
	int chars = 100;

	do {
		printf("A");
		chars--;
		delay(10000);
	} while(chars > 0);
}
