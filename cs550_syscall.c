//  This is the cs550 System  call file 


#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "defs.h"
#include "date.h"


/*************************************
************** ASSIGNMENT 1 *********
**************************************
*/
int
sys_date(void){
  
  struct rtcdate *r;
  if (argptr(0, (char **) &r, sizeof(struct rtcdate)) < 0)
    return -1;
  if(r) {
        cmostime(r);
   } else {
	return -1;
   }
  return 1;
}

/*
************************************
************** ASSIGNMENT 2 *********
**************************************/

typedef int (* Operation)(void);

typedef struct myMap {
    char *key;
    Operation value;
} myType;


int func_ls_call1(void){
    return 1;
}

int func_ls_call2(void){
    return 2;
}

int func_ls_call3(void){
    return 3;
}

int func_ls_call4(void){
    return 4;
}

int func_ls_call5(void){
    return 5;
}

int func_ls_call6(void){
    return 6;
}

int func_ls_call7(void){
    return 7;
}

int func_ls_call8(void){
    return 8;
}

int func_ls_call9(void){
    return 9;
}

int func_ls_call10(void){
    return 10;
}

int func_ls_call11(void){
    return 11;
}

int func_ls_call12(void){
    return 12;
}

int func_ls_call13(void){
    return 13;
}

int func_ls_call14(void){
    return 14;
}

int func_ls_call15(void){
    return 15;
}

int func_ls_call16(void){
    return 16;
}

int func_ls_call17(void){
    return 17;
}

int func_ls_call18(void){
    return 18;
}

int func_ls_call19(void){
    return 19;
}

int func_ls_call20(void){
    return 20;
}

int func_ls_call21(void){
    return 21;
}

int func_ls_call22(void){
    return 22;
}

int func_ls_call23(void){
    return 23;
}

int func_ls_call24(void){
    return 24;
}

int func_ls_call25(void){
    return 25;
}

int func_ls_call26(void){
    return 26;
}

int func_ls_call27(void){
    return 27;
}

int func_ls_call28(void){
    return 28;
}

int func_ls_call29(void){
    return 29;
}

int func_ls_call30(void){
    return 30;
}

int func_ls_call31(void){
    return 31;
}

int func_ls_call32(void){
    return 32;
}

int func_ls_call33(void){
    return 33;
}

int func_ls_call34(void){
    return 34;
}

int func_ls_call35(void){
    return 35;
}

int func_ls_call36(void){
    return 36;
}

int func_ls_call37(void){
    return 37;
}

int func_ls_call38(void){
    return 38;
}

int func_ls_call39(void){
    return 39;
}

int func_ls_call40(void){
    return 40;
}

int func_ls_call41(void){
    return 41;
}

int func_ls_call42(void){
    return 42;
}

int func_ls_call43(void){
    return 43;
}

int func_ls_call44(void){
    return 44;
}

int func_ls_call45(void){
    return 45;
}

int func_ls_call46(void){
    return 46;
}

int func_ls_call47(void){
    return 47;
}

int func_ls_call48(void){
    return 48;
}

int func_ls_call49(void){
    return 49;
}

int func_ls_call50(void){
    return 50;
}


int Default(void){
    return -1;
}

