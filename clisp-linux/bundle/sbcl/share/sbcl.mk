CC=cc
LD=ld
CFLAGS=-g -O2 -ffile-prefix-map=/build/sbcl-jU2XMl/sbcl-2.2.9=. -fstack-protector-strong -Wformat -Werror=format-security -g -Wall -Wundef -Wsign-compare -Wpointer-arith -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wunused-parameter -fno-omit-frame-pointer -momit-leaf-frame-pointer
ASFLAGS=-g -O2 -ffile-prefix-map=/build/sbcl-jU2XMl/sbcl-2.2.9=. -fstack-protector-strong -Wformat -Werror=format-security -g -Wall -Wundef -Wsign-compare -Wpointer-arith -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wunused-parameter -fno-omit-frame-pointer -momit-leaf-frame-pointer
LINKFLAGS=-g -Wl,--export-dynamic
LDFLAGS=-Wl,-z,relro
__LDFLAGS__=
LIBS=-ldl -lpthread -lzstd  -lm
LIBSBCL=sbcl.o
USE_LIBSBCL=sbcl.o
