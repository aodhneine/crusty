CC = clang
LD = ld
CFLAGS = -O2 -Wall -Wextra -Wpedantic -std=c99

crusty: crusty.o stub.o
	$(CC) crusty.o stub.o -o crusty $(CFLAGS)

crusty.o: crusty.c
	$(CC) -c crusty.c

stub.o: stub
	$(LD) -r -b binary stub -o stub.o

stub: stub.c
	$(CC) stub.c -o stub -Os -std=c99 -s

.PHONY: clean
clean:
	rm -f crusty stub.o stub main crusty.o
