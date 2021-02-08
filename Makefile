#NAME: Forrest Burton
#EMAIL: burton.forrest10@gmail.com
#ID: 005324612

default:
	gcc -Wall -Wextra -o lab2_add lab2_add.c
	gcc -Wall -Wextra -o lab2_list lab2_list.c SortedList.c

add:
	gcc -Wall -Wextra -o lab2_add lab2_add.c

tests:

graphs:

dist:
	tar -czvf lab2a-005324612.tar.gz lab2_add.c SortedList.h SortedList.c lab2_list.c lab2_add.csv lab2_list.csv lab2_add-1.png lab2_add-2.png lab2_add-3.png lab2_add-4.png lab2_add-5.png lab2_list-1.png lab2_list-2.png lab2_list-3.png lab2_list-4.png README Makefile 

clean:
	rm -f lab2_add lab2_list *tar.gz
