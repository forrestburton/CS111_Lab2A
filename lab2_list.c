//NAME: Forrest Burton
//EMAIL: burton.forrest10@gmail.com
//ID: 005324612

int main(int argc, char *argv[]) {
    int c;
    int iterations, threads;
    
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
                threads = atoi(optarg);
                break;
            case 'i':
                iterations = atoi(optarg);
                break;
            default:
                printf("Incorrect usage: accepted options are: [--threads=(int) --iterations=(int)]\n");
                exit(1);
        }
    }
}