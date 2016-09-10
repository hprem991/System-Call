
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	89 cb                	mov    %ecx,%ebx
  if(argc != 3){
  11:	83 3b 03             	cmpl   $0x3,(%ebx)
  14:	74 17                	je     2d <main+0x2d>
    printf(2, "Usage: ln old new\n");
  16:	83 ec 08             	sub    $0x8,%esp
  19:	68 f6 0e 00 00       	push   $0xef6
  1e:	6a 02                	push   $0x2
  20:	e8 1b 0b 00 00       	call   b40 <printf>
  25:	83 c4 10             	add    $0x10,%esp
    exit();
  28:	e8 9e 02 00 00       	call   2cb <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2d:	8b 43 04             	mov    0x4(%ebx),%eax
  30:	83 c0 08             	add    $0x8,%eax
  33:	8b 10                	mov    (%eax),%edx
  35:	8b 43 04             	mov    0x4(%ebx),%eax
  38:	83 c0 04             	add    $0x4,%eax
  3b:	8b 00                	mov    (%eax),%eax
  3d:	83 ec 08             	sub    $0x8,%esp
  40:	52                   	push   %edx
  41:	50                   	push   %eax
  42:	e8 e4 02 00 00       	call   32b <link>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	85 c0                	test   %eax,%eax
  4c:	79 21                	jns    6f <main+0x6f>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  4e:	8b 43 04             	mov    0x4(%ebx),%eax
  51:	83 c0 08             	add    $0x8,%eax
  54:	8b 10                	mov    (%eax),%edx
  56:	8b 43 04             	mov    0x4(%ebx),%eax
  59:	83 c0 04             	add    $0x4,%eax
  5c:	8b 00                	mov    (%eax),%eax
  5e:	52                   	push   %edx
  5f:	50                   	push   %eax
  60:	68 09 0f 00 00       	push   $0xf09
  65:	6a 02                	push   $0x2
  67:	e8 d4 0a 00 00       	call   b40 <printf>
  6c:	83 c4 10             	add    $0x10,%esp
  exit();
  6f:	e8 57 02 00 00       	call   2cb <exit>

00000074 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  74:	55                   	push   %ebp
  75:	89 e5                	mov    %esp,%ebp
  77:	57                   	push   %edi
  78:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  79:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7c:	8b 55 10             	mov    0x10(%ebp),%edx
  7f:	8b 45 0c             	mov    0xc(%ebp),%eax
  82:	89 cb                	mov    %ecx,%ebx
  84:	89 df                	mov    %ebx,%edi
  86:	89 d1                	mov    %edx,%ecx
  88:	fc                   	cld    
  89:	f3 aa                	rep stos %al,%es:(%edi)
  8b:	89 ca                	mov    %ecx,%edx
  8d:	89 fb                	mov    %edi,%ebx
  8f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  92:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  95:	90                   	nop
  96:	5b                   	pop    %ebx
  97:	5f                   	pop    %edi
  98:	5d                   	pop    %ebp
  99:	c3                   	ret    

0000009a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  9a:	55                   	push   %ebp
  9b:	89 e5                	mov    %esp,%ebp
  9d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a0:	8b 45 08             	mov    0x8(%ebp),%eax
  a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a6:	90                   	nop
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	8d 50 01             	lea    0x1(%eax),%edx
  ad:	89 55 08             	mov    %edx,0x8(%ebp)
  b0:	8b 55 0c             	mov    0xc(%ebp),%edx
  b3:	8d 4a 01             	lea    0x1(%edx),%ecx
  b6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b9:	0f b6 12             	movzbl (%edx),%edx
  bc:	88 10                	mov    %dl,(%eax)
  be:	0f b6 00             	movzbl (%eax),%eax
  c1:	84 c0                	test   %al,%al
  c3:	75 e2                	jne    a7 <strcpy+0xd>
    ;
  return os;
  c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c8:	c9                   	leave  
  c9:	c3                   	ret    

000000ca <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ca:	55                   	push   %ebp
  cb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cd:	eb 08                	jmp    d7 <strcmp+0xd>
    p++, q++;
  cf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	74 10                	je     f1 <strcmp+0x27>
  e1:	8b 45 08             	mov    0x8(%ebp),%eax
  e4:	0f b6 10             	movzbl (%eax),%edx
  e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  ea:	0f b6 00             	movzbl (%eax),%eax
  ed:	38 c2                	cmp    %al,%dl
  ef:	74 de                	je     cf <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 d0             	movzbl %al,%edx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	0f b6 00             	movzbl (%eax),%eax
 100:	0f b6 c0             	movzbl %al,%eax
 103:	29 c2                	sub    %eax,%edx
 105:	89 d0                	mov    %edx,%eax
}
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    

00000109 <strlen>:

