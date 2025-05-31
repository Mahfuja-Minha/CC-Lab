CC = gcc
CFLAGS = -I.
DEPS = submake.h
OBJS = submake.o subfunc.o

all:
	gcc -o sub sub.c
	gcc -E sub.c > sub.i 
	gcc -S -masm=intel sub.i
	as -o sub.o sub.s
	objdump -M intel -d sub.o > sub.dump
	gcc -c -o sub.o sub.c
	objdump -M intel -d sub.o > sub2.dump

submake: submake.c subfunc.c
	gcc -o submake submake.c subfunc.c -I.

submake2: submake.o subfunc.o
	$(CC) -o submake submake.o subfunc.o $(CFLAGS)

# submake.o: submake.c
# 	gcc -c -o submake.o submake.c -I.

# subfunc.o: subfunc.c
# 	gcc -c -o subfunc.o subfunc.c -I.

submake3: $(OBJS)
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