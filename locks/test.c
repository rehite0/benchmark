#include <pthread.h>
#include <stdio.h>
#include <sys/types.h>
#include <stdatomic.h>
#include <time.h>
#include <semaphore.h>
#include "../mytime.h"
#include "test.h"

ulong count=0;

pthread_barrier_t start,stop;
pthread_mutex_t mlock;
pthread_spinlock_t slock;
sem_t semlock;
atomic_int_fast8_t cst_slock=0;

void mutex(void);
void spin(void);
void sema(void);
void cst_spin(void);
void cst_spin_bad(void);

void* rut(void* arg);
void inc();
int main(){
	pthread_barrier_init(&start,0,THREADS+1);
	pthread_barrier_init(&stop,0,THREADS+1);
	pthread_mutex_init(&mlock,0);
	pthread_spin_init(&slock,0);
	sem_init(&semlock,0,1);
	pthread_t tid[THREADS]={0};
	for(int i=0;i<THREADS;++i){
		pthread_create(&tid[i],0,rut,0);
	}
	vtime(
		pthread_barrier_wait(&start);
		pthread_barrier_wait(&stop)	);
	for(int i=0;i<THREADS;++i){
		pthread_join(tid[i],0);
	}
	pthread_barrier_destroy(&start);
	pthread_barrier_destroy(&stop);
	pthread_mutex_destroy(&mlock);
	pthread_spin_destroy(&slock);
	sem_destroy(&semlock);
	printf("task check:%lu=%lu\n",COUNT_UP_TO,count);
}
void* rut(void* arg){
	(void)arg;
	pthread_barrier_wait(&start);
	//mutex();
	//spin();
	cst_spin();
	//cst_spin_bad();
	//sema();
	//atomic()
	pthread_barrier_wait(&stop);
	return 0;
}


void mutex(void){
	while(1){
		pthread_mutex_lock(&mlock);
		if(count>=COUNT_UP_TO) break;
		inc();
		pthread_mutex_unlock(&mlock);
	}
	pthread_mutex_unlock(&mlock);
}
void spin(void){
	while(1){
		pthread_spin_lock(&slock);
		if(count>=COUNT_UP_TO) break;
		inc();
		pthread_spin_unlock(&slock);
	}
	pthread_spin_unlock(&slock);
}
void cst_spin(void){
	while(1){
		for(int i=0;
		atomic_load_explicit(&cst_slock,memory_order_relaxed)
		||atomic_exchange_explicit(
		&cst_slock,1,memory_order_acquire)
		;++i){if(i==8) {i=0;nanosleep(&(struct timespec){0,1},0);}}
		if(count>=COUNT_UP_TO) break;
		inc();
		atomic_store_explicit(&cst_slock,0,memory_order_release);
	}
	atomic_store_explicit(&cst_slock,0,memory_order_release);
}
void cst_spin_bad(void){
	while(1){
		for(int i=0;
		atomic_load(&cst_slock)
		||atomic_exchange(
		&cst_slock,1)
		;++i){if(i==8) {i=0;nanosleep(&(struct timespec){0,1},0);}}
		if(count>=COUNT_UP_TO) break;
		inc();
		atomic_store(&cst_slock,0);
	}
	atomic_store(&cst_slock,0);
}

void sema(void){
	while(1){
		sem_wait(&semlock);
		if(count>=COUNT_UP_TO) break;
		inc();
		sem_post(&semlock);
	}
	sem_post(&semlock);
}

void inc(){
	count++;
}
