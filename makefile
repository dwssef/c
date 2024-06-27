CC = gcc

CFLAGS = -Wall -Wextra -std=c11 -g

TARGET = main

SRCS = main.c redirect_ptr.c

OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean

print-variables:
	@echo "Source files: $(SRCS)"
	@echo "Object files: $(OBJS)"