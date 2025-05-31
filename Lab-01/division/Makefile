CC = gcc
CFLAGS = -I.
DEPS = divmake.h
OBJS = divmake.o divfunc.o

all:
	gcc -o div div.c
	gcc -E div.c > div.i 
	gcc -S -masm=intel div.i
	as -o div.o div.s
	objdump -M intel -d div.o > div.dump
	gcc -c -o div.o div.c
	objdump -M intel -d div.o > div2.dump

divmake: divmake.c divfunc.c
	gcc -o divmake divmake.c divfunc.c -I.

divmake2: divmake.o divfunc.o
	$(CC) -o divmake divmake.o divfunc.o $(CFLAGS)

# divmake.o: divmake.c
# 	gcc -c -o divmake.o divmake.c -I.

# divfunc.o: divfunc.c
# 	gcc -c -o divfunc.o divfunc.c -I.

divmake3: $(OBJS)
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