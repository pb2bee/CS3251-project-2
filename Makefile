#################################################################
##
## FILE:	Makefile
## PROJECT:	CS 3251 Project 2 - Professor Traynor
## DESCRIPTION: Compile Project 2
##
#################################################################

CC=gcc

OS := $(shell uname -s)

# Extra LDFLAGS if Solaris
ifeq ($(OS), SunOS)
	LDFLAGS=-lsocket -lnsl
    endif

all: client server 

client: client.o list.o utilities.o
	$(CC) -lcrypto -o GTmyMusic client.o list.o utilities.o

server: server.o utilities.o
	$(CC) -pthread -lcrypto -o GTmyMusicServer server.o list.o utilities.o

%.o : %.c %.h
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f client server *.o