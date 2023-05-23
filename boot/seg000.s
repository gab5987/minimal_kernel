.set ALIGN,    1<<0
.set MEMINFO,  1<<1
.set FLAGS,    ALIGN | MEMINFO
.set BOOT_HEADER,    0x1BADB002
.set CHECKSUM, -(BOOT_HEADER + FLAGS)


.section .multiboot
.align 4
.long BOOT_HEADER
.long FLAGS
.long CHECKSUM

.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

.section .text
.global _start
.type _start, @function

_start:
	mov $stack_top, %esp

	call kernel_main

	cli
1:	hlt
	jmp 1b

.size _start, . - _start



/*
;=====================================
; nasmw boot.asm -f bin -o boot.bin
; partcopy boot.bin 0 200 -f0

[ORG 0x7c00]
   xor eax, eax
   mov ds, eax
   mov ss, eax
   mov esp, 0x9c00
 
   cld
 
   mov eax, 0xb800
   mov es, eax
 
   mov esi, msg
   call sprint
 
   mov eax, 0xb800
   mov gs, ax
   mov ebx, 0x0000   ; 'W'=57 attrib=0F
   mov eax, [gs:ebx]
 
hang: jmp hang

dochar: call cprint

sprint: lodsb
    cmp al, 0
    jne dochar
    add byte [ypos], 1   ;down one row
    mov byte [xpos], 0   ;back to left

    ret

cprint: mov ah, 0x0F   ; attrib = white on black
    mov ecx, eax    ; save char/attribute
    movzx eax, byte [ypos]
    mov edx, 160   ; 2 bytes (char/attrib)
    mul edx      ; for 80 columns
    movzx ebx, byte [xpos]
    shl ebx, 1
    
    mov edi, 0
    add edi, eax
    add edi, ebx
    
    mov eax, ecx
    stosw
    add byte [xpos], 1
    
    ret

times 510-($-$$) db 0
db 0x55
db 0xAA

;==================================

*/