static myType ls_syscallss[50] = {
    {(char *)"ls_call1",func_ls_call1},
    {(char *)"ls_call2",func_ls_call2},
    {(char *)"ls_call3",func_ls_call3},
    {(char *)"ls_call4",func_ls_call4},
    {(char *)"ls_call5",func_ls_call5},
    {(char *)"ls_call6",func_ls_call6},
    {(char *)"ls_call7",func_ls_call7},
    {(char *)"ls_call8",func_ls_call8},
    {(char *)"ls_call9",func_ls_call9},
    {(char *)"ls_call10",func_ls_call10},
    {(char *)"ls_call11",func_ls_call11},
    {(char *)"ls_call12",func_ls_call12},
    {(char *)"ls_call13",func_ls_call13},
    {(char *)"ls_call14",func_ls_call14},
    {(char *)"ls_call15",func_ls_call15},
    {(char *)"ls_call16",func_ls_call16},
    {(char *)"ls_call17",func_ls_call17},
    {(char *)"ls_call18",func_ls_call18},
    {(char *)"ls_call19",func_ls_call19},
    {(char *)"ls_call20",func_ls_call20},
    {(char *)"ls_call21",func_ls_call21},
    {(char *)"ls_call22",func_ls_call22},
    {(char *)"ls_call23",func_ls_call23},
    {(char *)"ls_call24",func_ls_call24},
    {(char *)"ls_call25",func_ls_call25},
    {(char *)"ls_call26",func_ls_call26},
    {(char *)"ls_call27",func_ls_call27},
    {(char *)"ls_call28",func_ls_call28},
    {(char *)"ls_call29",func_ls_call29},
    {(char *)"ls_call30",func_ls_call30},
    {(char *)"ls_call31",func_ls_call31},
    {(char *)"ls_call32",func_ls_call32},
    {(char *)"ls_call33",func_ls_call33},
    {(char *)"ls_call34",func_ls_call34},
    {(char *)"ls_call35",func_ls_call35},
    {(char *)"ls_call36",func_ls_call36},
    {(char *)"ls_call37",func_ls_call37},
    {(char *)"ls_call38",func_ls_call38},
    {(char *)"ls_call39",func_ls_call39},
    {(char *)"ls_call40",func_ls_call40},
    {(char *)"ls_call41",func_ls_call41},
    {(char *)"ls_call42",func_ls_call42},
    {(char *)"ls_call43",func_ls_call43},
    {(char *)"ls_call44",func_ls_call44},
    {(char *)"ls_call45",func_ls_call45},
    {(char *)"ls_call46",func_ls_call46},
    {(char *)"ls_call47",func_ls_call47},
    {(char *)"ls_call48",func_ls_call48},
    {(char *)"ls_call49",func_ls_call49},
    {(char *)"ls_call50",func_ls_call50},
};


int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}

int (* ls_call(char *ptr)) () {
    int index = 0;
    for(index = 0; index < 100;index++){
        if(strcmp(ptr, ls_syscallss[index].key) == 0){
            return ls_syscallss[index].value;
        }
    }
    return Default;
};


void ls_insert(char *k, int (* val)(void)){
     int i = 0;
     for(i = 0; i < 100; i++){
         if(!ls_syscallss[i].key){
  	     cprintf("Setting \n");
             ls_syscallss[i].key = k;
             ls_syscallss[i].value = val;
             break;
        } else {
  		cprintf("Setting failed \n");
        }
     }
 }

/** Some Linking Issue to this function Hence running static */ 
int sys_ls_init(void){
    cprintf("Able to Call? \n");
    ls_insert((char *)"ls_call1",func_ls_call1);
    ls_insert((char *)"ls_call2",func_ls_call2);
    ls_insert((char *)"ls_call3",func_ls_call3);
    ls_insert((char *)"ls_call4",func_ls_call4);
    ls_insert((char *)"ls_call5",func_ls_call5);
    ls_insert((char *)"ls_call6",func_ls_call6);
    ls_insert((char *)"ls_call7",func_ls_call7);
    ls_insert((char *)"ls_call8",func_ls_call8);
    ls_insert((char *)"ls_call9",func_ls_call9);
    ls_insert((char *)"ls_call10",func_ls_call10);
    ls_insert((char *)"ls_call11",func_ls_call11);
    ls_insert((char *)"ls_call12",func_ls_call12);
    ls_insert((char *)"ls_call13",func_ls_call13);
    ls_insert((char *)"ls_call14",func_ls_call14);
    ls_insert((char *)"ls_call15",func_ls_call15);
    ls_insert((char *)"ls_call16",func_ls_call16);
    ls_insert((char *)"ls_call17",func_ls_call17);
    ls_insert((char *)"ls_call18",func_ls_call18);
    ls_insert((char *)"ls_call19",func_ls_call19);
    ls_insert((char *)"ls_call20",func_ls_call20);
    ls_insert((char *)"ls_call21",func_ls_call21);
    ls_insert((char *)"ls_call22",func_ls_call22);
    ls_insert((char *)"ls_call23",func_ls_call23);
    ls_insert((char *)"ls_call24",func_ls_call24);
    ls_insert((char *)"ls_call25",func_ls_call25);
    ls_insert((char *)"ls_call26",func_ls_call26);
    ls_insert((char *)"ls_call27",func_ls_call27);
    ls_insert((char *)"ls_call28",func_ls_call28);
    ls_insert((char *)"ls_call29",func_ls_call29);
    ls_insert((char *)"ls_call30",func_ls_call30);
    ls_insert((char *)"ls_call31",func_ls_call31);
    ls_insert((char *)"ls_call32",func_ls_call32);
    ls_insert((char *)"ls_call33",func_ls_call33);
    ls_insert((char *)"ls_call34",func_ls_call34);
    ls_insert((char *)"ls_call35",func_ls_call35);
    ls_insert((char *)"ls_call36",func_ls_call36);
    ls_insert((char *)"ls_call37",func_ls_call37);
    ls_insert((char *)"ls_call38",func_ls_call38);
    ls_insert((char *)"ls_call39",func_ls_call39);
    ls_insert((char *)"ls_call40",func_ls_call40);
    ls_insert((char *)"ls_call41",func_ls_call41);
    ls_insert((char *)"ls_call42",func_ls_call42);
    ls_insert((char *)"ls_call43",func_ls_call43);
    ls_insert((char *)"ls_call44",func_ls_call44);
    ls_insert((char *)"ls_call45",func_ls_call45);
    ls_insert((char *)"ls_call46",func_ls_call46);
    ls_insert((char *)"ls_call47",func_ls_call47);
    ls_insert((char *)"ls_call48",func_ls_call48);
    ls_insert((char *)"ls_call49",func_ls_call49);
    ls_insert((char *)"ls_call50",func_ls_call50);
   return 1; 
}


