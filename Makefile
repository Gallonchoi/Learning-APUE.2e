CC = clang
FLAG = -Wall -g -O0 -pthread
TARGETS = fig1-1 fig1-2 fig1-3 fig1-4 fig1-5 fig1-8 fig3-1 fig3-2 fig3-4 fig4-1 fig5-3 fig7-2 fig8-1 fig8-2 fig8-5 fig8-6 fig10-1 fig11-1 fig16-1
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
