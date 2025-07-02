#include <pthread.h>
#include <stdio.h>
#include "../mytime.h"
#include "test.h"

//simple fork-join without work division version
int count=0;
void test(void);
void* inc(void*);
int main(){
	vtime(test());
	printf("%d\n",count);
}
void test(void){
	pthread_t tid;
	for(int i=0;i<COUNT_UP_TO;++i){
		pthread_create(&tid,NULL,inc,NULL);
		pthread_join(tid,NULL);
	}
}
void* inc(void* arg){
	(void)arg;
	count++;
	return NULL;
}
