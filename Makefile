#NAME: Forrest Burton
#EMAIL: burton.forrest10@gmail.com
#ID: 005324612

default:
	gcc -Wall -Wextra -pthread -o lab2_add lab2_add.c
	gcc -Wall -Wextra -pthread -o lab2_list lab2_list.c SortedList.c

add:
	gcc -Wall -Wextra -pthread -o lab2_add lab2_add.c

tests:
	rm -f lab2_add.csv lab2_list.csv

	#basic tests (no yield or sync option)
	./lab2_add --threads=1 --iterations=100 >>lab2_add.csv
	./lab2_add --threads=1 --iterations=1000 >>lab2_add.csv
	./lab2_add --threads=1 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=1 --iterations=100000 >>lab2_add.csv

	./lab2_add --threads=2 --iterations=100 >>lab2_add.csv
	./lab2_add --threads=2 --iterations=1000 >>lab2_add.csv
	./lab2_add --threads=2 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=2 --iterations=100000 >>lab2_add.csv
	
	./lab2_add --threads=4 --iterations=100 >>lab2_add.csv
	./lab2_add --threads=4 --iterations=1000 >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=4 --iterations=100000 >>lab2_add.csv

	./lab2_add --threads=8 --iterations=100 >>lab2_add.csv
	./lab2_add --threads=8 --iterations=1000 >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=8 --iterations=100000 >>lab2_add.csv

	./lab2_add --threads=12 --iterations=100 >>lab2_add.csv
	./lab2_add --threads=12 --iterations=1000 >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=12 --iterations=100000 >>lab2_add.csv

	#yield test 
	./lab2_add --threads=2 --iterations=10 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=20 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=40 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=80 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=100 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=1000 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=10000 --yield >>lab2_add.csv
	./lab2_add --threads=2 --iterations=100000 --yield >>lab2_add.csv
	
	./lab2_add --threads=4 --iterations=10 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=20 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=40 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=80 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=100 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=1000 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=100000 --yield >>lab2_add.csv

	./lab2_add --threads=8 --iterations=10 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=20 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=40 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=80 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=100 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=1000 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=100000 --yield >>lab2_add.csv

	./lab2_add --threads=12 --iterations=10 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=20 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=40 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=80 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=100 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=1000 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=100000 --yield >>lab2_add.csv

	#mutex yield
	./lab2_add --threads=2 --iterations=10000 --sync=m --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 --sync=m --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 --sync=m --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 --sync=m --yield >>lab2_add.csv

	#spin-lock yield
	./lab2_add --threads=2 --iterations=1000 --sync=s --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=1000 --sync=s --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=1000 --sync=s --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=1000 --sync=s --yield >>lab2_add.csv

	#cas yield
	./lab2_add --threads=2 --iterations=10000 --sync=c --yield >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 --sync=c --yield >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 --sync=c --yield >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 --sync=c--yield >>lab2_add.csv

	#all four (no yield)
	./lab2_add --threads=1 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=2 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 >>lab2_add.csv

	./lab2_add --threads=1 --iterations=10000 --sync=m >>lab2_add.csv
	./lab2_add --threads=2 --iterations=10000 --sync=m >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 --sync=m >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 --sync=m >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 --sync=m >>lab2_add.csv

	./lab2_add --threads=1 --iterations=10000 --sync=s >>lab2_add.csv
	./lab2_add --threads=2 --iterations=10000 --sync=s >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 --sync=s >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 --sync=s >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 --sync=s >>lab2_add.csv

	./lab2_add --threads=1 --iterations=10000 --sync=c >>lab2_add.csv
	./lab2_add --threads=2 --iterations=10000 --sync=c >>lab2_add.csv
	./lab2_add --threads=4 --iterations=10000 --sync=c >>lab2_add.csv
	./lab2_add --threads=8 --iterations=10000 --sync=c >>lab2_add.csv
	./lab2_add --threads=12 --iterations=10000 --sync=c >>lab2_add.csv

graphs:
	gnuplot ./lab2_add.gp
	#gnuplot ./lab2_list.gp

dist:
	tar -czvf lab2a-005324612.tar.gz lab2_add.c SortedList.h SortedList.c lab2_list.c lab2_add.csv lab2_list.csv lab2_add-1.png lab2_add-2.png lab2_add-3.png lab2_add-4.png lab2_add-5.png lab2_list-1.png lab2_list-2.png lab2_list-3.png lab2_list-4.png README Makefile 
	#tar -czvf lab2a-005324612.tar.gz lab2_add.c SortedList.h SortedList.c lab2_list.c README Makefile 
clean:
	rm -f lab2_add lab2_list *tar.gz
