ex4 :	ex3.l ex4.y
	bison -d ex4.y
	flex ex3.l
	cc -o $@ ex4.tab.c lex.yy.c -lfl

