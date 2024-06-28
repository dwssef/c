/* generics.h */
#ifndef GENERICS_H
#define GENERICS_H

typedef struct {
     const char *name;
     int score;
} student_t;

typedef int (*cmp_t)(void *, void *);
extern void *max(void *data[], int num, cmp_t cmp);

#endif