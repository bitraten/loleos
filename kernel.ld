ENTRY(_start)

SECTIONS
{
	/* load kernel at 1MB */
	. = 0x100000;

	/* First multiboot-header */
	.text : {
		*(multiboot)
		*(.text)
	}
	.data ALIGN(4096) : {
		*(.data)
	}
	.rodata ALIGN(4096) : {
		*(.rodata)
	}
	.bss ALIGN(4096) : {
		*(.bss)
	}
}
