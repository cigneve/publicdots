/* cc -o rice rice.c */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
int main(int c, char **v){
    srand(&c);
    char s[256];
    char i;
    for (i=1;i<c;i++){
        strcat(s,*(v+i));
        strcat(s," ");
    }
    for(;;){
        printf("\e[3%dm %s",rand()%7+1,s);
        // fflush(stdout);
        usleep(500);
    };
}
