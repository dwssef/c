CC = gcc

CFLAGS = -Wall -Wextra -std=c11 -g

TARGET = main

SRCS = main.c ret_ptr.c

OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

cleanall:
	rm -rf *.c *.h

.PHONY: all clean

print-variables:
	@echo "Source files: $(SRCS)"
	@echo "Object files: $(OBJS)"