void
ls_syscall(void)
{
  char *n = (char *)proc->tf->eax;
  if(n > 0) { 
	 proc->tf->eax = ls_call(n)();
  } else {
         proc->tf->eax = -1;
  }
}
    


/*************************************
************** ASSIGNMENT 3 *********
**************************************/
int hash(char *str);

int func_ht_call1(void){
    return 1;
}

int func_ht_call2(void){
    return 2;
}

int func_ht_call3(void){
    return 3;
}

int func_ht_call4(void){
    return 4;
}

int func_ht_call5(void){
    return 5;
}

int func_ht_call6(void){
    return 6;
}

int func_ht_call7(void){
    return 7;
}

int func_ht_call8(void){
    return 8;
}

int func_ht_call9(void){
    return 9;
}

int func_ht_call10(void){
    return 10;
}

int func_ht_call11(void){
    return 11;
}

int func_ht_call12(void){
    return 12;
}

int func_ht_call13(void){
    return 13;
}

int func_ht_call14(void){
    return 14;
}

int func_ht_call15(void){
    return 15;
}

int func_ht_call16(void){
    return 16;
}

int func_ht_call17(void){
    return 17;
}

int func_ht_call18(void){
    return 18;
}

int func_ht_call19(void){
    return 19;
}

int func_ht_call20(void){
    return 20;
}


int func_ht_call21(void){
    return 21;
}

int func_ht_call22(void){
    return 22;
}

int func_ht_call23(void){
    return 23;
}

int func_ht_call24(void){
    return 24;
}

int func_ht_call25(void){
    return 25;
}

int func_ht_call26(void){
    return 26;
}

int func_ht_call27(void){
    return 27;
}

int func_ht_call28(void){
    return 28;
}

int func_ht_call29(void){
    return 29;
}

int func_ht_call30(void){
    return 30;
}

int func_ht_call31(void){
    return 31;
}

int func_ht_call32(void){
    return 32;
}

int func_ht_call33(void){
    return 33;
}

int func_ht_call34(void){
    return 34;
}

int func_ht_call35(void){
    return 35;
}

int func_ht_call36(void){
    return 36;
}

int func_ht_call37(void){
    return 37;
}

int func_ht_call38(void){
    return 38;
}

int func_ht_call39(void){
    return 39;
}

int func_ht_call40(void){
    return 40;
}

int func_ht_call41(void){
    return 41;
}

int func_ht_call42(void){
    return 42;
}

int func_ht_call43(void){
    return 43;
}

int func_ht_call44(void){
    return 44;
}

int func_ht_call45(void){
    return 45;
}

int func_ht_call46(void){
    return 46;
}

int func_ht_call47(void){
    return 47;
}

int func_ht_call48(void){
    return 48;
}

int func_ht_call49(void){
    return 49;
}

int func_ht_call50(void){
    return 50;
}


int hash(char *str){
    int sum = 0;
    while(*str){
        sum += *str;
        str++;
    }
    return sum % 1000; // Assuming simple Hash Function
}


static int (*ht_syscalls[1000])(void); 


static char* hash_Key [1000];


int rehash(char *str, int mul){
    int key =  hash(str);
    key *= mul;
    char *ptr = hash_Key[key];
    if(ptr && (strcmp(str, ptr) != 0))
        return key;
    return 0;
}

