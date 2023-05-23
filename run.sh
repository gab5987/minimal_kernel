# Builds the bootloader
i686-elf-as boot/seg000.s -o boot.o

# Builds the kernel
i686-elf-gcc -c *.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

# Links the kernel and bootloader
i686-elf-gcc -T boot/linker.ld -o os.bin -ffreestanding -O2 -nostdlib *.o -lgcc

# Removes the object files
rm *.o

qemu-system-i386 -kernel os.bin
