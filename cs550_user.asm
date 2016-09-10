
_cs550_user:     file format elf32-i386


Disassembly of section .text:

00000000 <test_date>:
#include "stat.h"
#include "user.h"
#include "date.h"


void test_date(){
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	57                   	push   %edi
       4:	56                   	push   %esi
       5:	53                   	push   %ebx
       6:	83 ec 1c             	sub    $0x1c,%esp
  struct rtcdate *r = malloc(sizeof(struct rtcdate));
       9:	83 ec 0c             	sub    $0xc,%esp
       c:	6a 18                	push   $0x18
       e:	e8 2c 10 00 00       	call   103f <malloc>
      13:	83 c4 10             	add    $0x10,%esp
      16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  date(r); 
      19:	83 ec 0c             	sub    $0xc,%esp
      1c:	ff 75 e4             	pushl  -0x1c(%ebp)
      1f:	e8 73 05 00 00       	call   597 <date>
      24:	83 c4 10             	add    $0x10,%esp
  printf(1,"After Calling date %d %d %d %d %d %d \n",r->second,r->minute,r->hour,r->day,r->month,r->year);
      27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      2a:	8b 78 14             	mov    0x14(%eax),%edi
      2d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      30:	8b 70 10             	mov    0x10(%eax),%esi
      33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      36:	8b 58 0c             	mov    0xc(%eax),%ebx
      39:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      3c:	8b 48 08             	mov    0x8(%eax),%ecx
      3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      42:	8b 50 04             	mov    0x4(%eax),%edx
      45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      48:	8b 00                	mov    (%eax),%eax
      4a:	57                   	push   %edi
      4b:	56                   	push   %esi
      4c:	53                   	push   %ebx
      4d:	51                   	push   %ecx
      4e:	52                   	push   %edx
      4f:	50                   	push   %eax
      50:	68 24 11 00 00       	push   $0x1124
      55:	6a 01                	push   $0x1
      57:	e8 10 0d 00 00       	call   d6c <printf>
      5c:	83 c4 20             	add    $0x20,%esp
}
      5f:	90                   	nop
      60:	8d 65 f4             	lea    -0xc(%ebp),%esp
      63:	5b                   	pop    %ebx
      64:	5e                   	pop    %esi
      65:	5f                   	pop    %edi
      66:	5d                   	pop    %ebp
      67:	c3                   	ret    

00000068 <test_getpid>:

void test_getpid(){
      68:	55                   	push   %ebp
      69:	89 e5                	mov    %esp,%ebp
      6b:	83 ec 18             	sub    $0x18,%esp
  int i = 0;
      6e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  
  uint start = 1000000000 * uptime(); 
      75:	e8 15 05 00 00       	call   58f <uptime>
      7a:	69 c0 00 ca 9a 3b    	imul   $0x3b9aca00,%eax,%eax
      80:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  for(i= 0;i< 100000; i++) {
      83:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      8a:	eb 09                	jmp    95 <test_getpid+0x2d>
        getpid();
      8c:	e8 e6 04 00 00       	call   577 <getpid>
void test_getpid(){
  int i = 0;
  
  uint start = 1000000000 * uptime(); 
  
  for(i= 0;i< 100000; i++) {
      91:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      95:	81 7d f4 9f 86 01 00 	cmpl   $0x1869f,-0xc(%ebp)
      9c:	7e ee                	jle    8c <test_getpid+0x24>
        getpid();
  }
  uint stop = 1000000000 * uptime();
      9e:	e8 ec 04 00 00       	call   58f <uptime>
      a3:	69 c0 00 ca 9a 3b    	imul   $0x3b9aca00,%eax,%eax
      a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  uint diff  =  (stop - start) / 100000;
      ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
      af:	2b 45 f0             	sub    -0x10(%ebp),%eax
      b2:	c1 e8 05             	shr    $0x5,%eax
      b5:	ba c5 5a 7c 0a       	mov    $0xa7c5ac5,%edx
      ba:	f7 e2                	mul    %edx
      bc:	89 d0                	mov    %edx,%eax
      be:	c1 e8 07             	shr    $0x7,%eax
      c1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  printf(1, " Time Calculated doing getpid %d\n", diff);
      c4:	83 ec 04             	sub    $0x4,%esp
      c7:	ff 75 e8             	pushl  -0x18(%ebp)
      ca:	68 4c 11 00 00       	push   $0x114c
      cf:	6a 01                	push   $0x1
      d1:	e8 96 0c 00 00       	call   d6c <printf>
      d6:	83 c4 10             	add    $0x10,%esp
}
      d9:	90                   	nop
      da:	c9                   	leave  
      db:	c3                   	ret    

000000dc <call01_ls>:

void call01_ls() {
      dc:	55                   	push   %ebp
      dd:	89 e5                	mov    %esp,%ebp
      df:	83 ec 18             	sub    $0x18,%esp
  int i = 0;
      e2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  i = ls_call1();
      e9:	e8 ba 04 00 00       	call   5a8 <ls_call1>
      ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1," Calling ls cal1 01 %d\n",i);
      f1:	83 ec 04             	sub    $0x4,%esp
      f4:	ff 75 f4             	pushl  -0xc(%ebp)
      f7:	68 6e 11 00 00       	push   $0x116e
      fc:	6a 01                	push   $0x1
      fe:	e8 69 0c 00 00       	call   d6c <printf>
     103:	83 c4 10             	add    $0x10,%esp
}
     106:	90                   	nop
     107:	c9                   	leave  
     108:	c3                   	ret    

00000109 <call50_ls>:

void call50_ls() {
     109:	55                   	push   %ebp
     10a:	89 e5                	mov    %esp,%ebp
     10c:	83 ec 18             	sub    $0x18,%esp
  int i = 0;
     10f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  i = ls_call50();
     116:	e8 f7 07 00 00       	call   912 <ls_call50>
     11b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1," Calling ls cal1 05 %d\n",i);
     11e:	83 ec 04             	sub    $0x4,%esp
     121:	ff 75 f4             	pushl  -0xc(%ebp)
     124:	68 86 11 00 00       	push   $0x1186
     129:	6a 01                	push   $0x1
     12b:	e8 3c 0c 00 00       	call   d6c <printf>
     130:	83 c4 10             	add    $0x10,%esp
}
     133:	90                   	nop
     134:	c9                   	leave  
     135:	c3                   	ret    

00000136 <ls_linear_time>:

void ls_linear_time() {
     136:	55                   	push   %ebp
     137:	89 e5                	mov    %esp,%ebp
     139:	83 ec 18             	sub    $0x18,%esp
  int i = 0;
     13c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  
  uint start = 1000000000 * uptime(); 
     143:	e8 47 04 00 00       	call   58f <uptime>
     148:	69 c0 00 ca 9a 3b    	imul   $0x3b9aca00,%eax,%eax
     14e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  for(i= 0;i< 100000; i++) {
     151:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     158:	eb 09                	jmp    163 <ls_linear_time+0x2d>
        ls_call22();
     15a:	e8 bb 05 00 00       	call   71a <ls_call22>
void ls_linear_time() {
  int i = 0;
  
  uint start = 1000000000 * uptime(); 
  
  for(i= 0;i< 100000; i++) {
     15f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     163:	81 7d f4 9f 86 01 00 	cmpl   $0x1869f,-0xc(%ebp)
     16a:	7e ee                	jle    15a <ls_linear_time+0x24>
        ls_call22();
  }
  uint stop = 1000000000 * uptime();
     16c:	e8 1e 04 00 00       	call   58f <uptime>
     171:	69 c0 00 ca 9a 3b    	imul   $0x3b9aca00,%eax,%eax
     177:	89 45 ec             	mov    %eax,-0x14(%ebp)
  uint diff  =  (stop - start) / 100000;
     17a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     17d:	2b 45 f0             	sub    -0x10(%ebp),%eax
     180:	c1 e8 05             	shr    $0x5,%eax
     183:	ba c5 5a 7c 0a       	mov    $0xa7c5ac5,%edx
     188:	f7 e2                	mul    %edx
     18a:	89 d0                	mov    %edx,%eax
     18c:	c1 e8 07             	shr    $0x7,%eax
     18f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  printf(1, " Time Calculated doing linear %d\n", diff);
     192:	83 ec 04             	sub    $0x4,%esp
     195:	ff 75 e8             	pushl  -0x18(%ebp)
     198:	68 a0 11 00 00       	push   $0x11a0
     19d:	6a 01                	push   $0x1
     19f:	e8 c8 0b 00 00       	call   d6c <printf>
     1a4:	83 c4 10             	add    $0x10,%esp
}
     1a7:	90                   	nop
     1a8:	c9                   	leave  
     1a9:	c3                   	ret    

000001aa <ls_call03>:

void ls_call03() {
     1aa:	55                   	push   %ebp
     1ab:	89 e5                	mov    %esp,%ebp
     1ad:	83 ec 18             	sub    $0x18,%esp
  int i = 0;
     1b0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  i = ls_call3();
     1b7:	e8 0e 04 00 00       	call   5ca <ls_call3>
     1bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1," Calling ls cal1 03 %d\n",i);
     1bf:	83 ec 04             	sub    $0x4,%esp
     1c2:	ff 75 f4             	pushl  -0xc(%ebp)
     1c5:	68 c2 11 00 00       	push   $0x11c2
     1ca:	6a 01                	push   $0x1
     1cc:	e8 9b 0b 00 00       	call   d6c <printf>
     1d1:	83 c4 10             	add    $0x10,%esp
}
     1d4:	90                   	nop
     1d5:	c9                   	leave  
     1d6:	c3                   	ret    

000001d7 <ls_call04>:


void ls_call04() {
     1d7:	55                   	push   %ebp
     1d8:	89 e5                	mov    %esp,%ebp
     1da:	83 ec 18             	sub    $0x18,%esp
  int i = 0;
     1dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  i = ls_call4();
     1e4:	e8 f2 03 00 00       	call   5db <ls_call4>
     1e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1," Calling ls cal1 04 %d\n",i);
     1ec:	83 ec 04             	sub    $0x4,%esp
     1ef:	ff 75 f4             	pushl  -0xc(%ebp)
     1f2:	68 da 11 00 00       	push   $0x11da
     1f7:	6a 01                	push   $0x1
     1f9:	e8 6e 0b 00 00       	call   d6c <printf>
     1fe:	83 c4 10             	add    $0x10,%esp
}
     201:	90                   	nop
     202:	c9                   	leave  
     203:	c3                   	ret    

00000204 <call01_ht>:


void call01_ht() {
     204:	55                   	push   %ebp
     205:	89 e5                	mov    %esp,%ebp
     207:	83 ec 18             	sub    $0x18,%esp
  int i = 0;
     20a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  i = ht_call1();
     211:	e8 0d 07 00 00       	call   923 <ht_call1>
     216:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1," Calling ht 01 %d\n",i);
     219:	83 ec 04             	sub    $0x4,%esp
     21c:	ff 75 f4             	pushl  -0xc(%ebp)
     21f:	68 f2 11 00 00       	push   $0x11f2
     224:	6a 01                	push   $0x1
     226:	e8 41 0b 00 00       	call   d6c <printf>
     22b:	83 c4 10             	add    $0x10,%esp
}
     22e:	90                   	nop
     22f:	c9                   	leave  
     230:	c3                   	ret    

00000231 <call50_ht>:

void call50_ht() {
     231:	55                   	push   %ebp
     232:	89 e5                	mov    %esp,%ebp
     234:	83 ec 18             	sub    $0x18,%esp
  int i = 0;
     237:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  i = ht_call50();
     23e:	e8 4a 0a 00 00       	call   c8d <ht_call50>
     243:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1," Calling ht 50 5%d\n",i);
     246:	83 ec 04             	sub    $0x4,%esp
     249:	ff 75 f4             	pushl  -0xc(%ebp)
     24c:	68 05 12 00 00       	push   $0x1205
     251:	6a 01                	push   $0x1
     253:	e8 14 0b 00 00       	call   d6c <printf>
     258:	83 c4 10             	add    $0x10,%esp
}
     25b:	90                   	nop
     25c:	c9                   	leave  
     25d:	c3                   	ret    

0000025e <main>:
int
main(int argc, char *argv[])
{
     25e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     262:	83 e4 f0             	and    $0xfffffff0,%esp
     265:	ff 71 fc             	pushl  -0x4(%ecx)
     268:	55                   	push   %ebp
     269:	89 e5                	mov    %esp,%ebp
     26b:	51                   	push   %ecx
     26c:	83 ec 04             	sub    $0x4,%esp
  test_date();
     26f:	e8 8c fd ff ff       	call   0 <test_date>
  test_getpid();
     274:	e8 ef fd ff ff       	call   68 <test_getpid>
  call01_ls();
     279:	e8 5e fe ff ff       	call   dc <call01_ls>
  call50_ls();
     27e:	e8 86 fe ff ff       	call   109 <call50_ls>
  ls_linear_time();
     283:	e8 ae fe ff ff       	call   136 <ls_linear_time>
  call01_ht();
     288:	e8 77 ff ff ff       	call   204 <call01_ht>
  call50_ht();
     28d:	e8 9f ff ff ff       	call   231 <call50_ht>
  return 0;
     292:	b8 00 00 00 00       	mov    $0x0,%eax
}
     297:	83 c4 04             	add    $0x4,%esp
     29a:	59                   	pop    %ecx
     29b:	5d                   	pop    %ebp
     29c:	8d 61 fc             	lea    -0x4(%ecx),%esp
     29f:	c3                   	ret    