int getHashKey(char *str){
    int i = 1;
    int key =  hash(str); // Generate key
    char *p = hash_Key[key]; // Check if key is filled
    if(p) {
        if((strcmp(str, p) == 0)){ // Check if key is filled with give string
            return key;
        } else {
            for(i = 1; i < 10; i++){
                key = rehash(str, i);
                if(!key)
                    break;
            }
        }
    }
    return key;
}

void ht_insert(char *p, int (* func )(void)){
    int k = getHashKey(p);
    if(k > 0){
        hash_Key[k] = p;
        ht_syscalls[k] = func;
    }
}

void ht_insertFun(char *p, int (* func )(void)){
    int k = getHashKey(p);
    if(k > 0){
        ht_syscalls[k] = func;
    }
}

void ht_insertKey(char *p){
    int k = getHashKey(p);
    if(k > 0){
        hash_Key[k] = p;
    }
}

void printHash(){
  int i=0;
  for(i=0; i<1000; i++){
   cprintf("Key %s Value %d \n", hash_Key[i],ht_syscalls[i]());
  }
}

// Somehow I coudln't call this insert at all from my user file
int sys_ht_init(){
cprintf("\n\n\n\n\nAre you Here ??\n\n\n\n\n\n");
ht_insert((char *)"ht_call1", func_ht_call1);
ht_insert((char *)"ht_call2",func_ht_call2);
ht_insert((char *)"ht_call3",func_ht_call3);
ht_insert((char *)"ht_call4",func_ht_call4);
ht_insert((char *)"ht_call5",func_ht_call5);
ht_insert((char *)"ht_call6",func_ht_call6);
ht_insert((char *)"ht_call7",func_ht_call7);
ht_insert((char *)"ht_call8",func_ht_call8);
ht_insert((char *)"ht_call9",func_ht_call9);
ht_insert((char *)"ht_call10",func_ht_call10);
ht_insert((char *)"ht_call11",func_ht_call11);
ht_insert((char *)"ht_call12",func_ht_call12);
ht_insert((char *)"ht_call13",func_ht_call13);
ht_insert((char *)"ht_call14",func_ht_call14);
ht_insert((char *)"ht_call15",func_ht_call15);
ht_insert((char *)"ht_call16",func_ht_call16);
ht_insert((char *)"ht_call17",func_ht_call17);
ht_insert((char *)"ht_call18",func_ht_call18);
ht_insert((char *)"ht_call19",func_ht_call19);
ht_insert((char *)"ht_call20",func_ht_call20);
ht_insert((char *)"ht_call21",func_ht_call21);
ht_insert((char *)"ht_call22",func_ht_call22);
ht_insert((char *)"ht_call23",func_ht_call23);
ht_insert((char *)"ht_call24",func_ht_call24);
ht_insert((char *)"ht_call25",func_ht_call25);
ht_insert((char *)"ht_call26",func_ht_call26);
ht_insert((char *)"ht_call27",func_ht_call27);
ht_insert((char *)"ht_call28",func_ht_call28);
ht_insert((char *)"ht_call29",func_ht_call29);
ht_insert((char *)"ht_call30",func_ht_call30);
ht_insert((char *)"ht_call31",func_ht_call31);
ht_insert((char *)"ht_call32",func_ht_call32);
ht_insert((char *)"ht_call33",func_ht_call33);
ht_insert((char *)"ht_call34",func_ht_call34);
ht_insert((char *)"ht_call35",func_ht_call35);
ht_insert((char *)"ht_call36",func_ht_call36);
ht_insert((char *)"ht_call37",func_ht_call37);
ht_insert((char *)"ht_call38",func_ht_call38);
ht_insert((char *)"ht_call39",func_ht_call39);
ht_insert((char *)"ht_call40",func_ht_call40);
ht_insert((char *)"ht_call41",func_ht_call41);
ht_insert((char *)"ht_call42",func_ht_call42);
ht_insert((char *)"ht_call43",func_ht_call43);
ht_insert((char *)"ht_call44",func_ht_call44);
ht_insert((char *)"ht_call45",func_ht_call45);
ht_insert((char *)"ht_call46",func_ht_call46);
ht_insert((char *)"ht_call47",func_ht_call47);
ht_insert((char *)"ht_call48",func_ht_call48);
ht_insert((char *)"ht_call49",func_ht_call49);
ht_insert((char *)"ht_call50",func_ht_call50);
return 1;
}


void
ht_syscall(void)
{
  char *n = (char *)proc->tf->eax;
  if(n > 0) { 
	 proc->tf->eax = ht_syscalls[getHashKey(n)]();
	} else {
    	proc->tf->eax = -1;
        }
}

