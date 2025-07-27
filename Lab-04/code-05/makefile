input = input.txt
output = output.txt

main: factorial.l factorial.y
	bison -d factorial.y
	flex factorial.l
	gcc factorial.tab.c lex.yy.c -o factorial_calc
	./factorial_calc < $(input) > $(output)
