# Compiler and archiver
CC = gcc
AR = ar
ARFLAGS = rcs
CFLAGS = -fPIC

# Directories
SRCDIR = stack
OBJDIR = obj

# Target library
TARGET = libstack.so

# Source files
SRCS = $(wildcard $(SRCDIR)/*.c)

# Object files
OBJS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS))

# Default target
all: $(TARGET) main.c
	$(CC) -g main.c -L. -lstack -Istack -o main

# Create the object directory if it doesn't exist
$(OBJDIR):
	mkdir -p $(OBJDIR)

# Compile .c files to .o files
$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) -g $(CFLAGS) -c $< -o $@

# Build the static library
$(TARGET): $(OBJS)
	$(CC) -shared -o $@ $^
	# $(CC) -shared -o -Wl,-soname,libstack.so.1 -o libstack.so.1.0 $^

print-variables:
	@echo "Source files: $(SRCS)"
	@echo "Object files: $(OBJS)"

# Clean up
clean:
	rm -rf $(OBJDIR) $(TARGET)
	rm -rf main
	rm -rf libstack.a
	rm -rf libstack.so

.PHONY: all clean
