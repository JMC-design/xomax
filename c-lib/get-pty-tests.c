
#include "get-pty.h"
#include <stdlib.h>
#include <errno.h>
#include <stdio.h>
#include <stdio.h>

// int main(int argc, char * argv[], char *envp[]) {
int main(void) {
  int pty = cffi_openpt(3);
  if (pty < 0) {
    // Failure
    return 1;
  } 
  return 0;
}
