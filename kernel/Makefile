AS = nasm
CC = i386-elf-gcc
LD = i386-elf-ld

C_FLAGS = $(INCLUDE_DIRS) -ffreestanding -m32 -g -c
AS_FLAGS = -f elf
AS_B = -f bin

K_OFFSET = 0x1000

ARCH_DIR = arch/i386

K_OBJECTS = k_entery.o kernel.o tty.o

all: os-image.bin
	rm -f *.o k*.bin seg*.bin

$(K_OBJECTS):
	@echo "Compiling kernel..."
	@echo $(INCLUDE_DIRS)
	$(CC) $(C_FLAGS) kernel/kernel.c -o kernel.o
	$(CC) $(C_FLAGS) kernel/tty.c -o tty.o
	$(AS) $(AS_FLAGS) $(ARCH_DIR)/k_entery.asm -o k_entery.o

seg000.bin:
	$(AS) $(AS_B) $(ARCH_DIR)/seg000.asm -o seg000.bin

seg001.bin: $(K_OBJECTS)
	$(LD) -o seg001.bin -Ttext $(K_OFFSET) $(K_OBJECTS) --oformat binary

seg002.bin:
	$(AS) $(AS_B) $(ARCH_DIR)/seg002.asm -o seg002.bin

os-image.bin: seg000.bin seg001.bin seg002.bin
	cat seg000.bin seg001.bin seg002.bin > os-image.bin
