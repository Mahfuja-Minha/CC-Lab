all:
	gcc -o one one.c
	gcc -E one.c > one.i 
	gcc -S -masm=intel one.i
	as -o one.o one.s
	objdump -M intel -d one.o > one.dump
	gcc -c -o one.o one.c
	objdump -M intel -d one.o > one2.dump
