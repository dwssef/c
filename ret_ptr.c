/* ret_ptr.c */
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "ret_ptr.h"

static const char *msg[] = {"Sunday", "Monday", "Tuesday", "Wednesday",
                            "Thursday", "Friday", "Saturday"};

char *get_a_day(int idx)
{
    char *buf = malloc(strlen(msg[idx])+ 1);
    if (buf != NULL) {
        strcpy(buf, msg[idx]);
    }
    return buf;
}