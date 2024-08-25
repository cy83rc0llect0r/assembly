#include <stdio.h>
#include <string.h>
#include <sys/mman.h>

int main(int argc, char **argv) {
  unsigned char code[]= "YOUR_SHELLCODE_HERE";
  void *exec_mem = mmap(NULL, sizeof(code), PROT_READ | PROT_WRITE | PROT_EXEC, MAP_ANON | MAP_PRIVATE, -1, 0);
  if (exec_mem == MAP_FAILED) {
    perror("mmap");
    return 1;
  }

  // Copy shellcode to executable memory
  memcpy(exec_mem, code, sizeof(code));

  // Execute the shellcode
  ((void(*)())exec_mem)();

  return 0;
}
