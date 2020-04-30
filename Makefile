CC ?= clean
CFLAGS = -O2 -Wall -Wextra -Wpedantic -std=c89

crusty: crusty.c
	$(CC) $^ -o $@ $(CFLAGS)

.PHONY: clean
clean:
	rm -f crusty
