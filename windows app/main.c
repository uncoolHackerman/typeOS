#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
int main(){
    char ch;
    printf("Welcome to the typeOS for Windows app!\n");
    while(1) {
        ch = _getch();
        printf("%c", ch);}
    return 0;}
