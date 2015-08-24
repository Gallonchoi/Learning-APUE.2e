#include "apue.h"

static void sig_usr(int signo) {
    if(signo == SIGUSR1) {
        printf("received SIGUSR1\n");  // it must has line break because printf is line buffered
    } else if(signo == SIGUSR2) {
        printf("received SIGUSR2\n");
    } else {
        err_dump("received signal %d\n", signo);
    }
}

int main(void) {
    if(signal(SIGUSR1, sig_usr) == SIG_ERR) {
        err_sys("cant't catch SIGUSR1");
    } else if(signal(SIGUSR2, sig_usr) == SIG_ERR) {
        err_sys("cant't catch SIGUSR2");
    }
    while(1) {
        pause();
    }
    /* return 0; */
}
