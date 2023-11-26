/**
 * @file functions.c
 * @author Han H. Mouse
 * 
 * @version 5.3
 * @date 2002-02-16
 * 
 * @copyright Copyright (c) 2002 Han H. Mouse
 * 
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "functions.h"

void fnr(void) {
    puts("The door is locked.");
    return;
}

void fngrt(void) {
    puts("Opened.");
    puts("No root.");
    return;
}

int fnR(void) {
    puts("Opened.");
    puts("Be careful, you are ROOT !\n");
    return 0;
}

int fnchck(int a, int b) {
    int check;

    if (b == a) {
        puts("Valid access.");
        check = 0xf;
    } else {
        check = 0;
    }
    return check;
}

int validate(char * argv[]) {
    char buffer[20];
    printf("You entered %s and %s. \nDo you agree ? (Y,n):\n", argv[1], argv[2]);
    scanf("%s", buffer);
    return strcmp(buffer, "Y");
}
