#include "types.h"

struct stat;
struct rtcdate;

// system calls
int fork(void);
int exit(void) __attribute__((noreturn));
int wait(void);
int pipe(int*);
int write(int, void*, int);
int read(int, void*, int);
int close(int);
int kill(int);
int exec(char*, char**);
int open(char*, int);
int mknod(char*, short, short);
int unlink(char*);
int fstat(int fd, struct stat*);
int link(char*, char*);
int mkdir(char*);
int chdir(char*);
int dup(int);
int getpid(void);
char* sbrk(int);
int sleep(int);
int uptime(void);

// Assignemnt call

int date(struct rtcdate *);

int ls_call1(void);
int ls_call2(void);
int ls_call3(void);
int ls_call4(void);
int ls_call5(void);
int ls_call6(void);
int ls_call7(void);
int ls_call8(void);
int ls_call9(void);
int ls_call10(void);
int ls_call11(void);
int ls_call12(void);
int ls_call13(void);
int ls_call14(void);
int ls_call15(void);
int ls_call16(void);
int ls_call17(void);
int ls_call18(void);
int ls_call19(void);
int ls_call20(void);
int ls_call21(void);
int ls_call22(void);
int ls_call23(void);
int ls_call24(void);
int ls_call25(void);
int ls_call26(void);
int ls_call27(void);
int ls_call28(void);
int ls_call29(void);
int ls_call30(void);
int ls_call31(void);
int ls_call32(void);
int ls_call33(void);
int ls_call34(void);
int ls_call35(void);
int ls_call36(void);
int ls_call37(void);
int ls_call38(void);
int ls_call39(void);
int ls_call40(void);
int ls_call41(void);
int ls_call42(void);
int ls_call43(void);
int ls_call44(void);
int ls_call45(void);
int ls_call46(void);
int ls_call47(void);
int ls_call48(void);
int ls_call49(void);
int ls_call50(void);


int ht_call1(void);
int ht_call2(void);
int ht_call3(void);
int ht_call4(void);
int ht_call5(void);
int ht_call6(void);
int ht_call7(void);
int ht_call8(void);
int ht_call9(void);
int ht_call10(void);
int ht_call11(void);
int ht_call12(void);
int ht_call13(void);
int ht_call14(void);
int ht_call15(void);
int ht_call16(void);
int ht_call17(void);
int ht_call18(void);
int ht_call19(void);
int ht_call20(void);
int ht_call21(void);
int ht_call22(void);
int ht_call23(void);
int ht_call24(void);
int ht_call25(void);
int ht_call26(void);
int ht_call27(void);
int ht_call28(void);
int ht_call29(void);
int ht_call30(void);
int ht_call31(void);
int ht_call32(void);
int ht_call33(void);
int ht_call34(void);
int ht_call35(void);
int ht_call36(void);
int ht_call37(void);
int ht_call38(void);
int ht_call39(void);
int ht_call40(void);
int ht_call41(void);
int ht_call42(void);
int ht_call43(void);
int ht_call44(void);
int ht_call45(void);
int ht_call46(void);
int ht_call47(void);
int ht_call48(void);
int ht_call49(void);
int ht_call50(void);

// ulib.c
int stat(char*, struct stat*);
char* strcpy(char*, char*);
void *memmove(void*, void*, int);
char* strchr(const char*, char c);
int strcmp(const char*, const char*);
void printf(int, char*, ...);
char* gets(char*, int max);
uint strlen(char*);
void* memset(void*, int, uint);
void* malloc(uint);
void free(void*);
int atoi(const char*);
