CC ?= clang
CFLAGS = -O2 -Wall -Wextra -Wpedantic

crusty: crusty.c
	$(CC) $^ -o $@ $(CFLAGS)

.PHONY: clean
clean:
	rm -f crusty
