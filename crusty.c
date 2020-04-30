#include <stdio.h>
#include <stdlib.h>

#if defined(__linux__) && defined(__x86_64__)
#include "linux-x86_64-elf.h"
#define EXECUTABLE linux_x86_64_elf
#define EXECUTABLE_LEN linux_x86_64_elf_len
#else
#error "Unsupported platform"
#endif

int main(int argc, char **argv) {
  FILE *output = NULL;
  (void) argc;
  (void) argv;
  /* TODO: the produced file is not executable */
  output = fopen("a.out", "wb");
  fwrite(EXECUTABLE, 1, EXECUTABLE_LEN, output);
  fclose(output);
  return 0;
}
