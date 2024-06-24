# Compiler and archiver
CC = gcc
AR = ar
ARFLAGS = rcs
CFLAGS = -Wall -Istack

# Directories
SRCDIR = stack
OBJDIR = obj

# Target library
TARGET = libstack.a

# Source files
SRCS = $(wildcard $(SRCDIR)/*.c)

# Object files
OBJS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS))

# Default target
all: $(TARGET) main.c
	$(CC) -g main.c $(OBJS) -Istack -o main

# Create the object directory if it doesn't exist
$(OBJDIR):
	mkdir -p $(OBJDIR)

# Compile .c files to .o files
$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) -g $(CFLAGS) -c $< -o $@

# Build the static library
$(TARGET): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

print-variables:
	@echo "Source files: $(SRCS)"
	@echo "Object files: $(OBJS)"

# Clean up
clean:
	rm -rf $(OBJDIR) $(TARGET)
	rm -rf main

.PHONY: all clean
