#define _XOPEN_SOURCE 600
#define _DEFAULT_SOURCE
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <stdio.h>
#define __USE_BSD
#include <termios.h>

int slave_listener(int pty_fd_slave);
int exec_with_pty(void);
int run_slave(int pty_fd_slave);
int run_master(int pty_gd_master);

const int input_size = 150;

const int fd_stdin = 0;
const int fd_stdout = 1;
const int fd_stderr = 2;

int main(void) {
  if (exec_with_pty()) {
    // Sucess
    return 0;
  } else {
    // Failure
    return 1;
  }
}

// The aspects of protocol for inteteracting with the posix pseudo
// termininal library that we're interested in.  Firstly, as a
// procondition, 
//
// 1) Ensure no signal handler is installed to handle SIGCHLD
//    signals. SIGCHLD handlers conflict with grantpt and make its
//    behavior undetermined.
//
// 2) PTYs, as psuedo terminals, have two ends a master and a slave.
//    In this step we Open a file descriptor, pty_gd_master,
//    with a call to posix_openpt().  If the return value is non-zero
//    the number returned is the number to the master end of the of
//    the PTY.
//
// 3) Changes the mode and owner of the slave pseudoterminal device to
//    correspond with the master pseudoterminal.  The file system
//    analogy of this would be something along the lines of:
//
//    sudo chown $(stat -c '%U' master_file):TTY slave_file
//    chmod $(stat --format '%a' master_file) slave_file
//
// 4) Unlock the slave pseudo terminal using, unlockpt(), and the
//    master side of the PTY's file descriptor
//
// 5) open the slave side of the pseudo terminal. Now we have open
//    file descriptors for both master and slave ends of the psuedo
//    terminal.
//
// 6) Finally we fork the the process and execute the function
//    slave_listener, which takes one argument, the slave PTY, and is
//    free to perform any operations needed on the slave PTY.  Both
//    sides of the PYT are responsible for closing their end of the
//    PTY when they're done.

/* int execvpe(const char *file, char *const argv[], */
/*                        char *const envp[]); */




// For maximum saftey, slave_listener, including the function is
// calls, should not access any data from the previous process. It
// should only perform operations based on static data of the
// funcction passed or based on communication on the PTY.  Keep in
// mind that when the fork happened, other threads could have been
// performing various operations which are left half-complete in the
// slave side of the fork (all threads have effectively vanished).

int run_slave(int pty_fd_slave) {
  char input[input_size];
  struct termios slave_orig_term_settings; // Saved terminal settings
  struct termios new_term_settings; // Current terminal settings
  // Save the default parameters of the slave side of the PTY
  int rc = tcgetattr(pty_fd_slave, &slave_orig_term_settings);
  // All tc* cf* style terminal functions return 0 on success and -1
  // on failure except for cfgetispeed() and cfgetospeed(), which
  // return baud rates.
  if (rc != 0) {
    return 0;
  }
  // Set raw mode on the slave side of the PTY
  new_term_settings = slave_orig_term_settings;
  cfmakeraw (&new_term_settings);
  tcsetattr (pty_fd_slave, TCSANOW, &new_term_settings);
  // The slave side of the PTY becomes the standard input and
  // outputs of the child process
  close(fd_stdin); // Close standard input (current terminal)
  close(fd_stdout); // Close standard output (current terminal)
  close(fd_stderr); // Close standard error (current terminal)
  // TODO -- probably we should have 3 separate fds and perhaps 2 additional PTYs
  dup(pty_fd_slave); // fd_stdin: 0
  dup(pty_fd_slave); // fd_stdout: 1
  dup(pty_fd_slave); // fd_stderr: 2
  while (1) {
    rc = read(pty_fd_slave, input, sizeof(input) - 1);
    char *const argv[3] = {"echo", "my text", (char*)NULL};
    execve("/bin/echo", argv, NULL);
    if (rc > 0) {
      // Replace the terminating \n by a NUL to display it as
      // a string
      input[rc - 1] = '\0';
      printf("Child received : '%s'\n", input);
      
      
    } else {
      break;
    }
  }
  return 0;
}

int run_master(int pty_gd_master) {
  char input[input_size];
    while (1) {
      // Operator's entry (standard input = terminal)
      write(1, "Input : ", sizeof("Input : "));
      int rc = read(0, input, sizeof(input));
      if (rc > 0) {
	// Send the input to the child process through the PTY
	write(pty_gd_master, input, rc);
	// Get the child's answer through the PTY
	rc = read(pty_gd_master, input, sizeof(input) - 1);
	if (rc > 0) {
	  // Make the answer NUL terminated to display it as a string
	  input[rc] = '\0';
	  fprintf(stderr, "%s", input);
	} else {
	  break;
	}
      } else {
	break;
      }
    } return 1;
}

int exec_with_pty(void) {
  int pty_gd_master, pty_fd_slave, rc;
  char input[150];
  pty_gd_master = posix_openpt(O_RDWR);
  if (pty_gd_master < 0) {
    fprintf(stderr, "Error %d on posix_openpt()\n", errno);
    return 0;
  }
  //  fprintf(stderr, "Retrieved pty %d\n", pty_gd_master);
  rc = grantpt(pty_gd_master);
  if (rc != 0) {
    fprintf(stderr, "Error %d on grantpt()\n", errno);
    return 1;
  }
  rc = unlockpt(pty_gd_master);
  if (rc != 0) {
    fprintf(stderr, "Error %d on unlockpt()\n", errno);
    return 1;
  }
  // Open the slave PTY
  pty_fd_slave = open(ptsname(pty_gd_master), O_RDWR);
  // Creation of a child process
  if (fork()) {
    // Parent closes the slave side of the PTY
    close(pty_fd_slave);
    return run_master(pty_gd_master);
  } else {
    // Child closes the master side of the PTY
    close(pty_gd_master);
    return run_slave(pty_fd_slave);
  }
  return 0;
} 
