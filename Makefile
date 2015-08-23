CC = clang
FLAG = -Wall -g -O2
TARGETS = fig1-1 fig1-2
OBJ = $(addsuffix .o, $(TARGETS))

.PHONY: all clean

all: $(TARGETS)

err.o:
	$(CC) $(FLAG) -c err.c

$(OBJ): err.o
	$(CC) $(FLAG) -c $(addsuffix .c, $(basename $@))

$(TARGETS): err.o $(addsuffix .o, $(TARGETS))
	$(CC) $(FLAG) err.o $(addsuffix .o, $@) -lm -o $@

clean:
	rm *.o $(TARGETS)
