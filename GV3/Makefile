CC=gcc
CFLAGS=-Wall -O3 -Wno-unused-result

all: test_amb_speed

test_amb_speed: spooky.h spooky.c csf.h csf.c csf3.h csf3.c xxhash.c xxhash.h test_amb_speed.c
	$(CC) $(CFLAGS) test_amb_speed.c xxhash.c csf3.c csf.c spooky.c -o test_amb_speed
	
debug_amb: spooky.h spooky.c csf.h csf.c csf3.h csf3.c xxhash.c xxhash.h test_amb_speed.c
	$(CC) $(CFLAGS) -g test_amb_speed.c xxhash.c csf3.c csf.c spooky.c -o test_amb_speed
