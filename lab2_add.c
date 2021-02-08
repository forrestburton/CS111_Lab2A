//NAME: Forrest Burton
//EMAIL: burton.forrest10@gmail.com
//ID: 005324612
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <getopt.h>

int opt_yield;
void add(long long *pointer, long long value) {
    long long sum = *pointer + value;
    if (opt_yield)
        sched_yield();
    *pointer = sum;
}