uint
strlen(char *s)
{
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 116:	eb 04                	jmp    11c <strlen+0x13>
 118:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	01 d0                	add    %edx,%eax
 124:	0f b6 00             	movzbl (%eax),%eax
 127:	84 c0                	test   %al,%al
 129:	75 ed                	jne    118 <strlen+0xf>
    ;
  return n;
 12b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12e:	c9                   	leave  
 12f:	c3                   	ret    

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 133:	8b 45 10             	mov    0x10(%ebp),%eax
 136:	50                   	push   %eax
 137:	ff 75 0c             	pushl  0xc(%ebp)
 13a:	ff 75 08             	pushl  0x8(%ebp)
 13d:	e8 32 ff ff ff       	call   74 <stosb>
 142:	83 c4 0c             	add    $0xc,%esp
  return dst;
 145:	8b 45 08             	mov    0x8(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <strchr>:

char*
strchr(const char *s, char c)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 04             	sub    $0x4,%esp
 150:	8b 45 0c             	mov    0xc(%ebp),%eax
 153:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 156:	eb 14                	jmp    16c <strchr+0x22>
    if(*s == c)
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	0f b6 00             	movzbl (%eax),%eax
 15e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 161:	75 05                	jne    168 <strchr+0x1e>
      return (char*)s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	eb 13                	jmp    17b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 168:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	0f b6 00             	movzbl (%eax),%eax
 172:	84 c0                	test   %al,%al
 174:	75 e2                	jne    158 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	c9                   	leave  
 17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 183:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18a:	eb 42                	jmp    1ce <gets+0x51>
    cc = read(0, &c, 1);
 18c:	83 ec 04             	sub    $0x4,%esp
 18f:	6a 01                	push   $0x1
 191:	8d 45 ef             	lea    -0x11(%ebp),%eax
 194:	50                   	push   %eax
 195:	6a 00                	push   $0x0
 197:	e8 47 01 00 00       	call   2e3 <read>
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a6:	7e 33                	jle    1db <gets+0x5e>
      break;
    buf[i++] = c;
 1a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ab:	8d 50 01             	lea    0x1(%eax),%edx
 1ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b1:	89 c2                	mov    %eax,%edx
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	01 c2                	add    %eax,%edx
 1b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1bc:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c2:	3c 0a                	cmp    $0xa,%al
 1c4:	74 16                	je     1dc <gets+0x5f>
 1c6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ca:	3c 0d                	cmp    $0xd,%al
 1cc:	74 0e                	je     1dc <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d1:	83 c0 01             	add    $0x1,%eax
 1d4:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d7:	7c b3                	jl     18c <gets+0xf>
 1d9:	eb 01                	jmp    1dc <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1db:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	01 d0                	add    %edx,%eax
 1e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ea:	c9                   	leave  
 1eb:	c3                   	ret    

000001ec <stat>:

int
stat(char *n, struct stat *st)
{
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f2:	83 ec 08             	sub    $0x8,%esp
 1f5:	6a 00                	push   $0x0
 1f7:	ff 75 08             	pushl  0x8(%ebp)
 1fa:	e8 0c 01 00 00       	call   30b <open>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 205:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 209:	79 07                	jns    212 <stat+0x26>
    return -1;
 20b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 210:	eb 25                	jmp    237 <stat+0x4b>
  r = fstat(fd, st);
 212:	83 ec 08             	sub    $0x8,%esp
 215:	ff 75 0c             	pushl  0xc(%ebp)
 218:	ff 75 f4             	pushl  -0xc(%ebp)
 21b:	e8 03 01 00 00       	call   323 <fstat>
 220:	83 c4 10             	add    $0x10,%esp
 223:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 226:	83 ec 0c             	sub    $0xc,%esp
 229:	ff 75 f4             	pushl  -0xc(%ebp)
 22c:	e8 c2 00 00 00       	call   2f3 <close>
 231:	83 c4 10             	add    $0x10,%esp
  return r;
 234:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 237:	c9                   	leave  
 238:	c3                   	ret    

00000239 <atoi>:

int
atoi(const char *s)
{
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 23f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 246:	eb 25                	jmp    26d <atoi+0x34>
    n = n*10 + *s++ - '0';
 248:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24b:	89 d0                	mov    %edx,%eax
 24d:	c1 e0 02             	shl    $0x2,%eax
 250:	01 d0                	add    %edx,%eax
 252:	01 c0                	add    %eax,%eax
 254:	89 c1                	mov    %eax,%ecx
 256:	8b 45 08             	mov    0x8(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 08             	mov    %edx,0x8(%ebp)
 25f:	0f b6 00             	movzbl (%eax),%eax
 262:	0f be c0             	movsbl %al,%eax
 265:	01 c8                	add    %ecx,%eax
 267:	83 e8 30             	sub    $0x30,%eax
 26a:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
 270:	0f b6 00             	movzbl (%eax),%eax
 273:	3c 2f                	cmp    $0x2f,%al
 275:	7e 0a                	jle    281 <atoi+0x48>
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 00             	movzbl (%eax),%eax
 27d:	3c 39                	cmp    $0x39,%al
 27f:	7e c7                	jle    248 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 281:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 284:	c9                   	leave  
 285:	c3                   	ret    

00000286 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 28c:	8b 45 08             	mov    0x8(%ebp),%eax
 28f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 292:	8b 45 0c             	mov    0xc(%ebp),%eax
 295:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 298:	eb 17                	jmp    2b1 <memmove+0x2b>
    *dst++ = *src++;
 29a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 29d:	8d 50 01             	lea    0x1(%eax),%edx
 2a0:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2a6:	8d 4a 01             	lea    0x1(%edx),%ecx
 2a9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2ac:	0f b6 12             	movzbl (%edx),%edx
 2af:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b1:	8b 45 10             	mov    0x10(%ebp),%eax
 2b4:	8d 50 ff             	lea    -0x1(%eax),%edx
 2b7:	89 55 10             	mov    %edx,0x10(%ebp)
 2ba:	85 c0                	test   %eax,%eax
 2bc:	7f dc                	jg     29a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
 2c3:	b8 01 00 00 00       	mov    $0x1,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <exit>:
SYSCALL(exit)
 2cb:	b8 02 00 00 00       	mov    $0x2,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <wait>:
SYSCALL(wait)
 2d3:	b8 03 00 00 00       	mov    $0x3,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <pipe>:
SYSCALL(pipe)
 2db:	b8 04 00 00 00       	mov    $0x4,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <read>:
SYSCALL(read)
 2e3:	b8 05 00 00 00       	mov    $0x5,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <write>:
SYSCALL(write)
 2eb:	b8 10 00 00 00       	mov    $0x10,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <close>:
SYSCALL(close)
 2f3:	b8 15 00 00 00       	mov    $0x15,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <kill>:
SYSCALL(kill)
 2fb:	b8 06 00 00 00       	mov    $0x6,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <exec>:
SYSCALL(exec)
 303:	b8 07 00 00 00       	mov    $0x7,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <open>:
SYSCALL(open)
 30b:	b8 0f 00 00 00       	mov    $0xf,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <mknod>:
SYSCALL(mknod)
 313:	b8 11 00 00 00       	mov    $0x11,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <unlink>:
SYSCALL(unlink)
 31b:	b8 12 00 00 00       	mov    $0x12,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <fstat>:
SYSCALL(fstat)
 323:	b8 08 00 00 00       	mov    $0x8,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <link>:
SYSCALL(link)
 32b:	b8 13 00 00 00       	mov    $0x13,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <mkdir>:
SYSCALL(mkdir)
 333:	b8 14 00 00 00       	mov    $0x14,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <chdir>:
SYSCALL(chdir)
 33b:	b8 09 00 00 00       	mov    $0x9,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <dup>:
SYSCALL(dup)
 343:	b8 0a 00 00 00       	mov    $0xa,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <getpid>:
SYSCALL(getpid)
 34b:	b8 0b 00 00 00       	mov    $0xb,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <sbrk>:
SYSCALL(sbrk)
 353:	b8 0c 00 00 00       	mov    $0xc,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <sleep>:
SYSCALL(sleep)
 35b:	b8 0d 00 00 00       	mov    $0xd,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <uptime>:
SYSCALL(uptime)
 363:	b8 0e 00 00 00       	mov    $0xe,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <date>:

// Assignment starts here

SYSCALL(date)
 36b:	b8 16 00 00 00       	mov    $0x16,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <str_ls_call1>:
 373:	6c                   	insb   (%dx),%es:(%edi)
 374:	73 5f                	jae    3d5 <ls_call6+0x4>
 376:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 379:	6c                   	insb   (%dx),%es:(%edi)
 37a:	31 00                	xor    %eax,(%eax)

0000037c <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
 37c:	b8 73 03 00 00       	mov    $0x373,%eax
 381:	cd 41                	int    $0x41
 383:	c3                   	ret    

00000384 <str_ls_call2>:
 384:	6c                   	insb   (%dx),%es:(%edi)
 385:	73 5f                	jae    3e6 <ls_call7+0x4>
 387:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 38a:	6c                   	insb   (%dx),%es:(%edi)
 38b:	32 00                	xor    (%eax),%al

0000038d <ls_call2>:
CS550LSSYSCALL(ls_call2)
 38d:	b8 84 03 00 00       	mov    $0x384,%eax
 392:	cd 41                	int    $0x41
 394:	c3                   	ret    

00000395 <str_ls_call3>:
 395:	6c                   	insb   (%dx),%es:(%edi)
 396:	73 5f                	jae    3f7 <ls_call8+0x4>
 398:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 39b:	6c                   	insb   (%dx),%es:(%edi)
 39c:	33 00                	xor    (%eax),%eax

0000039e <ls_call3>:
CS550LSSYSCALL(ls_call3)
 39e:	b8 95 03 00 00       	mov    $0x395,%eax
 3a3:	cd 41                	int    $0x41
 3a5:	c3                   	ret    

000003a6 <str_ls_call4>:
 3a6:	6c                   	insb   (%dx),%es:(%edi)
 3a7:	73 5f                	jae    408 <ls_call9+0x4>
 3a9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3ac:	6c                   	insb   (%dx),%es:(%edi)
 3ad:	34 00                	xor    $0x0,%al

000003af <ls_call4>:
CS550LSSYSCALL(ls_call4)
 3af:	b8 a6 03 00 00       	mov    $0x3a6,%eax
 3b4:	cd 41                	int    $0x41
 3b6:	c3                   	ret    

000003b7 <str_ls_call5>:
 3b7:	6c                   	insb   (%dx),%es:(%edi)
 3b8:	73 5f                	jae    419 <ls_call10+0x3>
 3ba:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3bd:	6c                   	insb   (%dx),%es:(%edi)
 3be:	35                   	.byte 0x35
	...

000003c0 <ls_call5>:
CS550LSSYSCALL(ls_call5)
 3c0:	b8 b7 03 00 00       	mov    $0x3b7,%eax
 3c5:	cd 41                	int    $0x41
 3c7:	c3                   	ret    

000003c8 <str_ls_call6>:
 3c8:	6c                   	insb   (%dx),%es:(%edi)
 3c9:	73 5f                	jae    42a <ls_call11+0x2>
 3cb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3ce:	6c                   	insb   (%dx),%es:(%edi)
 3cf:	36                   	ss
	...

000003d1 <ls_call6>:
CS550LSSYSCALL(ls_call6)
 3d1:	b8 c8 03 00 00       	mov    $0x3c8,%eax
 3d6:	cd 41                	int    $0x41
 3d8:	c3                   	ret    

000003d9 <str_ls_call7>:
 3d9:	6c                   	insb   (%dx),%es:(%edi)
 3da:	73 5f                	jae    43b <ls_call12+0x1>
 3dc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3df:	6c                   	insb   (%dx),%es:(%edi)
 3e0:	37                   	aaa    
	...

000003e2 <ls_call7>:
CS550LSSYSCALL(ls_call7)
 3e2:	b8 d9 03 00 00       	mov    $0x3d9,%eax
 3e7:	cd 41                	int    $0x41
 3e9:	c3                   	ret    

000003ea <str_ls_call8>:
 3ea:	6c                   	insb   (%dx),%es:(%edi)
 3eb:	73 5f                	jae    44c <ls_call13>
 3ed:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3f0:	6c                   	insb   (%dx),%es:(%edi)
 3f1:	38 00                	cmp    %al,(%eax)

000003f3 <ls_call8>:
CS550LSSYSCALL(ls_call8)
 3f3:	b8 ea 03 00 00       	mov    $0x3ea,%eax
 3f8:	cd 41                	int    $0x41
 3fa:	c3                   	ret    

000003fb <str_ls_call9>:
 3fb:	6c                   	insb   (%dx),%es:(%edi)
 3fc:	73 5f                	jae    45d <str_ls_call14+0x9>
 3fe:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 401:	6c                   	insb   (%dx),%es:(%edi)
 402:	39 00                	cmp    %eax,(%eax)

00000404 <ls_call9>:
CS550LSSYSCALL(ls_call9)
 404:	b8 fb 03 00 00       	mov    $0x3fb,%eax
 409:	cd 41                	int    $0x41
 40b:	c3                   	ret    

0000040c <str_ls_call10>:
 40c:	6c                   	insb   (%dx),%es:(%edi)
 40d:	73 5f                	jae    46e <str_ls_call15+0x8>
 40f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 412:	6c                   	insb   (%dx),%es:(%edi)
 413:	31 30                	xor    %esi,(%eax)
	...

00000416 <ls_call10>:
CS550LSSYSCALL(ls_call10)
 416:	b8 0c 04 00 00       	mov    $0x40c,%eax
 41b:	cd 41                	int    $0x41
 41d:	c3                   	ret    

0000041e <str_ls_call11>:
 41e:	6c                   	insb   (%dx),%es:(%edi)
 41f:	73 5f                	jae    480 <str_ls_call16+0x8>
 421:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 424:	6c                   	insb   (%dx),%es:(%edi)
 425:	31 31                	xor    %esi,(%ecx)
	...

00000428 <ls_call11>:
CS550LSSYSCALL(ls_call11)
 428:	b8 1e 04 00 00       	mov    $0x41e,%eax
 42d:	cd 41                	int    $0x41
 42f:	c3                   	ret    

00000430 <str_ls_call12>:
 430:	6c                   	insb   (%dx),%es:(%edi)
 431:	73 5f                	jae    492 <str_ls_call17+0x8>
 433:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 436:	6c                   	insb   (%dx),%es:(%edi)
 437:	31 32                	xor    %esi,(%edx)
	...

0000043a <ls_call12>:
CS550LSSYSCALL(ls_call12)
 43a:	b8 30 04 00 00       	mov    $0x430,%eax
 43f:	cd 41                	int    $0x41
 441:	c3                   	ret    

00000442 <str_ls_call13>:
 442:	6c                   	insb   (%dx),%es:(%edi)
 443:	73 5f                	jae    4a4 <str_ls_call18+0x8>
 445:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 448:	6c                   	insb   (%dx),%es:(%edi)
 449:	31 33                	xor    %esi,(%ebx)
	...

0000044c <ls_call13>:
CS550LSSYSCALL(ls_call13)
 44c:	b8 42 04 00 00       	mov    $0x442,%eax
 451:	cd 41                	int    $0x41
 453:	c3                   	ret    

00000454 <str_ls_call14>:
 454:	6c                   	insb   (%dx),%es:(%edi)
 455:	73 5f                	jae    4b6 <str_ls_call19+0x8>
 457:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 45a:	6c                   	insb   (%dx),%es:(%edi)
 45b:	31 34 00             	xor    %esi,(%eax,%eax,1)

0000045e <ls_call14>:
CS550LSSYSCALL(ls_call14)
 45e:	b8 54 04 00 00       	mov    $0x454,%eax
 463:	cd 41                	int    $0x41
 465:	c3                   	ret    

00000466 <str_ls_call15>:
 466:	6c                   	insb   (%dx),%es:(%edi)
 467:	73 5f                	jae    4c8 <str_ls_call20+0x8>
 469:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 46c:	6c                   	insb   (%dx),%es:(%edi)
 46d:	31                   	.byte 0x31
 46e:	35                   	.byte 0x35
	...

00000470 <ls_call15>:
CS550LSSYSCALL(ls_call15)
 470:	b8 66 04 00 00       	mov    $0x466,%eax
 475:	cd 41                	int    $0x41
 477:	c3                   	ret    

00000478 <str_ls_call16>:
 478:	6c                   	insb   (%dx),%es:(%edi)
 479:	73 5f                	jae    4da <str_ls_call21+0x8>
 47b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 47e:	6c                   	insb   (%dx),%es:(%edi)
 47f:	31 36                	xor    %esi,(%esi)
	...

00000482 <ls_call16>:
CS550LSSYSCALL(ls_call16)
 482:	b8 78 04 00 00       	mov    $0x478,%eax
 487:	cd 41                	int    $0x41
 489:	c3                   	ret    

0000048a <str_ls_call17>:
 48a:	6c                   	insb   (%dx),%es:(%edi)
 48b:	73 5f                	jae    4ec <str_ls_call22+0x8>
 48d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 490:	6c                   	insb   (%dx),%es:(%edi)
 491:	31 37                	xor    %esi,(%edi)
	...

00000494 <ls_call17>:
CS550LSSYSCALL(ls_call17)
 494:	b8 8a 04 00 00       	mov    $0x48a,%eax
 499:	cd 41                	int    $0x41
 49b:	c3                   	ret    

0000049c <str_ls_call18>:
 49c:	6c                   	insb   (%dx),%es:(%edi)
 49d:	73 5f                	jae    4fe <str_ls_call23+0x8>
 49f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4a2:	6c                   	insb   (%dx),%es:(%edi)
 4a3:	31 38                	xor    %edi,(%eax)
	...

000004a6 <ls_call18>:
CS550LSSYSCALL(ls_call18)
 4a6:	b8 9c 04 00 00       	mov    $0x49c,%eax
 4ab:	cd 41                	int    $0x41
 4ad:	c3                   	ret    

000004ae <str_ls_call19>:
 4ae:	6c                   	insb   (%dx),%es:(%edi)
 4af:	73 5f                	jae    510 <str_ls_call24+0x8>
 4b1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4b4:	6c                   	insb   (%dx),%es:(%edi)
 4b5:	31 39                	xor    %edi,(%ecx)
	...

000004b8 <ls_call19>:
CS550LSSYSCALL(ls_call19)
 4b8:	b8 ae 04 00 00       	mov    $0x4ae,%eax
 4bd:	cd 41                	int    $0x41
 4bf:	c3                   	ret    

000004c0 <str_ls_call20>:
 4c0:	6c                   	insb   (%dx),%es:(%edi)
 4c1:	73 5f                	jae    522 <str_ls_call25+0x8>
 4c3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4c6:	6c                   	insb   (%dx),%es:(%edi)
 4c7:	32 30                	xor    (%eax),%dh
	...

000004ca <ls_call20>:
CS550LSSYSCALL(ls_call20)
 4ca:	b8 c0 04 00 00       	mov    $0x4c0,%eax
 4cf:	cd 41                	int    $0x41
 4d1:	c3                   	ret    

000004d2 <str_ls_call21>:
 4d2:	6c                   	insb   (%dx),%es:(%edi)
 4d3:	73 5f                	jae    534 <str_ls_call26+0x8>
 4d5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4d8:	6c                   	insb   (%dx),%es:(%edi)
 4d9:	32 31                	xor    (%ecx),%dh
	...

000004dc <ls_call21>:
CS550LSSYSCALL(ls_call21)
 4dc:	b8 d2 04 00 00       	mov    $0x4d2,%eax
 4e1:	cd 41                	int    $0x41
 4e3:	c3                   	ret    

000004e4 <str_ls_call22>:
 4e4:	6c                   	insb   (%dx),%es:(%edi)
 4e5:	73 5f                	jae    546 <str_ls_call27+0x8>
 4e7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4ea:	6c                   	insb   (%dx),%es:(%edi)
 4eb:	32 32                	xor    (%edx),%dh
	...

000004ee <ls_call22>:
CS550LSSYSCALL(ls_call22)
 4ee:	b8 e4 04 00 00       	mov    $0x4e4,%eax
 4f3:	cd 41                	int    $0x41
 4f5:	c3                   	ret    

000004f6 <str_ls_call23>:
 4f6:	6c                   	insb   (%dx),%es:(%edi)
 4f7:	73 5f                	jae    558 <str_ls_call28+0x8>
 4f9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4fc:	6c                   	insb   (%dx),%es:(%edi)
 4fd:	32 33                	xor    (%ebx),%dh
	...

00000500 <ls_call23>:
CS550LSSYSCALL(ls_call23)
 500:	b8 f6 04 00 00       	mov    $0x4f6,%eax
 505:	cd 41                	int    $0x41
 507:	c3                   	ret    

00000508 <str_ls_call24>:
 508:	6c                   	insb   (%dx),%es:(%edi)
 509:	73 5f                	jae    56a <str_ls_call29+0x8>
 50b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 50e:	6c                   	insb   (%dx),%es:(%edi)
 50f:	32 34 00             	xor    (%eax,%eax,1),%dh

00000512 <ls_call24>:
CS550LSSYSCALL(ls_call24)
 512:	b8 08 05 00 00       	mov    $0x508,%eax
 517:	cd 41                	int    $0x41
 519:	c3                   	ret    

0000051a <str_ls_call25>:
 51a:	6c                   	insb   (%dx),%es:(%edi)
 51b:	73 5f                	jae    57c <str_ls_call30+0x8>
 51d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 520:	6c                   	insb   (%dx),%es:(%edi)
 521:	32                   	.byte 0x32
 522:	35                   	.byte 0x35
	...

00000524 <ls_call25>:
CS550LSSYSCALL(ls_call25)
 524:	b8 1a 05 00 00       	mov    $0x51a,%eax
 529:	cd 41                	int    $0x41
 52b:	c3                   	ret    

0000052c <str_ls_call26>:
 52c:	6c                   	insb   (%dx),%es:(%edi)
 52d:	73 5f                	jae    58e <str_ls_call31+0x8>
 52f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 532:	6c                   	insb   (%dx),%es:(%edi)
 533:	32 36                	xor    (%esi),%dh
	...

00000536 <ls_call26>:
CS550LSSYSCALL(ls_call26)
 536:	b8 2c 05 00 00       	mov    $0x52c,%eax
 53b:	cd 41                	int    $0x41
 53d:	c3                   	ret    

0000053e <str_ls_call27>:
 53e:	6c                   	insb   (%dx),%es:(%edi)
 53f:	73 5f                	jae    5a0 <str_ls_call32+0x8>
 541:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 544:	6c                   	insb   (%dx),%es:(%edi)
 545:	32 37                	xor    (%edi),%dh
	...

00000548 <ls_call27>:
CS550LSSYSCALL(ls_call27)
 548:	b8 3e 05 00 00       	mov    $0x53e,%eax
 54d:	cd 41                	int    $0x41
 54f:	c3                   	ret    

00000550 <str_ls_call28>:
 550:	6c                   	insb   (%dx),%es:(%edi)
 551:	73 5f                	jae    5b2 <str_ls_call33+0x8>
 553:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 556:	6c                   	insb   (%dx),%es:(%edi)
 557:	32 38                	xor    (%eax),%bh
	...

0000055a <ls_call28>:
CS550LSSYSCALL(ls_call28)
 55a:	b8 50 05 00 00       	mov    $0x550,%eax
 55f:	cd 41                	int    $0x41
 561:	c3                   	ret    

00000562 <str_ls_call29>:
 562:	6c                   	insb   (%dx),%es:(%edi)
 563:	73 5f                	jae    5c4 <str_ls_call34+0x8>
 565:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 568:	6c                   	insb   (%dx),%es:(%edi)
 569:	32 39                	xor    (%ecx),%bh
	...

0000056c <ls_call29>:
CS550LSSYSCALL(ls_call29)
 56c:	b8 62 05 00 00       	mov    $0x562,%eax
 571:	cd 41                	int    $0x41
 573:	c3                   	ret    

00000574 <str_ls_call30>:
 574:	6c                   	insb   (%dx),%es:(%edi)
 575:	73 5f                	jae    5d6 <str_ls_call35+0x8>
 577:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 57a:	6c                   	insb   (%dx),%es:(%edi)
 57b:	33 30                	xor    (%eax),%esi
	...

0000057e <ls_call30>:
CS550LSSYSCALL(ls_call30)
 57e:	b8 74 05 00 00       	mov    $0x574,%eax
 583:	cd 41                	int    $0x41
 585:	c3                   	ret    

00000586 <str_ls_call31>:
 586:	6c                   	insb   (%dx),%es:(%edi)
 587:	73 5f                	jae    5e8 <str_ls_call36+0x8>
 589:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 58c:	6c                   	insb   (%dx),%es:(%edi)
 58d:	33 31                	xor    (%ecx),%esi
	...

00000590 <ls_call31>:
CS550LSSYSCALL(ls_call31)
 590:	b8 86 05 00 00       	mov    $0x586,%eax
 595:	cd 41                	int    $0x41
 597:	c3                   	ret    

00000598 <str_ls_call32>:
 598:	6c                   	insb   (%dx),%es:(%edi)
 599:	73 5f                	jae    5fa <str_ls_call37+0x8>
 59b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 59e:	6c                   	insb   (%dx),%es:(%edi)
 59f:	33 32                	xor    (%edx),%esi
	...

000005a2 <ls_call32>:
CS550LSSYSCALL(ls_call32)
 5a2:	b8 98 05 00 00       	mov    $0x598,%eax
 5a7:	cd 41                	int    $0x41
 5a9:	c3                   	ret    

000005aa <str_ls_call33>:
 5aa:	6c                   	insb   (%dx),%es:(%edi)
 5ab:	73 5f                	jae    60c <str_ls_call38+0x8>
 5ad:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5b0:	6c                   	insb   (%dx),%es:(%edi)
 5b1:	33 33                	xor    (%ebx),%esi
	...

000005b4 <ls_call33>:
CS550LSSYSCALL(ls_call33)
 5b4:	b8 aa 05 00 00       	mov    $0x5aa,%eax
 5b9:	cd 41                	int    $0x41
 5bb:	c3                   	ret    

000005bc <str_ls_call34>:
 5bc:	6c                   	insb   (%dx),%es:(%edi)
 5bd:	73 5f                	jae    61e <str_ls_call39+0x8>
 5bf:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5c2:	6c                   	insb   (%dx),%es:(%edi)
 5c3:	33 34 00             	xor    (%eax,%eax,1),%esi

000005c6 <ls_call34>:
CS550LSSYSCALL(ls_call34)
 5c6:	b8 bc 05 00 00       	mov    $0x5bc,%eax
 5cb:	cd 41                	int    $0x41
 5cd:	c3                   	ret    

000005ce <str_ls_call35>:
 5ce:	6c                   	insb   (%dx),%es:(%edi)
 5cf:	73 5f                	jae    630 <str_ls_call40+0x8>
 5d1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5d4:	6c                   	insb   (%dx),%es:(%edi)
 5d5:	33                   	.byte 0x33
 5d6:	35                   	.byte 0x35
	...

000005d8 <ls_call35>:
CS550LSSYSCALL(ls_call35)
 5d8:	b8 ce 05 00 00       	mov    $0x5ce,%eax
 5dd:	cd 41                	int    $0x41
 5df:	c3                   	ret    

000005e0 <str_ls_call36>:
 5e0:	6c                   	insb   (%dx),%es:(%edi)
 5e1:	73 5f                	jae    642 <str_ls_call41+0x8>
 5e3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5e6:	6c                   	insb   (%dx),%es:(%edi)
 5e7:	33 36                	xor    (%esi),%esi
	...

000005ea <ls_call36>:
CS550LSSYSCALL(ls_call36)
 5ea:	b8 e0 05 00 00       	mov    $0x5e0,%eax
 5ef:	cd 41                	int    $0x41
 5f1:	c3                   	ret    

000005f2 <str_ls_call37>:
 5f2:	6c                   	insb   (%dx),%es:(%edi)
 5f3:	73 5f                	jae    654 <str_ls_call42+0x8>
 5f5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5f8:	6c                   	insb   (%dx),%es:(%edi)
 5f9:	33 37                	xor    (%edi),%esi
	...

000005fc <ls_call37>:
CS550LSSYSCALL(ls_call37)
 5fc:	b8 f2 05 00 00       	mov    $0x5f2,%eax
 601:	cd 41                	int    $0x41
 603:	c3                   	ret    

00000604 <str_ls_call38>:
 604:	6c                   	insb   (%dx),%es:(%edi)
 605:	73 5f                	jae    666 <str_ls_call43+0x8>
 607:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 60a:	6c                   	insb   (%dx),%es:(%edi)
 60b:	33 38                	xor    (%eax),%edi
	...

0000060e <ls_call38>:
CS550LSSYSCALL(ls_call38)
 60e:	b8 04 06 00 00       	mov    $0x604,%eax
 613:	cd 41                	int    $0x41
 615:	c3                   	ret    

00000616 <str_ls_call39>:
 616:	6c                   	insb   (%dx),%es:(%edi)
 617:	73 5f                	jae    678 <str_ls_call44+0x8>
 619:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 61c:	6c                   	insb   (%dx),%es:(%edi)
 61d:	33 39                	xor    (%ecx),%edi
	...

00000620 <ls_call39>:
CS550LSSYSCALL(ls_call39)
 620:	b8 16 06 00 00       	mov    $0x616,%eax
 625:	cd 41                	int    $0x41
 627:	c3                   	ret    

00000628 <str_ls_call40>:
 628:	6c                   	insb   (%dx),%es:(%edi)
 629:	73 5f                	jae    68a <str_ls_call45+0x8>
 62b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 62e:	6c                   	insb   (%dx),%es:(%edi)
 62f:	34 30                	xor    $0x30,%al
	...

00000632 <ls_call40>:
CS550LSSYSCALL(ls_call40)
 632:	b8 28 06 00 00       	mov    $0x628,%eax
 637:	cd 41                	int    $0x41
 639:	c3                   	ret    

0000063a <str_ls_call41>:
 63a:	6c                   	insb   (%dx),%es:(%edi)
 63b:	73 5f                	jae    69c <str_ls_call46+0x8>
 63d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 640:	6c                   	insb   (%dx),%es:(%edi)
 641:	34 31                	xor    $0x31,%al
	...

00000644 <ls_call41>:
CS550LSSYSCALL(ls_call41)
 644:	b8 3a 06 00 00       	mov    $0x63a,%eax
 649:	cd 41                	int    $0x41
 64b:	c3                   	ret    

0000064c <str_ls_call42>:
 64c:	6c                   	insb   (%dx),%es:(%edi)
 64d:	73 5f                	jae    6ae <str_ls_call47+0x8>
 64f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 652:	6c                   	insb   (%dx),%es:(%edi)
 653:	34 32                	xor    $0x32,%al
	...

00000656 <ls_call42>:
CS550LSSYSCALL(ls_call42)
 656:	b8 4c 06 00 00       	mov    $0x64c,%eax
 65b:	cd 41                	int    $0x41
 65d:	c3                   	ret    

0000065e <str_ls_call43>:
 65e:	6c                   	insb   (%dx),%es:(%edi)
 65f:	73 5f                	jae    6c0 <str_ls_call48+0x8>
 661:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 664:	6c                   	insb   (%dx),%es:(%edi)
 665:	34 33                	xor    $0x33,%al
	...

00000668 <ls_call43>:
CS550LSSYSCALL(ls_call43)
 668:	b8 5e 06 00 00       	mov    $0x65e,%eax
 66d:	cd 41                	int    $0x41
 66f:	c3                   	ret    

00000670 <str_ls_call44>:
 670:	6c                   	insb   (%dx),%es:(%edi)
 671:	73 5f                	jae    6d2 <str_ls_call49+0x8>
 673:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 676:	6c                   	insb   (%dx),%es:(%edi)
 677:	34 34                	xor    $0x34,%al
	...

0000067a <ls_call44>:
CS550LSSYSCALL(ls_call44)
 67a:	b8 70 06 00 00       	mov    $0x670,%eax
 67f:	cd 41                	int    $0x41
 681:	c3                   	ret    

00000682 <str_ls_call45>:
 682:	6c                   	insb   (%dx),%es:(%edi)
 683:	73 5f                	jae    6e4 <str_ls_call50+0x8>
 685:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 688:	6c                   	insb   (%dx),%es:(%edi)
 689:	34 35                	xor    $0x35,%al
	...

0000068c <ls_call45>:
CS550LSSYSCALL(ls_call45)
 68c:	b8 82 06 00 00       	mov    $0x682,%eax
 691:	cd 41                	int    $0x41
 693:	c3                   	ret    

00000694 <str_ls_call46>:
 694:	6c                   	insb   (%dx),%es:(%edi)
 695:	73 5f                	jae    6f6 <str_ht_call1+0x8>
 697:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 69a:	6c                   	insb   (%dx),%es:(%edi)
 69b:	34 36                	xor    $0x36,%al
	...

0000069e <ls_call46>:
CS550LSSYSCALL(ls_call46)
 69e:	b8 94 06 00 00       	mov    $0x694,%eax
 6a3:	cd 41                	int    $0x41
 6a5:	c3                   	ret    

000006a6 <str_ls_call47>:
 6a6:	6c                   	insb   (%dx),%es:(%edi)
 6a7:	73 5f                	jae    708 <ht_call2>
 6a9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6ac:	6c                   	insb   (%dx),%es:(%edi)
 6ad:	34 37                	xor    $0x37,%al
	...

000006b0 <ls_call47>:
CS550LSSYSCALL(ls_call47)
 6b0:	b8 a6 06 00 00       	mov    $0x6a6,%eax
 6b5:	cd 41                	int    $0x41
 6b7:	c3                   	ret    

000006b8 <str_ls_call48>:
 6b8:	6c                   	insb   (%dx),%es:(%edi)
 6b9:	73 5f                	jae    71a <ht_call3+0x1>
 6bb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6be:	6c                   	insb   (%dx),%es:(%edi)
 6bf:	34 38                	xor    $0x38,%al
	...

000006c2 <ls_call48>:
CS550LSSYSCALL(ls_call48)
 6c2:	b8 b8 06 00 00       	mov    $0x6b8,%eax
 6c7:	cd 41                	int    $0x41
 6c9:	c3                   	ret    

000006ca <str_ls_call49>:
 6ca:	6c                   	insb   (%dx),%es:(%edi)
 6cb:	73 5f                	jae    72c <ht_call4+0x2>
 6cd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6d0:	6c                   	insb   (%dx),%es:(%edi)
 6d1:	34 39                	xor    $0x39,%al
	...

000006d4 <ls_call49>:
CS550LSSYSCALL(ls_call49)
 6d4:	b8 ca 06 00 00       	mov    $0x6ca,%eax
 6d9:	cd 41                	int    $0x41
 6db:	c3                   	ret    

000006dc <str_ls_call50>:
 6dc:	6c                   	insb   (%dx),%es:(%edi)
 6dd:	73 5f                	jae    73e <ht_call5+0x3>
 6df:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6e2:	6c                   	insb   (%dx),%es:(%edi)
 6e3:	35                   	.byte 0x35
 6e4:	30 00                	xor    %al,(%eax)

000006e6 <ls_call50>:
CS550LSSYSCALL(ls_call50)
 6e6:	b8 dc 06 00 00       	mov    $0x6dc,%eax
 6eb:	cd 41                	int    $0x41
 6ed:	c3                   	ret    

000006ee <str_ht_call1>:
 6ee:	68 74 5f 63 61       	push   $0x61635f74
 6f3:	6c                   	insb   (%dx),%es:(%edi)
 6f4:	6c                   	insb   (%dx),%es:(%edi)
 6f5:	31 00                	xor    %eax,(%eax)

000006f7 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
 6f7:	b8 ee 06 00 00       	mov    $0x6ee,%eax
 6fc:	cd 42                	int    $0x42
 6fe:	c3                   	ret    

000006ff <str_ht_call2>:
 6ff:	68 74 5f 63 61       	push   $0x61635f74
 704:	6c                   	insb   (%dx),%es:(%edi)
 705:	6c                   	insb   (%dx),%es:(%edi)
 706:	32 00                	xor    (%eax),%al

00000708 <ht_call2>:
CS550HTSYSCALL(ht_call2)
 708:	b8 ff 06 00 00       	mov    $0x6ff,%eax
 70d:	cd 42                	int    $0x42
 70f:	c3                   	ret    

00000710 <str_ht_call3>:
 710:	68 74 5f 63 61       	push   $0x61635f74
 715:	6c                   	insb   (%dx),%es:(%edi)
 716:	6c                   	insb   (%dx),%es:(%edi)
 717:	33 00                	xor    (%eax),%eax

00000719 <ht_call3>:
CS550HTSYSCALL(ht_call3)
 719:	b8 10 07 00 00       	mov    $0x710,%eax
 71e:	cd 42                	int    $0x42
 720:	c3                   	ret    

00000721 <str_ht_call4>:
 721:	68 74 5f 63 61       	push   $0x61635f74
 726:	6c                   	insb   (%dx),%es:(%edi)
 727:	6c                   	insb   (%dx),%es:(%edi)
 728:	34 00                	xor    $0x0,%al

0000072a <ht_call4>:
CS550HTSYSCALL(ht_call4)
 72a:	b8 21 07 00 00       	mov    $0x721,%eax
 72f:	cd 42                	int    $0x42
 731:	c3                   	ret    

00000732 <str_ht_call5>:
 732:	68 74 5f 63 61       	push   $0x61635f74
 737:	6c                   	insb   (%dx),%es:(%edi)
 738:	6c                   	insb   (%dx),%es:(%edi)
 739:	35                   	.byte 0x35
	...

0000073b <ht_call5>:
CS550HTSYSCALL(ht_call5)
 73b:	b8 32 07 00 00       	mov    $0x732,%eax
 740:	cd 42                	int    $0x42
 742:	c3                   	ret    

00000743 <str_ht_call6>:
 743:	68 74 5f 63 61       	push   $0x61635f74
 748:	6c                   	insb   (%dx),%es:(%edi)
 749:	6c                   	insb   (%dx),%es:(%edi)
 74a:	36                   	ss
	...

0000074c <ht_call6>:
CS550HTSYSCALL(ht_call6)
 74c:	b8 43 07 00 00       	mov    $0x743,%eax
 751:	cd 42                	int    $0x42
 753:	c3                   	ret    

00000754 <str_ht_call7>:
 754:	68 74 5f 63 61       	push   $0x61635f74
 759:	6c                   	insb   (%dx),%es:(%edi)
 75a:	6c                   	insb   (%dx),%es:(%edi)
 75b:	37                   	aaa    
	...

0000075d <ht_call7>:
CS550HTSYSCALL(ht_call7)
 75d:	b8 54 07 00 00       	mov    $0x754,%eax
 762:	cd 42                	int    $0x42
 764:	c3                   	ret    

00000765 <str_ht_call8>:
 765:	68 74 5f 63 61       	push   $0x61635f74
 76a:	6c                   	insb   (%dx),%es:(%edi)
 76b:	6c                   	insb   (%dx),%es:(%edi)
 76c:	38 00                	cmp    %al,(%eax)

0000076e <ht_call8>:
CS550HTSYSCALL(ht_call8)
 76e:	b8 65 07 00 00       	mov    $0x765,%eax
 773:	cd 42                	int    $0x42
 775:	c3                   	ret    

00000776 <str_ht_call9>:
 776:	68 74 5f 63 61       	push   $0x61635f74
 77b:	6c                   	insb   (%dx),%es:(%edi)
 77c:	6c                   	insb   (%dx),%es:(%edi)
 77d:	39 00                	cmp    %eax,(%eax)

0000077f <ht_call9>:
CS550HTSYSCALL(ht_call9)
 77f:	b8 76 07 00 00       	mov    $0x776,%eax
 784:	cd 42                	int    $0x42
 786:	c3                   	ret    

00000787 <str_ht_call10>:
 787:	68 74 5f 63 61       	push   $0x61635f74
 78c:	6c                   	insb   (%dx),%es:(%edi)
 78d:	6c                   	insb   (%dx),%es:(%edi)
 78e:	31 30                	xor    %esi,(%eax)
	...

00000791 <ht_call10>:
CS550HTSYSCALL(ht_call10)
 791:	b8 87 07 00 00       	mov    $0x787,%eax
 796:	cd 42                	int    $0x42
 798:	c3                   	ret    

00000799 <str_ht_call11>:
 799:	68 74 5f 63 61       	push   $0x61635f74
 79e:	6c                   	insb   (%dx),%es:(%edi)
 79f:	6c                   	insb   (%dx),%es:(%edi)
 7a0:	31 31                	xor    %esi,(%ecx)
	...

000007a3 <ht_call11>:
CS550HTSYSCALL(ht_call11)
 7a3:	b8 99 07 00 00       	mov    $0x799,%eax
 7a8:	cd 42                	int    $0x42
 7aa:	c3                   	ret    

000007ab <str_ht_call12>:
 7ab:	68 74 5f 63 61       	push   $0x61635f74
 7b0:	6c                   	insb   (%dx),%es:(%edi)
 7b1:	6c                   	insb   (%dx),%es:(%edi)
 7b2:	31 32                	xor    %esi,(%edx)
	...

000007b5 <ht_call12>:
CS550HTSYSCALL(ht_call12)
 7b5:	b8 ab 07 00 00       	mov    $0x7ab,%eax
 7ba:	cd 42                	int    $0x42
 7bc:	c3                   	ret    

000007bd <str_ht_call13>:
 7bd:	68 74 5f 63 61       	push   $0x61635f74
 7c2:	6c                   	insb   (%dx),%es:(%edi)
 7c3:	6c                   	insb   (%dx),%es:(%edi)
 7c4:	31 33                	xor    %esi,(%ebx)
	...

000007c7 <ht_call13>:
CS550HTSYSCALL(ht_call13)
 7c7:	b8 bd 07 00 00       	mov    $0x7bd,%eax
 7cc:	cd 42                	int    $0x42
 7ce:	c3                   	ret    

000007cf <str_ht_call14>:
 7cf:	68 74 5f 63 61       	push   $0x61635f74
 7d4:	6c                   	insb   (%dx),%es:(%edi)
 7d5:	6c                   	insb   (%dx),%es:(%edi)
 7d6:	31 34 00             	xor    %esi,(%eax,%eax,1)

000007d9 <ht_call14>:
CS550HTSYSCALL(ht_call14)
 7d9:	b8 cf 07 00 00       	mov    $0x7cf,%eax
 7de:	cd 42                	int    $0x42
 7e0:	c3                   	ret    

000007e1 <str_ht_call15>:
 7e1:	68 74 5f 63 61       	push   $0x61635f74
 7e6:	6c                   	insb   (%dx),%es:(%edi)
 7e7:	6c                   	insb   (%dx),%es:(%edi)
 7e8:	31                   	.byte 0x31
 7e9:	35                   	.byte 0x35
	...

000007eb <ht_call15>:
CS550HTSYSCALL(ht_call15)
 7eb:	b8 e1 07 00 00       	mov    $0x7e1,%eax
 7f0:	cd 42                	int    $0x42
 7f2:	c3                   	ret    

000007f3 <str_ht_call16>:
 7f3:	68 74 5f 63 61       	push   $0x61635f74
 7f8:	6c                   	insb   (%dx),%es:(%edi)
 7f9:	6c                   	insb   (%dx),%es:(%edi)
 7fa:	31 36                	xor    %esi,(%esi)
	...

000007fd <ht_call16>:
CS550HTSYSCALL(ht_call16)
 7fd:	b8 f3 07 00 00       	mov    $0x7f3,%eax
 802:	cd 42                	int    $0x42
 804:	c3                   	ret    

00000805 <str_ht_call17>:
 805:	68 74 5f 63 61       	push   $0x61635f74
 80a:	6c                   	insb   (%dx),%es:(%edi)
 80b:	6c                   	insb   (%dx),%es:(%edi)
 80c:	31 37                	xor    %esi,(%edi)
	...

0000080f <ht_call17>:
CS550HTSYSCALL(ht_call17)
 80f:	b8 05 08 00 00       	mov    $0x805,%eax
 814:	cd 42                	int    $0x42
 816:	c3                   	ret    

00000817 <str_ht_call18>:
 817:	68 74 5f 63 61       	push   $0x61635f74
 81c:	6c                   	insb   (%dx),%es:(%edi)
 81d:	6c                   	insb   (%dx),%es:(%edi)
 81e:	31 38                	xor    %edi,(%eax)
	...

00000821 <ht_call18>:
CS550HTSYSCALL(ht_call18)
 821:	b8 17 08 00 00       	mov    $0x817,%eax
 826:	cd 42                	int    $0x42
 828:	c3                   	ret    

00000829 <str_ht_call19>:
 829:	68 74 5f 63 61       	push   $0x61635f74
 82e:	6c                   	insb   (%dx),%es:(%edi)
 82f:	6c                   	insb   (%dx),%es:(%edi)
 830:	31 39                	xor    %edi,(%ecx)
	...

00000833 <ht_call19>:
CS550HTSYSCALL(ht_call19)
 833:	b8 29 08 00 00       	mov    $0x829,%eax
 838:	cd 42                	int    $0x42
 83a:	c3                   	ret    

0000083b <str_ht_call20>:
 83b:	68 74 5f 63 61       	push   $0x61635f74
 840:	6c                   	insb   (%dx),%es:(%edi)
 841:	6c                   	insb   (%dx),%es:(%edi)
 842:	32 30                	xor    (%eax),%dh
	...

00000845 <ht_call20>:
CS550HTSYSCALL(ht_call20)
 845:	b8 3b 08 00 00       	mov    $0x83b,%eax
 84a:	cd 42                	int    $0x42
 84c:	c3                   	ret    

0000084d <str_ht_call21>:
 84d:	68 74 5f 63 61       	push   $0x61635f74
 852:	6c                   	insb   (%dx),%es:(%edi)
 853:	6c                   	insb   (%dx),%es:(%edi)
 854:	32 31                	xor    (%ecx),%dh
	...

00000857 <ht_call21>:
CS550HTSYSCALL(ht_call21)
 857:	b8 4d 08 00 00       	mov    $0x84d,%eax
 85c:	cd 42                	int    $0x42
 85e:	c3                   	ret    

0000085f <str_ht_call22>:
 85f:	68 74 5f 63 61       	push   $0x61635f74
 864:	6c                   	insb   (%dx),%es:(%edi)
 865:	6c                   	insb   (%dx),%es:(%edi)
 866:	32 32                	xor    (%edx),%dh
	...

00000869 <ht_call22>:
CS550HTSYSCALL(ht_call22)
 869:	b8 5f 08 00 00       	mov    $0x85f,%eax
 86e:	cd 42                	int    $0x42
 870:	c3                   	ret    

00000871 <str_ht_call23>:
 871:	68 74 5f 63 61       	push   $0x61635f74
 876:	6c                   	insb   (%dx),%es:(%edi)
 877:	6c                   	insb   (%dx),%es:(%edi)
 878:	32 33                	xor    (%ebx),%dh
	...

0000087b <ht_call23>:
CS550HTSYSCALL(ht_call23)
 87b:	b8 71 08 00 00       	mov    $0x871,%eax
 880:	cd 42                	int    $0x42
 882:	c3                   	ret    

00000883 <str_ht_call24>:
 883:	68 74 5f 63 61       	push   $0x61635f74
 888:	6c                   	insb   (%dx),%es:(%edi)
 889:	6c                   	insb   (%dx),%es:(%edi)
 88a:	32 34 00             	xor    (%eax,%eax,1),%dh

0000088d <ht_call24>:
CS550HTSYSCALL(ht_call24)
 88d:	b8 83 08 00 00       	mov    $0x883,%eax
 892:	cd 42                	int    $0x42
 894:	c3                   	ret    

00000895 <str_ht_call25>:
 895:	68 74 5f 63 61       	push   $0x61635f74
 89a:	6c                   	insb   (%dx),%es:(%edi)
 89b:	6c                   	insb   (%dx),%es:(%edi)
 89c:	32                   	.byte 0x32
 89d:	35                   	.byte 0x35
	...

0000089f <ht_call25>:
CS550HTSYSCALL(ht_call25)
 89f:	b8 95 08 00 00       	mov    $0x895,%eax
 8a4:	cd 42                	int    $0x42
 8a6:	c3                   	ret    

000008a7 <str_ht_call26>:
 8a7:	68 74 5f 63 61       	push   $0x61635f74
 8ac:	6c                   	insb   (%dx),%es:(%edi)
 8ad:	6c                   	insb   (%dx),%es:(%edi)
 8ae:	32 36                	xor    (%esi),%dh
	...

000008b1 <ht_call26>:
CS550HTSYSCALL(ht_call26)
 8b1:	b8 a7 08 00 00       	mov    $0x8a7,%eax
 8b6:	cd 42                	int    $0x42
 8b8:	c3                   	ret    

000008b9 <str_ht_call27>:
 8b9:	68 74 5f 63 61       	push   $0x61635f74
 8be:	6c                   	insb   (%dx),%es:(%edi)
 8bf:	6c                   	insb   (%dx),%es:(%edi)
 8c0:	32 37                	xor    (%edi),%dh
	...

000008c3 <ht_call27>:
CS550HTSYSCALL(ht_call27)
 8c3:	b8 b9 08 00 00       	mov    $0x8b9,%eax
 8c8:	cd 42                	int    $0x42
 8ca:	c3                   	ret    

000008cb <str_ht_call28>:
 8cb:	68 74 5f 63 61       	push   $0x61635f74
 8d0:	6c                   	insb   (%dx),%es:(%edi)
 8d1:	6c                   	insb   (%dx),%es:(%edi)
 8d2:	32 38                	xor    (%eax),%bh
	...

000008d5 <ht_call28>:
CS550HTSYSCALL(ht_call28)
 8d5:	b8 cb 08 00 00       	mov    $0x8cb,%eax
 8da:	cd 42                	int    $0x42
 8dc:	c3                   	ret    

000008dd <str_ht_call29>:
 8dd:	68 74 5f 63 61       	push   $0x61635f74
 8e2:	6c                   	insb   (%dx),%es:(%edi)
 8e3:	6c                   	insb   (%dx),%es:(%edi)
 8e4:	32 39                	xor    (%ecx),%bh
	...

000008e7 <ht_call29>:
CS550HTSYSCALL(ht_call29)
 8e7:	b8 dd 08 00 00       	mov    $0x8dd,%eax
 8ec:	cd 42                	int    $0x42
 8ee:	c3                   	ret    

000008ef <str_ht_call30>:
 8ef:	68 74 5f 63 61       	push   $0x61635f74
 8f4:	6c                   	insb   (%dx),%es:(%edi)
 8f5:	6c                   	insb   (%dx),%es:(%edi)
 8f6:	33 30                	xor    (%eax),%esi
	...

000008f9 <ht_call30>:
CS550HTSYSCALL(ht_call30)
 8f9:	b8 ef 08 00 00       	mov    $0x8ef,%eax
 8fe:	cd 42                	int    $0x42
 900:	c3                   	ret    

00000901 <str_ht_call31>:
 901:	68 74 5f 63 61       	push   $0x61635f74
 906:	6c                   	insb   (%dx),%es:(%edi)
 907:	6c                   	insb   (%dx),%es:(%edi)
 908:	33 31                	xor    (%ecx),%esi
	...

0000090b <ht_call31>:
CS550HTSYSCALL(ht_call31)
 90b:	b8 01 09 00 00       	mov    $0x901,%eax
 910:	cd 42                	int    $0x42
 912:	c3                   	ret    

00000913 <str_ht_call32>:
 913:	68 74 5f 63 61       	push   $0x61635f74
 918:	6c                   	insb   (%dx),%es:(%edi)
 919:	6c                   	insb   (%dx),%es:(%edi)
 91a:	33 32                	xor    (%edx),%esi
	...

0000091d <ht_call32>:
CS550HTSYSCALL(ht_call32)
 91d:	b8 13 09 00 00       	mov    $0x913,%eax
 922:	cd 42                	int    $0x42
 924:	c3                   	ret    

00000925 <str_ht_call33>:
 925:	68 74 5f 63 61       	push   $0x61635f74
 92a:	6c                   	insb   (%dx),%es:(%edi)
 92b:	6c                   	insb   (%dx),%es:(%edi)
 92c:	33 33                	xor    (%ebx),%esi
	...

0000092f <ht_call33>:
CS550HTSYSCALL(ht_call33)
 92f:	b8 25 09 00 00       	mov    $0x925,%eax
 934:	cd 42                	int    $0x42
 936:	c3                   	ret    

00000937 <str_ht_call34>:
 937:	68 74 5f 63 61       	push   $0x61635f74
 93c:	6c                   	insb   (%dx),%es:(%edi)
 93d:	6c                   	insb   (%dx),%es:(%edi)
 93e:	33 34 00             	xor    (%eax,%eax,1),%esi

00000941 <ht_call34>:
CS550HTSYSCALL(ht_call34)
 941:	b8 37 09 00 00       	mov    $0x937,%eax
 946:	cd 42                	int    $0x42
 948:	c3                   	ret    

00000949 <str_ht_call35>:
 949:	68 74 5f 63 61       	push   $0x61635f74
 94e:	6c                   	insb   (%dx),%es:(%edi)
 94f:	6c                   	insb   (%dx),%es:(%edi)
 950:	33                   	.byte 0x33
 951:	35                   	.byte 0x35
	...

00000953 <ht_call35>:
CS550HTSYSCALL(ht_call35)
 953:	b8 49 09 00 00       	mov    $0x949,%eax
 958:	cd 42                	int    $0x42
 95a:	c3                   	ret    

0000095b <str_ht_call36>:
 95b:	68 74 5f 63 61       	push   $0x61635f74
 960:	6c                   	insb   (%dx),%es:(%edi)
 961:	6c                   	insb   (%dx),%es:(%edi)
 962:	33 36                	xor    (%esi),%esi
	...

00000965 <ht_call36>:
CS550HTSYSCALL(ht_call36)
 965:	b8 5b 09 00 00       	mov    $0x95b,%eax
 96a:	cd 42                	int    $0x42
 96c:	c3                   	ret    

0000096d <str_ht_call37>:
 96d:	68 74 5f 63 61       	push   $0x61635f74
 972:	6c                   	insb   (%dx),%es:(%edi)
 973:	6c                   	insb   (%dx),%es:(%edi)
 974:	33 37                	xor    (%edi),%esi
	...

00000977 <ht_call37>:
CS550HTSYSCALL(ht_call37)
 977:	b8 6d 09 00 00       	mov    $0x96d,%eax
 97c:	cd 42                	int    $0x42
 97e:	c3                   	ret    

0000097f <str_ht_call38>:
 97f:	68 74 5f 63 61       	push   $0x61635f74
 984:	6c                   	insb   (%dx),%es:(%edi)
 985:	6c                   	insb   (%dx),%es:(%edi)
 986:	33 38                	xor    (%eax),%edi
	...

00000989 <ht_call38>:
CS550HTSYSCALL(ht_call38)
 989:	b8 7f 09 00 00       	mov    $0x97f,%eax
 98e:	cd 42                	int    $0x42
 990:	c3                   	ret    

00000991 <str_ht_call39>:
 991:	68 74 5f 63 61       	push   $0x61635f74
 996:	6c                   	insb   (%dx),%es:(%edi)
 997:	6c                   	insb   (%dx),%es:(%edi)
 998:	33 39                	xor    (%ecx),%edi
	...

0000099b <ht_call39>:
CS550HTSYSCALL(ht_call39)
 99b:	b8 91 09 00 00       	mov    $0x991,%eax
 9a0:	cd 42                	int    $0x42
 9a2:	c3                   	ret    

000009a3 <str_ht_call40>:
 9a3:	68 74 5f 63 61       	push   $0x61635f74
 9a8:	6c                   	insb   (%dx),%es:(%edi)
 9a9:	6c                   	insb   (%dx),%es:(%edi)
 9aa:	34 30                	xor    $0x30,%al
	...

000009ad <ht_call40>:
CS550HTSYSCALL(ht_call40)
 9ad:	b8 a3 09 00 00       	mov    $0x9a3,%eax
 9b2:	cd 42                	int    $0x42
 9b4:	c3                   	ret    

000009b5 <str_ht_call41>:
 9b5:	68 74 5f 63 61       	push   $0x61635f74
 9ba:	6c                   	insb   (%dx),%es:(%edi)
 9bb:	6c                   	insb   (%dx),%es:(%edi)
 9bc:	34 31                	xor    $0x31,%al
	...

000009bf <ht_call41>:
CS550HTSYSCALL(ht_call41)
 9bf:	b8 b5 09 00 00       	mov    $0x9b5,%eax
 9c4:	cd 42                	int    $0x42
 9c6:	c3                   	ret    

000009c7 <str_ht_call42>:
 9c7:	68 74 5f 63 61       	push   $0x61635f74
 9cc:	6c                   	insb   (%dx),%es:(%edi)
 9cd:	6c                   	insb   (%dx),%es:(%edi)
 9ce:	34 32                	xor    $0x32,%al
	...

000009d1 <ht_call42>:
CS550HTSYSCALL(ht_call42)
 9d1:	b8 c7 09 00 00       	mov    $0x9c7,%eax
 9d6:	cd 42                	int    $0x42
 9d8:	c3                   	ret    

000009d9 <str_ht_call43>:
 9d9:	68 74 5f 63 61       	push   $0x61635f74
 9de:	6c                   	insb   (%dx),%es:(%edi)
 9df:	6c                   	insb   (%dx),%es:(%edi)
 9e0:	34 33                	xor    $0x33,%al
	...

000009e3 <ht_call43>:
CS550HTSYSCALL(ht_call43)
 9e3:	b8 d9 09 00 00       	mov    $0x9d9,%eax
 9e8:	cd 42                	int    $0x42
 9ea:	c3                   	ret    

000009eb <str_ht_call44>:
 9eb:	68 74 5f 63 61       	push   $0x61635f74
 9f0:	6c                   	insb   (%dx),%es:(%edi)
 9f1:	6c                   	insb   (%dx),%es:(%edi)
 9f2:	34 34                	xor    $0x34,%al
	...

000009f5 <ht_call44>:
CS550HTSYSCALL(ht_call44)
 9f5:	b8 eb 09 00 00       	mov    $0x9eb,%eax
 9fa:	cd 42                	int    $0x42
 9fc:	c3                   	ret    

000009fd <str_ht_call45>:
 9fd:	68 74 5f 63 61       	push   $0x61635f74
 a02:	6c                   	insb   (%dx),%es:(%edi)
 a03:	6c                   	insb   (%dx),%es:(%edi)
 a04:	34 35                	xor    $0x35,%al
	...

00000a07 <ht_call45>:
CS550HTSYSCALL(ht_call45)
 a07:	b8 fd 09 00 00       	mov    $0x9fd,%eax
 a0c:	cd 42                	int    $0x42
 a0e:	c3                   	ret    

00000a0f <str_ht_call46>:
 a0f:	68 74 5f 63 61       	push   $0x61635f74
 a14:	6c                   	insb   (%dx),%es:(%edi)
 a15:	6c                   	insb   (%dx),%es:(%edi)
 a16:	34 36                	xor    $0x36,%al
	...

00000a19 <ht_call46>:
CS550HTSYSCALL(ht_call46)
 a19:	b8 0f 0a 00 00       	mov    $0xa0f,%eax
 a1e:	cd 42                	int    $0x42
 a20:	c3                   	ret    

00000a21 <str_ht_call47>:
 a21:	68 74 5f 63 61       	push   $0x61635f74
 a26:	6c                   	insb   (%dx),%es:(%edi)
 a27:	6c                   	insb   (%dx),%es:(%edi)
 a28:	34 37                	xor    $0x37,%al
	...

00000a2b <ht_call47>:
CS550HTSYSCALL(ht_call47)
 a2b:	b8 21 0a 00 00       	mov    $0xa21,%eax
 a30:	cd 42                	int    $0x42
 a32:	c3                   	ret    

00000a33 <str_ht_call48>:
 a33:	68 74 5f 63 61       	push   $0x61635f74
 a38:	6c                   	insb   (%dx),%es:(%edi)
 a39:	6c                   	insb   (%dx),%es:(%edi)
 a3a:	34 38                	xor    $0x38,%al
	...

00000a3d <ht_call48>:
CS550HTSYSCALL(ht_call48)
 a3d:	b8 33 0a 00 00       	mov    $0xa33,%eax
 a42:	cd 42                	int    $0x42
 a44:	c3                   	ret    

00000a45 <str_ht_call49>:
 a45:	68 74 5f 63 61       	push   $0x61635f74
 a4a:	6c                   	insb   (%dx),%es:(%edi)
 a4b:	6c                   	insb   (%dx),%es:(%edi)
 a4c:	34 39                	xor    $0x39,%al
	...

00000a4f <ht_call49>:
CS550HTSYSCALL(ht_call49)
 a4f:	b8 45 0a 00 00       	mov    $0xa45,%eax
 a54:	cd 42                	int    $0x42
 a56:	c3                   	ret    

00000a57 <str_ht_call50>:
 a57:	68 74 5f 63 61       	push   $0x61635f74
 a5c:	6c                   	insb   (%dx),%es:(%edi)
 a5d:	6c                   	insb   (%dx),%es:(%edi)
 a5e:	35                   	.byte 0x35
 a5f:	30 00                	xor    %al,(%eax)

00000a61 <ht_call50>:
CS550HTSYSCALL(ht_call50)
 a61:	b8 57 0a 00 00       	mov    $0xa57,%eax
 a66:	cd 42                	int    $0x42
 a68:	c3                   	ret    

00000a69 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 a69:	55                   	push   %ebp
 a6a:	89 e5                	mov    %esp,%ebp
 a6c:	83 ec 18             	sub    $0x18,%esp
 a6f:	8b 45 0c             	mov    0xc(%ebp),%eax
 a72:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 a75:	83 ec 04             	sub    $0x4,%esp
 a78:	6a 01                	push   $0x1
 a7a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 a7d:	50                   	push   %eax
 a7e:	ff 75 08             	pushl  0x8(%ebp)
 a81:	e8 65 f8 ff ff       	call   2eb <write>
 a86:	83 c4 10             	add    $0x10,%esp
}
 a89:	90                   	nop
 a8a:	c9                   	leave  
 a8b:	c3                   	ret    

00000a8c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 a8c:	55                   	push   %ebp
 a8d:	89 e5                	mov    %esp,%ebp
 a8f:	53                   	push   %ebx
 a90:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 a93:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 a9a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 a9e:	74 17                	je     ab7 <printint+0x2b>
 aa0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 aa4:	79 11                	jns    ab7 <printint+0x2b>
    neg = 1;
 aa6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 aad:	8b 45 0c             	mov    0xc(%ebp),%eax
 ab0:	f7 d8                	neg    %eax
 ab2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 ab5:	eb 06                	jmp    abd <printint+0x31>
  } else {
    x = xx;
 ab7:	8b 45 0c             	mov    0xc(%ebp),%eax
 aba:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 abd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 ac4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 ac7:	8d 41 01             	lea    0x1(%ecx),%eax
 aca:	89 45 f4             	mov    %eax,-0xc(%ebp)
 acd:	8b 5d 10             	mov    0x10(%ebp),%ebx
 ad0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ad3:	ba 00 00 00 00       	mov    $0x0,%edx
 ad8:	f7 f3                	div    %ebx
 ada:	89 d0                	mov    %edx,%eax
 adc:	0f b6 80 70 11 00 00 	movzbl 0x1170(%eax),%eax
 ae3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 ae7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 aea:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aed:	ba 00 00 00 00       	mov    $0x0,%edx
 af2:	f7 f3                	div    %ebx
 af4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 af7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 afb:	75 c7                	jne    ac4 <printint+0x38>
  if(neg)
 afd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b01:	74 2d                	je     b30 <printint+0xa4>
    buf[i++] = '-';
 b03:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b06:	8d 50 01             	lea    0x1(%eax),%edx
 b09:	89 55 f4             	mov    %edx,-0xc(%ebp)
 b0c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 b11:	eb 1d                	jmp    b30 <printint+0xa4>
    putc(fd, buf[i]);
 b13:	8d 55 dc             	lea    -0x24(%ebp),%edx
 b16:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b19:	01 d0                	add    %edx,%eax
 b1b:	0f b6 00             	movzbl (%eax),%eax
 b1e:	0f be c0             	movsbl %al,%eax
 b21:	83 ec 08             	sub    $0x8,%esp
 b24:	50                   	push   %eax
 b25:	ff 75 08             	pushl  0x8(%ebp)
 b28:	e8 3c ff ff ff       	call   a69 <putc>
 b2d:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 b30:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 b34:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b38:	79 d9                	jns    b13 <printint+0x87>
    putc(fd, buf[i]);
}
 b3a:	90                   	nop
 b3b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b3e:	c9                   	leave  
 b3f:	c3                   	ret    

00000b40 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
 b43:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 b46:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 b4d:	8d 45 0c             	lea    0xc(%ebp),%eax
 b50:	83 c0 04             	add    $0x4,%eax
 b53:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 b56:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 b5d:	e9 59 01 00 00       	jmp    cbb <printf+0x17b>
    c = fmt[i] & 0xff;
 b62:	8b 55 0c             	mov    0xc(%ebp),%edx
 b65:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b68:	01 d0                	add    %edx,%eax
 b6a:	0f b6 00             	movzbl (%eax),%eax
 b6d:	0f be c0             	movsbl %al,%eax
 b70:	25 ff 00 00 00       	and    $0xff,%eax
 b75:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 b78:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b7c:	75 2c                	jne    baa <printf+0x6a>
      if(c == '%'){
 b7e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 b82:	75 0c                	jne    b90 <printf+0x50>
        state = '%';
 b84:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 b8b:	e9 27 01 00 00       	jmp    cb7 <printf+0x177>
      } else {
        putc(fd, c);
 b90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 b93:	0f be c0             	movsbl %al,%eax
 b96:	83 ec 08             	sub    $0x8,%esp
 b99:	50                   	push   %eax
 b9a:	ff 75 08             	pushl  0x8(%ebp)
 b9d:	e8 c7 fe ff ff       	call   a69 <putc>
 ba2:	83 c4 10             	add    $0x10,%esp
 ba5:	e9 0d 01 00 00       	jmp    cb7 <printf+0x177>
      }
    } else if(state == '%'){
 baa:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 bae:	0f 85 03 01 00 00    	jne    cb7 <printf+0x177>
      if(c == 'd'){
 bb4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 bb8:	75 1e                	jne    bd8 <printf+0x98>
        printint(fd, *ap, 10, 1);
 bba:	8b 45 e8             	mov    -0x18(%ebp),%eax
 bbd:	8b 00                	mov    (%eax),%eax
 bbf:	6a 01                	push   $0x1
 bc1:	6a 0a                	push   $0xa
 bc3:	50                   	push   %eax
 bc4:	ff 75 08             	pushl  0x8(%ebp)
 bc7:	e8 c0 fe ff ff       	call   a8c <printint>
 bcc:	83 c4 10             	add    $0x10,%esp
        ap++;
 bcf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 bd3:	e9 d8 00 00 00       	jmp    cb0 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 bd8:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 bdc:	74 06                	je     be4 <printf+0xa4>
 bde:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 be2:	75 1e                	jne    c02 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 be4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 be7:	8b 00                	mov    (%eax),%eax
 be9:	6a 00                	push   $0x0
 beb:	6a 10                	push   $0x10
 bed:	50                   	push   %eax
 bee:	ff 75 08             	pushl  0x8(%ebp)
 bf1:	e8 96 fe ff ff       	call   a8c <printint>
 bf6:	83 c4 10             	add    $0x10,%esp
        ap++;
 bf9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 bfd:	e9 ae 00 00 00       	jmp    cb0 <printf+0x170>
      } else if(c == 's'){
 c02:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 c06:	75 43                	jne    c4b <printf+0x10b>
        s = (char*)*ap;
 c08:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c0b:	8b 00                	mov    (%eax),%eax
 c0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 c10:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 c14:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c18:	75 25                	jne    c3f <printf+0xff>
          s = "(null)";
 c1a:	c7 45 f4 1d 0f 00 00 	movl   $0xf1d,-0xc(%ebp)
        while(*s != 0){
 c21:	eb 1c                	jmp    c3f <printf+0xff>
          putc(fd, *s);
 c23:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c26:	0f b6 00             	movzbl (%eax),%eax
 c29:	0f be c0             	movsbl %al,%eax
 c2c:	83 ec 08             	sub    $0x8,%esp
 c2f:	50                   	push   %eax
 c30:	ff 75 08             	pushl  0x8(%ebp)
 c33:	e8 31 fe ff ff       	call   a69 <putc>
 c38:	83 c4 10             	add    $0x10,%esp
          s++;
 c3b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 c3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c42:	0f b6 00             	movzbl (%eax),%eax
 c45:	84 c0                	test   %al,%al
 c47:	75 da                	jne    c23 <printf+0xe3>
 c49:	eb 65                	jmp    cb0 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 c4b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 c4f:	75 1d                	jne    c6e <printf+0x12e>
        putc(fd, *ap);
 c51:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c54:	8b 00                	mov    (%eax),%eax
 c56:	0f be c0             	movsbl %al,%eax
 c59:	83 ec 08             	sub    $0x8,%esp
 c5c:	50                   	push   %eax
 c5d:	ff 75 08             	pushl  0x8(%ebp)
 c60:	e8 04 fe ff ff       	call   a69 <putc>
 c65:	83 c4 10             	add    $0x10,%esp
        ap++;
 c68:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 c6c:	eb 42                	jmp    cb0 <printf+0x170>
      } else if(c == '%'){
 c6e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 c72:	75 17                	jne    c8b <printf+0x14b>
        putc(fd, c);
 c74:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c77:	0f be c0             	movsbl %al,%eax
 c7a:	83 ec 08             	sub    $0x8,%esp
 c7d:	50                   	push   %eax
 c7e:	ff 75 08             	pushl  0x8(%ebp)
 c81:	e8 e3 fd ff ff       	call   a69 <putc>
 c86:	83 c4 10             	add    $0x10,%esp
 c89:	eb 25                	jmp    cb0 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 c8b:	83 ec 08             	sub    $0x8,%esp
 c8e:	6a 25                	push   $0x25
 c90:	ff 75 08             	pushl  0x8(%ebp)
 c93:	e8 d1 fd ff ff       	call   a69 <putc>
 c98:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 c9b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c9e:	0f be c0             	movsbl %al,%eax
 ca1:	83 ec 08             	sub    $0x8,%esp
 ca4:	50                   	push   %eax
 ca5:	ff 75 08             	pushl  0x8(%ebp)
 ca8:	e8 bc fd ff ff       	call   a69 <putc>
 cad:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 cb0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 cb7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 cbb:	8b 55 0c             	mov    0xc(%ebp),%edx
 cbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cc1:	01 d0                	add    %edx,%eax
 cc3:	0f b6 00             	movzbl (%eax),%eax
 cc6:	84 c0                	test   %al,%al
 cc8:	0f 85 94 fe ff ff    	jne    b62 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 cce:	90                   	nop
 ccf:	c9                   	leave  
 cd0:	c3                   	ret    

00000cd1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 cd1:	55                   	push   %ebp
 cd2:	89 e5                	mov    %esp,%ebp
 cd4:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 cd7:	8b 45 08             	mov    0x8(%ebp),%eax
 cda:	83 e8 08             	sub    $0x8,%eax
 cdd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ce0:	a1 8c 11 00 00       	mov    0x118c,%eax
 ce5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 ce8:	eb 24                	jmp    d0e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ced:	8b 00                	mov    (%eax),%eax
 cef:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 cf2:	77 12                	ja     d06 <free+0x35>
 cf4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 cf7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 cfa:	77 24                	ja     d20 <free+0x4f>
 cfc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cff:	8b 00                	mov    (%eax),%eax
 d01:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d04:	77 1a                	ja     d20 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d06:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d09:	8b 00                	mov    (%eax),%eax
 d0b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 d0e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d11:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 d14:	76 d4                	jbe    cea <free+0x19>
 d16:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d19:	8b 00                	mov    (%eax),%eax
 d1b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d1e:	76 ca                	jbe    cea <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 d20:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d23:	8b 40 04             	mov    0x4(%eax),%eax
 d26:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 d2d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d30:	01 c2                	add    %eax,%edx
 d32:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d35:	8b 00                	mov    (%eax),%eax
 d37:	39 c2                	cmp    %eax,%edx
 d39:	75 24                	jne    d5f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 d3b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d3e:	8b 50 04             	mov    0x4(%eax),%edx
 d41:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d44:	8b 00                	mov    (%eax),%eax
 d46:	8b 40 04             	mov    0x4(%eax),%eax
 d49:	01 c2                	add    %eax,%edx
 d4b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d4e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 d51:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d54:	8b 00                	mov    (%eax),%eax
 d56:	8b 10                	mov    (%eax),%edx
 d58:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d5b:	89 10                	mov    %edx,(%eax)
 d5d:	eb 0a                	jmp    d69 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 d5f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d62:	8b 10                	mov    (%eax),%edx
 d64:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d67:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 d69:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d6c:	8b 40 04             	mov    0x4(%eax),%eax
 d6f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 d76:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d79:	01 d0                	add    %edx,%eax
 d7b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d7e:	75 20                	jne    da0 <free+0xcf>
    p->s.size += bp->s.size;
 d80:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d83:	8b 50 04             	mov    0x4(%eax),%edx
 d86:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d89:	8b 40 04             	mov    0x4(%eax),%eax
 d8c:	01 c2                	add    %eax,%edx
 d8e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d91:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 d94:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d97:	8b 10                	mov    (%eax),%edx
 d99:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d9c:	89 10                	mov    %edx,(%eax)
 d9e:	eb 08                	jmp    da8 <free+0xd7>
  } else
    p->s.ptr = bp;
 da0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 da3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 da6:	89 10                	mov    %edx,(%eax)
  freep = p;
 da8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 dab:	a3 8c 11 00 00       	mov    %eax,0x118c
}
 db0:	90                   	nop
 db1:	c9                   	leave  
 db2:	c3                   	ret    

00000db3 <morecore>:

static Header*
morecore(uint nu)
{
 db3:	55                   	push   %ebp
 db4:	89 e5                	mov    %esp,%ebp
 db6:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 db9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 dc0:	77 07                	ja     dc9 <morecore+0x16>
    nu = 4096;
 dc2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 dc9:	8b 45 08             	mov    0x8(%ebp),%eax
 dcc:	c1 e0 03             	shl    $0x3,%eax
 dcf:	83 ec 0c             	sub    $0xc,%esp
 dd2:	50                   	push   %eax
 dd3:	e8 7b f5 ff ff       	call   353 <sbrk>
 dd8:	83 c4 10             	add    $0x10,%esp
 ddb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 dde:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 de2:	75 07                	jne    deb <morecore+0x38>
    return 0;
 de4:	b8 00 00 00 00       	mov    $0x0,%eax
 de9:	eb 26                	jmp    e11 <morecore+0x5e>
  hp = (Header*)p;
 deb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 df1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 df4:	8b 55 08             	mov    0x8(%ebp),%edx
 df7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 dfa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 dfd:	83 c0 08             	add    $0x8,%eax
 e00:	83 ec 0c             	sub    $0xc,%esp
 e03:	50                   	push   %eax
 e04:	e8 c8 fe ff ff       	call   cd1 <free>
 e09:	83 c4 10             	add    $0x10,%esp
  return freep;
 e0c:	a1 8c 11 00 00       	mov    0x118c,%eax
}
 e11:	c9                   	leave  
 e12:	c3                   	ret    

00000e13 <malloc>:

void*
malloc(uint nbytes)
{
 e13:	55                   	push   %ebp
 e14:	89 e5                	mov    %esp,%ebp
 e16:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 e19:	8b 45 08             	mov    0x8(%ebp),%eax
 e1c:	83 c0 07             	add    $0x7,%eax
 e1f:	c1 e8 03             	shr    $0x3,%eax
 e22:	83 c0 01             	add    $0x1,%eax
 e25:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 e28:	a1 8c 11 00 00       	mov    0x118c,%eax
 e2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 e30:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 e34:	75 23                	jne    e59 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 e36:	c7 45 f0 84 11 00 00 	movl   $0x1184,-0x10(%ebp)
 e3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e40:	a3 8c 11 00 00       	mov    %eax,0x118c
 e45:	a1 8c 11 00 00       	mov    0x118c,%eax
 e4a:	a3 84 11 00 00       	mov    %eax,0x1184
    base.s.size = 0;
 e4f:	c7 05 88 11 00 00 00 	movl   $0x0,0x1188
 e56:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e59:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e5c:	8b 00                	mov    (%eax),%eax
 e5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 e61:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e64:	8b 40 04             	mov    0x4(%eax),%eax
 e67:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 e6a:	72 4d                	jb     eb9 <malloc+0xa6>
      if(p->s.size == nunits)
 e6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e6f:	8b 40 04             	mov    0x4(%eax),%eax
 e72:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 e75:	75 0c                	jne    e83 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 e77:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e7a:	8b 10                	mov    (%eax),%edx
 e7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e7f:	89 10                	mov    %edx,(%eax)
 e81:	eb 26                	jmp    ea9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 e83:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e86:	8b 40 04             	mov    0x4(%eax),%eax
 e89:	2b 45 ec             	sub    -0x14(%ebp),%eax
 e8c:	89 c2                	mov    %eax,%edx
 e8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e91:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 e94:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e97:	8b 40 04             	mov    0x4(%eax),%eax
 e9a:	c1 e0 03             	shl    $0x3,%eax
 e9d:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 ea0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ea3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 ea6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ea9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 eac:	a3 8c 11 00 00       	mov    %eax,0x118c
      return (void*)(p + 1);
 eb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 eb4:	83 c0 08             	add    $0x8,%eax
 eb7:	eb 3b                	jmp    ef4 <malloc+0xe1>
    }
    if(p == freep)
 eb9:	a1 8c 11 00 00       	mov    0x118c,%eax
 ebe:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ec1:	75 1e                	jne    ee1 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 ec3:	83 ec 0c             	sub    $0xc,%esp
 ec6:	ff 75 ec             	pushl  -0x14(%ebp)
 ec9:	e8 e5 fe ff ff       	call   db3 <morecore>
 ece:	83 c4 10             	add    $0x10,%esp
 ed1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ed4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ed8:	75 07                	jne    ee1 <malloc+0xce>
        return 0;
 eda:	b8 00 00 00 00       	mov    $0x0,%eax
 edf:	eb 13                	jmp    ef4 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ee1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ee4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ee7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 eea:	8b 00                	mov    (%eax),%eax
 eec:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 eef:	e9 6d ff ff ff       	jmp    e61 <malloc+0x4e>
}
 ef4:	c9                   	leave  
 ef5:	c3                   	ret    
