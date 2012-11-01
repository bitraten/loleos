.section multiboot
#define MB_MAGIC 0x1badb002
#define MB_FLAGS 0x0
#define MB_CHECKSUM -(MB_MAGIC + MB_FLAGS)

// Multiboot header
.align 4
.int MB_MAGIC
.int MB_FLAGS
.int MB_CHECKSUM

.section .text

.extern init

.global _start
_start:
	// initialize stack
	mov $kernel_stack, %esp

	// call c code
	call init
	
_stop:
	cli
	hlt

	jmp _stop

// 8kB stack
.section .bss
.space 8192
kernel_stack:
