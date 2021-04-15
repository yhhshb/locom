CC=gcc
CFLAGS=-Wall -O3 -Wno-unused-result

all: test_locom_speed

test_locom_speed: spooky.h spooky.c csf.h csf.c csf3.h csf3.c xxhash.c xxhash.h test_locom_speed.c
	$(CC) $(CFLAGS) test_locom_speed.c xxhash.c csf3.c csf.c spooky.c -o test_locom_speed
	
debug: spooky.h spooky.c csf.h csf.c csf3.h csf3.c xxhash.c xxhash.h test_locom_speed.c
	$(CC) $(CFLAGS) -g test_locom_speed.c xxhash.c csf3.c csf.c spooky.c -o test_locom_speed
