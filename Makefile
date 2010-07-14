#!/usr/bin/make
#

# The toplevel directory of the source tree.
SRCDIR = ./src

# The directory into which object code files should be written.
OBJDIR = ./obj

# The directory into which executable file should be written.
BINDIR = ./bin

# C Compiler and options for use in building executable.
CC = gcc -g -Os -Wall

SRC = \
	$(SRCDIR)/pit.c \
	$(SRCDIR)/project.c \
	$(SRCDIR)/table.c \
	$(SRCDIR)/task.c

OBJ = \
	$(OBJDIR)/pit.o \
	$(OBJDIR)/project.o \
	$(OBJDIR)/table.o \
	$(OBJDIR)/task.o

APP = pit

all: $(OBJDIR) $(APP)

$(OBJDIR):
	-mkdir $(OBJDIR)
	-mkdir $(BINDIR)

$(APP): $(OBJ)
	$(CC) -o $(BINDIR)/$(APP) $(OBJ)

$(OBJDIR)/pit.o: $(SRCDIR)/pit.c $(SRCDIR)/pit.h
	$(CC) -o $(OBJDIR)/pit.o -c $(SRCDIR)/pit.c

$(OBJDIR)/project.o: $(SRCDIR)/project.c $(SRCDIR)/project.h
	$(CC) -o $(OBJDIR)/project.o -c $(SRCDIR)/project.c

$(OBJDIR)/table.o: $(SRCDIR)/table.c $(SRCDIR)/table.h
	$(CC) -o $(OBJDIR)/table.o -c $(SRCDIR)/table.c

$(OBJDIR)/task.o: $(SRCDIR)/task.c $(SRCDIR)/task.h
	$(CC) -o $(OBJDIR)/task.o -c $(SRCDIR)/task.c


clean:
	rm -f $(OBJDIR)/*.o
	rm -f $(BINDIR)/$(APP)
	rmdir $(OBJDIR)
	rmdir $(BINDIR)
