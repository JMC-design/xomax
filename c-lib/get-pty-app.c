
#include "get-pty.h"
#include <stdlib.h>
#include <errno.h>
#include <stdio.h>
#include <stdio.h>

int main(void) {
  if (exec_with_pty()) {
    // Sucess
    return 0;
  } else {
    // Failure
    return 1;
  }
}
