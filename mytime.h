#pragma once
#include <stdio.h>
#include <sys/times.h>
#include <sys/time.h>
#include <unistd.h>

#define rtime(func)						\
	do{							\
		struct timeval tv_begin,tv_end;			\
		gettimeofday(&tv_begin,NULL);			\
		func;						\
		gettimeofday(&tv_end,NULL);			\
		printf("real\t:: %lf s\n"			\
		,(double)(tv_end.tv_sec-tv_begin.tv_sec)	\
		+(double)(tv_end.tv_usec-tv_begin.tv_usec)	\
		/1000000);					\
	}while(0)
#define sutime(func)						\
	do{							\
		struct tms tsm_begin,tsm_end;			\
		times(&tsm_begin);				\
		func;						\
		times(&tsm_end);				\
		printf("utime\t:: %.2lf s\n"			\
		,(double)(tsm_end.tms_utime-tsm_begin.tms_utime)\
		/(double)sysconf(_SC_CLK_TCK));			\
		printf("stime\t:: %.2lf s\n"			\
		,(double)(tsm_end.tms_stime-tsm_begin.tms_stime)\
		/(double)sysconf(_SC_CLK_TCK));			\
	}while(0)
#define vtime(func) rtime(sutime(func))
