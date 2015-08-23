CC=clang
FLAG=-Wall -g -O2

.PHONY: all clean

all: fig1-1

err.o:
	$(CC) $(FLAG) -c err.c

fig1-1.o:
	$(CC) $(FLAG) -c fig1-1.c

fig1-1: err.o fig1-1.o
	$(CC) $(FLAG) err.o fig1-1.o -lm -o fig1-1

clean:
	rm *.o fig1-1
