CC=gcc
CFLAGS=-c -O2 -Wall -g

all: main

csapp.o: csapp.c csapp.h
	$(CC) $(CFLAGS) -c csapp.c

io.o: io.c io.h
	$(CC) $(CFLAGS) -c io.c

crawler.o: crawler.c crawler.h
	$(CC) $(CFLAGS) -c crawler.c
main.o: main.c
	$(CC) $(CFLAGS) -c main.c

main: main.o io.o crawler.o csapp.o
	$(CC) main.o io.o crawler.o csapp.o -o main -lpthread -lcurl -ltidy


clean:
	/bin/rm -f main *.o *.gz

run:
	./main http://eecs.pku.edu.cn

tarball:
	tar -cvzf crawler.tar.gz *
