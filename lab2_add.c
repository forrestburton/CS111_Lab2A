//NAME: Forrest Burton
//EMAIL: burton.forrest10@gmail.com
//ID: 005324612

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <getopt.h>
#include <unistd.h>  
#include <pthread.h> 
#include <time.h>
#include <string.h>

pthread_t* threads = NULL;
long long counter = 0;
int opt_yield = 0;
int opt_sync = 0;
pthread_mutex_t protect;
long spin_lock = 0;

void add(long long *pointer, long long value) {
    long long sum = *pointer + value;
    if (opt_yield) {
        sched_yield();
    }
    *pointer = sum;
}

void free_memory(void) {
    if (threads != NULL) {
        free(threads);
    }
}

void add_atomically(long long *counter, unsigned long val) {
    long long curr_val, incremented_val;    
    do {
        curr_val = *counter;
        incremented_val = curr_val + val;
    } while (__sync_bool_compare_and_swap(counter, curr_val, incremented_val) == 0);
}

void* thread_tasks(void *arg) {
    int iterations = *((int*)arg);
    switch(opt_sync) {
        case 0:  //no sync option given
            for (int i = 0; i < iterations; i++) {
                add(&counter, 1);
            }
            for (int i = 0; i < iterations; i++) {
                add(&counter, -1);
            }
            break;
        case 'm': //mutex
            for (int i = 0; i < iterations; i++) {
                if (pthread_mutex_lock(&protect) != 0) {
                    fprintf(stderr, "Error locking mutex\n");
                    exit(1);
                }
                add(&counter, 1);
                if (pthread_mutex_unlock(&protect) != 0) {
                    fprintf(stderr, "Error unlocking mutex\n");
                    exit(1);
                }
            }
            for (int i = 0; i < iterations; i++) {
                if (pthread_mutex_lock(&protect) != 0) {
                    fprintf(stderr, "Error locking mutex\n");
                    exit(1);
                }
                add(&counter, -1);
                if (pthread_mutex_unlock(&protect) != 0) {
                    fprintf(stderr, "Error unlocking mutex\n");
                    exit(1);
                }
            }
            break;
        case 's':  //spinlock
            for (int i = 0; i < iterations; i++) {
                while (__sync_lock_test_and_set(&spin_lock, 1));
                add(&counter, 1);
                __sync_lock_release(&spin_lock);
            }
            for (int i = 0; i < iterations; i++) {
                while (__sync_lock_test_and_set(&spin_lock, 1));
                add(&counter, -1);
                __sync_lock_release(&spin_lock);
            }
            break;
        case 'c':  //compare-and-swap
            for (int i = 0; i < iterations; i++) {
                add_atomically(&counter, 1);
            }
            for (int i = 0; i < iterations; i++) {
                add_atomically(&counter, -1);
            }
            break;
        default: 
            fprintf(stderr, "Incorrect argument for sync, accepted are ['m', 's', 'c'] \n");
            exit(1);
            break;
    }
    return NULL;
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
            {"yield", no_argument, 0, 'y' },
            {"sync", required_argument, 0, 's' },
            {0,     0,             0, 0 }};
        c = getopt_long(argc, argv, "t:i:ys:", long_options, &option_index);
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
            case 'y':
                opt_yield = 1;
                break;
            case 's':
                opt_sync = optarg[0];
                if (!(opt_sync != 'm' || opt_sync != 's' || opt_sync != 'c')) {
                    fprintf(stderr, "Incorrect argument for sync, accepted are ['m', 's', 'c'] \n");
                    exit(1);
                }
                break;
            default:
                fprintf(stderr, "Incorrect usage, accepted options are: [--threads=th_num --iterations=it_num]\n");
                exit(1);
        }
    }

    if (opt_sync == 'm') {
        if (pthread_mutex_init(&protect, NULL) != 0) {
            fprintf(stderr, "Error initializing mutex: %s\n", strerror(errno));
            exit(1);
        }
    }

    threads = malloc(sizeof(pthread_t) * thread_num); //allocate memory for array of threads
    if (threads == NULL) {
        fprintf(stderr, "Error, malloc (memory allocation) failed: %s\n", strerror(errno));
        exit(1);
    }

    atexit(free_memory); //must free allocated memory at exit

    struct timespec start_time; //get start time
    if (clock_gettime(CLOCK_MONOTONIC, &start_time) == -1) {
        fprintf(stderr, "Error getting start time: %s\n", strerror(errno));
        exit(1);
    }

    for (int i = 0; i < thread_num; i++) { //create threads
        if (pthread_create(&threads[i], NULL, thread_tasks, &iterations) != 0) {
            fprintf(stderr, "Error, creation of a thread failed: %s\n", strerror(errno));
            exit(1);
        }
    }

    for (int i = 0; i < thread_num; i++) { //join threads
        if (pthread_join(threads[i], NULL) != 0) {
            fprintf(stderr, "Error, joining threads failed: %s\n", strerror(errno));
            exit(1);
        }
    } 

    struct timespec end_time;  //get end time
    if (clock_gettime(CLOCK_MONOTONIC, &end_time) == -1) {
        fprintf(stderr, "Error getting start time: %s\n", strerror(errno));
        exit(1);
    }

    //get total time
    unsigned long total_time_nsec; 
    long nsec = end_time.tv_nsec - start_time.tv_nsec;
    time_t sec = end_time.tv_sec - start_time.tv_sec;
    total_time_nsec = sec*1000000000 + nsec;

    //get average time per operation
    long ops = thread_num * iterations * 2;
    long avg_time_per_op = total_time_nsec / ops;

    //print out stats - Name of test, thread#, itera#, operation#, runtime, avg t/oper, total
    char output[50] = "";
    strcat(output, "add");

    if (opt_yield) {
        strcat(output, "-yield");
    }

    //get name of test
    switch(opt_sync) {
        case 0:  //no sync option given
            strcat(output, "-none");
            break;
        case 'm': //mutex
            strcat(output, "-m");
            break;
        case 's':  //spinlock
            strcat(output, "-s");
            break;
        case 'c':  //compare-and-swap
           strcat(output, "-c");
            break;
        default: 
            break;
    }

    fprintf(stdout, "%s,%d,%d,%ld,%lu,%ld,%lld\n", output, thread_num, iterations, ops, total_time_nsec, avg_time_per_op, counter);

    exit(0);
}