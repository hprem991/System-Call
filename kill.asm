
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
  12:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
  14:	83 3b 01             	cmpl   $0x1,(%ebx)
  17:	7f 17                	jg     30 <main+0x30>
    printf(2, "usage: kill pid...\n");
  19:	83 ec 08             	sub    $0x8,%esp
  1c:	68 f4 0e 00 00       	push   $0xef4
  21:	6a 02                	push   $0x2
  23:	e8 16 0b 00 00       	call   b3e <printf>
  28:	83 c4 10             	add    $0x10,%esp
    exit();
  2b:	e8 99 02 00 00       	call   2c9 <exit>
  }
  for(i=1; i<argc; i++)
  30:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  37:	eb 2d                	jmp    66 <main+0x66>
    kill(atoi(argv[i]));
  39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  43:	8b 43 04             	mov    0x4(%ebx),%eax
  46:	01 d0                	add    %edx,%eax
  48:	8b 00                	mov    (%eax),%eax
  4a:	83 ec 0c             	sub    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	e8 e4 01 00 00       	call   237 <atoi>
  53:	83 c4 10             	add    $0x10,%esp
  56:	83 ec 0c             	sub    $0xc,%esp
  59:	50                   	push   %eax
  5a:	e8 9a 02 00 00       	call   2f9 <kill>
  5f:	83 c4 10             	add    $0x10,%esp

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  62:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  66:	8b 45 f4             	mov    -0xc(%ebp),%eax
  69:	3b 03                	cmp    (%ebx),%eax
  6b:	7c cc                	jl     39 <main+0x39>
    kill(atoi(argv[i]));
  exit();
  6d:	e8 57 02 00 00       	call   2c9 <exit>

00000072 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  72:	55                   	push   %ebp
  73:	89 e5                	mov    %esp,%ebp
  75:	57                   	push   %edi
  76:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  77:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7a:	8b 55 10             	mov    0x10(%ebp),%edx
  7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  80:	89 cb                	mov    %ecx,%ebx
  82:	89 df                	mov    %ebx,%edi
  84:	89 d1                	mov    %edx,%ecx
  86:	fc                   	cld    
  87:	f3 aa                	rep stos %al,%es:(%edi)
  89:	89 ca                	mov    %ecx,%edx
  8b:	89 fb                	mov    %edi,%ebx
  8d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  90:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  93:	90                   	nop
  94:	5b                   	pop    %ebx
  95:	5f                   	pop    %edi
  96:	5d                   	pop    %ebp
  97:	c3                   	ret    

00000098 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  98:	55                   	push   %ebp
  99:	89 e5                	mov    %esp,%ebp
  9b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a4:	90                   	nop
  a5:	8b 45 08             	mov    0x8(%ebp),%eax
  a8:	8d 50 01             	lea    0x1(%eax),%edx
  ab:	89 55 08             	mov    %edx,0x8(%ebp)
  ae:	8b 55 0c             	mov    0xc(%ebp),%edx
  b1:	8d 4a 01             	lea    0x1(%edx),%ecx
  b4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b7:	0f b6 12             	movzbl (%edx),%edx
  ba:	88 10                	mov    %dl,(%eax)
  bc:	0f b6 00             	movzbl (%eax),%eax
  bf:	84 c0                	test   %al,%al
  c1:	75 e2                	jne    a5 <strcpy+0xd>
    ;
  return os;
  c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c6:	c9                   	leave  
  c7:	c3                   	ret    

000000c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c8:	55                   	push   %ebp
  c9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cb:	eb 08                	jmp    d5 <strcmp+0xd>
    p++, q++;
  cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d5:	8b 45 08             	mov    0x8(%ebp),%eax
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	74 10                	je     ef <strcmp+0x27>
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	0f b6 10             	movzbl (%eax),%edx
  e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  e8:	0f b6 00             	movzbl (%eax),%eax
  eb:	38 c2                	cmp    %al,%dl
  ed:	74 de                	je     cd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  ef:	8b 45 08             	mov    0x8(%ebp),%eax
  f2:	0f b6 00             	movzbl (%eax),%eax
  f5:	0f b6 d0             	movzbl %al,%edx
  f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  fb:	0f b6 00             	movzbl (%eax),%eax
  fe:	0f b6 c0             	movzbl %al,%eax
 101:	29 c2                	sub    %eax,%edx
 103:	89 d0                	mov    %edx,%eax
}
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    

00000107 <strlen>:

