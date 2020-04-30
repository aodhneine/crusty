CC ?= clean
CFLAGS = -O2 -Wall -Wextra -Wpedantic -std=c89

# TODO: the platform conditional compilation should be probably done in the Makefile
crusty: crusty.c linux-x86_64-elf.h
	$(CC) $^ -o $@ $(CFLAGS)

linux-x86_64-elf.h: linux-x86_64-elf
	xxd -i linux-x86_64-elf > linux-x86_64-elf.h

linux-x86_64-elf: linux-x86_64-elf.o
	ld -o linux-x86_64-elf linux-x86_64-elf.o

linux-x86_64-elf.o: linux-x86_64-elf.nasm
	nasm -felf64 linux-x86_64-elf.nasm

.PHONY: clean
clean:
	rm -f crusty
