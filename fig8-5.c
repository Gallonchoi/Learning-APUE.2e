#include "apue.h"
#include <sys/wait.h>


int main(void) {
    pid_t pid;

    if((pid = fork()) < 0) {
        err_sys("fork error");
    } else if(pid == 0) {  // first child
        if((pid = fork()) < 0) {
            err_sys("fork error");
        } else if(pid > 0) {
            exit(0);  //  first child
        }

        // second child
        sleep(2);
        printf("second child, parent pid = %d\n", getppid());
        exit(0);
    }

    // parent
    if(waitpid(pid, NULL, 0) != pid) {
        err_sys("waitpid error");
    }

    return 0;
}
