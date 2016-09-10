#include "param.h"
#include "syscall.h"
#include "traps.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "date.h"


void test_date(){
  struct rtcdate *r = malloc(sizeof(struct rtcdate));
  date(r); 
  printf(1,"After Calling date %d %d %d %d %d %d \n",r->second,r->minute,r->hour,r->day,r->month,r->year);
}

void test_getpid(){
  int i = 0;
  
  uint start = 1000000000 * uptime(); 
  
  for(i= 0;i< 100000; i++) {
        getpid();
  }
  uint stop = 1000000000 * uptime();
  uint diff  =  (stop - start) / 100000;
  printf(1, " Time Calculated doing getpid %d\n", diff);
}

void call01_ls() {
  int i = 0;
  i = ls_call1();
  printf(1," Calling ls cal1 01 %d\n",i);
}

void call50_ls() {
  int i = 0;
  i = ls_call50();
  printf(1," Calling ls cal1 05 %d\n",i);
}

void ls_linear_time() {
  int i = 0;
  
  uint start = 1000000000 * uptime(); 
  
  for(i= 0;i< 100000; i++) {
        ls_call22();
  }
  uint stop = 1000000000 * uptime();
  uint diff  =  (stop - start) / 100000;
  printf(1, " Time Calculated doing linear %d\n", diff);
}

void ls_call03() {
  int i = 0;
  i = ls_call3();
  printf(1," Calling ls cal1 03 %d\n",i);
}


void ls_call04() {
  int i = 0;
  i = ls_call4();
  printf(1," Calling ls cal1 04 %d\n",i);
}


void call01_ht() {
  int i = 0;
  i = ht_call1();
  printf(1," Calling ht 01 %d\n",i);
}

void call50_ht() {
  int i = 0;
  i = ht_call50();
  printf(1," Calling ht 50 5%d\n",i);
}
int
main(int argc, char *argv[])
{
  test_date();
  test_getpid();
  call01_ls();
  call50_ls();
  ls_linear_time();
  call01_ht();
  call50_ht();
  return 0;
}
