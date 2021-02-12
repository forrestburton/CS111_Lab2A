#NAME: Forrest Burton
#EMAIL: burton.forrest10@gmail.com
#ID: 005324612

build:
	gcc -Wall -Wextra -pthread -g -o lab2_add lab2_add.c
	gcc -Wall -Wextra -pthread -g -o lab2_list lab2_list.c SortedList.c

add:
	gcc -Wall -Wextra -pthread -g -o lab2_add lab2_add.c

tests: make
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

	#List Tests (10, 100, 1000, 10000, 20000)
	./lab2_list --threads=1 --iterations=10 >>lab2_list.csv
	./lab2_list --threads=1 --iterations=100 >>lab2_list.csv
	./lab2_list --threads=1 --iterations=1000 >>lab2_list.csv
	./lab2_list --threads=1 --iterations=10000 >>lab2_list.csv
	./lab2_list --threads=1 --iterations=20000 >>lab2_list.csv

	-./lab2_list --threads=2 --iterations=1 >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=1000 >>lab2_list.csv

	-./lab2_list --threads=4 --iterations=1 >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=1000 >>lab2_list.csv

	-./lab2_list --threads=8 --iterations=1 >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=1000 >>lab2_list.csv

	-./lab2_list --threads=12 --iterations=1 >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=1000 >>lab2_list.csv

	#List Tests (10, 100, 1000, 10000, 20000)
	./lab2_list --threads=1 --iterations=10 >>lab2_list.csv
	./lab2_list --threads=1 --iterations=100 >>lab2_list.csv
	./lab2_list --threads=1 --iterations=1000 >>lab2_list.csv
	./lab2_list --threads=1 --iterations=10000 >>lab2_list.csv
	./lab2_list --threads=1 --iterations=20000 >>lab2_list.csv

	-./lab2_list --threads=2 --iterations=1 >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=1000 >>lab2_list.csv

	-./lab2_list --threads=4 --iterations=1 >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=1000 >>lab2_list.csv

	-./lab2_list --threads=8 --iterations=1 >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=1000 >>lab2_list.csv

	-./lab2_list --threads=12 --iterations=1 >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=10 >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=100 >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=1000 >>lab2_list.csv

	#various yield options
	-./lab2_list --threads=2 --iterations=1 --yield=i >>lab2_list.csv  
	-./lab2_list --threads=2 --iterations=2 --yield=i >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=4 --yield=i >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=8 --yield=i >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=16 --yield=i >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=32 --yield=i >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=1 --yield=i >>lab2_list.csv  
	-./lab2_list --threads=4 --iterations=2 --yield=i >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=4 --yield=i >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=8 --yield=i >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=16 --yield=i >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=32 --yield=i >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=1 --yield=i >>lab2_list.csv  
	-./lab2_list --threads=8 --iterations=2 --yield=i >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=4 --yield=i >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=8 --yield=i >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=16 --yield=i >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=32 --yield=i >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=1 --yield=i >>lab2_list.csv  
	-./lab2_list --threads=12 --iterations=2 --yield=i >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=4 --yield=i >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=8 --yield=i >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=16 --yield=i >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=32 --yield=i >>lab2_list.csv

	-./lab2_list --threads=2 --iterations=1 --yield=d >>lab2_list.csv  
	-./lab2_list --threads=2 --iterations=2 --yield=d >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=4 --yield=d >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=8 --yield=d >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=16 --yield=d >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=32 --yield=d >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=1 --yield=d >>lab2_list.csv  
	-./lab2_list --threads=4 --iterations=2 --yield=d >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=4 --yield=d >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=8 --yield=d >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=16 --yield=d >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=32 --yield=d >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=1 --yield=d >>lab2_list.csv  
	-./lab2_list --threads=8 --iterations=2 --yield=d >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=4 --yield=d >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=8 --yield=d >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=16 --yield=d >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=32 --yield=d >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=1 --yield=d >>lab2_list.csv  
	-./lab2_list --threads=12 --iterations=2 --yield=d >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=4 --yield=d >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=8 --yield=d >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=16 --yield=d >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=32 --yield=d >>lab2_list.csv

	-./lab2_list --threads=2 --iterations=1 --yield=il >>lab2_list.csv  
	-./lab2_list --threads=2 --iterations=2 --yield=il >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=4 --yield=il >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=8 --yield=il >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=16 --yield=il >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=32 --yield=il >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=1 --yield=il >>lab2_list.csv  
	-./lab2_list --threads=4 --iterations=2 --yield=il >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=4 --yield=il >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=8 --yield=il >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=16 --yield=il >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=32 --yield=il >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=1 --yield=il >>lab2_list.csv  
	-./lab2_list --threads=8 --iterations=2 --yield=il >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=4 --yield=il >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=8 --yield=il >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=16 --yield=il >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=32 --yield=il >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=1 --yield=il >>lab2_list.csv  
	-./lab2_list --threads=12 --iterations=2 --yield=il >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=4 --yield=il >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=8 --yield=il >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=16 --yield=il >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=32 --yield=il >>lab2_list.csv

	-./lab2_list --threads=2 --iterations=1 --yield=dl >>lab2_list.csv  
	-./lab2_list --threads=2 --iterations=2 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=4 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=8 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=16 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=2 --iterations=32 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=1 --yield=dl >>lab2_list.csv  
	-./lab2_list --threads=4 --iterations=2 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=4 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=8 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=16 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=4 --iterations=32 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=1 --yield=dl >>lab2_list.csv  
	-./lab2_list --threads=8 --iterations=2 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=4 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=8 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=16 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=8 --iterations=32 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=1 --yield=dl >>lab2_list.csv  
	-./lab2_list --threads=12 --iterations=2 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=4 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=8 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=16 --yield=dl >>lab2_list.csv
	-./lab2_list --threads=12 --iterations=32 --yield=dl >>lab2_list.csv

	#sync options
	./lab2_list --threads=12 --iterations=32 --yield=i --sync=m >>lab2_list.csv  
	./lab2_list --threads=12 --iterations=32 --yield=i --sync=s >>lab2_list.csv  
	./lab2_list --threads=12 --iterations=32 --yield=d --sync=m >>lab2_list.csv  
	./lab2_list --threads=12 --iterations=32 --yield=d --sync=s >>lab2_list.csv
	./lab2_list --threads=12 --iterations=32 --yield=il --sync=m >>lab2_list.csv  
	./lab2_list --threads=12 --iterations=32 --yield=il --sync=s >>lab2_list.csv 
	./lab2_list --threads=12 --iterations=32 --yield=dl --sync=m >>lab2_list.csv  
	./lab2_list --threads=12 --iterations=32 --yield=dl --sync=s >>lab2_list.csv      
	
	./lab2_list --threads=1 --iterations=1000 --sync=m >>lab2_list.csv
	./lab2_list --threads=2 --iterations=1000 --sync=m >>lab2_list.csv 
	./lab2_list --threads=4 --iterations=1000 --sync=m >>lab2_list.csv 
	./lab2_list --threads=8 --iterations=1000 --sync=m >>lab2_list.csv 
	./lab2_list --threads=12 --iterations=1000 --sync=m >>lab2_list.csv 
	./lab2_list --threads=16 --iterations=1000 --sync=m >>lab2_list.csv 
	./lab2_list --threads=24 --iterations=1000 --sync=m >>lab2_list.csv  
	
	./lab2_list --threads=1 --iterations=1000 --sync=s >>lab2_list.csv
	./lab2_list --threads=2 --iterations=1000 --sync=s >>lab2_list.csv 
	./lab2_list --threads=4 --iterations=1000 --sync=s >>lab2_list.csv 
	./lab2_list --threads=8 --iterations=1000 --sync=s >>lab2_list.csv 
	./lab2_list --threads=12 --iterations=1000 --sync=s >>lab2_list.csv 
	./lab2_list --threads=16 --iterations=1000 --sync=s >>lab2_list.csv 
	./lab2_list --threads=24 --iterations=1000 --sync=s >>lab2_list.csv  
  

graphs: tests
	gnuplot ./lab2_add.gp
	gnuplot ./lab2_list.gp

dist: graphs
	tar -czvf lab2a-005324612.tar.gz lab2_add.c SortedList.h SortedList.c lab2_list.c lab2_add.gp lab2_list.gp lab2_add.csv lab2_list.csv lab2_add-1.png lab2_add-2.png lab2_add-3.png lab2_add-4.png lab2_add-5.png lab2_list-1.png lab2_list-2.png lab2_list-3.png lab2_list-4.png README Makefile 
	
clean:
	rm -f lab2_add lab2_list *tar.gz
