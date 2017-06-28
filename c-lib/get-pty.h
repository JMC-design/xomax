#ifndef GET_PTY_H
#define	GET_PTY_H

int slave_listener(int pty_fd_slave);
int exec_with_pty(void);
int run_slave(int pty_fd_slave);
int run_master(int pty_gd_master);
int cffi_openpt(int lisp_flags);
int cffi_get_slave_pt(int pty_gd_master);
const char* cffi_get_slave_name(int pty_gd_master);
  
#endif