uint
strlen(char *s)
{
 107:	55                   	push   %ebp
 108:	89 e5                	mov    %esp,%ebp
 10a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 114:	eb 04                	jmp    11a <strlen+0x13>
 116:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11d:	8b 45 08             	mov    0x8(%ebp),%eax
 120:	01 d0                	add    %edx,%eax
 122:	0f b6 00             	movzbl (%eax),%eax
 125:	84 c0                	test   %al,%al
 127:	75 ed                	jne    116 <strlen+0xf>
    ;
  return n;
 129:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12c:	c9                   	leave  
 12d:	c3                   	ret    

0000012e <memset>:

void*
memset(void *dst, int c, uint n)
{
 12e:	55                   	push   %ebp
 12f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 131:	8b 45 10             	mov    0x10(%ebp),%eax
 134:	50                   	push   %eax
 135:	ff 75 0c             	pushl  0xc(%ebp)
 138:	ff 75 08             	pushl  0x8(%ebp)
 13b:	e8 32 ff ff ff       	call   72 <stosb>
 140:	83 c4 0c             	add    $0xc,%esp
  return dst;
 143:	8b 45 08             	mov    0x8(%ebp),%eax
}
 146:	c9                   	leave  
 147:	c3                   	ret    

00000148 <strchr>:

char*
strchr(const char *s, char c)
{
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	83 ec 04             	sub    $0x4,%esp
 14e:	8b 45 0c             	mov    0xc(%ebp),%eax
 151:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 154:	eb 14                	jmp    16a <strchr+0x22>
    if(*s == c)
 156:	8b 45 08             	mov    0x8(%ebp),%eax
 159:	0f b6 00             	movzbl (%eax),%eax
 15c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 15f:	75 05                	jne    166 <strchr+0x1e>
      return (char*)s;
 161:	8b 45 08             	mov    0x8(%ebp),%eax
 164:	eb 13                	jmp    179 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 166:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16a:	8b 45 08             	mov    0x8(%ebp),%eax
 16d:	0f b6 00             	movzbl (%eax),%eax
 170:	84 c0                	test   %al,%al
 172:	75 e2                	jne    156 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 174:	b8 00 00 00 00       	mov    $0x0,%eax
}
 179:	c9                   	leave  
 17a:	c3                   	ret    

0000017b <gets>:

char*
gets(char *buf, int max)
{
 17b:	55                   	push   %ebp
 17c:	89 e5                	mov    %esp,%ebp
 17e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 181:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 188:	eb 42                	jmp    1cc <gets+0x51>
    cc = read(0, &c, 1);
 18a:	83 ec 04             	sub    $0x4,%esp
 18d:	6a 01                	push   $0x1
 18f:	8d 45 ef             	lea    -0x11(%ebp),%eax
 192:	50                   	push   %eax
 193:	6a 00                	push   $0x0
 195:	e8 47 01 00 00       	call   2e1 <read>
 19a:	83 c4 10             	add    $0x10,%esp
 19d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a4:	7e 33                	jle    1d9 <gets+0x5e>
      break;
    buf[i++] = c;
 1a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1a9:	8d 50 01             	lea    0x1(%eax),%edx
 1ac:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1af:	89 c2                	mov    %eax,%edx
 1b1:	8b 45 08             	mov    0x8(%ebp),%eax
 1b4:	01 c2                	add    %eax,%edx
 1b6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ba:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1bc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c0:	3c 0a                	cmp    $0xa,%al
 1c2:	74 16                	je     1da <gets+0x5f>
 1c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c8:	3c 0d                	cmp    $0xd,%al
 1ca:	74 0e                	je     1da <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1cf:	83 c0 01             	add    $0x1,%eax
 1d2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d5:	7c b3                	jl     18a <gets+0xf>
 1d7:	eb 01                	jmp    1da <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1d9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1da:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1dd:	8b 45 08             	mov    0x8(%ebp),%eax
 1e0:	01 d0                	add    %edx,%eax
 1e2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1e8:	c9                   	leave  
 1e9:	c3                   	ret    

000001ea <stat>:

int
stat(char *n, struct stat *st)
{
 1ea:	55                   	push   %ebp
 1eb:	89 e5                	mov    %esp,%ebp
 1ed:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f0:	83 ec 08             	sub    $0x8,%esp
 1f3:	6a 00                	push   $0x0
 1f5:	ff 75 08             	pushl  0x8(%ebp)
 1f8:	e8 0c 01 00 00       	call   309 <open>
 1fd:	83 c4 10             	add    $0x10,%esp
 200:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 203:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 207:	79 07                	jns    210 <stat+0x26>
    return -1;
 209:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 20e:	eb 25                	jmp    235 <stat+0x4b>
  r = fstat(fd, st);
 210:	83 ec 08             	sub    $0x8,%esp
 213:	ff 75 0c             	pushl  0xc(%ebp)
 216:	ff 75 f4             	pushl  -0xc(%ebp)
 219:	e8 03 01 00 00       	call   321 <fstat>
 21e:	83 c4 10             	add    $0x10,%esp
 221:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 224:	83 ec 0c             	sub    $0xc,%esp
 227:	ff 75 f4             	pushl  -0xc(%ebp)
 22a:	e8 c2 00 00 00       	call   2f1 <close>
 22f:	83 c4 10             	add    $0x10,%esp
  return r;
 232:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 235:	c9                   	leave  
 236:	c3                   	ret    

00000237 <atoi>:

int
atoi(const char *s)
{
 237:	55                   	push   %ebp
 238:	89 e5                	mov    %esp,%ebp
 23a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 23d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 244:	eb 25                	jmp    26b <atoi+0x34>
    n = n*10 + *s++ - '0';
 246:	8b 55 fc             	mov    -0x4(%ebp),%edx
 249:	89 d0                	mov    %edx,%eax
 24b:	c1 e0 02             	shl    $0x2,%eax
 24e:	01 d0                	add    %edx,%eax
 250:	01 c0                	add    %eax,%eax
 252:	89 c1                	mov    %eax,%ecx
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	8d 50 01             	lea    0x1(%eax),%edx
 25a:	89 55 08             	mov    %edx,0x8(%ebp)
 25d:	0f b6 00             	movzbl (%eax),%eax
 260:	0f be c0             	movsbl %al,%eax
 263:	01 c8                	add    %ecx,%eax
 265:	83 e8 30             	sub    $0x30,%eax
 268:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
 26e:	0f b6 00             	movzbl (%eax),%eax
 271:	3c 2f                	cmp    $0x2f,%al
 273:	7e 0a                	jle    27f <atoi+0x48>
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	0f b6 00             	movzbl (%eax),%eax
 27b:	3c 39                	cmp    $0x39,%al
 27d:	7e c7                	jle    246 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 27f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 282:	c9                   	leave  
 283:	c3                   	ret    

00000284 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 290:	8b 45 0c             	mov    0xc(%ebp),%eax
 293:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 296:	eb 17                	jmp    2af <memmove+0x2b>
    *dst++ = *src++;
 298:	8b 45 fc             	mov    -0x4(%ebp),%eax
 29b:	8d 50 01             	lea    0x1(%eax),%edx
 29e:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2a4:	8d 4a 01             	lea    0x1(%edx),%ecx
 2a7:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2aa:	0f b6 12             	movzbl (%edx),%edx
 2ad:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2af:	8b 45 10             	mov    0x10(%ebp),%eax
 2b2:	8d 50 ff             	lea    -0x1(%eax),%edx
 2b5:	89 55 10             	mov    %edx,0x10(%ebp)
 2b8:	85 c0                	test   %eax,%eax
 2ba:	7f dc                	jg     298 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2bc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2bf:	c9                   	leave  
 2c0:	c3                   	ret    

000002c1 <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
 2c1:	b8 01 00 00 00       	mov    $0x1,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <exit>:
SYSCALL(exit)
 2c9:	b8 02 00 00 00       	mov    $0x2,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <wait>:
SYSCALL(wait)
 2d1:	b8 03 00 00 00       	mov    $0x3,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <pipe>:
SYSCALL(pipe)
 2d9:	b8 04 00 00 00       	mov    $0x4,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <read>:
SYSCALL(read)
 2e1:	b8 05 00 00 00       	mov    $0x5,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <write>:
SYSCALL(write)
 2e9:	b8 10 00 00 00       	mov    $0x10,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <close>:
SYSCALL(close)
 2f1:	b8 15 00 00 00       	mov    $0x15,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <kill>:
SYSCALL(kill)
 2f9:	b8 06 00 00 00       	mov    $0x6,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <exec>:
SYSCALL(exec)
 301:	b8 07 00 00 00       	mov    $0x7,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <open>:
SYSCALL(open)
 309:	b8 0f 00 00 00       	mov    $0xf,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <mknod>:
SYSCALL(mknod)
 311:	b8 11 00 00 00       	mov    $0x11,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <unlink>:
SYSCALL(unlink)
 319:	b8 12 00 00 00       	mov    $0x12,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <fstat>:
SYSCALL(fstat)
 321:	b8 08 00 00 00       	mov    $0x8,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <link>:
SYSCALL(link)
 329:	b8 13 00 00 00       	mov    $0x13,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <mkdir>:
SYSCALL(mkdir)
 331:	b8 14 00 00 00       	mov    $0x14,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <chdir>:
SYSCALL(chdir)
 339:	b8 09 00 00 00       	mov    $0x9,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <dup>:
SYSCALL(dup)
 341:	b8 0a 00 00 00       	mov    $0xa,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <getpid>:
SYSCALL(getpid)
 349:	b8 0b 00 00 00       	mov    $0xb,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <sbrk>:
SYSCALL(sbrk)
 351:	b8 0c 00 00 00       	mov    $0xc,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <sleep>:
SYSCALL(sleep)
 359:	b8 0d 00 00 00       	mov    $0xd,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <uptime>:
SYSCALL(uptime)
 361:	b8 0e 00 00 00       	mov    $0xe,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <date>:

// Assignment starts here

SYSCALL(date)
 369:	b8 16 00 00 00       	mov    $0x16,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <str_ls_call1>:
 371:	6c                   	insb   (%dx),%es:(%edi)
 372:	73 5f                	jae    3d3 <ls_call6+0x4>
 374:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 377:	6c                   	insb   (%dx),%es:(%edi)
 378:	31 00                	xor    %eax,(%eax)

0000037a <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
 37a:	b8 71 03 00 00       	mov    $0x371,%eax
 37f:	cd 41                	int    $0x41
 381:	c3                   	ret    

00000382 <str_ls_call2>:
 382:	6c                   	insb   (%dx),%es:(%edi)
 383:	73 5f                	jae    3e4 <ls_call7+0x4>
 385:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 388:	6c                   	insb   (%dx),%es:(%edi)
 389:	32 00                	xor    (%eax),%al

0000038b <ls_call2>:
CS550LSSYSCALL(ls_call2)
 38b:	b8 82 03 00 00       	mov    $0x382,%eax
 390:	cd 41                	int    $0x41
 392:	c3                   	ret    

00000393 <str_ls_call3>:
 393:	6c                   	insb   (%dx),%es:(%edi)
 394:	73 5f                	jae    3f5 <ls_call8+0x4>
 396:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 399:	6c                   	insb   (%dx),%es:(%edi)
 39a:	33 00                	xor    (%eax),%eax

0000039c <ls_call3>:
CS550LSSYSCALL(ls_call3)
 39c:	b8 93 03 00 00       	mov    $0x393,%eax
 3a1:	cd 41                	int    $0x41
 3a3:	c3                   	ret    

000003a4 <str_ls_call4>:
 3a4:	6c                   	insb   (%dx),%es:(%edi)
 3a5:	73 5f                	jae    406 <ls_call9+0x4>
 3a7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3aa:	6c                   	insb   (%dx),%es:(%edi)
 3ab:	34 00                	xor    $0x0,%al

000003ad <ls_call4>:
CS550LSSYSCALL(ls_call4)
 3ad:	b8 a4 03 00 00       	mov    $0x3a4,%eax
 3b2:	cd 41                	int    $0x41
 3b4:	c3                   	ret    

000003b5 <str_ls_call5>:
 3b5:	6c                   	insb   (%dx),%es:(%edi)
 3b6:	73 5f                	jae    417 <ls_call10+0x3>
 3b8:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3bb:	6c                   	insb   (%dx),%es:(%edi)
 3bc:	35                   	.byte 0x35
	...

000003be <ls_call5>:
CS550LSSYSCALL(ls_call5)
 3be:	b8 b5 03 00 00       	mov    $0x3b5,%eax
 3c3:	cd 41                	int    $0x41
 3c5:	c3                   	ret    

000003c6 <str_ls_call6>:
 3c6:	6c                   	insb   (%dx),%es:(%edi)
 3c7:	73 5f                	jae    428 <ls_call11+0x2>
 3c9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3cc:	6c                   	insb   (%dx),%es:(%edi)
 3cd:	36                   	ss
	...

000003cf <ls_call6>:
CS550LSSYSCALL(ls_call6)
 3cf:	b8 c6 03 00 00       	mov    $0x3c6,%eax
 3d4:	cd 41                	int    $0x41
 3d6:	c3                   	ret    

000003d7 <str_ls_call7>:
 3d7:	6c                   	insb   (%dx),%es:(%edi)
 3d8:	73 5f                	jae    439 <ls_call12+0x1>
 3da:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3dd:	6c                   	insb   (%dx),%es:(%edi)
 3de:	37                   	aaa    
	...

000003e0 <ls_call7>:
CS550LSSYSCALL(ls_call7)
 3e0:	b8 d7 03 00 00       	mov    $0x3d7,%eax
 3e5:	cd 41                	int    $0x41
 3e7:	c3                   	ret    

000003e8 <str_ls_call8>:
 3e8:	6c                   	insb   (%dx),%es:(%edi)
 3e9:	73 5f                	jae    44a <ls_call13>
 3eb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3ee:	6c                   	insb   (%dx),%es:(%edi)
 3ef:	38 00                	cmp    %al,(%eax)

000003f1 <ls_call8>:
CS550LSSYSCALL(ls_call8)
 3f1:	b8 e8 03 00 00       	mov    $0x3e8,%eax
 3f6:	cd 41                	int    $0x41
 3f8:	c3                   	ret    

000003f9 <str_ls_call9>:
 3f9:	6c                   	insb   (%dx),%es:(%edi)
 3fa:	73 5f                	jae    45b <str_ls_call14+0x9>
 3fc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3ff:	6c                   	insb   (%dx),%es:(%edi)
 400:	39 00                	cmp    %eax,(%eax)

00000402 <ls_call9>:
CS550LSSYSCALL(ls_call9)
 402:	b8 f9 03 00 00       	mov    $0x3f9,%eax
 407:	cd 41                	int    $0x41
 409:	c3                   	ret    

0000040a <str_ls_call10>:
 40a:	6c                   	insb   (%dx),%es:(%edi)
 40b:	73 5f                	jae    46c <str_ls_call15+0x8>
 40d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 410:	6c                   	insb   (%dx),%es:(%edi)
 411:	31 30                	xor    %esi,(%eax)
	...

00000414 <ls_call10>:
CS550LSSYSCALL(ls_call10)
 414:	b8 0a 04 00 00       	mov    $0x40a,%eax
 419:	cd 41                	int    $0x41
 41b:	c3                   	ret    

0000041c <str_ls_call11>:
 41c:	6c                   	insb   (%dx),%es:(%edi)
 41d:	73 5f                	jae    47e <str_ls_call16+0x8>
 41f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 422:	6c                   	insb   (%dx),%es:(%edi)
 423:	31 31                	xor    %esi,(%ecx)
	...

00000426 <ls_call11>:
CS550LSSYSCALL(ls_call11)
 426:	b8 1c 04 00 00       	mov    $0x41c,%eax
 42b:	cd 41                	int    $0x41
 42d:	c3                   	ret    

0000042e <str_ls_call12>:
 42e:	6c                   	insb   (%dx),%es:(%edi)
 42f:	73 5f                	jae    490 <str_ls_call17+0x8>
 431:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 434:	6c                   	insb   (%dx),%es:(%edi)
 435:	31 32                	xor    %esi,(%edx)
	...

00000438 <ls_call12>:
CS550LSSYSCALL(ls_call12)
 438:	b8 2e 04 00 00       	mov    $0x42e,%eax
 43d:	cd 41                	int    $0x41
 43f:	c3                   	ret    

00000440 <str_ls_call13>:
 440:	6c                   	insb   (%dx),%es:(%edi)
 441:	73 5f                	jae    4a2 <str_ls_call18+0x8>
 443:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 446:	6c                   	insb   (%dx),%es:(%edi)
 447:	31 33                	xor    %esi,(%ebx)
	...

0000044a <ls_call13>:
CS550LSSYSCALL(ls_call13)
 44a:	b8 40 04 00 00       	mov    $0x440,%eax
 44f:	cd 41                	int    $0x41
 451:	c3                   	ret    

00000452 <str_ls_call14>:
 452:	6c                   	insb   (%dx),%es:(%edi)
 453:	73 5f                	jae    4b4 <str_ls_call19+0x8>
 455:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 458:	6c                   	insb   (%dx),%es:(%edi)
 459:	31 34 00             	xor    %esi,(%eax,%eax,1)

0000045c <ls_call14>:
CS550LSSYSCALL(ls_call14)
 45c:	b8 52 04 00 00       	mov    $0x452,%eax
 461:	cd 41                	int    $0x41
 463:	c3                   	ret    

00000464 <str_ls_call15>:
 464:	6c                   	insb   (%dx),%es:(%edi)
 465:	73 5f                	jae    4c6 <str_ls_call20+0x8>
 467:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 46a:	6c                   	insb   (%dx),%es:(%edi)
 46b:	31                   	.byte 0x31
 46c:	35                   	.byte 0x35
	...

0000046e <ls_call15>:
CS550LSSYSCALL(ls_call15)
 46e:	b8 64 04 00 00       	mov    $0x464,%eax
 473:	cd 41                	int    $0x41
 475:	c3                   	ret    

00000476 <str_ls_call16>:
 476:	6c                   	insb   (%dx),%es:(%edi)
 477:	73 5f                	jae    4d8 <str_ls_call21+0x8>
 479:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 47c:	6c                   	insb   (%dx),%es:(%edi)
 47d:	31 36                	xor    %esi,(%esi)
	...

00000480 <ls_call16>:
CS550LSSYSCALL(ls_call16)
 480:	b8 76 04 00 00       	mov    $0x476,%eax
 485:	cd 41                	int    $0x41
 487:	c3                   	ret    

00000488 <str_ls_call17>:
 488:	6c                   	insb   (%dx),%es:(%edi)
 489:	73 5f                	jae    4ea <str_ls_call22+0x8>
 48b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 48e:	6c                   	insb   (%dx),%es:(%edi)
 48f:	31 37                	xor    %esi,(%edi)
	...

00000492 <ls_call17>:
CS550LSSYSCALL(ls_call17)
 492:	b8 88 04 00 00       	mov    $0x488,%eax
 497:	cd 41                	int    $0x41
 499:	c3                   	ret    

0000049a <str_ls_call18>:
 49a:	6c                   	insb   (%dx),%es:(%edi)
 49b:	73 5f                	jae    4fc <str_ls_call23+0x8>
 49d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4a0:	6c                   	insb   (%dx),%es:(%edi)
 4a1:	31 38                	xor    %edi,(%eax)
	...

000004a4 <ls_call18>:
CS550LSSYSCALL(ls_call18)
 4a4:	b8 9a 04 00 00       	mov    $0x49a,%eax
 4a9:	cd 41                	int    $0x41
 4ab:	c3                   	ret    

000004ac <str_ls_call19>:
 4ac:	6c                   	insb   (%dx),%es:(%edi)
 4ad:	73 5f                	jae    50e <str_ls_call24+0x8>
 4af:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4b2:	6c                   	insb   (%dx),%es:(%edi)
 4b3:	31 39                	xor    %edi,(%ecx)
	...

000004b6 <ls_call19>:
CS550LSSYSCALL(ls_call19)
 4b6:	b8 ac 04 00 00       	mov    $0x4ac,%eax
 4bb:	cd 41                	int    $0x41
 4bd:	c3                   	ret    

000004be <str_ls_call20>:
 4be:	6c                   	insb   (%dx),%es:(%edi)
 4bf:	73 5f                	jae    520 <str_ls_call25+0x8>
 4c1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4c4:	6c                   	insb   (%dx),%es:(%edi)
 4c5:	32 30                	xor    (%eax),%dh
	...

000004c8 <ls_call20>:
CS550LSSYSCALL(ls_call20)
 4c8:	b8 be 04 00 00       	mov    $0x4be,%eax
 4cd:	cd 41                	int    $0x41
 4cf:	c3                   	ret    

000004d0 <str_ls_call21>:
 4d0:	6c                   	insb   (%dx),%es:(%edi)
 4d1:	73 5f                	jae    532 <str_ls_call26+0x8>
 4d3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4d6:	6c                   	insb   (%dx),%es:(%edi)
 4d7:	32 31                	xor    (%ecx),%dh
	...

000004da <ls_call21>:
CS550LSSYSCALL(ls_call21)
 4da:	b8 d0 04 00 00       	mov    $0x4d0,%eax
 4df:	cd 41                	int    $0x41
 4e1:	c3                   	ret    

000004e2 <str_ls_call22>:
 4e2:	6c                   	insb   (%dx),%es:(%edi)
 4e3:	73 5f                	jae    544 <str_ls_call27+0x8>
 4e5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4e8:	6c                   	insb   (%dx),%es:(%edi)
 4e9:	32 32                	xor    (%edx),%dh
	...

000004ec <ls_call22>:
CS550LSSYSCALL(ls_call22)
 4ec:	b8 e2 04 00 00       	mov    $0x4e2,%eax
 4f1:	cd 41                	int    $0x41
 4f3:	c3                   	ret    

000004f4 <str_ls_call23>:
 4f4:	6c                   	insb   (%dx),%es:(%edi)
 4f5:	73 5f                	jae    556 <str_ls_call28+0x8>
 4f7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4fa:	6c                   	insb   (%dx),%es:(%edi)
 4fb:	32 33                	xor    (%ebx),%dh
	...

000004fe <ls_call23>:
CS550LSSYSCALL(ls_call23)
 4fe:	b8 f4 04 00 00       	mov    $0x4f4,%eax
 503:	cd 41                	int    $0x41
 505:	c3                   	ret    

00000506 <str_ls_call24>:
 506:	6c                   	insb   (%dx),%es:(%edi)
 507:	73 5f                	jae    568 <str_ls_call29+0x8>
 509:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 50c:	6c                   	insb   (%dx),%es:(%edi)
 50d:	32 34 00             	xor    (%eax,%eax,1),%dh

00000510 <ls_call24>:
CS550LSSYSCALL(ls_call24)
 510:	b8 06 05 00 00       	mov    $0x506,%eax
 515:	cd 41                	int    $0x41
 517:	c3                   	ret    

00000518 <str_ls_call25>:
 518:	6c                   	insb   (%dx),%es:(%edi)
 519:	73 5f                	jae    57a <str_ls_call30+0x8>
 51b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 51e:	6c                   	insb   (%dx),%es:(%edi)
 51f:	32                   	.byte 0x32
 520:	35                   	.byte 0x35
	...

00000522 <ls_call25>:
CS550LSSYSCALL(ls_call25)
 522:	b8 18 05 00 00       	mov    $0x518,%eax
 527:	cd 41                	int    $0x41
 529:	c3                   	ret    

0000052a <str_ls_call26>:
 52a:	6c                   	insb   (%dx),%es:(%edi)
 52b:	73 5f                	jae    58c <str_ls_call31+0x8>
 52d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 530:	6c                   	insb   (%dx),%es:(%edi)
 531:	32 36                	xor    (%esi),%dh
	...

00000534 <ls_call26>:
CS550LSSYSCALL(ls_call26)
 534:	b8 2a 05 00 00       	mov    $0x52a,%eax
 539:	cd 41                	int    $0x41
 53b:	c3                   	ret    

0000053c <str_ls_call27>:
 53c:	6c                   	insb   (%dx),%es:(%edi)
 53d:	73 5f                	jae    59e <str_ls_call32+0x8>
 53f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 542:	6c                   	insb   (%dx),%es:(%edi)
 543:	32 37                	xor    (%edi),%dh
	...

00000546 <ls_call27>:
CS550LSSYSCALL(ls_call27)
 546:	b8 3c 05 00 00       	mov    $0x53c,%eax
 54b:	cd 41                	int    $0x41
 54d:	c3                   	ret    

0000054e <str_ls_call28>:
 54e:	6c                   	insb   (%dx),%es:(%edi)
 54f:	73 5f                	jae    5b0 <str_ls_call33+0x8>
 551:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 554:	6c                   	insb   (%dx),%es:(%edi)
 555:	32 38                	xor    (%eax),%bh
	...

00000558 <ls_call28>:
CS550LSSYSCALL(ls_call28)
 558:	b8 4e 05 00 00       	mov    $0x54e,%eax
 55d:	cd 41                	int    $0x41
 55f:	c3                   	ret    

00000560 <str_ls_call29>:
 560:	6c                   	insb   (%dx),%es:(%edi)
 561:	73 5f                	jae    5c2 <str_ls_call34+0x8>
 563:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 566:	6c                   	insb   (%dx),%es:(%edi)
 567:	32 39                	xor    (%ecx),%bh
	...

0000056a <ls_call29>:
CS550LSSYSCALL(ls_call29)
 56a:	b8 60 05 00 00       	mov    $0x560,%eax
 56f:	cd 41                	int    $0x41
 571:	c3                   	ret    

00000572 <str_ls_call30>:
 572:	6c                   	insb   (%dx),%es:(%edi)
 573:	73 5f                	jae    5d4 <str_ls_call35+0x8>
 575:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 578:	6c                   	insb   (%dx),%es:(%edi)
 579:	33 30                	xor    (%eax),%esi
	...

0000057c <ls_call30>:
CS550LSSYSCALL(ls_call30)
 57c:	b8 72 05 00 00       	mov    $0x572,%eax
 581:	cd 41                	int    $0x41
 583:	c3                   	ret    

00000584 <str_ls_call31>:
 584:	6c                   	insb   (%dx),%es:(%edi)
 585:	73 5f                	jae    5e6 <str_ls_call36+0x8>
 587:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 58a:	6c                   	insb   (%dx),%es:(%edi)
 58b:	33 31                	xor    (%ecx),%esi
	...

0000058e <ls_call31>:
CS550LSSYSCALL(ls_call31)
 58e:	b8 84 05 00 00       	mov    $0x584,%eax
 593:	cd 41                	int    $0x41
 595:	c3                   	ret    

00000596 <str_ls_call32>:
 596:	6c                   	insb   (%dx),%es:(%edi)
 597:	73 5f                	jae    5f8 <str_ls_call37+0x8>
 599:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 59c:	6c                   	insb   (%dx),%es:(%edi)
 59d:	33 32                	xor    (%edx),%esi
	...

000005a0 <ls_call32>:
CS550LSSYSCALL(ls_call32)
 5a0:	b8 96 05 00 00       	mov    $0x596,%eax
 5a5:	cd 41                	int    $0x41
 5a7:	c3                   	ret    

000005a8 <str_ls_call33>:
 5a8:	6c                   	insb   (%dx),%es:(%edi)
 5a9:	73 5f                	jae    60a <str_ls_call38+0x8>
 5ab:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5ae:	6c                   	insb   (%dx),%es:(%edi)
 5af:	33 33                	xor    (%ebx),%esi
	...

000005b2 <ls_call33>:
CS550LSSYSCALL(ls_call33)
 5b2:	b8 a8 05 00 00       	mov    $0x5a8,%eax
 5b7:	cd 41                	int    $0x41
 5b9:	c3                   	ret    

000005ba <str_ls_call34>:
 5ba:	6c                   	insb   (%dx),%es:(%edi)
 5bb:	73 5f                	jae    61c <str_ls_call39+0x8>
 5bd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5c0:	6c                   	insb   (%dx),%es:(%edi)
 5c1:	33 34 00             	xor    (%eax,%eax,1),%esi

000005c4 <ls_call34>:
CS550LSSYSCALL(ls_call34)
 5c4:	b8 ba 05 00 00       	mov    $0x5ba,%eax
 5c9:	cd 41                	int    $0x41
 5cb:	c3                   	ret    

000005cc <str_ls_call35>:
 5cc:	6c                   	insb   (%dx),%es:(%edi)
 5cd:	73 5f                	jae    62e <str_ls_call40+0x8>
 5cf:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5d2:	6c                   	insb   (%dx),%es:(%edi)
 5d3:	33                   	.byte 0x33
 5d4:	35                   	.byte 0x35
	...

000005d6 <ls_call35>:
CS550LSSYSCALL(ls_call35)
 5d6:	b8 cc 05 00 00       	mov    $0x5cc,%eax
 5db:	cd 41                	int    $0x41
 5dd:	c3                   	ret    

000005de <str_ls_call36>:
 5de:	6c                   	insb   (%dx),%es:(%edi)
 5df:	73 5f                	jae    640 <str_ls_call41+0x8>
 5e1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5e4:	6c                   	insb   (%dx),%es:(%edi)
 5e5:	33 36                	xor    (%esi),%esi
	...

000005e8 <ls_call36>:
CS550LSSYSCALL(ls_call36)
 5e8:	b8 de 05 00 00       	mov    $0x5de,%eax
 5ed:	cd 41                	int    $0x41
 5ef:	c3                   	ret    

000005f0 <str_ls_call37>:
 5f0:	6c                   	insb   (%dx),%es:(%edi)
 5f1:	73 5f                	jae    652 <str_ls_call42+0x8>
 5f3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5f6:	6c                   	insb   (%dx),%es:(%edi)
 5f7:	33 37                	xor    (%edi),%esi
	...

000005fa <ls_call37>:
CS550LSSYSCALL(ls_call37)
 5fa:	b8 f0 05 00 00       	mov    $0x5f0,%eax
 5ff:	cd 41                	int    $0x41
 601:	c3                   	ret    

00000602 <str_ls_call38>:
 602:	6c                   	insb   (%dx),%es:(%edi)
 603:	73 5f                	jae    664 <str_ls_call43+0x8>
 605:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 608:	6c                   	insb   (%dx),%es:(%edi)
 609:	33 38                	xor    (%eax),%edi
	...

0000060c <ls_call38>:
CS550LSSYSCALL(ls_call38)
 60c:	b8 02 06 00 00       	mov    $0x602,%eax
 611:	cd 41                	int    $0x41
 613:	c3                   	ret    

00000614 <str_ls_call39>:
 614:	6c                   	insb   (%dx),%es:(%edi)
 615:	73 5f                	jae    676 <str_ls_call44+0x8>
 617:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 61a:	6c                   	insb   (%dx),%es:(%edi)
 61b:	33 39                	xor    (%ecx),%edi
	...

0000061e <ls_call39>:
CS550LSSYSCALL(ls_call39)
 61e:	b8 14 06 00 00       	mov    $0x614,%eax
 623:	cd 41                	int    $0x41
 625:	c3                   	ret    

00000626 <str_ls_call40>:
 626:	6c                   	insb   (%dx),%es:(%edi)
 627:	73 5f                	jae    688 <str_ls_call45+0x8>
 629:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 62c:	6c                   	insb   (%dx),%es:(%edi)
 62d:	34 30                	xor    $0x30,%al
	...

00000630 <ls_call40>:
CS550LSSYSCALL(ls_call40)
 630:	b8 26 06 00 00       	mov    $0x626,%eax
 635:	cd 41                	int    $0x41
 637:	c3                   	ret    

00000638 <str_ls_call41>:
 638:	6c                   	insb   (%dx),%es:(%edi)
 639:	73 5f                	jae    69a <str_ls_call46+0x8>
 63b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 63e:	6c                   	insb   (%dx),%es:(%edi)
 63f:	34 31                	xor    $0x31,%al
	...

00000642 <ls_call41>:
CS550LSSYSCALL(ls_call41)
 642:	b8 38 06 00 00       	mov    $0x638,%eax
 647:	cd 41                	int    $0x41
 649:	c3                   	ret    

0000064a <str_ls_call42>:
 64a:	6c                   	insb   (%dx),%es:(%edi)
 64b:	73 5f                	jae    6ac <str_ls_call47+0x8>
 64d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 650:	6c                   	insb   (%dx),%es:(%edi)
 651:	34 32                	xor    $0x32,%al
	...

00000654 <ls_call42>:
CS550LSSYSCALL(ls_call42)
 654:	b8 4a 06 00 00       	mov    $0x64a,%eax
 659:	cd 41                	int    $0x41
 65b:	c3                   	ret    

0000065c <str_ls_call43>:
 65c:	6c                   	insb   (%dx),%es:(%edi)
 65d:	73 5f                	jae    6be <str_ls_call48+0x8>
 65f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 662:	6c                   	insb   (%dx),%es:(%edi)
 663:	34 33                	xor    $0x33,%al
	...

00000666 <ls_call43>:
CS550LSSYSCALL(ls_call43)
 666:	b8 5c 06 00 00       	mov    $0x65c,%eax
 66b:	cd 41                	int    $0x41
 66d:	c3                   	ret    

0000066e <str_ls_call44>:
 66e:	6c                   	insb   (%dx),%es:(%edi)
 66f:	73 5f                	jae    6d0 <str_ls_call49+0x8>
 671:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 674:	6c                   	insb   (%dx),%es:(%edi)
 675:	34 34                	xor    $0x34,%al
	...

00000678 <ls_call44>:
CS550LSSYSCALL(ls_call44)
 678:	b8 6e 06 00 00       	mov    $0x66e,%eax
 67d:	cd 41                	int    $0x41
 67f:	c3                   	ret    

00000680 <str_ls_call45>:
 680:	6c                   	insb   (%dx),%es:(%edi)
 681:	73 5f                	jae    6e2 <str_ls_call50+0x8>
 683:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 686:	6c                   	insb   (%dx),%es:(%edi)
 687:	34 35                	xor    $0x35,%al
	...

0000068a <ls_call45>:
CS550LSSYSCALL(ls_call45)
 68a:	b8 80 06 00 00       	mov    $0x680,%eax
 68f:	cd 41                	int    $0x41
 691:	c3                   	ret    

00000692 <str_ls_call46>:
 692:	6c                   	insb   (%dx),%es:(%edi)
 693:	73 5f                	jae    6f4 <str_ht_call1+0x8>
 695:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 698:	6c                   	insb   (%dx),%es:(%edi)
 699:	34 36                	xor    $0x36,%al
	...

0000069c <ls_call46>:
CS550LSSYSCALL(ls_call46)
 69c:	b8 92 06 00 00       	mov    $0x692,%eax
 6a1:	cd 41                	int    $0x41
 6a3:	c3                   	ret    

000006a4 <str_ls_call47>:
 6a4:	6c                   	insb   (%dx),%es:(%edi)
 6a5:	73 5f                	jae    706 <ht_call2>
 6a7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6aa:	6c                   	insb   (%dx),%es:(%edi)
 6ab:	34 37                	xor    $0x37,%al
	...

000006ae <ls_call47>:
CS550LSSYSCALL(ls_call47)
 6ae:	b8 a4 06 00 00       	mov    $0x6a4,%eax
 6b3:	cd 41                	int    $0x41
 6b5:	c3                   	ret    

000006b6 <str_ls_call48>:
 6b6:	6c                   	insb   (%dx),%es:(%edi)
 6b7:	73 5f                	jae    718 <ht_call3+0x1>
 6b9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6bc:	6c                   	insb   (%dx),%es:(%edi)
 6bd:	34 38                	xor    $0x38,%al
	...

000006c0 <ls_call48>:
CS550LSSYSCALL(ls_call48)
 6c0:	b8 b6 06 00 00       	mov    $0x6b6,%eax
 6c5:	cd 41                	int    $0x41
 6c7:	c3                   	ret    

000006c8 <str_ls_call49>:
 6c8:	6c                   	insb   (%dx),%es:(%edi)
 6c9:	73 5f                	jae    72a <ht_call4+0x2>
 6cb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6ce:	6c                   	insb   (%dx),%es:(%edi)
 6cf:	34 39                	xor    $0x39,%al
	...

000006d2 <ls_call49>:
CS550LSSYSCALL(ls_call49)
 6d2:	b8 c8 06 00 00       	mov    $0x6c8,%eax
 6d7:	cd 41                	int    $0x41
 6d9:	c3                   	ret    

000006da <str_ls_call50>:
 6da:	6c                   	insb   (%dx),%es:(%edi)
 6db:	73 5f                	jae    73c <ht_call5+0x3>
 6dd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6e0:	6c                   	insb   (%dx),%es:(%edi)
 6e1:	35                   	.byte 0x35
 6e2:	30 00                	xor    %al,(%eax)

000006e4 <ls_call50>:
CS550LSSYSCALL(ls_call50)
 6e4:	b8 da 06 00 00       	mov    $0x6da,%eax
 6e9:	cd 41                	int    $0x41
 6eb:	c3                   	ret    

000006ec <str_ht_call1>:
 6ec:	68 74 5f 63 61       	push   $0x61635f74
 6f1:	6c                   	insb   (%dx),%es:(%edi)
 6f2:	6c                   	insb   (%dx),%es:(%edi)
 6f3:	31 00                	xor    %eax,(%eax)

000006f5 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
 6f5:	b8 ec 06 00 00       	mov    $0x6ec,%eax
 6fa:	cd 42                	int    $0x42
 6fc:	c3                   	ret    

000006fd <str_ht_call2>:
 6fd:	68 74 5f 63 61       	push   $0x61635f74
 702:	6c                   	insb   (%dx),%es:(%edi)
 703:	6c                   	insb   (%dx),%es:(%edi)
 704:	32 00                	xor    (%eax),%al

00000706 <ht_call2>:
CS550HTSYSCALL(ht_call2)
 706:	b8 fd 06 00 00       	mov    $0x6fd,%eax
 70b:	cd 42                	int    $0x42
 70d:	c3                   	ret    

0000070e <str_ht_call3>:
 70e:	68 74 5f 63 61       	push   $0x61635f74
 713:	6c                   	insb   (%dx),%es:(%edi)
 714:	6c                   	insb   (%dx),%es:(%edi)
 715:	33 00                	xor    (%eax),%eax

00000717 <ht_call3>:
CS550HTSYSCALL(ht_call3)
 717:	b8 0e 07 00 00       	mov    $0x70e,%eax
 71c:	cd 42                	int    $0x42
 71e:	c3                   	ret    

0000071f <str_ht_call4>:
 71f:	68 74 5f 63 61       	push   $0x61635f74
 724:	6c                   	insb   (%dx),%es:(%edi)
 725:	6c                   	insb   (%dx),%es:(%edi)
 726:	34 00                	xor    $0x0,%al

00000728 <ht_call4>:
CS550HTSYSCALL(ht_call4)
 728:	b8 1f 07 00 00       	mov    $0x71f,%eax
 72d:	cd 42                	int    $0x42
 72f:	c3                   	ret    

00000730 <str_ht_call5>:
 730:	68 74 5f 63 61       	push   $0x61635f74
 735:	6c                   	insb   (%dx),%es:(%edi)
 736:	6c                   	insb   (%dx),%es:(%edi)
 737:	35                   	.byte 0x35
	...

00000739 <ht_call5>:
CS550HTSYSCALL(ht_call5)
 739:	b8 30 07 00 00       	mov    $0x730,%eax
 73e:	cd 42                	int    $0x42
 740:	c3                   	ret    

00000741 <str_ht_call6>:
 741:	68 74 5f 63 61       	push   $0x61635f74
 746:	6c                   	insb   (%dx),%es:(%edi)
 747:	6c                   	insb   (%dx),%es:(%edi)
 748:	36                   	ss
	...

0000074a <ht_call6>:
CS550HTSYSCALL(ht_call6)
 74a:	b8 41 07 00 00       	mov    $0x741,%eax
 74f:	cd 42                	int    $0x42
 751:	c3                   	ret    

00000752 <str_ht_call7>:
 752:	68 74 5f 63 61       	push   $0x61635f74
 757:	6c                   	insb   (%dx),%es:(%edi)
 758:	6c                   	insb   (%dx),%es:(%edi)
 759:	37                   	aaa    
	...

0000075b <ht_call7>:
CS550HTSYSCALL(ht_call7)
 75b:	b8 52 07 00 00       	mov    $0x752,%eax
 760:	cd 42                	int    $0x42
 762:	c3                   	ret    

00000763 <str_ht_call8>:
 763:	68 74 5f 63 61       	push   $0x61635f74
 768:	6c                   	insb   (%dx),%es:(%edi)
 769:	6c                   	insb   (%dx),%es:(%edi)
 76a:	38 00                	cmp    %al,(%eax)

0000076c <ht_call8>:
CS550HTSYSCALL(ht_call8)
 76c:	b8 63 07 00 00       	mov    $0x763,%eax
 771:	cd 42                	int    $0x42
 773:	c3                   	ret    

00000774 <str_ht_call9>:
 774:	68 74 5f 63 61       	push   $0x61635f74
 779:	6c                   	insb   (%dx),%es:(%edi)
 77a:	6c                   	insb   (%dx),%es:(%edi)
 77b:	39 00                	cmp    %eax,(%eax)

0000077d <ht_call9>:
CS550HTSYSCALL(ht_call9)
 77d:	b8 74 07 00 00       	mov    $0x774,%eax
 782:	cd 42                	int    $0x42
 784:	c3                   	ret    

00000785 <str_ht_call10>:
 785:	68 74 5f 63 61       	push   $0x61635f74
 78a:	6c                   	insb   (%dx),%es:(%edi)
 78b:	6c                   	insb   (%dx),%es:(%edi)
 78c:	31 30                	xor    %esi,(%eax)
	...

0000078f <ht_call10>:
CS550HTSYSCALL(ht_call10)
 78f:	b8 85 07 00 00       	mov    $0x785,%eax
 794:	cd 42                	int    $0x42
 796:	c3                   	ret    

00000797 <str_ht_call11>:
 797:	68 74 5f 63 61       	push   $0x61635f74
 79c:	6c                   	insb   (%dx),%es:(%edi)
 79d:	6c                   	insb   (%dx),%es:(%edi)
 79e:	31 31                	xor    %esi,(%ecx)
	...

000007a1 <ht_call11>:
CS550HTSYSCALL(ht_call11)
 7a1:	b8 97 07 00 00       	mov    $0x797,%eax
 7a6:	cd 42                	int    $0x42
 7a8:	c3                   	ret    

000007a9 <str_ht_call12>:
 7a9:	68 74 5f 63 61       	push   $0x61635f74
 7ae:	6c                   	insb   (%dx),%es:(%edi)
 7af:	6c                   	insb   (%dx),%es:(%edi)
 7b0:	31 32                	xor    %esi,(%edx)
	...

000007b3 <ht_call12>:
CS550HTSYSCALL(ht_call12)
 7b3:	b8 a9 07 00 00       	mov    $0x7a9,%eax
 7b8:	cd 42                	int    $0x42
 7ba:	c3                   	ret    

000007bb <str_ht_call13>:
 7bb:	68 74 5f 63 61       	push   $0x61635f74
 7c0:	6c                   	insb   (%dx),%es:(%edi)
 7c1:	6c                   	insb   (%dx),%es:(%edi)
 7c2:	31 33                	xor    %esi,(%ebx)
	...

000007c5 <ht_call13>:
CS550HTSYSCALL(ht_call13)
 7c5:	b8 bb 07 00 00       	mov    $0x7bb,%eax
 7ca:	cd 42                	int    $0x42
 7cc:	c3                   	ret    

000007cd <str_ht_call14>:
 7cd:	68 74 5f 63 61       	push   $0x61635f74
 7d2:	6c                   	insb   (%dx),%es:(%edi)
 7d3:	6c                   	insb   (%dx),%es:(%edi)
 7d4:	31 34 00             	xor    %esi,(%eax,%eax,1)

000007d7 <ht_call14>:
CS550HTSYSCALL(ht_call14)
 7d7:	b8 cd 07 00 00       	mov    $0x7cd,%eax
 7dc:	cd 42                	int    $0x42
 7de:	c3                   	ret    

000007df <str_ht_call15>:
 7df:	68 74 5f 63 61       	push   $0x61635f74
 7e4:	6c                   	insb   (%dx),%es:(%edi)
 7e5:	6c                   	insb   (%dx),%es:(%edi)
 7e6:	31                   	.byte 0x31
 7e7:	35                   	.byte 0x35
	...

000007e9 <ht_call15>:
CS550HTSYSCALL(ht_call15)
 7e9:	b8 df 07 00 00       	mov    $0x7df,%eax
 7ee:	cd 42                	int    $0x42
 7f0:	c3                   	ret    

000007f1 <str_ht_call16>:
 7f1:	68 74 5f 63 61       	push   $0x61635f74
 7f6:	6c                   	insb   (%dx),%es:(%edi)
 7f7:	6c                   	insb   (%dx),%es:(%edi)
 7f8:	31 36                	xor    %esi,(%esi)
	...

000007fb <ht_call16>:
CS550HTSYSCALL(ht_call16)
 7fb:	b8 f1 07 00 00       	mov    $0x7f1,%eax
 800:	cd 42                	int    $0x42
 802:	c3                   	ret    

00000803 <str_ht_call17>:
 803:	68 74 5f 63 61       	push   $0x61635f74
 808:	6c                   	insb   (%dx),%es:(%edi)
 809:	6c                   	insb   (%dx),%es:(%edi)
 80a:	31 37                	xor    %esi,(%edi)
	...

0000080d <ht_call17>:
CS550HTSYSCALL(ht_call17)
 80d:	b8 03 08 00 00       	mov    $0x803,%eax
 812:	cd 42                	int    $0x42
 814:	c3                   	ret    

00000815 <str_ht_call18>:
 815:	68 74 5f 63 61       	push   $0x61635f74
 81a:	6c                   	insb   (%dx),%es:(%edi)
 81b:	6c                   	insb   (%dx),%es:(%edi)
 81c:	31 38                	xor    %edi,(%eax)
	...

0000081f <ht_call18>:
CS550HTSYSCALL(ht_call18)
 81f:	b8 15 08 00 00       	mov    $0x815,%eax
 824:	cd 42                	int    $0x42
 826:	c3                   	ret    

00000827 <str_ht_call19>:
 827:	68 74 5f 63 61       	push   $0x61635f74
 82c:	6c                   	insb   (%dx),%es:(%edi)
 82d:	6c                   	insb   (%dx),%es:(%edi)
 82e:	31 39                	xor    %edi,(%ecx)
	...

00000831 <ht_call19>:
CS550HTSYSCALL(ht_call19)
 831:	b8 27 08 00 00       	mov    $0x827,%eax
 836:	cd 42                	int    $0x42
 838:	c3                   	ret    

00000839 <str_ht_call20>:
 839:	68 74 5f 63 61       	push   $0x61635f74
 83e:	6c                   	insb   (%dx),%es:(%edi)
 83f:	6c                   	insb   (%dx),%es:(%edi)
 840:	32 30                	xor    (%eax),%dh
	...

00000843 <ht_call20>:
CS550HTSYSCALL(ht_call20)
 843:	b8 39 08 00 00       	mov    $0x839,%eax
 848:	cd 42                	int    $0x42
 84a:	c3                   	ret    

0000084b <str_ht_call21>:
 84b:	68 74 5f 63 61       	push   $0x61635f74
 850:	6c                   	insb   (%dx),%es:(%edi)
 851:	6c                   	insb   (%dx),%es:(%edi)
 852:	32 31                	xor    (%ecx),%dh
	...

00000855 <ht_call21>:
CS550HTSYSCALL(ht_call21)
 855:	b8 4b 08 00 00       	mov    $0x84b,%eax
 85a:	cd 42                	int    $0x42
 85c:	c3                   	ret    

0000085d <str_ht_call22>:
 85d:	68 74 5f 63 61       	push   $0x61635f74
 862:	6c                   	insb   (%dx),%es:(%edi)
 863:	6c                   	insb   (%dx),%es:(%edi)
 864:	32 32                	xor    (%edx),%dh
	...

00000867 <ht_call22>:
CS550HTSYSCALL(ht_call22)
 867:	b8 5d 08 00 00       	mov    $0x85d,%eax
 86c:	cd 42                	int    $0x42
 86e:	c3                   	ret    

0000086f <str_ht_call23>:
 86f:	68 74 5f 63 61       	push   $0x61635f74
 874:	6c                   	insb   (%dx),%es:(%edi)
 875:	6c                   	insb   (%dx),%es:(%edi)
 876:	32 33                	xor    (%ebx),%dh
	...

00000879 <ht_call23>:
CS550HTSYSCALL(ht_call23)
 879:	b8 6f 08 00 00       	mov    $0x86f,%eax
 87e:	cd 42                	int    $0x42
 880:	c3                   	ret    

00000881 <str_ht_call24>:
 881:	68 74 5f 63 61       	push   $0x61635f74
 886:	6c                   	insb   (%dx),%es:(%edi)
 887:	6c                   	insb   (%dx),%es:(%edi)
 888:	32 34 00             	xor    (%eax,%eax,1),%dh

0000088b <ht_call24>:
CS550HTSYSCALL(ht_call24)
 88b:	b8 81 08 00 00       	mov    $0x881,%eax
 890:	cd 42                	int    $0x42
 892:	c3                   	ret    

00000893 <str_ht_call25>:
 893:	68 74 5f 63 61       	push   $0x61635f74
 898:	6c                   	insb   (%dx),%es:(%edi)
 899:	6c                   	insb   (%dx),%es:(%edi)
 89a:	32                   	.byte 0x32
 89b:	35                   	.byte 0x35
	...

0000089d <ht_call25>:
CS550HTSYSCALL(ht_call25)
 89d:	b8 93 08 00 00       	mov    $0x893,%eax
 8a2:	cd 42                	int    $0x42
 8a4:	c3                   	ret    

000008a5 <str_ht_call26>:
 8a5:	68 74 5f 63 61       	push   $0x61635f74
 8aa:	6c                   	insb   (%dx),%es:(%edi)
 8ab:	6c                   	insb   (%dx),%es:(%edi)
 8ac:	32 36                	xor    (%esi),%dh
	...

000008af <ht_call26>:
CS550HTSYSCALL(ht_call26)
 8af:	b8 a5 08 00 00       	mov    $0x8a5,%eax
 8b4:	cd 42                	int    $0x42
 8b6:	c3                   	ret    

000008b7 <str_ht_call27>:
 8b7:	68 74 5f 63 61       	push   $0x61635f74
 8bc:	6c                   	insb   (%dx),%es:(%edi)
 8bd:	6c                   	insb   (%dx),%es:(%edi)
 8be:	32 37                	xor    (%edi),%dh
	...

000008c1 <ht_call27>:
CS550HTSYSCALL(ht_call27)
 8c1:	b8 b7 08 00 00       	mov    $0x8b7,%eax
 8c6:	cd 42                	int    $0x42
 8c8:	c3                   	ret    

000008c9 <str_ht_call28>:
 8c9:	68 74 5f 63 61       	push   $0x61635f74
 8ce:	6c                   	insb   (%dx),%es:(%edi)
 8cf:	6c                   	insb   (%dx),%es:(%edi)
 8d0:	32 38                	xor    (%eax),%bh
	...

000008d3 <ht_call28>:
CS550HTSYSCALL(ht_call28)
 8d3:	b8 c9 08 00 00       	mov    $0x8c9,%eax
 8d8:	cd 42                	int    $0x42
 8da:	c3                   	ret    

000008db <str_ht_call29>:
 8db:	68 74 5f 63 61       	push   $0x61635f74
 8e0:	6c                   	insb   (%dx),%es:(%edi)
 8e1:	6c                   	insb   (%dx),%es:(%edi)
 8e2:	32 39                	xor    (%ecx),%bh
	...

000008e5 <ht_call29>:
CS550HTSYSCALL(ht_call29)
 8e5:	b8 db 08 00 00       	mov    $0x8db,%eax
 8ea:	cd 42                	int    $0x42
 8ec:	c3                   	ret    

000008ed <str_ht_call30>:
 8ed:	68 74 5f 63 61       	push   $0x61635f74
 8f2:	6c                   	insb   (%dx),%es:(%edi)
 8f3:	6c                   	insb   (%dx),%es:(%edi)
 8f4:	33 30                	xor    (%eax),%esi
	...

000008f7 <ht_call30>:
CS550HTSYSCALL(ht_call30)
 8f7:	b8 ed 08 00 00       	mov    $0x8ed,%eax
 8fc:	cd 42                	int    $0x42
 8fe:	c3                   	ret    

000008ff <str_ht_call31>:
 8ff:	68 74 5f 63 61       	push   $0x61635f74
 904:	6c                   	insb   (%dx),%es:(%edi)
 905:	6c                   	insb   (%dx),%es:(%edi)
 906:	33 31                	xor    (%ecx),%esi
	...

00000909 <ht_call31>:
CS550HTSYSCALL(ht_call31)
 909:	b8 ff 08 00 00       	mov    $0x8ff,%eax
 90e:	cd 42                	int    $0x42
 910:	c3                   	ret    

00000911 <str_ht_call32>:
 911:	68 74 5f 63 61       	push   $0x61635f74
 916:	6c                   	insb   (%dx),%es:(%edi)
 917:	6c                   	insb   (%dx),%es:(%edi)
 918:	33 32                	xor    (%edx),%esi
	...

0000091b <ht_call32>:
CS550HTSYSCALL(ht_call32)
 91b:	b8 11 09 00 00       	mov    $0x911,%eax
 920:	cd 42                	int    $0x42
 922:	c3                   	ret    

00000923 <str_ht_call33>:
 923:	68 74 5f 63 61       	push   $0x61635f74
 928:	6c                   	insb   (%dx),%es:(%edi)
 929:	6c                   	insb   (%dx),%es:(%edi)
 92a:	33 33                	xor    (%ebx),%esi
	...

0000092d <ht_call33>:
CS550HTSYSCALL(ht_call33)
 92d:	b8 23 09 00 00       	mov    $0x923,%eax
 932:	cd 42                	int    $0x42
 934:	c3                   	ret    

00000935 <str_ht_call34>:
 935:	68 74 5f 63 61       	push   $0x61635f74
 93a:	6c                   	insb   (%dx),%es:(%edi)
 93b:	6c                   	insb   (%dx),%es:(%edi)
 93c:	33 34 00             	xor    (%eax,%eax,1),%esi

0000093f <ht_call34>:
CS550HTSYSCALL(ht_call34)
 93f:	b8 35 09 00 00       	mov    $0x935,%eax
 944:	cd 42                	int    $0x42
 946:	c3                   	ret    

00000947 <str_ht_call35>:
 947:	68 74 5f 63 61       	push   $0x61635f74
 94c:	6c                   	insb   (%dx),%es:(%edi)
 94d:	6c                   	insb   (%dx),%es:(%edi)
 94e:	33                   	.byte 0x33
 94f:	35                   	.byte 0x35
	...

00000951 <ht_call35>:
CS550HTSYSCALL(ht_call35)
 951:	b8 47 09 00 00       	mov    $0x947,%eax
 956:	cd 42                	int    $0x42
 958:	c3                   	ret    

00000959 <str_ht_call36>:
 959:	68 74 5f 63 61       	push   $0x61635f74
 95e:	6c                   	insb   (%dx),%es:(%edi)
 95f:	6c                   	insb   (%dx),%es:(%edi)
 960:	33 36                	xor    (%esi),%esi
	...

00000963 <ht_call36>:
CS550HTSYSCALL(ht_call36)
 963:	b8 59 09 00 00       	mov    $0x959,%eax
 968:	cd 42                	int    $0x42
 96a:	c3                   	ret    

0000096b <str_ht_call37>:
 96b:	68 74 5f 63 61       	push   $0x61635f74
 970:	6c                   	insb   (%dx),%es:(%edi)
 971:	6c                   	insb   (%dx),%es:(%edi)
 972:	33 37                	xor    (%edi),%esi
	...

00000975 <ht_call37>:
CS550HTSYSCALL(ht_call37)
 975:	b8 6b 09 00 00       	mov    $0x96b,%eax
 97a:	cd 42                	int    $0x42
 97c:	c3                   	ret    

0000097d <str_ht_call38>:
 97d:	68 74 5f 63 61       	push   $0x61635f74
 982:	6c                   	insb   (%dx),%es:(%edi)
 983:	6c                   	insb   (%dx),%es:(%edi)
 984:	33 38                	xor    (%eax),%edi
	...

00000987 <ht_call38>:
CS550HTSYSCALL(ht_call38)
 987:	b8 7d 09 00 00       	mov    $0x97d,%eax
 98c:	cd 42                	int    $0x42
 98e:	c3                   	ret    

0000098f <str_ht_call39>:
 98f:	68 74 5f 63 61       	push   $0x61635f74
 994:	6c                   	insb   (%dx),%es:(%edi)
 995:	6c                   	insb   (%dx),%es:(%edi)
 996:	33 39                	xor    (%ecx),%edi
	...

00000999 <ht_call39>:
CS550HTSYSCALL(ht_call39)
 999:	b8 8f 09 00 00       	mov    $0x98f,%eax
 99e:	cd 42                	int    $0x42
 9a0:	c3                   	ret    

000009a1 <str_ht_call40>:
 9a1:	68 74 5f 63 61       	push   $0x61635f74
 9a6:	6c                   	insb   (%dx),%es:(%edi)
 9a7:	6c                   	insb   (%dx),%es:(%edi)
 9a8:	34 30                	xor    $0x30,%al
	...

000009ab <ht_call40>:
CS550HTSYSCALL(ht_call40)
 9ab:	b8 a1 09 00 00       	mov    $0x9a1,%eax
 9b0:	cd 42                	int    $0x42
 9b2:	c3                   	ret    

000009b3 <str_ht_call41>:
 9b3:	68 74 5f 63 61       	push   $0x61635f74
 9b8:	6c                   	insb   (%dx),%es:(%edi)
 9b9:	6c                   	insb   (%dx),%es:(%edi)
 9ba:	34 31                	xor    $0x31,%al
	...

000009bd <ht_call41>:
CS550HTSYSCALL(ht_call41)
 9bd:	b8 b3 09 00 00       	mov    $0x9b3,%eax
 9c2:	cd 42                	int    $0x42
 9c4:	c3                   	ret    

000009c5 <str_ht_call42>:
 9c5:	68 74 5f 63 61       	push   $0x61635f74
 9ca:	6c                   	insb   (%dx),%es:(%edi)
 9cb:	6c                   	insb   (%dx),%es:(%edi)
 9cc:	34 32                	xor    $0x32,%al
	...

000009cf <ht_call42>:
CS550HTSYSCALL(ht_call42)
 9cf:	b8 c5 09 00 00       	mov    $0x9c5,%eax
 9d4:	cd 42                	int    $0x42
 9d6:	c3                   	ret    

000009d7 <str_ht_call43>:
 9d7:	68 74 5f 63 61       	push   $0x61635f74
 9dc:	6c                   	insb   (%dx),%es:(%edi)
 9dd:	6c                   	insb   (%dx),%es:(%edi)
 9de:	34 33                	xor    $0x33,%al
	...

000009e1 <ht_call43>:
CS550HTSYSCALL(ht_call43)
 9e1:	b8 d7 09 00 00       	mov    $0x9d7,%eax
 9e6:	cd 42                	int    $0x42
 9e8:	c3                   	ret    

000009e9 <str_ht_call44>:
 9e9:	68 74 5f 63 61       	push   $0x61635f74
 9ee:	6c                   	insb   (%dx),%es:(%edi)
 9ef:	6c                   	insb   (%dx),%es:(%edi)
 9f0:	34 34                	xor    $0x34,%al
	...

000009f3 <ht_call44>:
CS550HTSYSCALL(ht_call44)
 9f3:	b8 e9 09 00 00       	mov    $0x9e9,%eax
 9f8:	cd 42                	int    $0x42
 9fa:	c3                   	ret    

000009fb <str_ht_call45>:
 9fb:	68 74 5f 63 61       	push   $0x61635f74
 a00:	6c                   	insb   (%dx),%es:(%edi)
 a01:	6c                   	insb   (%dx),%es:(%edi)
 a02:	34 35                	xor    $0x35,%al
	...

00000a05 <ht_call45>:
CS550HTSYSCALL(ht_call45)
 a05:	b8 fb 09 00 00       	mov    $0x9fb,%eax
 a0a:	cd 42                	int    $0x42
 a0c:	c3                   	ret    

00000a0d <str_ht_call46>:
 a0d:	68 74 5f 63 61       	push   $0x61635f74
 a12:	6c                   	insb   (%dx),%es:(%edi)
 a13:	6c                   	insb   (%dx),%es:(%edi)
 a14:	34 36                	xor    $0x36,%al
	...

00000a17 <ht_call46>:
CS550HTSYSCALL(ht_call46)
 a17:	b8 0d 0a 00 00       	mov    $0xa0d,%eax
 a1c:	cd 42                	int    $0x42
 a1e:	c3                   	ret    

00000a1f <str_ht_call47>:
 a1f:	68 74 5f 63 61       	push   $0x61635f74
 a24:	6c                   	insb   (%dx),%es:(%edi)
 a25:	6c                   	insb   (%dx),%es:(%edi)
 a26:	34 37                	xor    $0x37,%al
	...

00000a29 <ht_call47>:
CS550HTSYSCALL(ht_call47)
 a29:	b8 1f 0a 00 00       	mov    $0xa1f,%eax
 a2e:	cd 42                	int    $0x42
 a30:	c3                   	ret    

00000a31 <str_ht_call48>:
 a31:	68 74 5f 63 61       	push   $0x61635f74
 a36:	6c                   	insb   (%dx),%es:(%edi)
 a37:	6c                   	insb   (%dx),%es:(%edi)
 a38:	34 38                	xor    $0x38,%al
	...

00000a3b <ht_call48>:
CS550HTSYSCALL(ht_call48)
 a3b:	b8 31 0a 00 00       	mov    $0xa31,%eax
 a40:	cd 42                	int    $0x42
 a42:	c3                   	ret    

00000a43 <str_ht_call49>:
 a43:	68 74 5f 63 61       	push   $0x61635f74
 a48:	6c                   	insb   (%dx),%es:(%edi)
 a49:	6c                   	insb   (%dx),%es:(%edi)
 a4a:	34 39                	xor    $0x39,%al
	...

00000a4d <ht_call49>:
CS550HTSYSCALL(ht_call49)
 a4d:	b8 43 0a 00 00       	mov    $0xa43,%eax
 a52:	cd 42                	int    $0x42
 a54:	c3                   	ret    

00000a55 <str_ht_call50>:
 a55:	68 74 5f 63 61       	push   $0x61635f74
 a5a:	6c                   	insb   (%dx),%es:(%edi)
 a5b:	6c                   	insb   (%dx),%es:(%edi)
 a5c:	35                   	.byte 0x35
 a5d:	30 00                	xor    %al,(%eax)

00000a5f <ht_call50>:
CS550HTSYSCALL(ht_call50)
 a5f:	b8 55 0a 00 00       	mov    $0xa55,%eax
 a64:	cd 42                	int    $0x42
 a66:	c3                   	ret    

00000a67 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 a67:	55                   	push   %ebp
 a68:	89 e5                	mov    %esp,%ebp
 a6a:	83 ec 18             	sub    $0x18,%esp
 a6d:	8b 45 0c             	mov    0xc(%ebp),%eax
 a70:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 a73:	83 ec 04             	sub    $0x4,%esp
 a76:	6a 01                	push   $0x1
 a78:	8d 45 f4             	lea    -0xc(%ebp),%eax
 a7b:	50                   	push   %eax
 a7c:	ff 75 08             	pushl  0x8(%ebp)
 a7f:	e8 65 f8 ff ff       	call   2e9 <write>
 a84:	83 c4 10             	add    $0x10,%esp
}
 a87:	90                   	nop
 a88:	c9                   	leave  
 a89:	c3                   	ret    

00000a8a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 a8a:	55                   	push   %ebp
 a8b:	89 e5                	mov    %esp,%ebp
 a8d:	53                   	push   %ebx
 a8e:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 a91:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 a98:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 a9c:	74 17                	je     ab5 <printint+0x2b>
 a9e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 aa2:	79 11                	jns    ab5 <printint+0x2b>
    neg = 1;
 aa4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 aab:	8b 45 0c             	mov    0xc(%ebp),%eax
 aae:	f7 d8                	neg    %eax
 ab0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 ab3:	eb 06                	jmp    abb <printint+0x31>
  } else {
    x = xx;
 ab5:	8b 45 0c             	mov    0xc(%ebp),%eax
 ab8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 abb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 ac2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 ac5:	8d 41 01             	lea    0x1(%ecx),%eax
 ac8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 acb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 ace:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ad1:	ba 00 00 00 00       	mov    $0x0,%edx
 ad6:	f7 f3                	div    %ebx
 ad8:	89 d0                	mov    %edx,%eax
 ada:	0f b6 80 5c 11 00 00 	movzbl 0x115c(%eax),%eax
 ae1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 ae5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 ae8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aeb:	ba 00 00 00 00       	mov    $0x0,%edx
 af0:	f7 f3                	div    %ebx
 af2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 af5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 af9:	75 c7                	jne    ac2 <printint+0x38>
  if(neg)
 afb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 aff:	74 2d                	je     b2e <printint+0xa4>
    buf[i++] = '-';
 b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b04:	8d 50 01             	lea    0x1(%eax),%edx
 b07:	89 55 f4             	mov    %edx,-0xc(%ebp)
 b0a:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 b0f:	eb 1d                	jmp    b2e <printint+0xa4>
    putc(fd, buf[i]);
 b11:	8d 55 dc             	lea    -0x24(%ebp),%edx
 b14:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b17:	01 d0                	add    %edx,%eax
 b19:	0f b6 00             	movzbl (%eax),%eax
 b1c:	0f be c0             	movsbl %al,%eax
 b1f:	83 ec 08             	sub    $0x8,%esp
 b22:	50                   	push   %eax
 b23:	ff 75 08             	pushl  0x8(%ebp)
 b26:	e8 3c ff ff ff       	call   a67 <putc>
 b2b:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 b2e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 b32:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b36:	79 d9                	jns    b11 <printint+0x87>
    putc(fd, buf[i]);
}
 b38:	90                   	nop
 b39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b3c:	c9                   	leave  
 b3d:	c3                   	ret    

00000b3e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 b3e:	55                   	push   %ebp
 b3f:	89 e5                	mov    %esp,%ebp
 b41:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 b44:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 b4b:	8d 45 0c             	lea    0xc(%ebp),%eax
 b4e:	83 c0 04             	add    $0x4,%eax
 b51:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 b54:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 b5b:	e9 59 01 00 00       	jmp    cb9 <printf+0x17b>
    c = fmt[i] & 0xff;
 b60:	8b 55 0c             	mov    0xc(%ebp),%edx
 b63:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b66:	01 d0                	add    %edx,%eax
 b68:	0f b6 00             	movzbl (%eax),%eax
 b6b:	0f be c0             	movsbl %al,%eax
 b6e:	25 ff 00 00 00       	and    $0xff,%eax
 b73:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 b76:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b7a:	75 2c                	jne    ba8 <printf+0x6a>
      if(c == '%'){
 b7c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 b80:	75 0c                	jne    b8e <printf+0x50>
        state = '%';
 b82:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 b89:	e9 27 01 00 00       	jmp    cb5 <printf+0x177>
      } else {
        putc(fd, c);
 b8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 b91:	0f be c0             	movsbl %al,%eax
 b94:	83 ec 08             	sub    $0x8,%esp
 b97:	50                   	push   %eax
 b98:	ff 75 08             	pushl  0x8(%ebp)
 b9b:	e8 c7 fe ff ff       	call   a67 <putc>
 ba0:	83 c4 10             	add    $0x10,%esp
 ba3:	e9 0d 01 00 00       	jmp    cb5 <printf+0x177>
      }
    } else if(state == '%'){
 ba8:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 bac:	0f 85 03 01 00 00    	jne    cb5 <printf+0x177>
      if(c == 'd'){
 bb2:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 bb6:	75 1e                	jne    bd6 <printf+0x98>
        printint(fd, *ap, 10, 1);
 bb8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 bbb:	8b 00                	mov    (%eax),%eax
 bbd:	6a 01                	push   $0x1
 bbf:	6a 0a                	push   $0xa
 bc1:	50                   	push   %eax
 bc2:	ff 75 08             	pushl  0x8(%ebp)
 bc5:	e8 c0 fe ff ff       	call   a8a <printint>
 bca:	83 c4 10             	add    $0x10,%esp
        ap++;
 bcd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 bd1:	e9 d8 00 00 00       	jmp    cae <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 bd6:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 bda:	74 06                	je     be2 <printf+0xa4>
 bdc:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 be0:	75 1e                	jne    c00 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 be2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 be5:	8b 00                	mov    (%eax),%eax
 be7:	6a 00                	push   $0x0
 be9:	6a 10                	push   $0x10
 beb:	50                   	push   %eax
 bec:	ff 75 08             	pushl  0x8(%ebp)
 bef:	e8 96 fe ff ff       	call   a8a <printint>
 bf4:	83 c4 10             	add    $0x10,%esp
        ap++;
 bf7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 bfb:	e9 ae 00 00 00       	jmp    cae <printf+0x170>
      } else if(c == 's'){
 c00:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 c04:	75 43                	jne    c49 <printf+0x10b>
        s = (char*)*ap;
 c06:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c09:	8b 00                	mov    (%eax),%eax
 c0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 c0e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 c12:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c16:	75 25                	jne    c3d <printf+0xff>
          s = "(null)";
 c18:	c7 45 f4 08 0f 00 00 	movl   $0xf08,-0xc(%ebp)
        while(*s != 0){
 c1f:	eb 1c                	jmp    c3d <printf+0xff>
          putc(fd, *s);
 c21:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c24:	0f b6 00             	movzbl (%eax),%eax
 c27:	0f be c0             	movsbl %al,%eax
 c2a:	83 ec 08             	sub    $0x8,%esp
 c2d:	50                   	push   %eax
 c2e:	ff 75 08             	pushl  0x8(%ebp)
 c31:	e8 31 fe ff ff       	call   a67 <putc>
 c36:	83 c4 10             	add    $0x10,%esp
          s++;
 c39:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 c3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c40:	0f b6 00             	movzbl (%eax),%eax
 c43:	84 c0                	test   %al,%al
 c45:	75 da                	jne    c21 <printf+0xe3>
 c47:	eb 65                	jmp    cae <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 c49:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 c4d:	75 1d                	jne    c6c <printf+0x12e>
        putc(fd, *ap);
 c4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c52:	8b 00                	mov    (%eax),%eax
 c54:	0f be c0             	movsbl %al,%eax
 c57:	83 ec 08             	sub    $0x8,%esp
 c5a:	50                   	push   %eax
 c5b:	ff 75 08             	pushl  0x8(%ebp)
 c5e:	e8 04 fe ff ff       	call   a67 <putc>
 c63:	83 c4 10             	add    $0x10,%esp
        ap++;
 c66:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 c6a:	eb 42                	jmp    cae <printf+0x170>
      } else if(c == '%'){
 c6c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 c70:	75 17                	jne    c89 <printf+0x14b>
        putc(fd, c);
 c72:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c75:	0f be c0             	movsbl %al,%eax
 c78:	83 ec 08             	sub    $0x8,%esp
 c7b:	50                   	push   %eax
 c7c:	ff 75 08             	pushl  0x8(%ebp)
 c7f:	e8 e3 fd ff ff       	call   a67 <putc>
 c84:	83 c4 10             	add    $0x10,%esp
 c87:	eb 25                	jmp    cae <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 c89:	83 ec 08             	sub    $0x8,%esp
 c8c:	6a 25                	push   $0x25
 c8e:	ff 75 08             	pushl  0x8(%ebp)
 c91:	e8 d1 fd ff ff       	call   a67 <putc>
 c96:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 c99:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c9c:	0f be c0             	movsbl %al,%eax
 c9f:	83 ec 08             	sub    $0x8,%esp
 ca2:	50                   	push   %eax
 ca3:	ff 75 08             	pushl  0x8(%ebp)
 ca6:	e8 bc fd ff ff       	call   a67 <putc>
 cab:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 cae:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 cb5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 cb9:	8b 55 0c             	mov    0xc(%ebp),%edx
 cbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cbf:	01 d0                	add    %edx,%eax
 cc1:	0f b6 00             	movzbl (%eax),%eax
 cc4:	84 c0                	test   %al,%al
 cc6:	0f 85 94 fe ff ff    	jne    b60 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 ccc:	90                   	nop
 ccd:	c9                   	leave  
 cce:	c3                   	ret    

00000ccf <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ccf:	55                   	push   %ebp
 cd0:	89 e5                	mov    %esp,%ebp
 cd2:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 cd5:	8b 45 08             	mov    0x8(%ebp),%eax
 cd8:	83 e8 08             	sub    $0x8,%eax
 cdb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cde:	a1 78 11 00 00       	mov    0x1178,%eax
 ce3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 ce6:	eb 24                	jmp    d0c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ce8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ceb:	8b 00                	mov    (%eax),%eax
 ced:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 cf0:	77 12                	ja     d04 <free+0x35>
 cf2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 cf5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 cf8:	77 24                	ja     d1e <free+0x4f>
 cfa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cfd:	8b 00                	mov    (%eax),%eax
 cff:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d02:	77 1a                	ja     d1e <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d04:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d07:	8b 00                	mov    (%eax),%eax
 d09:	89 45 fc             	mov    %eax,-0x4(%ebp)
 d0c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d0f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 d12:	76 d4                	jbe    ce8 <free+0x19>
 d14:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d17:	8b 00                	mov    (%eax),%eax
 d19:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d1c:	76 ca                	jbe    ce8 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 d1e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d21:	8b 40 04             	mov    0x4(%eax),%eax
 d24:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 d2b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d2e:	01 c2                	add    %eax,%edx
 d30:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d33:	8b 00                	mov    (%eax),%eax
 d35:	39 c2                	cmp    %eax,%edx
 d37:	75 24                	jne    d5d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 d39:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d3c:	8b 50 04             	mov    0x4(%eax),%edx
 d3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d42:	8b 00                	mov    (%eax),%eax
 d44:	8b 40 04             	mov    0x4(%eax),%eax
 d47:	01 c2                	add    %eax,%edx
 d49:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d4c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 d4f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d52:	8b 00                	mov    (%eax),%eax
 d54:	8b 10                	mov    (%eax),%edx
 d56:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d59:	89 10                	mov    %edx,(%eax)
 d5b:	eb 0a                	jmp    d67 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 d5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d60:	8b 10                	mov    (%eax),%edx
 d62:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d65:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 d67:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d6a:	8b 40 04             	mov    0x4(%eax),%eax
 d6d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 d74:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d77:	01 d0                	add    %edx,%eax
 d79:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d7c:	75 20                	jne    d9e <free+0xcf>
    p->s.size += bp->s.size;
 d7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d81:	8b 50 04             	mov    0x4(%eax),%edx
 d84:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d87:	8b 40 04             	mov    0x4(%eax),%eax
 d8a:	01 c2                	add    %eax,%edx
 d8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d8f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 d92:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d95:	8b 10                	mov    (%eax),%edx
 d97:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d9a:	89 10                	mov    %edx,(%eax)
 d9c:	eb 08                	jmp    da6 <free+0xd7>
  } else
    p->s.ptr = bp;
 d9e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 da1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 da4:	89 10                	mov    %edx,(%eax)
  freep = p;
 da6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 da9:	a3 78 11 00 00       	mov    %eax,0x1178
}
 dae:	90                   	nop
 daf:	c9                   	leave  
 db0:	c3                   	ret    

00000db1 <morecore>:

static Header*
morecore(uint nu)
{
 db1:	55                   	push   %ebp
 db2:	89 e5                	mov    %esp,%ebp
 db4:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 db7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 dbe:	77 07                	ja     dc7 <morecore+0x16>
    nu = 4096;
 dc0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 dc7:	8b 45 08             	mov    0x8(%ebp),%eax
 dca:	c1 e0 03             	shl    $0x3,%eax
 dcd:	83 ec 0c             	sub    $0xc,%esp
 dd0:	50                   	push   %eax
 dd1:	e8 7b f5 ff ff       	call   351 <sbrk>
 dd6:	83 c4 10             	add    $0x10,%esp
 dd9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 ddc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 de0:	75 07                	jne    de9 <morecore+0x38>
    return 0;
 de2:	b8 00 00 00 00       	mov    $0x0,%eax
 de7:	eb 26                	jmp    e0f <morecore+0x5e>
  hp = (Header*)p;
 de9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dec:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 def:	8b 45 f0             	mov    -0x10(%ebp),%eax
 df2:	8b 55 08             	mov    0x8(%ebp),%edx
 df5:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 df8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 dfb:	83 c0 08             	add    $0x8,%eax
 dfe:	83 ec 0c             	sub    $0xc,%esp
 e01:	50                   	push   %eax
 e02:	e8 c8 fe ff ff       	call   ccf <free>
 e07:	83 c4 10             	add    $0x10,%esp
  return freep;
 e0a:	a1 78 11 00 00       	mov    0x1178,%eax
}
 e0f:	c9                   	leave  
 e10:	c3                   	ret    

00000e11 <malloc>:

void*
malloc(uint nbytes)
{
 e11:	55                   	push   %ebp
 e12:	89 e5                	mov    %esp,%ebp
 e14:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 e17:	8b 45 08             	mov    0x8(%ebp),%eax
 e1a:	83 c0 07             	add    $0x7,%eax
 e1d:	c1 e8 03             	shr    $0x3,%eax
 e20:	83 c0 01             	add    $0x1,%eax
 e23:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 e26:	a1 78 11 00 00       	mov    0x1178,%eax
 e2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 e2e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 e32:	75 23                	jne    e57 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 e34:	c7 45 f0 70 11 00 00 	movl   $0x1170,-0x10(%ebp)
 e3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e3e:	a3 78 11 00 00       	mov    %eax,0x1178
 e43:	a1 78 11 00 00       	mov    0x1178,%eax
 e48:	a3 70 11 00 00       	mov    %eax,0x1170
    base.s.size = 0;
 e4d:	c7 05 74 11 00 00 00 	movl   $0x0,0x1174
 e54:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e57:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e5a:	8b 00                	mov    (%eax),%eax
 e5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 e5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e62:	8b 40 04             	mov    0x4(%eax),%eax
 e65:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 e68:	72 4d                	jb     eb7 <malloc+0xa6>
      if(p->s.size == nunits)
 e6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e6d:	8b 40 04             	mov    0x4(%eax),%eax
 e70:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 e73:	75 0c                	jne    e81 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 e75:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e78:	8b 10                	mov    (%eax),%edx
 e7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e7d:	89 10                	mov    %edx,(%eax)
 e7f:	eb 26                	jmp    ea7 <malloc+0x96>
      else {
        p->s.size -= nunits;
 e81:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e84:	8b 40 04             	mov    0x4(%eax),%eax
 e87:	2b 45 ec             	sub    -0x14(%ebp),%eax
 e8a:	89 c2                	mov    %eax,%edx
 e8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e8f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 e92:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e95:	8b 40 04             	mov    0x4(%eax),%eax
 e98:	c1 e0 03             	shl    $0x3,%eax
 e9b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 e9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ea1:	8b 55 ec             	mov    -0x14(%ebp),%edx
 ea4:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ea7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 eaa:	a3 78 11 00 00       	mov    %eax,0x1178
      return (void*)(p + 1);
 eaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 eb2:	83 c0 08             	add    $0x8,%eax
 eb5:	eb 3b                	jmp    ef2 <malloc+0xe1>
    }
    if(p == freep)
 eb7:	a1 78 11 00 00       	mov    0x1178,%eax
 ebc:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ebf:	75 1e                	jne    edf <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 ec1:	83 ec 0c             	sub    $0xc,%esp
 ec4:	ff 75 ec             	pushl  -0x14(%ebp)
 ec7:	e8 e5 fe ff ff       	call   db1 <morecore>
 ecc:	83 c4 10             	add    $0x10,%esp
 ecf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ed2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ed6:	75 07                	jne    edf <malloc+0xce>
        return 0;
 ed8:	b8 00 00 00 00       	mov    $0x0,%eax
 edd:	eb 13                	jmp    ef2 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 edf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ee2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ee5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ee8:	8b 00                	mov    (%eax),%eax
 eea:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 eed:	e9 6d ff ff ff       	jmp    e5f <malloc+0x4e>
}
 ef2:	c9                   	leave  
 ef3:	c3                   	ret    
