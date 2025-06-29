#include <alloca.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <alloca.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/resource.h>
#include "test_data.h"

void test(ulong size);
void test2(ulong size);
void control(ulong size);
void alloca_limit();
int main(){
	//test(TEST_SMALL);
	//test(TEST_MID);
	//test(TEST_LARGE);
	test(TEST_VLARGE);
	//while(1) alloca_limit();
	//control(TEST_MID);
	//control(TEST_LARGE);
}
void test(ulong size){
	void* arr[num_alloc];	
	for(int i=0;i<num_alloc;++i){
		arr[i]=malloc(size);
	}
	for(int i=0;i<num_alloc;++i){
		free(arr[i]);
	}
	printf("num allocated:%d\nsize:%lu\n",num_alloc,size);
}
void test2(ulong size){
	//mem pool
	char* mempool=NULL;
	ulong top=0;
	if (mempool==NULL) mempool=(char*)malloc(size*num_alloc);
	void* arr[num_alloc];
	for(int i=0;i<num_alloc;++i){
		arr[i]=(void*)&mempool[top];
		((int*)arr)[i]=1;
		top+=size;
	}
	for(int i=0;i<num_alloc;++i){
		top-=size;
	}
	(void)arr;
	assert(top==0);
	free(mempool);
	printf("num allocated:%d\nsize:%lu\n",num_alloc,size);
}

void control(ulong size){
	//vla or allca (basically stack allocation)
	struct rlimit lim;
	assert(0==getrlimit(RLIMIT_STACK,&lim));
	assert(size*num_alloc-5000<lim.rlim_cur&&"too big for stack allocation");
	// printf("%lu:%lu\n",lim.rlim_max,lim.rlim_cur);
	void* arr[num_alloc];	
	for(int i=0;i<num_alloc;++i){
		arr[i]=alloca(size);
	}
	
	for(int i=0;i<num_alloc;++i){
		(void)arr[i];
	}
	printf("num allocated:%d\nsize:%lu\n",num_alloc,size);
}
void alloca_limit(){
	static ulong i=0;
	void* a=alloca(i+=128);
	(void)a;
	printf("%lu\n",i);
}