000002a0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     2a0:	55                   	push   %ebp
     2a1:	89 e5                	mov    %esp,%ebp
     2a3:	57                   	push   %edi
     2a4:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     2a5:	8b 4d 08             	mov    0x8(%ebp),%ecx
     2a8:	8b 55 10             	mov    0x10(%ebp),%edx
     2ab:	8b 45 0c             	mov    0xc(%ebp),%eax
     2ae:	89 cb                	mov    %ecx,%ebx
     2b0:	89 df                	mov    %ebx,%edi
     2b2:	89 d1                	mov    %edx,%ecx
     2b4:	fc                   	cld    
     2b5:	f3 aa                	rep stos %al,%es:(%edi)
     2b7:	89 ca                	mov    %ecx,%edx
     2b9:	89 fb                	mov    %edi,%ebx
     2bb:	89 5d 08             	mov    %ebx,0x8(%ebp)
     2be:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     2c1:	90                   	nop
     2c2:	5b                   	pop    %ebx
     2c3:	5f                   	pop    %edi
     2c4:	5d                   	pop    %ebp
     2c5:	c3                   	ret    

000002c6 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     2c6:	55                   	push   %ebp
     2c7:	89 e5                	mov    %esp,%ebp
     2c9:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     2cc:	8b 45 08             	mov    0x8(%ebp),%eax
     2cf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     2d2:	90                   	nop
     2d3:	8b 45 08             	mov    0x8(%ebp),%eax
     2d6:	8d 50 01             	lea    0x1(%eax),%edx
     2d9:	89 55 08             	mov    %edx,0x8(%ebp)
     2dc:	8b 55 0c             	mov    0xc(%ebp),%edx
     2df:	8d 4a 01             	lea    0x1(%edx),%ecx
     2e2:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     2e5:	0f b6 12             	movzbl (%edx),%edx
     2e8:	88 10                	mov    %dl,(%eax)
     2ea:	0f b6 00             	movzbl (%eax),%eax
     2ed:	84 c0                	test   %al,%al
     2ef:	75 e2                	jne    2d3 <strcpy+0xd>
    ;
  return os;
     2f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     2f4:	c9                   	leave  
     2f5:	c3                   	ret    

000002f6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     2f6:	55                   	push   %ebp
     2f7:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     2f9:	eb 08                	jmp    303 <strcmp+0xd>
    p++, q++;
     2fb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     2ff:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     303:	8b 45 08             	mov    0x8(%ebp),%eax
     306:	0f b6 00             	movzbl (%eax),%eax
     309:	84 c0                	test   %al,%al
     30b:	74 10                	je     31d <strcmp+0x27>
     30d:	8b 45 08             	mov    0x8(%ebp),%eax
     310:	0f b6 10             	movzbl (%eax),%edx
     313:	8b 45 0c             	mov    0xc(%ebp),%eax
     316:	0f b6 00             	movzbl (%eax),%eax
     319:	38 c2                	cmp    %al,%dl
     31b:	74 de                	je     2fb <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     31d:	8b 45 08             	mov    0x8(%ebp),%eax
     320:	0f b6 00             	movzbl (%eax),%eax
     323:	0f b6 d0             	movzbl %al,%edx
     326:	8b 45 0c             	mov    0xc(%ebp),%eax
     329:	0f b6 00             	movzbl (%eax),%eax
     32c:	0f b6 c0             	movzbl %al,%eax
     32f:	29 c2                	sub    %eax,%edx
     331:	89 d0                	mov    %edx,%eax
}
     333:	5d                   	pop    %ebp
     334:	c3                   	ret    

00000335 <strlen>:

uint
strlen(char *s)
{
     335:	55                   	push   %ebp
     336:	89 e5                	mov    %esp,%ebp
     338:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     33b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     342:	eb 04                	jmp    348 <strlen+0x13>
     344:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     348:	8b 55 fc             	mov    -0x4(%ebp),%edx
     34b:	8b 45 08             	mov    0x8(%ebp),%eax
     34e:	01 d0                	add    %edx,%eax
     350:	0f b6 00             	movzbl (%eax),%eax
     353:	84 c0                	test   %al,%al
     355:	75 ed                	jne    344 <strlen+0xf>
    ;
  return n;
     357:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     35a:	c9                   	leave  
     35b:	c3                   	ret    

0000035c <memset>:

void*
memset(void *dst, int c, uint n)
{
     35c:	55                   	push   %ebp
     35d:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     35f:	8b 45 10             	mov    0x10(%ebp),%eax
     362:	50                   	push   %eax
     363:	ff 75 0c             	pushl  0xc(%ebp)
     366:	ff 75 08             	pushl  0x8(%ebp)
     369:	e8 32 ff ff ff       	call   2a0 <stosb>
     36e:	83 c4 0c             	add    $0xc,%esp
  return dst;
     371:	8b 45 08             	mov    0x8(%ebp),%eax
}
     374:	c9                   	leave  
     375:	c3                   	ret    

00000376 <strchr>:

char*
strchr(const char *s, char c)
{
     376:	55                   	push   %ebp
     377:	89 e5                	mov    %esp,%ebp
     379:	83 ec 04             	sub    $0x4,%esp
     37c:	8b 45 0c             	mov    0xc(%ebp),%eax
     37f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     382:	eb 14                	jmp    398 <strchr+0x22>
    if(*s == c)
     384:	8b 45 08             	mov    0x8(%ebp),%eax
     387:	0f b6 00             	movzbl (%eax),%eax
     38a:	3a 45 fc             	cmp    -0x4(%ebp),%al
     38d:	75 05                	jne    394 <strchr+0x1e>
      return (char*)s;
     38f:	8b 45 08             	mov    0x8(%ebp),%eax
     392:	eb 13                	jmp    3a7 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     394:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     398:	8b 45 08             	mov    0x8(%ebp),%eax
     39b:	0f b6 00             	movzbl (%eax),%eax
     39e:	84 c0                	test   %al,%al
     3a0:	75 e2                	jne    384 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     3a2:	b8 00 00 00 00       	mov    $0x0,%eax
}
     3a7:	c9                   	leave  
     3a8:	c3                   	ret    

000003a9 <gets>:

char*
gets(char *buf, int max)
{
     3a9:	55                   	push   %ebp
     3aa:	89 e5                	mov    %esp,%ebp
     3ac:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     3af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     3b6:	eb 42                	jmp    3fa <gets+0x51>
    cc = read(0, &c, 1);
     3b8:	83 ec 04             	sub    $0x4,%esp
     3bb:	6a 01                	push   $0x1
     3bd:	8d 45 ef             	lea    -0x11(%ebp),%eax
     3c0:	50                   	push   %eax
     3c1:	6a 00                	push   $0x0
     3c3:	e8 47 01 00 00       	call   50f <read>
     3c8:	83 c4 10             	add    $0x10,%esp
     3cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     3ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     3d2:	7e 33                	jle    407 <gets+0x5e>
      break;
    buf[i++] = c;
     3d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3d7:	8d 50 01             	lea    0x1(%eax),%edx
     3da:	89 55 f4             	mov    %edx,-0xc(%ebp)
     3dd:	89 c2                	mov    %eax,%edx
     3df:	8b 45 08             	mov    0x8(%ebp),%eax
     3e2:	01 c2                	add    %eax,%edx
     3e4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     3e8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     3ea:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     3ee:	3c 0a                	cmp    $0xa,%al
     3f0:	74 16                	je     408 <gets+0x5f>
     3f2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     3f6:	3c 0d                	cmp    $0xd,%al
     3f8:	74 0e                	je     408 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     3fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3fd:	83 c0 01             	add    $0x1,%eax
     400:	3b 45 0c             	cmp    0xc(%ebp),%eax
     403:	7c b3                	jl     3b8 <gets+0xf>
     405:	eb 01                	jmp    408 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     407:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     408:	8b 55 f4             	mov    -0xc(%ebp),%edx
     40b:	8b 45 08             	mov    0x8(%ebp),%eax
     40e:	01 d0                	add    %edx,%eax
     410:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     413:	8b 45 08             	mov    0x8(%ebp),%eax
}
     416:	c9                   	leave  
     417:	c3                   	ret    

00000418 <stat>:

int
stat(char *n, struct stat *st)
{
     418:	55                   	push   %ebp
     419:	89 e5                	mov    %esp,%ebp
     41b:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     41e:	83 ec 08             	sub    $0x8,%esp
     421:	6a 00                	push   $0x0
     423:	ff 75 08             	pushl  0x8(%ebp)
     426:	e8 0c 01 00 00       	call   537 <open>
     42b:	83 c4 10             	add    $0x10,%esp
     42e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     431:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     435:	79 07                	jns    43e <stat+0x26>
    return -1;
     437:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     43c:	eb 25                	jmp    463 <stat+0x4b>
  r = fstat(fd, st);
     43e:	83 ec 08             	sub    $0x8,%esp
     441:	ff 75 0c             	pushl  0xc(%ebp)
     444:	ff 75 f4             	pushl  -0xc(%ebp)
     447:	e8 03 01 00 00       	call   54f <fstat>
     44c:	83 c4 10             	add    $0x10,%esp
     44f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     452:	83 ec 0c             	sub    $0xc,%esp
     455:	ff 75 f4             	pushl  -0xc(%ebp)
     458:	e8 c2 00 00 00       	call   51f <close>
     45d:	83 c4 10             	add    $0x10,%esp
  return r;
     460:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     463:	c9                   	leave  
     464:	c3                   	ret    

00000465 <atoi>:

int
atoi(const char *s)
{
     465:	55                   	push   %ebp
     466:	89 e5                	mov    %esp,%ebp
     468:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     46b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     472:	eb 25                	jmp    499 <atoi+0x34>
    n = n*10 + *s++ - '0';
     474:	8b 55 fc             	mov    -0x4(%ebp),%edx
     477:	89 d0                	mov    %edx,%eax
     479:	c1 e0 02             	shl    $0x2,%eax
     47c:	01 d0                	add    %edx,%eax
     47e:	01 c0                	add    %eax,%eax
     480:	89 c1                	mov    %eax,%ecx
     482:	8b 45 08             	mov    0x8(%ebp),%eax
     485:	8d 50 01             	lea    0x1(%eax),%edx
     488:	89 55 08             	mov    %edx,0x8(%ebp)
     48b:	0f b6 00             	movzbl (%eax),%eax
     48e:	0f be c0             	movsbl %al,%eax
     491:	01 c8                	add    %ecx,%eax
     493:	83 e8 30             	sub    $0x30,%eax
     496:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     499:	8b 45 08             	mov    0x8(%ebp),%eax
     49c:	0f b6 00             	movzbl (%eax),%eax
     49f:	3c 2f                	cmp    $0x2f,%al
     4a1:	7e 0a                	jle    4ad <atoi+0x48>
     4a3:	8b 45 08             	mov    0x8(%ebp),%eax
     4a6:	0f b6 00             	movzbl (%eax),%eax
     4a9:	3c 39                	cmp    $0x39,%al
     4ab:	7e c7                	jle    474 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     4ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     4b0:	c9                   	leave  
     4b1:	c3                   	ret    

000004b2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     4b2:	55                   	push   %ebp
     4b3:	89 e5                	mov    %esp,%ebp
     4b5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     4b8:	8b 45 08             	mov    0x8(%ebp),%eax
     4bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     4be:	8b 45 0c             	mov    0xc(%ebp),%eax
     4c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     4c4:	eb 17                	jmp    4dd <memmove+0x2b>
    *dst++ = *src++;
     4c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
     4c9:	8d 50 01             	lea    0x1(%eax),%edx
     4cc:	89 55 fc             	mov    %edx,-0x4(%ebp)
     4cf:	8b 55 f8             	mov    -0x8(%ebp),%edx
     4d2:	8d 4a 01             	lea    0x1(%edx),%ecx
     4d5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     4d8:	0f b6 12             	movzbl (%edx),%edx
     4db:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     4dd:	8b 45 10             	mov    0x10(%ebp),%eax
     4e0:	8d 50 ff             	lea    -0x1(%eax),%edx
     4e3:	89 55 10             	mov    %edx,0x10(%ebp)
     4e6:	85 c0                	test   %eax,%eax
     4e8:	7f dc                	jg     4c6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     4ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
     4ed:	c9                   	leave  
     4ee:	c3                   	ret    

000004ef <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
     4ef:	b8 01 00 00 00       	mov    $0x1,%eax
     4f4:	cd 40                	int    $0x40
     4f6:	c3                   	ret    

000004f7 <exit>:
SYSCALL(exit)
     4f7:	b8 02 00 00 00       	mov    $0x2,%eax
     4fc:	cd 40                	int    $0x40
     4fe:	c3                   	ret    

000004ff <wait>:
SYSCALL(wait)
     4ff:	b8 03 00 00 00       	mov    $0x3,%eax
     504:	cd 40                	int    $0x40
     506:	c3                   	ret    

00000507 <pipe>:
SYSCALL(pipe)
     507:	b8 04 00 00 00       	mov    $0x4,%eax
     50c:	cd 40                	int    $0x40
     50e:	c3                   	ret    

0000050f <read>:
SYSCALL(read)
     50f:	b8 05 00 00 00       	mov    $0x5,%eax
     514:	cd 40                	int    $0x40
     516:	c3                   	ret    

00000517 <write>:
SYSCALL(write)
     517:	b8 10 00 00 00       	mov    $0x10,%eax
     51c:	cd 40                	int    $0x40
     51e:	c3                   	ret    

0000051f <close>:
SYSCALL(close)
     51f:	b8 15 00 00 00       	mov    $0x15,%eax
     524:	cd 40                	int    $0x40
     526:	c3                   	ret    

00000527 <kill>:
SYSCALL(kill)
     527:	b8 06 00 00 00       	mov    $0x6,%eax
     52c:	cd 40                	int    $0x40
     52e:	c3                   	ret    

0000052f <exec>:
SYSCALL(exec)
     52f:	b8 07 00 00 00       	mov    $0x7,%eax
     534:	cd 40                	int    $0x40
     536:	c3                   	ret    

00000537 <open>:
SYSCALL(open)
     537:	b8 0f 00 00 00       	mov    $0xf,%eax
     53c:	cd 40                	int    $0x40
     53e:	c3                   	ret    

0000053f <mknod>:
SYSCALL(mknod)
     53f:	b8 11 00 00 00       	mov    $0x11,%eax
     544:	cd 40                	int    $0x40
     546:	c3                   	ret    

00000547 <unlink>:
SYSCALL(unlink)
     547:	b8 12 00 00 00       	mov    $0x12,%eax
     54c:	cd 40                	int    $0x40
     54e:	c3                   	ret    

0000054f <fstat>:
SYSCALL(fstat)
     54f:	b8 08 00 00 00       	mov    $0x8,%eax
     554:	cd 40                	int    $0x40
     556:	c3                   	ret    

00000557 <link>:
SYSCALL(link)
     557:	b8 13 00 00 00       	mov    $0x13,%eax
     55c:	cd 40                	int    $0x40
     55e:	c3                   	ret    

0000055f <mkdir>:
SYSCALL(mkdir)
     55f:	b8 14 00 00 00       	mov    $0x14,%eax
     564:	cd 40                	int    $0x40
     566:	c3                   	ret    

00000567 <chdir>:
SYSCALL(chdir)
     567:	b8 09 00 00 00       	mov    $0x9,%eax
     56c:	cd 40                	int    $0x40
     56e:	c3                   	ret    

0000056f <dup>:
SYSCALL(dup)
     56f:	b8 0a 00 00 00       	mov    $0xa,%eax
     574:	cd 40                	int    $0x40
     576:	c3                   	ret    

00000577 <getpid>:
SYSCALL(getpid)
     577:	b8 0b 00 00 00       	mov    $0xb,%eax
     57c:	cd 40                	int    $0x40
     57e:	c3                   	ret    

0000057f <sbrk>:
SYSCALL(sbrk)
     57f:	b8 0c 00 00 00       	mov    $0xc,%eax
     584:	cd 40                	int    $0x40
     586:	c3                   	ret    

00000587 <sleep>:
SYSCALL(sleep)
     587:	b8 0d 00 00 00       	mov    $0xd,%eax
     58c:	cd 40                	int    $0x40
     58e:	c3                   	ret    

0000058f <uptime>:
SYSCALL(uptime)
     58f:	b8 0e 00 00 00       	mov    $0xe,%eax
     594:	cd 40                	int    $0x40
     596:	c3                   	ret    

00000597 <date>:

// Assignment starts here

SYSCALL(date)
     597:	b8 16 00 00 00       	mov    $0x16,%eax
     59c:	cd 40                	int    $0x40
     59e:	c3                   	ret    

0000059f <str_ls_call1>:
     59f:	6c                   	insb   (%dx),%es:(%edi)
     5a0:	73 5f                	jae    601 <ls_call6+0x4>
     5a2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5a5:	6c                   	insb   (%dx),%es:(%edi)
     5a6:	31 00                	xor    %eax,(%eax)

000005a8 <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
     5a8:	b8 9f 05 00 00       	mov    $0x59f,%eax
     5ad:	cd 41                	int    $0x41
     5af:	c3                   	ret    

000005b0 <str_ls_call2>:
     5b0:	6c                   	insb   (%dx),%es:(%edi)
     5b1:	73 5f                	jae    612 <ls_call7+0x4>
     5b3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5b6:	6c                   	insb   (%dx),%es:(%edi)
     5b7:	32 00                	xor    (%eax),%al

000005b9 <ls_call2>:
CS550LSSYSCALL(ls_call2)
     5b9:	b8 b0 05 00 00       	mov    $0x5b0,%eax
     5be:	cd 41                	int    $0x41
     5c0:	c3                   	ret    

000005c1 <str_ls_call3>:
     5c1:	6c                   	insb   (%dx),%es:(%edi)
     5c2:	73 5f                	jae    623 <ls_call8+0x4>
     5c4:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5c7:	6c                   	insb   (%dx),%es:(%edi)
     5c8:	33 00                	xor    (%eax),%eax

000005ca <ls_call3>:
CS550LSSYSCALL(ls_call3)
     5ca:	b8 c1 05 00 00       	mov    $0x5c1,%eax
     5cf:	cd 41                	int    $0x41
     5d1:	c3                   	ret    

000005d2 <str_ls_call4>:
     5d2:	6c                   	insb   (%dx),%es:(%edi)
     5d3:	73 5f                	jae    634 <ls_call9+0x4>
     5d5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5d8:	6c                   	insb   (%dx),%es:(%edi)
     5d9:	34 00                	xor    $0x0,%al

000005db <ls_call4>:
CS550LSSYSCALL(ls_call4)
     5db:	b8 d2 05 00 00       	mov    $0x5d2,%eax
     5e0:	cd 41                	int    $0x41
     5e2:	c3                   	ret    

000005e3 <str_ls_call5>:
     5e3:	6c                   	insb   (%dx),%es:(%edi)
     5e4:	73 5f                	jae    645 <ls_call10+0x3>
     5e6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5e9:	6c                   	insb   (%dx),%es:(%edi)
     5ea:	35                   	.byte 0x35
	...

000005ec <ls_call5>:
CS550LSSYSCALL(ls_call5)
     5ec:	b8 e3 05 00 00       	mov    $0x5e3,%eax
     5f1:	cd 41                	int    $0x41
     5f3:	c3                   	ret    

000005f4 <str_ls_call6>:
     5f4:	6c                   	insb   (%dx),%es:(%edi)
     5f5:	73 5f                	jae    656 <ls_call11+0x2>
     5f7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5fa:	6c                   	insb   (%dx),%es:(%edi)
     5fb:	36                   	ss
	...

000005fd <ls_call6>:
CS550LSSYSCALL(ls_call6)
     5fd:	b8 f4 05 00 00       	mov    $0x5f4,%eax
     602:	cd 41                	int    $0x41
     604:	c3                   	ret    

00000605 <str_ls_call7>:
     605:	6c                   	insb   (%dx),%es:(%edi)
     606:	73 5f                	jae    667 <ls_call12+0x1>
     608:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     60b:	6c                   	insb   (%dx),%es:(%edi)
     60c:	37                   	aaa    
	...

0000060e <ls_call7>:
CS550LSSYSCALL(ls_call7)
     60e:	b8 05 06 00 00       	mov    $0x605,%eax
     613:	cd 41                	int    $0x41
     615:	c3                   	ret    

00000616 <str_ls_call8>:
     616:	6c                   	insb   (%dx),%es:(%edi)
     617:	73 5f                	jae    678 <ls_call13>
     619:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     61c:	6c                   	insb   (%dx),%es:(%edi)
     61d:	38 00                	cmp    %al,(%eax)

0000061f <ls_call8>:
CS550LSSYSCALL(ls_call8)
     61f:	b8 16 06 00 00       	mov    $0x616,%eax
     624:	cd 41                	int    $0x41
     626:	c3                   	ret    

00000627 <str_ls_call9>:
     627:	6c                   	insb   (%dx),%es:(%edi)
     628:	73 5f                	jae    689 <str_ls_call14+0x9>
     62a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     62d:	6c                   	insb   (%dx),%es:(%edi)
     62e:	39 00                	cmp    %eax,(%eax)

00000630 <ls_call9>:
CS550LSSYSCALL(ls_call9)
     630:	b8 27 06 00 00       	mov    $0x627,%eax
     635:	cd 41                	int    $0x41
     637:	c3                   	ret    

00000638 <str_ls_call10>:
     638:	6c                   	insb   (%dx),%es:(%edi)
     639:	73 5f                	jae    69a <str_ls_call15+0x8>
     63b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     63e:	6c                   	insb   (%dx),%es:(%edi)
     63f:	31 30                	xor    %esi,(%eax)
	...

00000642 <ls_call10>:
CS550LSSYSCALL(ls_call10)
     642:	b8 38 06 00 00       	mov    $0x638,%eax
     647:	cd 41                	int    $0x41
     649:	c3                   	ret    

0000064a <str_ls_call11>:
     64a:	6c                   	insb   (%dx),%es:(%edi)
     64b:	73 5f                	jae    6ac <str_ls_call16+0x8>
     64d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     650:	6c                   	insb   (%dx),%es:(%edi)
     651:	31 31                	xor    %esi,(%ecx)
	...

00000654 <ls_call11>:
CS550LSSYSCALL(ls_call11)
     654:	b8 4a 06 00 00       	mov    $0x64a,%eax
     659:	cd 41                	int    $0x41
     65b:	c3                   	ret    

0000065c <str_ls_call12>:
     65c:	6c                   	insb   (%dx),%es:(%edi)
     65d:	73 5f                	jae    6be <str_ls_call17+0x8>
     65f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     662:	6c                   	insb   (%dx),%es:(%edi)
     663:	31 32                	xor    %esi,(%edx)
	...

00000666 <ls_call12>:
CS550LSSYSCALL(ls_call12)
     666:	b8 5c 06 00 00       	mov    $0x65c,%eax
     66b:	cd 41                	int    $0x41
     66d:	c3                   	ret    

0000066e <str_ls_call13>:
     66e:	6c                   	insb   (%dx),%es:(%edi)
     66f:	73 5f                	jae    6d0 <str_ls_call18+0x8>
     671:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     674:	6c                   	insb   (%dx),%es:(%edi)
     675:	31 33                	xor    %esi,(%ebx)
	...

00000678 <ls_call13>:
CS550LSSYSCALL(ls_call13)
     678:	b8 6e 06 00 00       	mov    $0x66e,%eax
     67d:	cd 41                	int    $0x41
     67f:	c3                   	ret    

00000680 <str_ls_call14>:
     680:	6c                   	insb   (%dx),%es:(%edi)
     681:	73 5f                	jae    6e2 <str_ls_call19+0x8>
     683:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     686:	6c                   	insb   (%dx),%es:(%edi)
     687:	31 34 00             	xor    %esi,(%eax,%eax,1)

0000068a <ls_call14>:
CS550LSSYSCALL(ls_call14)
     68a:	b8 80 06 00 00       	mov    $0x680,%eax
     68f:	cd 41                	int    $0x41
     691:	c3                   	ret    

00000692 <str_ls_call15>:
     692:	6c                   	insb   (%dx),%es:(%edi)
     693:	73 5f                	jae    6f4 <str_ls_call20+0x8>
     695:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     698:	6c                   	insb   (%dx),%es:(%edi)
     699:	31                   	.byte 0x31
     69a:	35                   	.byte 0x35
	...

0000069c <ls_call15>:
CS550LSSYSCALL(ls_call15)
     69c:	b8 92 06 00 00       	mov    $0x692,%eax
     6a1:	cd 41                	int    $0x41
     6a3:	c3                   	ret    

000006a4 <str_ls_call16>:
     6a4:	6c                   	insb   (%dx),%es:(%edi)
     6a5:	73 5f                	jae    706 <str_ls_call21+0x8>
     6a7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6aa:	6c                   	insb   (%dx),%es:(%edi)
     6ab:	31 36                	xor    %esi,(%esi)
	...

000006ae <ls_call16>:
CS550LSSYSCALL(ls_call16)
     6ae:	b8 a4 06 00 00       	mov    $0x6a4,%eax
     6b3:	cd 41                	int    $0x41
     6b5:	c3                   	ret    

000006b6 <str_ls_call17>:
     6b6:	6c                   	insb   (%dx),%es:(%edi)
     6b7:	73 5f                	jae    718 <str_ls_call22+0x8>
     6b9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6bc:	6c                   	insb   (%dx),%es:(%edi)
     6bd:	31 37                	xor    %esi,(%edi)
	...

000006c0 <ls_call17>:
CS550LSSYSCALL(ls_call17)
     6c0:	b8 b6 06 00 00       	mov    $0x6b6,%eax
     6c5:	cd 41                	int    $0x41
     6c7:	c3                   	ret    

000006c8 <str_ls_call18>:
     6c8:	6c                   	insb   (%dx),%es:(%edi)
     6c9:	73 5f                	jae    72a <str_ls_call23+0x8>
     6cb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6ce:	6c                   	insb   (%dx),%es:(%edi)
     6cf:	31 38                	xor    %edi,(%eax)
	...

000006d2 <ls_call18>:
CS550LSSYSCALL(ls_call18)
     6d2:	b8 c8 06 00 00       	mov    $0x6c8,%eax
     6d7:	cd 41                	int    $0x41
     6d9:	c3                   	ret    

000006da <str_ls_call19>:
     6da:	6c                   	insb   (%dx),%es:(%edi)
     6db:	73 5f                	jae    73c <str_ls_call24+0x8>
     6dd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6e0:	6c                   	insb   (%dx),%es:(%edi)
     6e1:	31 39                	xor    %edi,(%ecx)
	...

000006e4 <ls_call19>:
CS550LSSYSCALL(ls_call19)
     6e4:	b8 da 06 00 00       	mov    $0x6da,%eax
     6e9:	cd 41                	int    $0x41
     6eb:	c3                   	ret    

000006ec <str_ls_call20>:
     6ec:	6c                   	insb   (%dx),%es:(%edi)
     6ed:	73 5f                	jae    74e <str_ls_call25+0x8>
     6ef:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6f2:	6c                   	insb   (%dx),%es:(%edi)
     6f3:	32 30                	xor    (%eax),%dh
	...

000006f6 <ls_call20>:
CS550LSSYSCALL(ls_call20)
     6f6:	b8 ec 06 00 00       	mov    $0x6ec,%eax
     6fb:	cd 41                	int    $0x41
     6fd:	c3                   	ret    

000006fe <str_ls_call21>:
     6fe:	6c                   	insb   (%dx),%es:(%edi)
     6ff:	73 5f                	jae    760 <str_ls_call26+0x8>
     701:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     704:	6c                   	insb   (%dx),%es:(%edi)
     705:	32 31                	xor    (%ecx),%dh
	...

00000708 <ls_call21>:
CS550LSSYSCALL(ls_call21)
     708:	b8 fe 06 00 00       	mov    $0x6fe,%eax
     70d:	cd 41                	int    $0x41
     70f:	c3                   	ret    

00000710 <str_ls_call22>:
     710:	6c                   	insb   (%dx),%es:(%edi)
     711:	73 5f                	jae    772 <str_ls_call27+0x8>
     713:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     716:	6c                   	insb   (%dx),%es:(%edi)
     717:	32 32                	xor    (%edx),%dh
	...

0000071a <ls_call22>:
CS550LSSYSCALL(ls_call22)
     71a:	b8 10 07 00 00       	mov    $0x710,%eax
     71f:	cd 41                	int    $0x41
     721:	c3                   	ret    

00000722 <str_ls_call23>:
     722:	6c                   	insb   (%dx),%es:(%edi)
     723:	73 5f                	jae    784 <str_ls_call28+0x8>
     725:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     728:	6c                   	insb   (%dx),%es:(%edi)
     729:	32 33                	xor    (%ebx),%dh
	...

0000072c <ls_call23>:
CS550LSSYSCALL(ls_call23)
     72c:	b8 22 07 00 00       	mov    $0x722,%eax
     731:	cd 41                	int    $0x41
     733:	c3                   	ret    

00000734 <str_ls_call24>:
     734:	6c                   	insb   (%dx),%es:(%edi)
     735:	73 5f                	jae    796 <str_ls_call29+0x8>
     737:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     73a:	6c                   	insb   (%dx),%es:(%edi)
     73b:	32 34 00             	xor    (%eax,%eax,1),%dh

0000073e <ls_call24>:
CS550LSSYSCALL(ls_call24)
     73e:	b8 34 07 00 00       	mov    $0x734,%eax
     743:	cd 41                	int    $0x41
     745:	c3                   	ret    

00000746 <str_ls_call25>:
     746:	6c                   	insb   (%dx),%es:(%edi)
     747:	73 5f                	jae    7a8 <str_ls_call30+0x8>
     749:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     74c:	6c                   	insb   (%dx),%es:(%edi)
     74d:	32                   	.byte 0x32
     74e:	35                   	.byte 0x35
	...

00000750 <ls_call25>:
CS550LSSYSCALL(ls_call25)
     750:	b8 46 07 00 00       	mov    $0x746,%eax
     755:	cd 41                	int    $0x41
     757:	c3                   	ret    

00000758 <str_ls_call26>:
     758:	6c                   	insb   (%dx),%es:(%edi)
     759:	73 5f                	jae    7ba <str_ls_call31+0x8>
     75b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     75e:	6c                   	insb   (%dx),%es:(%edi)
     75f:	32 36                	xor    (%esi),%dh
	...

00000762 <ls_call26>:
CS550LSSYSCALL(ls_call26)
     762:	b8 58 07 00 00       	mov    $0x758,%eax
     767:	cd 41                	int    $0x41
     769:	c3                   	ret    

0000076a <str_ls_call27>:
     76a:	6c                   	insb   (%dx),%es:(%edi)
     76b:	73 5f                	jae    7cc <str_ls_call32+0x8>
     76d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     770:	6c                   	insb   (%dx),%es:(%edi)
     771:	32 37                	xor    (%edi),%dh
	...

00000774 <ls_call27>:
CS550LSSYSCALL(ls_call27)
     774:	b8 6a 07 00 00       	mov    $0x76a,%eax
     779:	cd 41                	int    $0x41
     77b:	c3                   	ret    

0000077c <str_ls_call28>:
     77c:	6c                   	insb   (%dx),%es:(%edi)
     77d:	73 5f                	jae    7de <str_ls_call33+0x8>
     77f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     782:	6c                   	insb   (%dx),%es:(%edi)
     783:	32 38                	xor    (%eax),%bh
	...

00000786 <ls_call28>:
CS550LSSYSCALL(ls_call28)
     786:	b8 7c 07 00 00       	mov    $0x77c,%eax
     78b:	cd 41                	int    $0x41
     78d:	c3                   	ret    

0000078e <str_ls_call29>:
     78e:	6c                   	insb   (%dx),%es:(%edi)
     78f:	73 5f                	jae    7f0 <str_ls_call34+0x8>
     791:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     794:	6c                   	insb   (%dx),%es:(%edi)
     795:	32 39                	xor    (%ecx),%bh
	...

00000798 <ls_call29>:
CS550LSSYSCALL(ls_call29)
     798:	b8 8e 07 00 00       	mov    $0x78e,%eax
     79d:	cd 41                	int    $0x41
     79f:	c3                   	ret    

000007a0 <str_ls_call30>:
     7a0:	6c                   	insb   (%dx),%es:(%edi)
     7a1:	73 5f                	jae    802 <str_ls_call35+0x8>
     7a3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7a6:	6c                   	insb   (%dx),%es:(%edi)
     7a7:	33 30                	xor    (%eax),%esi
	...

000007aa <ls_call30>:
CS550LSSYSCALL(ls_call30)
     7aa:	b8 a0 07 00 00       	mov    $0x7a0,%eax
     7af:	cd 41                	int    $0x41
     7b1:	c3                   	ret    

000007b2 <str_ls_call31>:
     7b2:	6c                   	insb   (%dx),%es:(%edi)
     7b3:	73 5f                	jae    814 <str_ls_call36+0x8>
     7b5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7b8:	6c                   	insb   (%dx),%es:(%edi)
     7b9:	33 31                	xor    (%ecx),%esi
	...

000007bc <ls_call31>:
CS550LSSYSCALL(ls_call31)
     7bc:	b8 b2 07 00 00       	mov    $0x7b2,%eax
     7c1:	cd 41                	int    $0x41
     7c3:	c3                   	ret    

000007c4 <str_ls_call32>:
     7c4:	6c                   	insb   (%dx),%es:(%edi)
     7c5:	73 5f                	jae    826 <str_ls_call37+0x8>
     7c7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7ca:	6c                   	insb   (%dx),%es:(%edi)
     7cb:	33 32                	xor    (%edx),%esi
	...

000007ce <ls_call32>:
CS550LSSYSCALL(ls_call32)
     7ce:	b8 c4 07 00 00       	mov    $0x7c4,%eax
     7d3:	cd 41                	int    $0x41
     7d5:	c3                   	ret    

000007d6 <str_ls_call33>:
     7d6:	6c                   	insb   (%dx),%es:(%edi)
     7d7:	73 5f                	jae    838 <str_ls_call38+0x8>
     7d9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7dc:	6c                   	insb   (%dx),%es:(%edi)
     7dd:	33 33                	xor    (%ebx),%esi
	...

000007e0 <ls_call33>:
CS550LSSYSCALL(ls_call33)
     7e0:	b8 d6 07 00 00       	mov    $0x7d6,%eax
     7e5:	cd 41                	int    $0x41
     7e7:	c3                   	ret    

000007e8 <str_ls_call34>:
     7e8:	6c                   	insb   (%dx),%es:(%edi)
     7e9:	73 5f                	jae    84a <str_ls_call39+0x8>
     7eb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7ee:	6c                   	insb   (%dx),%es:(%edi)
     7ef:	33 34 00             	xor    (%eax,%eax,1),%esi

000007f2 <ls_call34>:
CS550LSSYSCALL(ls_call34)
     7f2:	b8 e8 07 00 00       	mov    $0x7e8,%eax
     7f7:	cd 41                	int    $0x41
     7f9:	c3                   	ret    

000007fa <str_ls_call35>:
     7fa:	6c                   	insb   (%dx),%es:(%edi)
     7fb:	73 5f                	jae    85c <str_ls_call40+0x8>
     7fd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     800:	6c                   	insb   (%dx),%es:(%edi)
     801:	33                   	.byte 0x33
     802:	35                   	.byte 0x35
	...

00000804 <ls_call35>:
CS550LSSYSCALL(ls_call35)
     804:	b8 fa 07 00 00       	mov    $0x7fa,%eax
     809:	cd 41                	int    $0x41
     80b:	c3                   	ret    

0000080c <str_ls_call36>:
     80c:	6c                   	insb   (%dx),%es:(%edi)
     80d:	73 5f                	jae    86e <str_ls_call41+0x8>
     80f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     812:	6c                   	insb   (%dx),%es:(%edi)
     813:	33 36                	xor    (%esi),%esi
	...

00000816 <ls_call36>:
CS550LSSYSCALL(ls_call36)
     816:	b8 0c 08 00 00       	mov    $0x80c,%eax
     81b:	cd 41                	int    $0x41
     81d:	c3                   	ret    

0000081e <str_ls_call37>:
     81e:	6c                   	insb   (%dx),%es:(%edi)
     81f:	73 5f                	jae    880 <str_ls_call42+0x8>
     821:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     824:	6c                   	insb   (%dx),%es:(%edi)
     825:	33 37                	xor    (%edi),%esi
	...

00000828 <ls_call37>:
CS550LSSYSCALL(ls_call37)
     828:	b8 1e 08 00 00       	mov    $0x81e,%eax
     82d:	cd 41                	int    $0x41
     82f:	c3                   	ret    

00000830 <str_ls_call38>:
     830:	6c                   	insb   (%dx),%es:(%edi)
     831:	73 5f                	jae    892 <str_ls_call43+0x8>
     833:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     836:	6c                   	insb   (%dx),%es:(%edi)
     837:	33 38                	xor    (%eax),%edi
	...

0000083a <ls_call38>:
CS550LSSYSCALL(ls_call38)
     83a:	b8 30 08 00 00       	mov    $0x830,%eax
     83f:	cd 41                	int    $0x41
     841:	c3                   	ret    

00000842 <str_ls_call39>:
     842:	6c                   	insb   (%dx),%es:(%edi)
     843:	73 5f                	jae    8a4 <str_ls_call44+0x8>
     845:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     848:	6c                   	insb   (%dx),%es:(%edi)
     849:	33 39                	xor    (%ecx),%edi
	...

0000084c <ls_call39>:
CS550LSSYSCALL(ls_call39)
     84c:	b8 42 08 00 00       	mov    $0x842,%eax
     851:	cd 41                	int    $0x41
     853:	c3                   	ret    

00000854 <str_ls_call40>:
     854:	6c                   	insb   (%dx),%es:(%edi)
     855:	73 5f                	jae    8b6 <str_ls_call45+0x8>
     857:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     85a:	6c                   	insb   (%dx),%es:(%edi)
     85b:	34 30                	xor    $0x30,%al
	...

0000085e <ls_call40>:
CS550LSSYSCALL(ls_call40)
     85e:	b8 54 08 00 00       	mov    $0x854,%eax
     863:	cd 41                	int    $0x41
     865:	c3                   	ret    

00000866 <str_ls_call41>:
     866:	6c                   	insb   (%dx),%es:(%edi)
     867:	73 5f                	jae    8c8 <str_ls_call46+0x8>
     869:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     86c:	6c                   	insb   (%dx),%es:(%edi)
     86d:	34 31                	xor    $0x31,%al
	...

00000870 <ls_call41>:
CS550LSSYSCALL(ls_call41)
     870:	b8 66 08 00 00       	mov    $0x866,%eax
     875:	cd 41                	int    $0x41
     877:	c3                   	ret    

00000878 <str_ls_call42>:
     878:	6c                   	insb   (%dx),%es:(%edi)
     879:	73 5f                	jae    8da <str_ls_call47+0x8>
     87b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     87e:	6c                   	insb   (%dx),%es:(%edi)
     87f:	34 32                	xor    $0x32,%al
	...

00000882 <ls_call42>:
CS550LSSYSCALL(ls_call42)
     882:	b8 78 08 00 00       	mov    $0x878,%eax
     887:	cd 41                	int    $0x41
     889:	c3                   	ret    

0000088a <str_ls_call43>:
     88a:	6c                   	insb   (%dx),%es:(%edi)
     88b:	73 5f                	jae    8ec <str_ls_call48+0x8>
     88d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     890:	6c                   	insb   (%dx),%es:(%edi)
     891:	34 33                	xor    $0x33,%al
	...

00000894 <ls_call43>:
CS550LSSYSCALL(ls_call43)
     894:	b8 8a 08 00 00       	mov    $0x88a,%eax
     899:	cd 41                	int    $0x41
     89b:	c3                   	ret    

0000089c <str_ls_call44>:
     89c:	6c                   	insb   (%dx),%es:(%edi)
     89d:	73 5f                	jae    8fe <str_ls_call49+0x8>
     89f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8a2:	6c                   	insb   (%dx),%es:(%edi)
     8a3:	34 34                	xor    $0x34,%al
	...

000008a6 <ls_call44>:
CS550LSSYSCALL(ls_call44)
     8a6:	b8 9c 08 00 00       	mov    $0x89c,%eax
     8ab:	cd 41                	int    $0x41
     8ad:	c3                   	ret    

000008ae <str_ls_call45>:
     8ae:	6c                   	insb   (%dx),%es:(%edi)
     8af:	73 5f                	jae    910 <str_ls_call50+0x8>
     8b1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8b4:	6c                   	insb   (%dx),%es:(%edi)
     8b5:	34 35                	xor    $0x35,%al
	...

000008b8 <ls_call45>:
CS550LSSYSCALL(ls_call45)
     8b8:	b8 ae 08 00 00       	mov    $0x8ae,%eax
     8bd:	cd 41                	int    $0x41
     8bf:	c3                   	ret    

000008c0 <str_ls_call46>:
     8c0:	6c                   	insb   (%dx),%es:(%edi)
     8c1:	73 5f                	jae    922 <str_ht_call1+0x8>
     8c3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8c6:	6c                   	insb   (%dx),%es:(%edi)
     8c7:	34 36                	xor    $0x36,%al
	...

000008ca <ls_call46>:
CS550LSSYSCALL(ls_call46)
     8ca:	b8 c0 08 00 00       	mov    $0x8c0,%eax
     8cf:	cd 41                	int    $0x41
     8d1:	c3                   	ret    

000008d2 <str_ls_call47>:
     8d2:	6c                   	insb   (%dx),%es:(%edi)
     8d3:	73 5f                	jae    934 <ht_call2>
     8d5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8d8:	6c                   	insb   (%dx),%es:(%edi)
     8d9:	34 37                	xor    $0x37,%al
	...

000008dc <ls_call47>:
CS550LSSYSCALL(ls_call47)
     8dc:	b8 d2 08 00 00       	mov    $0x8d2,%eax
     8e1:	cd 41                	int    $0x41
     8e3:	c3                   	ret    

000008e4 <str_ls_call48>:
     8e4:	6c                   	insb   (%dx),%es:(%edi)
     8e5:	73 5f                	jae    946 <ht_call3+0x1>
     8e7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8ea:	6c                   	insb   (%dx),%es:(%edi)
     8eb:	34 38                	xor    $0x38,%al
	...

000008ee <ls_call48>:
CS550LSSYSCALL(ls_call48)
     8ee:	b8 e4 08 00 00       	mov    $0x8e4,%eax
     8f3:	cd 41                	int    $0x41
     8f5:	c3                   	ret    

000008f6 <str_ls_call49>:
     8f6:	6c                   	insb   (%dx),%es:(%edi)
     8f7:	73 5f                	jae    958 <ht_call4+0x2>
     8f9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8fc:	6c                   	insb   (%dx),%es:(%edi)
     8fd:	34 39                	xor    $0x39,%al
	...

00000900 <ls_call49>:
CS550LSSYSCALL(ls_call49)
     900:	b8 f6 08 00 00       	mov    $0x8f6,%eax
     905:	cd 41                	int    $0x41
     907:	c3                   	ret    

00000908 <str_ls_call50>:
     908:	6c                   	insb   (%dx),%es:(%edi)
     909:	73 5f                	jae    96a <ht_call5+0x3>
     90b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     90e:	6c                   	insb   (%dx),%es:(%edi)
     90f:	35                   	.byte 0x35
     910:	30 00                	xor    %al,(%eax)

00000912 <ls_call50>:
CS550LSSYSCALL(ls_call50)
     912:	b8 08 09 00 00       	mov    $0x908,%eax
     917:	cd 41                	int    $0x41
     919:	c3                   	ret    

0000091a <str_ht_call1>:
     91a:	68 74 5f 63 61       	push   $0x61635f74
     91f:	6c                   	insb   (%dx),%es:(%edi)
     920:	6c                   	insb   (%dx),%es:(%edi)
     921:	31 00                	xor    %eax,(%eax)

00000923 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
     923:	b8 1a 09 00 00       	mov    $0x91a,%eax
     928:	cd 42                	int    $0x42
     92a:	c3                   	ret    

0000092b <str_ht_call2>:
     92b:	68 74 5f 63 61       	push   $0x61635f74
     930:	6c                   	insb   (%dx),%es:(%edi)
     931:	6c                   	insb   (%dx),%es:(%edi)
     932:	32 00                	xor    (%eax),%al

00000934 <ht_call2>:
CS550HTSYSCALL(ht_call2)
     934:	b8 2b 09 00 00       	mov    $0x92b,%eax
     939:	cd 42                	int    $0x42
     93b:	c3                   	ret    

0000093c <str_ht_call3>:
     93c:	68 74 5f 63 61       	push   $0x61635f74
     941:	6c                   	insb   (%dx),%es:(%edi)
     942:	6c                   	insb   (%dx),%es:(%edi)
     943:	33 00                	xor    (%eax),%eax

00000945 <ht_call3>:
CS550HTSYSCALL(ht_call3)
     945:	b8 3c 09 00 00       	mov    $0x93c,%eax
     94a:	cd 42                	int    $0x42
     94c:	c3                   	ret    

0000094d <str_ht_call4>:
     94d:	68 74 5f 63 61       	push   $0x61635f74
     952:	6c                   	insb   (%dx),%es:(%edi)
     953:	6c                   	insb   (%dx),%es:(%edi)
     954:	34 00                	xor    $0x0,%al

00000956 <ht_call4>:
CS550HTSYSCALL(ht_call4)
     956:	b8 4d 09 00 00       	mov    $0x94d,%eax
     95b:	cd 42                	int    $0x42
     95d:	c3                   	ret    

0000095e <str_ht_call5>:
     95e:	68 74 5f 63 61       	push   $0x61635f74
     963:	6c                   	insb   (%dx),%es:(%edi)
     964:	6c                   	insb   (%dx),%es:(%edi)
     965:	35                   	.byte 0x35
	...

00000967 <ht_call5>:
CS550HTSYSCALL(ht_call5)
     967:	b8 5e 09 00 00       	mov    $0x95e,%eax
     96c:	cd 42                	int    $0x42
     96e:	c3                   	ret    

0000096f <str_ht_call6>:
     96f:	68 74 5f 63 61       	push   $0x61635f74
     974:	6c                   	insb   (%dx),%es:(%edi)
     975:	6c                   	insb   (%dx),%es:(%edi)
     976:	36                   	ss
	...

00000978 <ht_call6>:
CS550HTSYSCALL(ht_call6)
     978:	b8 6f 09 00 00       	mov    $0x96f,%eax
     97d:	cd 42                	int    $0x42
     97f:	c3                   	ret    

00000980 <str_ht_call7>:
     980:	68 74 5f 63 61       	push   $0x61635f74
     985:	6c                   	insb   (%dx),%es:(%edi)
     986:	6c                   	insb   (%dx),%es:(%edi)
     987:	37                   	aaa    
	...

00000989 <ht_call7>:
CS550HTSYSCALL(ht_call7)
     989:	b8 80 09 00 00       	mov    $0x980,%eax
     98e:	cd 42                	int    $0x42
     990:	c3                   	ret    

00000991 <str_ht_call8>:
     991:	68 74 5f 63 61       	push   $0x61635f74
     996:	6c                   	insb   (%dx),%es:(%edi)
     997:	6c                   	insb   (%dx),%es:(%edi)
     998:	38 00                	cmp    %al,(%eax)

0000099a <ht_call8>:
CS550HTSYSCALL(ht_call8)
     99a:	b8 91 09 00 00       	mov    $0x991,%eax
     99f:	cd 42                	int    $0x42
     9a1:	c3                   	ret    

000009a2 <str_ht_call9>:
     9a2:	68 74 5f 63 61       	push   $0x61635f74
     9a7:	6c                   	insb   (%dx),%es:(%edi)
     9a8:	6c                   	insb   (%dx),%es:(%edi)
     9a9:	39 00                	cmp    %eax,(%eax)

000009ab <ht_call9>:
CS550HTSYSCALL(ht_call9)
     9ab:	b8 a2 09 00 00       	mov    $0x9a2,%eax
     9b0:	cd 42                	int    $0x42
     9b2:	c3                   	ret    

000009b3 <str_ht_call10>:
     9b3:	68 74 5f 63 61       	push   $0x61635f74
     9b8:	6c                   	insb   (%dx),%es:(%edi)
     9b9:	6c                   	insb   (%dx),%es:(%edi)
     9ba:	31 30                	xor    %esi,(%eax)
	...

000009bd <ht_call10>:
CS550HTSYSCALL(ht_call10)
     9bd:	b8 b3 09 00 00       	mov    $0x9b3,%eax
     9c2:	cd 42                	int    $0x42
     9c4:	c3                   	ret    

000009c5 <str_ht_call11>:
     9c5:	68 74 5f 63 61       	push   $0x61635f74
     9ca:	6c                   	insb   (%dx),%es:(%edi)
     9cb:	6c                   	insb   (%dx),%es:(%edi)
     9cc:	31 31                	xor    %esi,(%ecx)
	...

000009cf <ht_call11>:
CS550HTSYSCALL(ht_call11)
     9cf:	b8 c5 09 00 00       	mov    $0x9c5,%eax
     9d4:	cd 42                	int    $0x42
     9d6:	c3                   	ret    

000009d7 <str_ht_call12>:
     9d7:	68 74 5f 63 61       	push   $0x61635f74
     9dc:	6c                   	insb   (%dx),%es:(%edi)
     9dd:	6c                   	insb   (%dx),%es:(%edi)
     9de:	31 32                	xor    %esi,(%edx)
	...

000009e1 <ht_call12>:
CS550HTSYSCALL(ht_call12)
     9e1:	b8 d7 09 00 00       	mov    $0x9d7,%eax
     9e6:	cd 42                	int    $0x42
     9e8:	c3                   	ret    

000009e9 <str_ht_call13>:
     9e9:	68 74 5f 63 61       	push   $0x61635f74
     9ee:	6c                   	insb   (%dx),%es:(%edi)
     9ef:	6c                   	insb   (%dx),%es:(%edi)
     9f0:	31 33                	xor    %esi,(%ebx)
	...

000009f3 <ht_call13>:
CS550HTSYSCALL(ht_call13)
     9f3:	b8 e9 09 00 00       	mov    $0x9e9,%eax
     9f8:	cd 42                	int    $0x42
     9fa:	c3                   	ret    

000009fb <str_ht_call14>:
     9fb:	68 74 5f 63 61       	push   $0x61635f74
     a00:	6c                   	insb   (%dx),%es:(%edi)
     a01:	6c                   	insb   (%dx),%es:(%edi)
     a02:	31 34 00             	xor    %esi,(%eax,%eax,1)

00000a05 <ht_call14>:
CS550HTSYSCALL(ht_call14)
     a05:	b8 fb 09 00 00       	mov    $0x9fb,%eax
     a0a:	cd 42                	int    $0x42
     a0c:	c3                   	ret    

00000a0d <str_ht_call15>:
     a0d:	68 74 5f 63 61       	push   $0x61635f74
     a12:	6c                   	insb   (%dx),%es:(%edi)
     a13:	6c                   	insb   (%dx),%es:(%edi)
     a14:	31                   	.byte 0x31
     a15:	35                   	.byte 0x35
	...

00000a17 <ht_call15>:
CS550HTSYSCALL(ht_call15)
     a17:	b8 0d 0a 00 00       	mov    $0xa0d,%eax
     a1c:	cd 42                	int    $0x42
     a1e:	c3                   	ret    

00000a1f <str_ht_call16>:
     a1f:	68 74 5f 63 61       	push   $0x61635f74
     a24:	6c                   	insb   (%dx),%es:(%edi)
     a25:	6c                   	insb   (%dx),%es:(%edi)
     a26:	31 36                	xor    %esi,(%esi)
	...

00000a29 <ht_call16>:
CS550HTSYSCALL(ht_call16)
     a29:	b8 1f 0a 00 00       	mov    $0xa1f,%eax
     a2e:	cd 42                	int    $0x42
     a30:	c3                   	ret    

00000a31 <str_ht_call17>:
     a31:	68 74 5f 63 61       	push   $0x61635f74
     a36:	6c                   	insb   (%dx),%es:(%edi)
     a37:	6c                   	insb   (%dx),%es:(%edi)
     a38:	31 37                	xor    %esi,(%edi)
	...

00000a3b <ht_call17>:
CS550HTSYSCALL(ht_call17)
     a3b:	b8 31 0a 00 00       	mov    $0xa31,%eax
     a40:	cd 42                	int    $0x42
     a42:	c3                   	ret    

00000a43 <str_ht_call18>:
     a43:	68 74 5f 63 61       	push   $0x61635f74
     a48:	6c                   	insb   (%dx),%es:(%edi)
     a49:	6c                   	insb   (%dx),%es:(%edi)
     a4a:	31 38                	xor    %edi,(%eax)
	...

00000a4d <ht_call18>:
CS550HTSYSCALL(ht_call18)
     a4d:	b8 43 0a 00 00       	mov    $0xa43,%eax
     a52:	cd 42                	int    $0x42
     a54:	c3                   	ret    

00000a55 <str_ht_call19>:
     a55:	68 74 5f 63 61       	push   $0x61635f74
     a5a:	6c                   	insb   (%dx),%es:(%edi)
     a5b:	6c                   	insb   (%dx),%es:(%edi)
     a5c:	31 39                	xor    %edi,(%ecx)
	...

00000a5f <ht_call19>:
CS550HTSYSCALL(ht_call19)
     a5f:	b8 55 0a 00 00       	mov    $0xa55,%eax
     a64:	cd 42                	int    $0x42
     a66:	c3                   	ret    

00000a67 <str_ht_call20>:
     a67:	68 74 5f 63 61       	push   $0x61635f74
     a6c:	6c                   	insb   (%dx),%es:(%edi)
     a6d:	6c                   	insb   (%dx),%es:(%edi)
     a6e:	32 30                	xor    (%eax),%dh
	...

00000a71 <ht_call20>:
CS550HTSYSCALL(ht_call20)
     a71:	b8 67 0a 00 00       	mov    $0xa67,%eax
     a76:	cd 42                	int    $0x42
     a78:	c3                   	ret    

00000a79 <str_ht_call21>:
     a79:	68 74 5f 63 61       	push   $0x61635f74
     a7e:	6c                   	insb   (%dx),%es:(%edi)
     a7f:	6c                   	insb   (%dx),%es:(%edi)
     a80:	32 31                	xor    (%ecx),%dh
	...

00000a83 <ht_call21>:
CS550HTSYSCALL(ht_call21)
     a83:	b8 79 0a 00 00       	mov    $0xa79,%eax
     a88:	cd 42                	int    $0x42
     a8a:	c3                   	ret    

00000a8b <str_ht_call22>:
     a8b:	68 74 5f 63 61       	push   $0x61635f74
     a90:	6c                   	insb   (%dx),%es:(%edi)
     a91:	6c                   	insb   (%dx),%es:(%edi)
     a92:	32 32                	xor    (%edx),%dh
	...

00000a95 <ht_call22>:
CS550HTSYSCALL(ht_call22)
     a95:	b8 8b 0a 00 00       	mov    $0xa8b,%eax
     a9a:	cd 42                	int    $0x42
     a9c:	c3                   	ret    

00000a9d <str_ht_call23>:
     a9d:	68 74 5f 63 61       	push   $0x61635f74
     aa2:	6c                   	insb   (%dx),%es:(%edi)
     aa3:	6c                   	insb   (%dx),%es:(%edi)
     aa4:	32 33                	xor    (%ebx),%dh
	...

00000aa7 <ht_call23>:
CS550HTSYSCALL(ht_call23)
     aa7:	b8 9d 0a 00 00       	mov    $0xa9d,%eax
     aac:	cd 42                	int    $0x42
     aae:	c3                   	ret    

00000aaf <str_ht_call24>:
     aaf:	68 74 5f 63 61       	push   $0x61635f74
     ab4:	6c                   	insb   (%dx),%es:(%edi)
     ab5:	6c                   	insb   (%dx),%es:(%edi)
     ab6:	32 34 00             	xor    (%eax,%eax,1),%dh

00000ab9 <ht_call24>:
CS550HTSYSCALL(ht_call24)
     ab9:	b8 af 0a 00 00       	mov    $0xaaf,%eax
     abe:	cd 42                	int    $0x42
     ac0:	c3                   	ret    

00000ac1 <str_ht_call25>:
     ac1:	68 74 5f 63 61       	push   $0x61635f74
     ac6:	6c                   	insb   (%dx),%es:(%edi)
     ac7:	6c                   	insb   (%dx),%es:(%edi)
     ac8:	32                   	.byte 0x32
     ac9:	35                   	.byte 0x35
	...

00000acb <ht_call25>:
CS550HTSYSCALL(ht_call25)
     acb:	b8 c1 0a 00 00       	mov    $0xac1,%eax
     ad0:	cd 42                	int    $0x42
     ad2:	c3                   	ret    

00000ad3 <str_ht_call26>:
     ad3:	68 74 5f 63 61       	push   $0x61635f74
     ad8:	6c                   	insb   (%dx),%es:(%edi)
     ad9:	6c                   	insb   (%dx),%es:(%edi)
     ada:	32 36                	xor    (%esi),%dh
	...

00000add <ht_call26>:
CS550HTSYSCALL(ht_call26)
     add:	b8 d3 0a 00 00       	mov    $0xad3,%eax
     ae2:	cd 42                	int    $0x42
     ae4:	c3                   	ret    

00000ae5 <str_ht_call27>:
     ae5:	68 74 5f 63 61       	push   $0x61635f74
     aea:	6c                   	insb   (%dx),%es:(%edi)
     aeb:	6c                   	insb   (%dx),%es:(%edi)
     aec:	32 37                	xor    (%edi),%dh
	...

00000aef <ht_call27>:
CS550HTSYSCALL(ht_call27)
     aef:	b8 e5 0a 00 00       	mov    $0xae5,%eax
     af4:	cd 42                	int    $0x42
     af6:	c3                   	ret    

00000af7 <str_ht_call28>:
     af7:	68 74 5f 63 61       	push   $0x61635f74
     afc:	6c                   	insb   (%dx),%es:(%edi)
     afd:	6c                   	insb   (%dx),%es:(%edi)
     afe:	32 38                	xor    (%eax),%bh
	...

00000b01 <ht_call28>:
CS550HTSYSCALL(ht_call28)
     b01:	b8 f7 0a 00 00       	mov    $0xaf7,%eax
     b06:	cd 42                	int    $0x42
     b08:	c3                   	ret    

00000b09 <str_ht_call29>:
     b09:	68 74 5f 63 61       	push   $0x61635f74
     b0e:	6c                   	insb   (%dx),%es:(%edi)
     b0f:	6c                   	insb   (%dx),%es:(%edi)
     b10:	32 39                	xor    (%ecx),%bh
	...

00000b13 <ht_call29>:
CS550HTSYSCALL(ht_call29)
     b13:	b8 09 0b 00 00       	mov    $0xb09,%eax
     b18:	cd 42                	int    $0x42
     b1a:	c3                   	ret    

00000b1b <str_ht_call30>:
     b1b:	68 74 5f 63 61       	push   $0x61635f74
     b20:	6c                   	insb   (%dx),%es:(%edi)
     b21:	6c                   	insb   (%dx),%es:(%edi)
     b22:	33 30                	xor    (%eax),%esi
	...

00000b25 <ht_call30>:
CS550HTSYSCALL(ht_call30)
     b25:	b8 1b 0b 00 00       	mov    $0xb1b,%eax
     b2a:	cd 42                	int    $0x42
     b2c:	c3                   	ret    

00000b2d <str_ht_call31>:
     b2d:	68 74 5f 63 61       	push   $0x61635f74
     b32:	6c                   	insb   (%dx),%es:(%edi)
     b33:	6c                   	insb   (%dx),%es:(%edi)
     b34:	33 31                	xor    (%ecx),%esi
	...

00000b37 <ht_call31>:
CS550HTSYSCALL(ht_call31)
     b37:	b8 2d 0b 00 00       	mov    $0xb2d,%eax
     b3c:	cd 42                	int    $0x42
     b3e:	c3                   	ret    

00000b3f <str_ht_call32>:
     b3f:	68 74 5f 63 61       	push   $0x61635f74
     b44:	6c                   	insb   (%dx),%es:(%edi)
     b45:	6c                   	insb   (%dx),%es:(%edi)
     b46:	33 32                	xor    (%edx),%esi
	...

00000b49 <ht_call32>:
CS550HTSYSCALL(ht_call32)
     b49:	b8 3f 0b 00 00       	mov    $0xb3f,%eax
     b4e:	cd 42                	int    $0x42
     b50:	c3                   	ret    

00000b51 <str_ht_call33>:
     b51:	68 74 5f 63 61       	push   $0x61635f74
     b56:	6c                   	insb   (%dx),%es:(%edi)
     b57:	6c                   	insb   (%dx),%es:(%edi)
     b58:	33 33                	xor    (%ebx),%esi
	...

00000b5b <ht_call33>:
CS550HTSYSCALL(ht_call33)
     b5b:	b8 51 0b 00 00       	mov    $0xb51,%eax
     b60:	cd 42                	int    $0x42
     b62:	c3                   	ret    

00000b63 <str_ht_call34>:
     b63:	68 74 5f 63 61       	push   $0x61635f74
     b68:	6c                   	insb   (%dx),%es:(%edi)
     b69:	6c                   	insb   (%dx),%es:(%edi)
     b6a:	33 34 00             	xor    (%eax,%eax,1),%esi

00000b6d <ht_call34>:
CS550HTSYSCALL(ht_call34)
     b6d:	b8 63 0b 00 00       	mov    $0xb63,%eax
     b72:	cd 42                	int    $0x42
     b74:	c3                   	ret    

00000b75 <str_ht_call35>:
     b75:	68 74 5f 63 61       	push   $0x61635f74
     b7a:	6c                   	insb   (%dx),%es:(%edi)
     b7b:	6c                   	insb   (%dx),%es:(%edi)
     b7c:	33                   	.byte 0x33
     b7d:	35                   	.byte 0x35
	...

00000b7f <ht_call35>:
CS550HTSYSCALL(ht_call35)
     b7f:	b8 75 0b 00 00       	mov    $0xb75,%eax
     b84:	cd 42                	int    $0x42
     b86:	c3                   	ret    

00000b87 <str_ht_call36>:
     b87:	68 74 5f 63 61       	push   $0x61635f74
     b8c:	6c                   	insb   (%dx),%es:(%edi)
     b8d:	6c                   	insb   (%dx),%es:(%edi)
     b8e:	33 36                	xor    (%esi),%esi
	...

00000b91 <ht_call36>:
CS550HTSYSCALL(ht_call36)
     b91:	b8 87 0b 00 00       	mov    $0xb87,%eax
     b96:	cd 42                	int    $0x42
     b98:	c3                   	ret    

00000b99 <str_ht_call37>:
     b99:	68 74 5f 63 61       	push   $0x61635f74
     b9e:	6c                   	insb   (%dx),%es:(%edi)
     b9f:	6c                   	insb   (%dx),%es:(%edi)
     ba0:	33 37                	xor    (%edi),%esi
	...

00000ba3 <ht_call37>:
CS550HTSYSCALL(ht_call37)
     ba3:	b8 99 0b 00 00       	mov    $0xb99,%eax
     ba8:	cd 42                	int    $0x42
     baa:	c3                   	ret    

00000bab <str_ht_call38>:
     bab:	68 74 5f 63 61       	push   $0x61635f74
     bb0:	6c                   	insb   (%dx),%es:(%edi)
     bb1:	6c                   	insb   (%dx),%es:(%edi)
     bb2:	33 38                	xor    (%eax),%edi
	...

00000bb5 <ht_call38>:
CS550HTSYSCALL(ht_call38)
     bb5:	b8 ab 0b 00 00       	mov    $0xbab,%eax
     bba:	cd 42                	int    $0x42
     bbc:	c3                   	ret    

00000bbd <str_ht_call39>:
     bbd:	68 74 5f 63 61       	push   $0x61635f74
     bc2:	6c                   	insb   (%dx),%es:(%edi)
     bc3:	6c                   	insb   (%dx),%es:(%edi)
     bc4:	33 39                	xor    (%ecx),%edi
	...

00000bc7 <ht_call39>:
CS550HTSYSCALL(ht_call39)
     bc7:	b8 bd 0b 00 00       	mov    $0xbbd,%eax
     bcc:	cd 42                	int    $0x42
     bce:	c3                   	ret    

00000bcf <str_ht_call40>:
     bcf:	68 74 5f 63 61       	push   $0x61635f74
     bd4:	6c                   	insb   (%dx),%es:(%edi)
     bd5:	6c                   	insb   (%dx),%es:(%edi)
     bd6:	34 30                	xor    $0x30,%al
	...

00000bd9 <ht_call40>:
CS550HTSYSCALL(ht_call40)
     bd9:	b8 cf 0b 00 00       	mov    $0xbcf,%eax
     bde:	cd 42                	int    $0x42
     be0:	c3                   	ret    

00000be1 <str_ht_call41>:
     be1:	68 74 5f 63 61       	push   $0x61635f74
     be6:	6c                   	insb   (%dx),%es:(%edi)
     be7:	6c                   	insb   (%dx),%es:(%edi)
     be8:	34 31                	xor    $0x31,%al
	...

00000beb <ht_call41>:
CS550HTSYSCALL(ht_call41)
     beb:	b8 e1 0b 00 00       	mov    $0xbe1,%eax
     bf0:	cd 42                	int    $0x42
     bf2:	c3                   	ret    

00000bf3 <str_ht_call42>:
     bf3:	68 74 5f 63 61       	push   $0x61635f74
     bf8:	6c                   	insb   (%dx),%es:(%edi)
     bf9:	6c                   	insb   (%dx),%es:(%edi)
     bfa:	34 32                	xor    $0x32,%al
	...

00000bfd <ht_call42>:
CS550HTSYSCALL(ht_call42)
     bfd:	b8 f3 0b 00 00       	mov    $0xbf3,%eax
     c02:	cd 42                	int    $0x42
     c04:	c3                   	ret    

00000c05 <str_ht_call43>:
     c05:	68 74 5f 63 61       	push   $0x61635f74
     c0a:	6c                   	insb   (%dx),%es:(%edi)
     c0b:	6c                   	insb   (%dx),%es:(%edi)
     c0c:	34 33                	xor    $0x33,%al
	...

00000c0f <ht_call43>:
CS550HTSYSCALL(ht_call43)
     c0f:	b8 05 0c 00 00       	mov    $0xc05,%eax
     c14:	cd 42                	int    $0x42
     c16:	c3                   	ret    

00000c17 <str_ht_call44>:
     c17:	68 74 5f 63 61       	push   $0x61635f74
     c1c:	6c                   	insb   (%dx),%es:(%edi)
     c1d:	6c                   	insb   (%dx),%es:(%edi)
     c1e:	34 34                	xor    $0x34,%al
	...

00000c21 <ht_call44>:
CS550HTSYSCALL(ht_call44)
     c21:	b8 17 0c 00 00       	mov    $0xc17,%eax
     c26:	cd 42                	int    $0x42
     c28:	c3                   	ret    

00000c29 <str_ht_call45>:
     c29:	68 74 5f 63 61       	push   $0x61635f74
     c2e:	6c                   	insb   (%dx),%es:(%edi)
     c2f:	6c                   	insb   (%dx),%es:(%edi)
     c30:	34 35                	xor    $0x35,%al
	...

00000c33 <ht_call45>:
CS550HTSYSCALL(ht_call45)
     c33:	b8 29 0c 00 00       	mov    $0xc29,%eax
     c38:	cd 42                	int    $0x42
     c3a:	c3                   	ret    

00000c3b <str_ht_call46>:
     c3b:	68 74 5f 63 61       	push   $0x61635f74
     c40:	6c                   	insb   (%dx),%es:(%edi)
     c41:	6c                   	insb   (%dx),%es:(%edi)
     c42:	34 36                	xor    $0x36,%al
	...

00000c45 <ht_call46>:
CS550HTSYSCALL(ht_call46)
     c45:	b8 3b 0c 00 00       	mov    $0xc3b,%eax
     c4a:	cd 42                	int    $0x42
     c4c:	c3                   	ret    

00000c4d <str_ht_call47>:
     c4d:	68 74 5f 63 61       	push   $0x61635f74
     c52:	6c                   	insb   (%dx),%es:(%edi)
     c53:	6c                   	insb   (%dx),%es:(%edi)
     c54:	34 37                	xor    $0x37,%al
	...

00000c57 <ht_call47>:
CS550HTSYSCALL(ht_call47)
     c57:	b8 4d 0c 00 00       	mov    $0xc4d,%eax
     c5c:	cd 42                	int    $0x42
     c5e:	c3                   	ret    

00000c5f <str_ht_call48>:
     c5f:	68 74 5f 63 61       	push   $0x61635f74
     c64:	6c                   	insb   (%dx),%es:(%edi)
     c65:	6c                   	insb   (%dx),%es:(%edi)
     c66:	34 38                	xor    $0x38,%al
	...

00000c69 <ht_call48>:
CS550HTSYSCALL(ht_call48)
     c69:	b8 5f 0c 00 00       	mov    $0xc5f,%eax
     c6e:	cd 42                	int    $0x42
     c70:	c3                   	ret    

00000c71 <str_ht_call49>:
     c71:	68 74 5f 63 61       	push   $0x61635f74
     c76:	6c                   	insb   (%dx),%es:(%edi)
     c77:	6c                   	insb   (%dx),%es:(%edi)
     c78:	34 39                	xor    $0x39,%al
	...

00000c7b <ht_call49>:
CS550HTSYSCALL(ht_call49)
     c7b:	b8 71 0c 00 00       	mov    $0xc71,%eax
     c80:	cd 42                	int    $0x42
     c82:	c3                   	ret    

00000c83 <str_ht_call50>:
     c83:	68 74 5f 63 61       	push   $0x61635f74
     c88:	6c                   	insb   (%dx),%es:(%edi)
     c89:	6c                   	insb   (%dx),%es:(%edi)
     c8a:	35                   	.byte 0x35
     c8b:	30 00                	xor    %al,(%eax)

00000c8d <ht_call50>:
CS550HTSYSCALL(ht_call50)
     c8d:	b8 83 0c 00 00       	mov    $0xc83,%eax
     c92:	cd 42                	int    $0x42
     c94:	c3                   	ret    

00000c95 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     c95:	55                   	push   %ebp
     c96:	89 e5                	mov    %esp,%ebp
     c98:	83 ec 18             	sub    $0x18,%esp
     c9b:	8b 45 0c             	mov    0xc(%ebp),%eax
     c9e:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     ca1:	83 ec 04             	sub    $0x4,%esp
     ca4:	6a 01                	push   $0x1
     ca6:	8d 45 f4             	lea    -0xc(%ebp),%eax
     ca9:	50                   	push   %eax
     caa:	ff 75 08             	pushl  0x8(%ebp)
     cad:	e8 65 f8 ff ff       	call   517 <write>
     cb2:	83 c4 10             	add    $0x10,%esp
}
     cb5:	90                   	nop
     cb6:	c9                   	leave  
     cb7:	c3                   	ret    

00000cb8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     cb8:	55                   	push   %ebp
     cb9:	89 e5                	mov    %esp,%ebp
     cbb:	53                   	push   %ebx
     cbc:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     cbf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     cc6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     cca:	74 17                	je     ce3 <printint+0x2b>
     ccc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     cd0:	79 11                	jns    ce3 <printint+0x2b>
    neg = 1;
     cd2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     cd9:	8b 45 0c             	mov    0xc(%ebp),%eax
     cdc:	f7 d8                	neg    %eax
     cde:	89 45 ec             	mov    %eax,-0x14(%ebp)
     ce1:	eb 06                	jmp    ce9 <printint+0x31>
  } else {
    x = xx;
     ce3:	8b 45 0c             	mov    0xc(%ebp),%eax
     ce6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     ce9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     cf0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     cf3:	8d 41 01             	lea    0x1(%ecx),%eax
     cf6:	89 45 f4             	mov    %eax,-0xc(%ebp)
     cf9:	8b 5d 10             	mov    0x10(%ebp),%ebx
     cfc:	8b 45 ec             	mov    -0x14(%ebp),%eax
     cff:	ba 00 00 00 00       	mov    $0x0,%edx
     d04:	f7 f3                	div    %ebx
     d06:	89 d0                	mov    %edx,%eax
     d08:	0f b6 80 9c 15 00 00 	movzbl 0x159c(%eax),%eax
     d0f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     d13:	8b 5d 10             	mov    0x10(%ebp),%ebx
     d16:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d19:	ba 00 00 00 00       	mov    $0x0,%edx
     d1e:	f7 f3                	div    %ebx
     d20:	89 45 ec             	mov    %eax,-0x14(%ebp)
     d23:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     d27:	75 c7                	jne    cf0 <printint+0x38>
  if(neg)
     d29:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     d2d:	74 2d                	je     d5c <printint+0xa4>
    buf[i++] = '-';
     d2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d32:	8d 50 01             	lea    0x1(%eax),%edx
     d35:	89 55 f4             	mov    %edx,-0xc(%ebp)
     d38:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     d3d:	eb 1d                	jmp    d5c <printint+0xa4>
    putc(fd, buf[i]);
     d3f:	8d 55 dc             	lea    -0x24(%ebp),%edx
     d42:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d45:	01 d0                	add    %edx,%eax
     d47:	0f b6 00             	movzbl (%eax),%eax
     d4a:	0f be c0             	movsbl %al,%eax
     d4d:	83 ec 08             	sub    $0x8,%esp
     d50:	50                   	push   %eax
     d51:	ff 75 08             	pushl  0x8(%ebp)
     d54:	e8 3c ff ff ff       	call   c95 <putc>
     d59:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     d5c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     d60:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d64:	79 d9                	jns    d3f <printint+0x87>
    putc(fd, buf[i]);
}
     d66:	90                   	nop
     d67:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d6a:	c9                   	leave  
     d6b:	c3                   	ret    

00000d6c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     d6c:	55                   	push   %ebp
     d6d:	89 e5                	mov    %esp,%ebp
     d6f:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     d72:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     d79:	8d 45 0c             	lea    0xc(%ebp),%eax
     d7c:	83 c0 04             	add    $0x4,%eax
     d7f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     d82:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     d89:	e9 59 01 00 00       	jmp    ee7 <printf+0x17b>
    c = fmt[i] & 0xff;
     d8e:	8b 55 0c             	mov    0xc(%ebp),%edx
     d91:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d94:	01 d0                	add    %edx,%eax
     d96:	0f b6 00             	movzbl (%eax),%eax
     d99:	0f be c0             	movsbl %al,%eax
     d9c:	25 ff 00 00 00       	and    $0xff,%eax
     da1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     da4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     da8:	75 2c                	jne    dd6 <printf+0x6a>
      if(c == '%'){
     daa:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     dae:	75 0c                	jne    dbc <printf+0x50>
        state = '%';
     db0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     db7:	e9 27 01 00 00       	jmp    ee3 <printf+0x177>
      } else {
        putc(fd, c);
     dbc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     dbf:	0f be c0             	movsbl %al,%eax
     dc2:	83 ec 08             	sub    $0x8,%esp
     dc5:	50                   	push   %eax
     dc6:	ff 75 08             	pushl  0x8(%ebp)
     dc9:	e8 c7 fe ff ff       	call   c95 <putc>
     dce:	83 c4 10             	add    $0x10,%esp
     dd1:	e9 0d 01 00 00       	jmp    ee3 <printf+0x177>
      }
    } else if(state == '%'){
     dd6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     dda:	0f 85 03 01 00 00    	jne    ee3 <printf+0x177>
      if(c == 'd'){
     de0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     de4:	75 1e                	jne    e04 <printf+0x98>
        printint(fd, *ap, 10, 1);
     de6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     de9:	8b 00                	mov    (%eax),%eax
     deb:	6a 01                	push   $0x1
     ded:	6a 0a                	push   $0xa
     def:	50                   	push   %eax
     df0:	ff 75 08             	pushl  0x8(%ebp)
     df3:	e8 c0 fe ff ff       	call   cb8 <printint>
     df8:	83 c4 10             	add    $0x10,%esp
        ap++;
     dfb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     dff:	e9 d8 00 00 00       	jmp    edc <printf+0x170>
      } else if(c == 'x' || c == 'p'){
     e04:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     e08:	74 06                	je     e10 <printf+0xa4>
     e0a:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     e0e:	75 1e                	jne    e2e <printf+0xc2>
        printint(fd, *ap, 16, 0);
     e10:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e13:	8b 00                	mov    (%eax),%eax
     e15:	6a 00                	push   $0x0
     e17:	6a 10                	push   $0x10
     e19:	50                   	push   %eax
     e1a:	ff 75 08             	pushl  0x8(%ebp)
     e1d:	e8 96 fe ff ff       	call   cb8 <printint>
     e22:	83 c4 10             	add    $0x10,%esp
        ap++;
     e25:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     e29:	e9 ae 00 00 00       	jmp    edc <printf+0x170>
      } else if(c == 's'){
     e2e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     e32:	75 43                	jne    e77 <printf+0x10b>
        s = (char*)*ap;
     e34:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e37:	8b 00                	mov    (%eax),%eax
     e39:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     e3c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     e40:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e44:	75 25                	jne    e6b <printf+0xff>
          s = "(null)";
     e46:	c7 45 f4 19 12 00 00 	movl   $0x1219,-0xc(%ebp)
        while(*s != 0){
     e4d:	eb 1c                	jmp    e6b <printf+0xff>
          putc(fd, *s);
     e4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e52:	0f b6 00             	movzbl (%eax),%eax
     e55:	0f be c0             	movsbl %al,%eax
     e58:	83 ec 08             	sub    $0x8,%esp
     e5b:	50                   	push   %eax
     e5c:	ff 75 08             	pushl  0x8(%ebp)
     e5f:	e8 31 fe ff ff       	call   c95 <putc>
     e64:	83 c4 10             	add    $0x10,%esp
          s++;
     e67:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     e6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e6e:	0f b6 00             	movzbl (%eax),%eax
     e71:	84 c0                	test   %al,%al
     e73:	75 da                	jne    e4f <printf+0xe3>
     e75:	eb 65                	jmp    edc <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     e77:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     e7b:	75 1d                	jne    e9a <printf+0x12e>
        putc(fd, *ap);
     e7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e80:	8b 00                	mov    (%eax),%eax
     e82:	0f be c0             	movsbl %al,%eax
     e85:	83 ec 08             	sub    $0x8,%esp
     e88:	50                   	push   %eax
     e89:	ff 75 08             	pushl  0x8(%ebp)
     e8c:	e8 04 fe ff ff       	call   c95 <putc>
     e91:	83 c4 10             	add    $0x10,%esp
        ap++;
     e94:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     e98:	eb 42                	jmp    edc <printf+0x170>
      } else if(c == '%'){
     e9a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     e9e:	75 17                	jne    eb7 <printf+0x14b>
        putc(fd, c);
     ea0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     ea3:	0f be c0             	movsbl %al,%eax
     ea6:	83 ec 08             	sub    $0x8,%esp
     ea9:	50                   	push   %eax
     eaa:	ff 75 08             	pushl  0x8(%ebp)
     ead:	e8 e3 fd ff ff       	call   c95 <putc>
     eb2:	83 c4 10             	add    $0x10,%esp
     eb5:	eb 25                	jmp    edc <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     eb7:	83 ec 08             	sub    $0x8,%esp
     eba:	6a 25                	push   $0x25
     ebc:	ff 75 08             	pushl  0x8(%ebp)
     ebf:	e8 d1 fd ff ff       	call   c95 <putc>
     ec4:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     ec7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     eca:	0f be c0             	movsbl %al,%eax
     ecd:	83 ec 08             	sub    $0x8,%esp
     ed0:	50                   	push   %eax
     ed1:	ff 75 08             	pushl  0x8(%ebp)
     ed4:	e8 bc fd ff ff       	call   c95 <putc>
     ed9:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     edc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     ee3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     ee7:	8b 55 0c             	mov    0xc(%ebp),%edx
     eea:	8b 45 f0             	mov    -0x10(%ebp),%eax
     eed:	01 d0                	add    %edx,%eax
     eef:	0f b6 00             	movzbl (%eax),%eax
     ef2:	84 c0                	test   %al,%al
     ef4:	0f 85 94 fe ff ff    	jne    d8e <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     efa:	90                   	nop
     efb:	c9                   	leave  
     efc:	c3                   	ret    

00000efd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     efd:	55                   	push   %ebp
     efe:	89 e5                	mov    %esp,%ebp
     f00:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     f03:	8b 45 08             	mov    0x8(%ebp),%eax
     f06:	83 e8 08             	sub    $0x8,%eax
     f09:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f0c:	a1 b8 15 00 00       	mov    0x15b8,%eax
     f11:	89 45 fc             	mov    %eax,-0x4(%ebp)
     f14:	eb 24                	jmp    f3a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f16:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f19:	8b 00                	mov    (%eax),%eax
     f1b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     f1e:	77 12                	ja     f32 <free+0x35>
     f20:	8b 45 f8             	mov    -0x8(%ebp),%eax
     f23:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     f26:	77 24                	ja     f4c <free+0x4f>
     f28:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f2b:	8b 00                	mov    (%eax),%eax
     f2d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     f30:	77 1a                	ja     f4c <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f32:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f35:	8b 00                	mov    (%eax),%eax
     f37:	89 45 fc             	mov    %eax,-0x4(%ebp)
     f3a:	8b 45 f8             	mov    -0x8(%ebp),%eax
     f3d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     f40:	76 d4                	jbe    f16 <free+0x19>
     f42:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f45:	8b 00                	mov    (%eax),%eax
     f47:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     f4a:	76 ca                	jbe    f16 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     f4c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     f4f:	8b 40 04             	mov    0x4(%eax),%eax
     f52:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     f59:	8b 45 f8             	mov    -0x8(%ebp),%eax
     f5c:	01 c2                	add    %eax,%edx
     f5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f61:	8b 00                	mov    (%eax),%eax
     f63:	39 c2                	cmp    %eax,%edx
     f65:	75 24                	jne    f8b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     f67:	8b 45 f8             	mov    -0x8(%ebp),%eax
     f6a:	8b 50 04             	mov    0x4(%eax),%edx
     f6d:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f70:	8b 00                	mov    (%eax),%eax
     f72:	8b 40 04             	mov    0x4(%eax),%eax
     f75:	01 c2                	add    %eax,%edx
     f77:	8b 45 f8             	mov    -0x8(%ebp),%eax
     f7a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     f7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f80:	8b 00                	mov    (%eax),%eax
     f82:	8b 10                	mov    (%eax),%edx
     f84:	8b 45 f8             	mov    -0x8(%ebp),%eax
     f87:	89 10                	mov    %edx,(%eax)
     f89:	eb 0a                	jmp    f95 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     f8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f8e:	8b 10                	mov    (%eax),%edx
     f90:	8b 45 f8             	mov    -0x8(%ebp),%eax
     f93:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     f95:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f98:	8b 40 04             	mov    0x4(%eax),%eax
     f9b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     fa2:	8b 45 fc             	mov    -0x4(%ebp),%eax
     fa5:	01 d0                	add    %edx,%eax
     fa7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     faa:	75 20                	jne    fcc <free+0xcf>
    p->s.size += bp->s.size;
     fac:	8b 45 fc             	mov    -0x4(%ebp),%eax
     faf:	8b 50 04             	mov    0x4(%eax),%edx
     fb2:	8b 45 f8             	mov    -0x8(%ebp),%eax
     fb5:	8b 40 04             	mov    0x4(%eax),%eax
     fb8:	01 c2                	add    %eax,%edx
     fba:	8b 45 fc             	mov    -0x4(%ebp),%eax
     fbd:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     fc0:	8b 45 f8             	mov    -0x8(%ebp),%eax
     fc3:	8b 10                	mov    (%eax),%edx
     fc5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     fc8:	89 10                	mov    %edx,(%eax)
     fca:	eb 08                	jmp    fd4 <free+0xd7>
  } else
    p->s.ptr = bp;
     fcc:	8b 45 fc             	mov    -0x4(%ebp),%eax
     fcf:	8b 55 f8             	mov    -0x8(%ebp),%edx
     fd2:	89 10                	mov    %edx,(%eax)
  freep = p;
     fd4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     fd7:	a3 b8 15 00 00       	mov    %eax,0x15b8
}
     fdc:	90                   	nop
     fdd:	c9                   	leave  
     fde:	c3                   	ret    

00000fdf <morecore>:

static Header*
morecore(uint nu)
{
     fdf:	55                   	push   %ebp
     fe0:	89 e5                	mov    %esp,%ebp
     fe2:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     fe5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     fec:	77 07                	ja     ff5 <morecore+0x16>
    nu = 4096;
     fee:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     ff5:	8b 45 08             	mov    0x8(%ebp),%eax
     ff8:	c1 e0 03             	shl    $0x3,%eax
     ffb:	83 ec 0c             	sub    $0xc,%esp
     ffe:	50                   	push   %eax
     fff:	e8 7b f5 ff ff       	call   57f <sbrk>
    1004:	83 c4 10             	add    $0x10,%esp
    1007:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    100a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    100e:	75 07                	jne    1017 <morecore+0x38>
    return 0;
    1010:	b8 00 00 00 00       	mov    $0x0,%eax
    1015:	eb 26                	jmp    103d <morecore+0x5e>
  hp = (Header*)p;
    1017:	8b 45 f4             	mov    -0xc(%ebp),%eax
    101a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    101d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1020:	8b 55 08             	mov    0x8(%ebp),%edx
    1023:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1026:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1029:	83 c0 08             	add    $0x8,%eax
    102c:	83 ec 0c             	sub    $0xc,%esp
    102f:	50                   	push   %eax
    1030:	e8 c8 fe ff ff       	call   efd <free>
    1035:	83 c4 10             	add    $0x10,%esp
  return freep;
    1038:	a1 b8 15 00 00       	mov    0x15b8,%eax
}
    103d:	c9                   	leave  
    103e:	c3                   	ret    

0000103f <malloc>:

void*
malloc(uint nbytes)
{
    103f:	55                   	push   %ebp
    1040:	89 e5                	mov    %esp,%ebp
    1042:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1045:	8b 45 08             	mov    0x8(%ebp),%eax
    1048:	83 c0 07             	add    $0x7,%eax
    104b:	c1 e8 03             	shr    $0x3,%eax
    104e:	83 c0 01             	add    $0x1,%eax
    1051:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1054:	a1 b8 15 00 00       	mov    0x15b8,%eax
    1059:	89 45 f0             	mov    %eax,-0x10(%ebp)
    105c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1060:	75 23                	jne    1085 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1062:	c7 45 f0 b0 15 00 00 	movl   $0x15b0,-0x10(%ebp)
    1069:	8b 45 f0             	mov    -0x10(%ebp),%eax
    106c:	a3 b8 15 00 00       	mov    %eax,0x15b8
    1071:	a1 b8 15 00 00       	mov    0x15b8,%eax
    1076:	a3 b0 15 00 00       	mov    %eax,0x15b0
    base.s.size = 0;
    107b:	c7 05 b4 15 00 00 00 	movl   $0x0,0x15b4
    1082:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1085:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1088:	8b 00                	mov    (%eax),%eax
    108a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    108d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1090:	8b 40 04             	mov    0x4(%eax),%eax
    1093:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1096:	72 4d                	jb     10e5 <malloc+0xa6>
      if(p->s.size == nunits)
    1098:	8b 45 f4             	mov    -0xc(%ebp),%eax
    109b:	8b 40 04             	mov    0x4(%eax),%eax
    109e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    10a1:	75 0c                	jne    10af <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    10a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10a6:	8b 10                	mov    (%eax),%edx
    10a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10ab:	89 10                	mov    %edx,(%eax)
    10ad:	eb 26                	jmp    10d5 <malloc+0x96>
      else {
        p->s.size -= nunits;
    10af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10b2:	8b 40 04             	mov    0x4(%eax),%eax
    10b5:	2b 45 ec             	sub    -0x14(%ebp),%eax
    10b8:	89 c2                	mov    %eax,%edx
    10ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10bd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    10c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10c3:	8b 40 04             	mov    0x4(%eax),%eax
    10c6:	c1 e0 03             	shl    $0x3,%eax
    10c9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    10cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10cf:	8b 55 ec             	mov    -0x14(%ebp),%edx
    10d2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    10d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10d8:	a3 b8 15 00 00       	mov    %eax,0x15b8
      return (void*)(p + 1);
    10dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10e0:	83 c0 08             	add    $0x8,%eax
    10e3:	eb 3b                	jmp    1120 <malloc+0xe1>
    }
    if(p == freep)
    10e5:	a1 b8 15 00 00       	mov    0x15b8,%eax
    10ea:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    10ed:	75 1e                	jne    110d <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    10ef:	83 ec 0c             	sub    $0xc,%esp
    10f2:	ff 75 ec             	pushl  -0x14(%ebp)
    10f5:	e8 e5 fe ff ff       	call   fdf <morecore>
    10fa:	83 c4 10             	add    $0x10,%esp
    10fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1100:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1104:	75 07                	jne    110d <malloc+0xce>
        return 0;
    1106:	b8 00 00 00 00       	mov    $0x0,%eax
    110b:	eb 13                	jmp    1120 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    110d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1110:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1113:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1116:	8b 00                	mov    (%eax),%eax
    1118:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    111b:	e9 6d ff ff ff       	jmp    108d <malloc+0x4e>
}
    1120:	c9                   	leave  
    1121:	c3                   	ret    
