#ifndef __INC_H__
#define __INC_H__

//#include "inc.h"
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define max(x,y) x>y?x:y
#define min(x,y) x<y?x:y

// protots
void oper(float x1, float x2, float *y1, float *y2, int i1, int i2);
void dek(float *x, int n, int *iq, int m, float *y);
void genbaf(int m, int k, float *x, float *q, float *z, int l);
void genyad(int *iq,int n22);
void oper(float x1, float x2, float *y1, float *y2, int i1, int i2);
void qtosc(int m,float *s,float *c);
void tfr(int m,int nap,float *s,float *c,float *x,float *z);

#endif // __INC_H__
// __eof__
