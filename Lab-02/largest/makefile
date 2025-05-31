all:
	gcc -o large large.c
	gcc -E large.c > large.i 
	gcc -S -masm=intel large.i
	as -o large.o large.s
	objdump -M intel -d large.o > large.dump
	gcc -c -o large.o large.c
	objdump -M intel -d large.o > large2.dump
