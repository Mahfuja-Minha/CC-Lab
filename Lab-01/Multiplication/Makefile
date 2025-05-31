CC = gcc
CFLAGS = -I.
DEPS = mulmake.h
OBJS = mulmake.o mulfunc.o

all:
	gcc -o mul mul.c
	gcc -E mul.c > mul.i 
	gcc -S -masm=intel mul.i
	as -o mul.o mul.s
	objdump -M intel -d mul.o > mul.dump
	gcc -c -o mul.o mul.c
	objdump -M intel -d mul.o > mul2.dump

mulmake: mulmake.c mulfunc.c
	gcc -o mulmake mulmake.c mulfunc.c -I.

mulmake2: mulmake.o mulfunc.o
	$(CC) -o mulmake mulmake.o mulfunc.o $(CFLAGS)

# mulmake.o: mulmake.c
# 	gcc -c -o mulmake.o mulmake.c -I.

# mulfunc.o: mulfunc.c
# 	gcc -c -o mulfunc.o mulfunc.c -I.

mulmake3: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

%.o: %.c $(DEPS) 
	gcc -c -o $@ $< -I.

.PHONY: clean

clean:
	rm -f *.o

assembler:
	C:\masm32\bin\ml /c /coff /Cp prog1.asm
	C:\masm32\bin\link -entry:main /subsystem:console prog1.obj
	prog1