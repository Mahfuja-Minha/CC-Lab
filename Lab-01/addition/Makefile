CC = gcc
CFLAGS = -I.
DEPS = addmake.h
OBJS = addmake.o addfunc.o

all:
	gcc -o add add.c
	gcc -E add.c > add.i 
	gcc -S -masm=intel add.i
	as -o add.o add.s
	objdump -M intel -d add.o > add.dump
	gcc -c -o add.o add.c
	objdump -M intel -d add.o > add2.dump

addmake: addmake.c addfunc.c
	gcc -o addmake addmake.c addfunc.c -I.

addmake2: addmake.o addfunc.o
	$(CC) -o addmake addmake.o addfunc.o $(CFLAGS)

# addmake.o: addmake.c
# 	gcc -c -o addmake.o addmake.c -I.

# addfunc.o: addfunc.c
# 	gcc -c -o addfunc.o addfunc.c -I.

addmake3: $(OBJS)
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