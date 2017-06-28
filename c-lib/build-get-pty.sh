#!/usr/bin/env bash 
#-*- mode: bash;  -*-

CFLAGS="-g3"
LDFLAGS="-L."

rm -f get-pty-slave get-pty-app *.o *.so \

export libs="-lm"

# Note, the -Wl,-R flags will make our shared library available to the
# executable app from the location that it was compiled, rather than
# having to be installed globably or adding the build path to
# LD_LIBRARY_PATH.

export LDFLAGS="-L. -Wl,-R -Wl,. $LDFLAGS"
export CFLAGS="-DGC_LINUX_THREADS -D_REENTRANT -fPIC  -g -pipe -Wall $CFLAGS"

gcc $CFLAGS -c get-pty.c
gcc -shared -Wl,-soname,libget_pty.so $LDFLAGS -o libget_pty.so *o $libs
rm get-pty.o
gcc get-pty-app.c $CFLAGS $LDFLAGS -lget_pty  -o get-pty-app
gcc get-pty-slave.c $CFLAGS $LDFLAGS -lget_pty  -o get-pty-slave
gcc get-pty-tests.c $CFLAGS $LDFLAGS -lget_pty  -o get-pty-tests


# gcc $CFLAGS -o get-pty get-pty-main.c

# gcc get-pty-main.c $CFLAGS $LDFLAGS -lget_pty -o get-pty

