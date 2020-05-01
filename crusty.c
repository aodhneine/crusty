#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#if !defined(__unix__)
#error "This platform is currently not supported"
#else
#include <sys/stat.h>
#endif

int main(int argc, char **argv) {
  /* print usage */
  if(argc < 2) {
    /* TODO: this is possibly not cross-platform */
    fprintf(stderr, "%s: [1;31merror[0m: no input files\n", argv[0]);
    return 1;
  }

  extern const char _binary_stub_start, _binary_stub_end;
  const char *stub_start = &_binary_stub_start;
  const char *stub_end = &_binary_stub_end;

  FILE *output = fopen("main", "wb");
  fwrite(stub_start, stub_end - stub_start, 1, output);
  fclose(output);

  /* TODO: this may not be cross-platform */
  mode_t mode = (S_IRWXU) | (S_IRGRP | S_IXGRP) | (S_IROTH | S_IXOTH);
  if(chmod("main", mode)) {
    fprintf(stderr, "[1;31minternal error[0m: failed to chmod main\n");
    return 1;
  }

  return 0;
}
