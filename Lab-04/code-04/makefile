input = input.txt
output = output.txt

main: evenodd.l evenodd.y
	bison -d evenodd.y
	flex evenodd.l
	gcc evenodd.tab.c lex.yy.c -o evenodd_calc
	./evenodd_calc < $(input) > $(output)