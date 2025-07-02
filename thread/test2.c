#include <pthread.h>
#include <stdio.h>
#include <stdatomic.h>
#include "../mytime.h"
#include "test.h"

//single creation multi-use  without work division version
int count=0;
pthread_barrier_t fk;
pthread_barrier_t jo;
atomic_int stop=0;
atomic_int all_blocked=0;
void test(void);
void inc(void);
void* rut(void* arg);
int main(){
	vtime(test());
	printf("%d\n",count);
}
void test(void){
	pthread_t tid;
	pthread_barrier_init(&fk,NULL,2);
	pthread_barrier_init(&jo,NULL,2);
	pthread_create(&tid,NULL,rut,NULL);
	for(int i=0;i<COUNT_UP_TO;++i){
		pthread_barrier_wait(&fk);
		pthread_barrier_wait(&jo);
	}
	atomic_store(&stop,1);
	pthread_barrier_wait(&fk);
	pthread_join(tid,NULL);
	pthread_barrier_destroy(&fk);
	pthread_barrier_destroy(&jo);

}
void* rut(void* arg){
	(void)arg;
	while(1){
		pthread_barrier_wait(&fk);
		if(atomic_load(&stop)) return NULL;
		inc();
		pthread_barrier_wait(&jo);
	}
	return NULL;
}
void inc(void){
	count++;
}
