//NAME: Forrest Burton
//EMAIL: burton.forrest10@gmail.com
//ID: 005324612
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <getopt.h>
#include <unistd.h>  
#include <pthread.h> 

pthread_t* threads = NULL;

void add(long long *pointer, long long value) {
    long long sum = *pointer + value;
    *pointer = sum;
}

void free_memory(void) {
    if (threads != NULL) {
        free(threads);
    }
}

int main(int argc, char *argv[]) {
    int c;
    int iterations = 1;
    int thread_num = 1;
    
    while(1) {
        int option_index = 0;
        static struct option long_options[] = {
            {"threads", required_argument, 0, 't' },
            {"iterations", required_argument, 0, 'i' },
            {0,     0,             0, 0 }};
        c = getopt_long(argc, argv, "t:i:", long_options, &option_index);
        if (c == -1) break;
        switch (c) {
            case 't':
                thread_num = atoi(optarg);
                if (thread_num < 1) {
                    fprintf(stderr, "Error: number of threads must be greater than 0");
                    exit(1);
                }
                break;
            case 'i':
                iterations = atoi(optarg);
                if (iterations < 1) {
                    fprintf(stderr, "Error: number of iterations must be greater than 0");
                    exit(1);
                }
                break;
            default:
                fprintf(stderr, "Incorrect usage: accepted options are: [--threads=th_num --iterations=it_num]\n");
                exit(1);
        }
    }
    threads = malloc(sizeof(pthread_t) * thread_num);
    atexit(free_memory);

    for (int i = 0; i < thread_num; i++) { //create threads
        pthread_create(threads[i], NULL, );
    }

    exit(0);
}