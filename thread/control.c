#include <stdio.h>
#include "../mytime.h"
#include "test.h"

//simple single threaded version
int count=0;
void test(void);
void inc(void);
int main(){
	vtime(test());
	printf("%d\n",count);
}
void test(void){
	for(int i=0;i<COUNT_UP_TO;++i){
		inc();
	}

}
void inc(void){
	count++;
}
