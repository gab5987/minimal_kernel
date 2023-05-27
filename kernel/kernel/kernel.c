// #include <kernel/tty.h>
#include <kernel/vga.h>

void k_main(void) {
	terminal_initialize();
    // *((char *) 0xb8000) = VGA_COLOR_WHITE | VGA_COLOR_BLACK << 4;
    // return;
	// // printf("Hello World!\n");
    terminal_writestring("Hello World!\n");
}
