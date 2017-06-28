
#include "get-pty.h"
#include <stdlib.h>
#include <errno.h>
#include <stdio.h>
#include <stdio.h>




// get-pty-slave handles the protocol for dynamically executing execve()
// without having to worry about various threading issues that we
// would otherwise have to concern ourselves with if we tried to
// execute any programatic logic after the fork is executed.  The
// protocol for calling this is as follows:
//
// 1) The slave process that spawns us by calling execve, needs to
//    have mapped our standard in, standard out and standard err to
//    PTYs that the master can see.  It also needs to have made our
//    terminal visible to the master caller.  'We' have no visibility
//    to those assignments and will process things as though they are
//    simply ordinary streams, which, on account of the unix design of
//    PTYs, in some sense they are.
//
// 2) So we need to have been passed several arguments, which we will
//    turn around and pass to our own ececve.  The first argument should 
//    
int main(int argc, char * argv[], char *envp[]) {
  if (exec_with_pty()) {
    // Sucess
    return 0;
  } else {
    // Failure
    return 1;
  }
}
