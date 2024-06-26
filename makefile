CC = gcc
CFLAGS = -g

all: main.c
	$(CC) $(CFLAGS) main.c -o main

clean:
	rm -rf $(OBJDIR) $(TARGET)
	rm -rf main
	rm -rf libstack.a
	rm -rf libstack.so

.PHONY: all clean
