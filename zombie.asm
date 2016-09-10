
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 65 02 00 00       	call   27b <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 ef 02 00 00       	call   313 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 57 02 00 00       	call   283 <exit>

0000002c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  2c:	55                   	push   %ebp
  2d:	89 e5                	mov    %esp,%ebp
  2f:	57                   	push   %edi
  30:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  31:	8b 4d 08             	mov    0x8(%ebp),%ecx
  34:	8b 55 10             	mov    0x10(%ebp),%edx
  37:	8b 45 0c             	mov    0xc(%ebp),%eax
  3a:	89 cb                	mov    %ecx,%ebx
  3c:	89 df                	mov    %ebx,%edi
  3e:	89 d1                	mov    %edx,%ecx
  40:	fc                   	cld    
  41:	f3 aa                	rep stos %al,%es:(%edi)
  43:	89 ca                	mov    %ecx,%edx
  45:	89 fb                	mov    %edi,%ebx
  47:	89 5d 08             	mov    %ebx,0x8(%ebp)
  4a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  4d:	90                   	nop
  4e:	5b                   	pop    %ebx
  4f:	5f                   	pop    %edi
  50:	5d                   	pop    %ebp
  51:	c3                   	ret    

00000052 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  52:	55                   	push   %ebp
  53:	89 e5                	mov    %esp,%ebp
  55:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  58:	8b 45 08             	mov    0x8(%ebp),%eax
  5b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  5e:	90                   	nop
  5f:	8b 45 08             	mov    0x8(%ebp),%eax
  62:	8d 50 01             	lea    0x1(%eax),%edx
  65:	89 55 08             	mov    %edx,0x8(%ebp)
  68:	8b 55 0c             	mov    0xc(%ebp),%edx
  6b:	8d 4a 01             	lea    0x1(%edx),%ecx
  6e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  71:	0f b6 12             	movzbl (%edx),%edx
  74:	88 10                	mov    %dl,(%eax)
  76:	0f b6 00             	movzbl (%eax),%eax
  79:	84 c0                	test   %al,%al
  7b:	75 e2                	jne    5f <strcpy+0xd>
    ;
  return os;
  7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  80:	c9                   	leave  
  81:	c3                   	ret    

00000082 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  82:	55                   	push   %ebp
  83:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  85:	eb 08                	jmp    8f <strcmp+0xd>
    p++, q++;
  87:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  8b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  8f:	8b 45 08             	mov    0x8(%ebp),%eax
  92:	0f b6 00             	movzbl (%eax),%eax
  95:	84 c0                	test   %al,%al
  97:	74 10                	je     a9 <strcmp+0x27>
  99:	8b 45 08             	mov    0x8(%ebp),%eax
  9c:	0f b6 10             	movzbl (%eax),%edx
  9f:	8b 45 0c             	mov    0xc(%ebp),%eax
  a2:	0f b6 00             	movzbl (%eax),%eax
  a5:	38 c2                	cmp    %al,%dl
  a7:	74 de                	je     87 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a9:	8b 45 08             	mov    0x8(%ebp),%eax
  ac:	0f b6 00             	movzbl (%eax),%eax
  af:	0f b6 d0             	movzbl %al,%edx
  b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  b5:	0f b6 00             	movzbl (%eax),%eax
  b8:	0f b6 c0             	movzbl %al,%eax
  bb:	29 c2                	sub    %eax,%edx
  bd:	89 d0                	mov    %edx,%eax
}
  bf:	5d                   	pop    %ebp
  c0:	c3                   	ret    

000000c1 <strlen>:

uint
strlen(char *s)
{
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  c4:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  ce:	eb 04                	jmp    d4 <strlen+0x13>
  d0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	01 d0                	add    %edx,%eax
  dc:	0f b6 00             	movzbl (%eax),%eax
  df:	84 c0                	test   %al,%al
  e1:	75 ed                	jne    d0 <strlen+0xf>
    ;
  return n;
  e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e6:	c9                   	leave  
  e7:	c3                   	ret    

000000e8 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e8:	55                   	push   %ebp
  e9:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  eb:	8b 45 10             	mov    0x10(%ebp),%eax
  ee:	50                   	push   %eax
  ef:	ff 75 0c             	pushl  0xc(%ebp)
  f2:	ff 75 08             	pushl  0x8(%ebp)
  f5:	e8 32 ff ff ff       	call   2c <stosb>
  fa:	83 c4 0c             	add    $0xc,%esp
  return dst;
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	83 ec 04             	sub    $0x4,%esp
 108:	8b 45 0c             	mov    0xc(%ebp),%eax
 10b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10e:	eb 14                	jmp    124 <strchr+0x22>
    if(*s == c)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	3a 45 fc             	cmp    -0x4(%ebp),%al
 119:	75 05                	jne    120 <strchr+0x1e>
      return (char*)s;
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	eb 13                	jmp    133 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 120:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	84 c0                	test   %al,%al
 12c:	75 e2                	jne    110 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 12e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <gets>:

char*
gets(char *buf, int max)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 142:	eb 42                	jmp    186 <gets+0x51>
    cc = read(0, &c, 1);
 144:	83 ec 04             	sub    $0x4,%esp
 147:	6a 01                	push   $0x1
 149:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14c:	50                   	push   %eax
 14d:	6a 00                	push   $0x0
 14f:	e8 47 01 00 00       	call   29b <read>
 154:	83 c4 10             	add    $0x10,%esp
 157:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 15a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 15e:	7e 33                	jle    193 <gets+0x5e>
      break;
    buf[i++] = c;
 160:	8b 45 f4             	mov    -0xc(%ebp),%eax
 163:	8d 50 01             	lea    0x1(%eax),%edx
 166:	89 55 f4             	mov    %edx,-0xc(%ebp)
 169:	89 c2                	mov    %eax,%edx
 16b:	8b 45 08             	mov    0x8(%ebp),%eax
 16e:	01 c2                	add    %eax,%edx
 170:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 174:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 176:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17a:	3c 0a                	cmp    $0xa,%al
 17c:	74 16                	je     194 <gets+0x5f>
 17e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 182:	3c 0d                	cmp    $0xd,%al
 184:	74 0e                	je     194 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 186:	8b 45 f4             	mov    -0xc(%ebp),%eax
 189:	83 c0 01             	add    $0x1,%eax
 18c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 18f:	7c b3                	jl     144 <gets+0xf>
 191:	eb 01                	jmp    194 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 193:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 194:	8b 55 f4             	mov    -0xc(%ebp),%edx
 197:	8b 45 08             	mov    0x8(%ebp),%eax
 19a:	01 d0                	add    %edx,%eax
 19c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 19f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a2:	c9                   	leave  
 1a3:	c3                   	ret    

000001a4 <stat>:

int
stat(char *n, struct stat *st)
{
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1aa:	83 ec 08             	sub    $0x8,%esp
 1ad:	6a 00                	push   $0x0
 1af:	ff 75 08             	pushl  0x8(%ebp)
 1b2:	e8 0c 01 00 00       	call   2c3 <open>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1c1:	79 07                	jns    1ca <stat+0x26>
    return -1;
 1c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1c8:	eb 25                	jmp    1ef <stat+0x4b>
  r = fstat(fd, st);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	ff 75 0c             	pushl  0xc(%ebp)
 1d0:	ff 75 f4             	pushl  -0xc(%ebp)
 1d3:	e8 03 01 00 00       	call   2db <fstat>
 1d8:	83 c4 10             	add    $0x10,%esp
 1db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1de:	83 ec 0c             	sub    $0xc,%esp
 1e1:	ff 75 f4             	pushl  -0xc(%ebp)
 1e4:	e8 c2 00 00 00       	call   2ab <close>
 1e9:	83 c4 10             	add    $0x10,%esp
  return r;
 1ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1ef:	c9                   	leave  
 1f0:	c3                   	ret    

000001f1 <atoi>:

int
atoi(const char *s)
{
 1f1:	55                   	push   %ebp
 1f2:	89 e5                	mov    %esp,%ebp
 1f4:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1fe:	eb 25                	jmp    225 <atoi+0x34>
    n = n*10 + *s++ - '0';
 200:	8b 55 fc             	mov    -0x4(%ebp),%edx
 203:	89 d0                	mov    %edx,%eax
 205:	c1 e0 02             	shl    $0x2,%eax
 208:	01 d0                	add    %edx,%eax
 20a:	01 c0                	add    %eax,%eax
 20c:	89 c1                	mov    %eax,%ecx
 20e:	8b 45 08             	mov    0x8(%ebp),%eax
 211:	8d 50 01             	lea    0x1(%eax),%edx
 214:	89 55 08             	mov    %edx,0x8(%ebp)
 217:	0f b6 00             	movzbl (%eax),%eax
 21a:	0f be c0             	movsbl %al,%eax
 21d:	01 c8                	add    %ecx,%eax
 21f:	83 e8 30             	sub    $0x30,%eax
 222:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	3c 2f                	cmp    $0x2f,%al
 22d:	7e 0a                	jle    239 <atoi+0x48>
 22f:	8b 45 08             	mov    0x8(%ebp),%eax
 232:	0f b6 00             	movzbl (%eax),%eax
 235:	3c 39                	cmp    $0x39,%al
 237:	7e c7                	jle    200 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 239:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 23c:	c9                   	leave  
 23d:	c3                   	ret    

0000023e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 23e:	55                   	push   %ebp
 23f:	89 e5                	mov    %esp,%ebp
 241:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 244:	8b 45 08             	mov    0x8(%ebp),%eax
 247:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 250:	eb 17                	jmp    269 <memmove+0x2b>
    *dst++ = *src++;
 252:	8b 45 fc             	mov    -0x4(%ebp),%eax
 255:	8d 50 01             	lea    0x1(%eax),%edx
 258:	89 55 fc             	mov    %edx,-0x4(%ebp)
 25b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 25e:	8d 4a 01             	lea    0x1(%edx),%ecx
 261:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 264:	0f b6 12             	movzbl (%edx),%edx
 267:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 269:	8b 45 10             	mov    0x10(%ebp),%eax
 26c:	8d 50 ff             	lea    -0x1(%eax),%edx
 26f:	89 55 10             	mov    %edx,0x10(%ebp)
 272:	85 c0                	test   %eax,%eax
 274:	7f dc                	jg     252 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 276:	8b 45 08             	mov    0x8(%ebp),%eax
}
 279:	c9                   	leave  
 27a:	c3                   	ret    

0000027b <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
 27b:	b8 01 00 00 00       	mov    $0x1,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <exit>:
SYSCALL(exit)
 283:	b8 02 00 00 00       	mov    $0x2,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <wait>:
SYSCALL(wait)
 28b:	b8 03 00 00 00       	mov    $0x3,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <pipe>:
SYSCALL(pipe)
 293:	b8 04 00 00 00       	mov    $0x4,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <read>:
SYSCALL(read)
 29b:	b8 05 00 00 00       	mov    $0x5,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <write>:
SYSCALL(write)
 2a3:	b8 10 00 00 00       	mov    $0x10,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <close>:
SYSCALL(close)
 2ab:	b8 15 00 00 00       	mov    $0x15,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <kill>:
SYSCALL(kill)
 2b3:	b8 06 00 00 00       	mov    $0x6,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <exec>:
SYSCALL(exec)
 2bb:	b8 07 00 00 00       	mov    $0x7,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <open>:
SYSCALL(open)
 2c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <mknod>:
SYSCALL(mknod)
 2cb:	b8 11 00 00 00       	mov    $0x11,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <unlink>:
SYSCALL(unlink)
 2d3:	b8 12 00 00 00       	mov    $0x12,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <fstat>:
SYSCALL(fstat)
 2db:	b8 08 00 00 00       	mov    $0x8,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <link>:
SYSCALL(link)
 2e3:	b8 13 00 00 00       	mov    $0x13,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mkdir>:
SYSCALL(mkdir)
 2eb:	b8 14 00 00 00       	mov    $0x14,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <chdir>:
SYSCALL(chdir)
 2f3:	b8 09 00 00 00       	mov    $0x9,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <dup>:
SYSCALL(dup)
 2fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <getpid>:
SYSCALL(getpid)
 303:	b8 0b 00 00 00       	mov    $0xb,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <sbrk>:
SYSCALL(sbrk)
 30b:	b8 0c 00 00 00       	mov    $0xc,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <sleep>:
SYSCALL(sleep)
 313:	b8 0d 00 00 00       	mov    $0xd,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <uptime>:
SYSCALL(uptime)
 31b:	b8 0e 00 00 00       	mov    $0xe,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <date>:

// Assignment starts here

SYSCALL(date)
 323:	b8 16 00 00 00       	mov    $0x16,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <str_ls_call1>:
 32b:	6c                   	insb   (%dx),%es:(%edi)
 32c:	73 5f                	jae    38d <ls_call6+0x4>
 32e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 331:	6c                   	insb   (%dx),%es:(%edi)
 332:	31 00                	xor    %eax,(%eax)

00000334 <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
 334:	b8 2b 03 00 00       	mov    $0x32b,%eax
 339:	cd 41                	int    $0x41
 33b:	c3                   	ret    

0000033c <str_ls_call2>:
 33c:	6c                   	insb   (%dx),%es:(%edi)
 33d:	73 5f                	jae    39e <ls_call7+0x4>
 33f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 342:	6c                   	insb   (%dx),%es:(%edi)
 343:	32 00                	xor    (%eax),%al

00000345 <ls_call2>:
CS550LSSYSCALL(ls_call2)
 345:	b8 3c 03 00 00       	mov    $0x33c,%eax
 34a:	cd 41                	int    $0x41
 34c:	c3                   	ret    

0000034d <str_ls_call3>:
 34d:	6c                   	insb   (%dx),%es:(%edi)
 34e:	73 5f                	jae    3af <ls_call8+0x4>
 350:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 353:	6c                   	insb   (%dx),%es:(%edi)
 354:	33 00                	xor    (%eax),%eax

00000356 <ls_call3>:
CS550LSSYSCALL(ls_call3)
 356:	b8 4d 03 00 00       	mov    $0x34d,%eax
 35b:	cd 41                	int    $0x41
 35d:	c3                   	ret    

0000035e <str_ls_call4>:
 35e:	6c                   	insb   (%dx),%es:(%edi)
 35f:	73 5f                	jae    3c0 <ls_call9+0x4>
 361:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 364:	6c                   	insb   (%dx),%es:(%edi)
 365:	34 00                	xor    $0x0,%al

00000367 <ls_call4>:
CS550LSSYSCALL(ls_call4)
 367:	b8 5e 03 00 00       	mov    $0x35e,%eax
 36c:	cd 41                	int    $0x41
 36e:	c3                   	ret    

0000036f <str_ls_call5>:
 36f:	6c                   	insb   (%dx),%es:(%edi)
 370:	73 5f                	jae    3d1 <ls_call10+0x3>
 372:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 375:	6c                   	insb   (%dx),%es:(%edi)
 376:	35                   	.byte 0x35
	...

00000378 <ls_call5>:
CS550LSSYSCALL(ls_call5)
 378:	b8 6f 03 00 00       	mov    $0x36f,%eax
 37d:	cd 41                	int    $0x41
 37f:	c3                   	ret    

00000380 <str_ls_call6>:
 380:	6c                   	insb   (%dx),%es:(%edi)
 381:	73 5f                	jae    3e2 <ls_call11+0x2>
 383:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 386:	6c                   	insb   (%dx),%es:(%edi)
 387:	36                   	ss
	...

00000389 <ls_call6>:
CS550LSSYSCALL(ls_call6)
 389:	b8 80 03 00 00       	mov    $0x380,%eax
 38e:	cd 41                	int    $0x41
 390:	c3                   	ret    

00000391 <str_ls_call7>:
 391:	6c                   	insb   (%dx),%es:(%edi)
 392:	73 5f                	jae    3f3 <ls_call12+0x1>
 394:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 397:	6c                   	insb   (%dx),%es:(%edi)
 398:	37                   	aaa    
	...

0000039a <ls_call7>:
CS550LSSYSCALL(ls_call7)
 39a:	b8 91 03 00 00       	mov    $0x391,%eax
 39f:	cd 41                	int    $0x41
 3a1:	c3                   	ret    

000003a2 <str_ls_call8>:
 3a2:	6c                   	insb   (%dx),%es:(%edi)
 3a3:	73 5f                	jae    404 <ls_call13>
 3a5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3a8:	6c                   	insb   (%dx),%es:(%edi)
 3a9:	38 00                	cmp    %al,(%eax)

000003ab <ls_call8>:
CS550LSSYSCALL(ls_call8)
 3ab:	b8 a2 03 00 00       	mov    $0x3a2,%eax
 3b0:	cd 41                	int    $0x41
 3b2:	c3                   	ret    

000003b3 <str_ls_call9>:
 3b3:	6c                   	insb   (%dx),%es:(%edi)
 3b4:	73 5f                	jae    415 <str_ls_call14+0x9>
 3b6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3b9:	6c                   	insb   (%dx),%es:(%edi)
 3ba:	39 00                	cmp    %eax,(%eax)

000003bc <ls_call9>:
CS550LSSYSCALL(ls_call9)
 3bc:	b8 b3 03 00 00       	mov    $0x3b3,%eax
 3c1:	cd 41                	int    $0x41
 3c3:	c3                   	ret    

000003c4 <str_ls_call10>:
 3c4:	6c                   	insb   (%dx),%es:(%edi)
 3c5:	73 5f                	jae    426 <str_ls_call15+0x8>
 3c7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3ca:	6c                   	insb   (%dx),%es:(%edi)
 3cb:	31 30                	xor    %esi,(%eax)
	...

000003ce <ls_call10>:
CS550LSSYSCALL(ls_call10)
 3ce:	b8 c4 03 00 00       	mov    $0x3c4,%eax
 3d3:	cd 41                	int    $0x41
 3d5:	c3                   	ret    

000003d6 <str_ls_call11>:
 3d6:	6c                   	insb   (%dx),%es:(%edi)
 3d7:	73 5f                	jae    438 <str_ls_call16+0x8>
 3d9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3dc:	6c                   	insb   (%dx),%es:(%edi)
 3dd:	31 31                	xor    %esi,(%ecx)
	...

000003e0 <ls_call11>:
CS550LSSYSCALL(ls_call11)
 3e0:	b8 d6 03 00 00       	mov    $0x3d6,%eax
 3e5:	cd 41                	int    $0x41
 3e7:	c3                   	ret    

000003e8 <str_ls_call12>:
 3e8:	6c                   	insb   (%dx),%es:(%edi)
 3e9:	73 5f                	jae    44a <str_ls_call17+0x8>
 3eb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3ee:	6c                   	insb   (%dx),%es:(%edi)
 3ef:	31 32                	xor    %esi,(%edx)
	...

000003f2 <ls_call12>:
CS550LSSYSCALL(ls_call12)
 3f2:	b8 e8 03 00 00       	mov    $0x3e8,%eax
 3f7:	cd 41                	int    $0x41
 3f9:	c3                   	ret    

000003fa <str_ls_call13>:
 3fa:	6c                   	insb   (%dx),%es:(%edi)
 3fb:	73 5f                	jae    45c <str_ls_call18+0x8>
 3fd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 400:	6c                   	insb   (%dx),%es:(%edi)
 401:	31 33                	xor    %esi,(%ebx)
	...

00000404 <ls_call13>:
CS550LSSYSCALL(ls_call13)
 404:	b8 fa 03 00 00       	mov    $0x3fa,%eax
 409:	cd 41                	int    $0x41
 40b:	c3                   	ret    

0000040c <str_ls_call14>:
 40c:	6c                   	insb   (%dx),%es:(%edi)
 40d:	73 5f                	jae    46e <str_ls_call19+0x8>
 40f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 412:	6c                   	insb   (%dx),%es:(%edi)
 413:	31 34 00             	xor    %esi,(%eax,%eax,1)

00000416 <ls_call14>:
CS550LSSYSCALL(ls_call14)
 416:	b8 0c 04 00 00       	mov    $0x40c,%eax
 41b:	cd 41                	int    $0x41
 41d:	c3                   	ret    

0000041e <str_ls_call15>:
 41e:	6c                   	insb   (%dx),%es:(%edi)
 41f:	73 5f                	jae    480 <str_ls_call20+0x8>
 421:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 424:	6c                   	insb   (%dx),%es:(%edi)
 425:	31                   	.byte 0x31
 426:	35                   	.byte 0x35
	...

00000428 <ls_call15>:
CS550LSSYSCALL(ls_call15)
 428:	b8 1e 04 00 00       	mov    $0x41e,%eax
 42d:	cd 41                	int    $0x41
 42f:	c3                   	ret    

00000430 <str_ls_call16>:
 430:	6c                   	insb   (%dx),%es:(%edi)
 431:	73 5f                	jae    492 <str_ls_call21+0x8>
 433:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 436:	6c                   	insb   (%dx),%es:(%edi)
 437:	31 36                	xor    %esi,(%esi)
	...

0000043a <ls_call16>:
CS550LSSYSCALL(ls_call16)
 43a:	b8 30 04 00 00       	mov    $0x430,%eax
 43f:	cd 41                	int    $0x41
 441:	c3                   	ret    

00000442 <str_ls_call17>:
 442:	6c                   	insb   (%dx),%es:(%edi)
 443:	73 5f                	jae    4a4 <str_ls_call22+0x8>
 445:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 448:	6c                   	insb   (%dx),%es:(%edi)
 449:	31 37                	xor    %esi,(%edi)
	...

0000044c <ls_call17>:
CS550LSSYSCALL(ls_call17)
 44c:	b8 42 04 00 00       	mov    $0x442,%eax
 451:	cd 41                	int    $0x41
 453:	c3                   	ret    

00000454 <str_ls_call18>:
 454:	6c                   	insb   (%dx),%es:(%edi)
 455:	73 5f                	jae    4b6 <str_ls_call23+0x8>
 457:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 45a:	6c                   	insb   (%dx),%es:(%edi)
 45b:	31 38                	xor    %edi,(%eax)
	...

0000045e <ls_call18>:
CS550LSSYSCALL(ls_call18)
 45e:	b8 54 04 00 00       	mov    $0x454,%eax
 463:	cd 41                	int    $0x41
 465:	c3                   	ret    

00000466 <str_ls_call19>:
 466:	6c                   	insb   (%dx),%es:(%edi)
 467:	73 5f                	jae    4c8 <str_ls_call24+0x8>
 469:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 46c:	6c                   	insb   (%dx),%es:(%edi)
 46d:	31 39                	xor    %edi,(%ecx)
	...

00000470 <ls_call19>:
CS550LSSYSCALL(ls_call19)
 470:	b8 66 04 00 00       	mov    $0x466,%eax
 475:	cd 41                	int    $0x41
 477:	c3                   	ret    

00000478 <str_ls_call20>:
 478:	6c                   	insb   (%dx),%es:(%edi)
 479:	73 5f                	jae    4da <str_ls_call25+0x8>
 47b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 47e:	6c                   	insb   (%dx),%es:(%edi)
 47f:	32 30                	xor    (%eax),%dh
	...

00000482 <ls_call20>:
CS550LSSYSCALL(ls_call20)
 482:	b8 78 04 00 00       	mov    $0x478,%eax
 487:	cd 41                	int    $0x41
 489:	c3                   	ret    

0000048a <str_ls_call21>:
 48a:	6c                   	insb   (%dx),%es:(%edi)
 48b:	73 5f                	jae    4ec <str_ls_call26+0x8>
 48d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 490:	6c                   	insb   (%dx),%es:(%edi)
 491:	32 31                	xor    (%ecx),%dh
	...

00000494 <ls_call21>:
CS550LSSYSCALL(ls_call21)
 494:	b8 8a 04 00 00       	mov    $0x48a,%eax
 499:	cd 41                	int    $0x41
 49b:	c3                   	ret    

0000049c <str_ls_call22>:
 49c:	6c                   	insb   (%dx),%es:(%edi)
 49d:	73 5f                	jae    4fe <str_ls_call27+0x8>
 49f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4a2:	6c                   	insb   (%dx),%es:(%edi)
 4a3:	32 32                	xor    (%edx),%dh
	...

000004a6 <ls_call22>:
CS550LSSYSCALL(ls_call22)
 4a6:	b8 9c 04 00 00       	mov    $0x49c,%eax
 4ab:	cd 41                	int    $0x41
 4ad:	c3                   	ret    

000004ae <str_ls_call23>:
 4ae:	6c                   	insb   (%dx),%es:(%edi)
 4af:	73 5f                	jae    510 <str_ls_call28+0x8>
 4b1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4b4:	6c                   	insb   (%dx),%es:(%edi)
 4b5:	32 33                	xor    (%ebx),%dh
	...

000004b8 <ls_call23>:
CS550LSSYSCALL(ls_call23)
 4b8:	b8 ae 04 00 00       	mov    $0x4ae,%eax
 4bd:	cd 41                	int    $0x41
 4bf:	c3                   	ret    

000004c0 <str_ls_call24>:
 4c0:	6c                   	insb   (%dx),%es:(%edi)
 4c1:	73 5f                	jae    522 <str_ls_call29+0x8>
 4c3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4c6:	6c                   	insb   (%dx),%es:(%edi)
 4c7:	32 34 00             	xor    (%eax,%eax,1),%dh

000004ca <ls_call24>:
CS550LSSYSCALL(ls_call24)
 4ca:	b8 c0 04 00 00       	mov    $0x4c0,%eax
 4cf:	cd 41                	int    $0x41
 4d1:	c3                   	ret    

000004d2 <str_ls_call25>:
 4d2:	6c                   	insb   (%dx),%es:(%edi)
 4d3:	73 5f                	jae    534 <str_ls_call30+0x8>
 4d5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4d8:	6c                   	insb   (%dx),%es:(%edi)
 4d9:	32                   	.byte 0x32
 4da:	35                   	.byte 0x35
	...

000004dc <ls_call25>:
CS550LSSYSCALL(ls_call25)
 4dc:	b8 d2 04 00 00       	mov    $0x4d2,%eax
 4e1:	cd 41                	int    $0x41
 4e3:	c3                   	ret    

000004e4 <str_ls_call26>:
 4e4:	6c                   	insb   (%dx),%es:(%edi)
 4e5:	73 5f                	jae    546 <str_ls_call31+0x8>
 4e7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4ea:	6c                   	insb   (%dx),%es:(%edi)
 4eb:	32 36                	xor    (%esi),%dh
	...

000004ee <ls_call26>:
CS550LSSYSCALL(ls_call26)
 4ee:	b8 e4 04 00 00       	mov    $0x4e4,%eax
 4f3:	cd 41                	int    $0x41
 4f5:	c3                   	ret    

000004f6 <str_ls_call27>:
 4f6:	6c                   	insb   (%dx),%es:(%edi)
 4f7:	73 5f                	jae    558 <str_ls_call32+0x8>
 4f9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4fc:	6c                   	insb   (%dx),%es:(%edi)
 4fd:	32 37                	xor    (%edi),%dh
	...

00000500 <ls_call27>:
CS550LSSYSCALL(ls_call27)
 500:	b8 f6 04 00 00       	mov    $0x4f6,%eax
 505:	cd 41                	int    $0x41
 507:	c3                   	ret    

00000508 <str_ls_call28>:
 508:	6c                   	insb   (%dx),%es:(%edi)
 509:	73 5f                	jae    56a <str_ls_call33+0x8>
 50b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 50e:	6c                   	insb   (%dx),%es:(%edi)
 50f:	32 38                	xor    (%eax),%bh
	...

00000512 <ls_call28>:
CS550LSSYSCALL(ls_call28)
 512:	b8 08 05 00 00       	mov    $0x508,%eax
 517:	cd 41                	int    $0x41
 519:	c3                   	ret    

0000051a <str_ls_call29>:
 51a:	6c                   	insb   (%dx),%es:(%edi)
 51b:	73 5f                	jae    57c <str_ls_call34+0x8>
 51d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 520:	6c                   	insb   (%dx),%es:(%edi)
 521:	32 39                	xor    (%ecx),%bh
	...

00000524 <ls_call29>:
CS550LSSYSCALL(ls_call29)
 524:	b8 1a 05 00 00       	mov    $0x51a,%eax
 529:	cd 41                	int    $0x41
 52b:	c3                   	ret    

0000052c <str_ls_call30>:
 52c:	6c                   	insb   (%dx),%es:(%edi)
 52d:	73 5f                	jae    58e <str_ls_call35+0x8>
 52f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 532:	6c                   	insb   (%dx),%es:(%edi)
 533:	33 30                	xor    (%eax),%esi
	...

00000536 <ls_call30>:
CS550LSSYSCALL(ls_call30)
 536:	b8 2c 05 00 00       	mov    $0x52c,%eax
 53b:	cd 41                	int    $0x41
 53d:	c3                   	ret    

0000053e <str_ls_call31>:
 53e:	6c                   	insb   (%dx),%es:(%edi)
 53f:	73 5f                	jae    5a0 <str_ls_call36+0x8>
 541:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 544:	6c                   	insb   (%dx),%es:(%edi)
 545:	33 31                	xor    (%ecx),%esi
	...

00000548 <ls_call31>:
CS550LSSYSCALL(ls_call31)
 548:	b8 3e 05 00 00       	mov    $0x53e,%eax
 54d:	cd 41                	int    $0x41
 54f:	c3                   	ret    

00000550 <str_ls_call32>:
 550:	6c                   	insb   (%dx),%es:(%edi)
 551:	73 5f                	jae    5b2 <str_ls_call37+0x8>
 553:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 556:	6c                   	insb   (%dx),%es:(%edi)
 557:	33 32                	xor    (%edx),%esi
	...

0000055a <ls_call32>:
CS550LSSYSCALL(ls_call32)
 55a:	b8 50 05 00 00       	mov    $0x550,%eax
 55f:	cd 41                	int    $0x41
 561:	c3                   	ret    

00000562 <str_ls_call33>:
 562:	6c                   	insb   (%dx),%es:(%edi)
 563:	73 5f                	jae    5c4 <str_ls_call38+0x8>
 565:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 568:	6c                   	insb   (%dx),%es:(%edi)
 569:	33 33                	xor    (%ebx),%esi
	...

0000056c <ls_call33>:
CS550LSSYSCALL(ls_call33)
 56c:	b8 62 05 00 00       	mov    $0x562,%eax
 571:	cd 41                	int    $0x41
 573:	c3                   	ret    

00000574 <str_ls_call34>:
 574:	6c                   	insb   (%dx),%es:(%edi)
 575:	73 5f                	jae    5d6 <str_ls_call39+0x8>
 577:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 57a:	6c                   	insb   (%dx),%es:(%edi)
 57b:	33 34 00             	xor    (%eax,%eax,1),%esi

0000057e <ls_call34>:
CS550LSSYSCALL(ls_call34)
 57e:	b8 74 05 00 00       	mov    $0x574,%eax
 583:	cd 41                	int    $0x41
 585:	c3                   	ret    

00000586 <str_ls_call35>:
 586:	6c                   	insb   (%dx),%es:(%edi)
 587:	73 5f                	jae    5e8 <str_ls_call40+0x8>
 589:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 58c:	6c                   	insb   (%dx),%es:(%edi)
 58d:	33                   	.byte 0x33
 58e:	35                   	.byte 0x35
	...

00000590 <ls_call35>:
CS550LSSYSCALL(ls_call35)
 590:	b8 86 05 00 00       	mov    $0x586,%eax
 595:	cd 41                	int    $0x41
 597:	c3                   	ret    

00000598 <str_ls_call36>:
 598:	6c                   	insb   (%dx),%es:(%edi)
 599:	73 5f                	jae    5fa <str_ls_call41+0x8>
 59b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 59e:	6c                   	insb   (%dx),%es:(%edi)
 59f:	33 36                	xor    (%esi),%esi
	...

000005a2 <ls_call36>:
CS550LSSYSCALL(ls_call36)
 5a2:	b8 98 05 00 00       	mov    $0x598,%eax
 5a7:	cd 41                	int    $0x41
 5a9:	c3                   	ret    

000005aa <str_ls_call37>:
 5aa:	6c                   	insb   (%dx),%es:(%edi)
 5ab:	73 5f                	jae    60c <str_ls_call42+0x8>
 5ad:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5b0:	6c                   	insb   (%dx),%es:(%edi)
 5b1:	33 37                	xor    (%edi),%esi
	...

000005b4 <ls_call37>:
CS550LSSYSCALL(ls_call37)
 5b4:	b8 aa 05 00 00       	mov    $0x5aa,%eax
 5b9:	cd 41                	int    $0x41
 5bb:	c3                   	ret    

000005bc <str_ls_call38>:
 5bc:	6c                   	insb   (%dx),%es:(%edi)
 5bd:	73 5f                	jae    61e <str_ls_call43+0x8>
 5bf:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5c2:	6c                   	insb   (%dx),%es:(%edi)
 5c3:	33 38                	xor    (%eax),%edi
	...

000005c6 <ls_call38>:
CS550LSSYSCALL(ls_call38)
 5c6:	b8 bc 05 00 00       	mov    $0x5bc,%eax
 5cb:	cd 41                	int    $0x41
 5cd:	c3                   	ret    

000005ce <str_ls_call39>:
 5ce:	6c                   	insb   (%dx),%es:(%edi)
 5cf:	73 5f                	jae    630 <str_ls_call44+0x8>
 5d1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5d4:	6c                   	insb   (%dx),%es:(%edi)
 5d5:	33 39                	xor    (%ecx),%edi
	...

000005d8 <ls_call39>:
CS550LSSYSCALL(ls_call39)
 5d8:	b8 ce 05 00 00       	mov    $0x5ce,%eax
 5dd:	cd 41                	int    $0x41
 5df:	c3                   	ret    

000005e0 <str_ls_call40>:
 5e0:	6c                   	insb   (%dx),%es:(%edi)
 5e1:	73 5f                	jae    642 <str_ls_call45+0x8>
 5e3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5e6:	6c                   	insb   (%dx),%es:(%edi)
 5e7:	34 30                	xor    $0x30,%al
	...

000005ea <ls_call40>:
CS550LSSYSCALL(ls_call40)
 5ea:	b8 e0 05 00 00       	mov    $0x5e0,%eax
 5ef:	cd 41                	int    $0x41
 5f1:	c3                   	ret    

000005f2 <str_ls_call41>:
 5f2:	6c                   	insb   (%dx),%es:(%edi)
 5f3:	73 5f                	jae    654 <str_ls_call46+0x8>
 5f5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5f8:	6c                   	insb   (%dx),%es:(%edi)
 5f9:	34 31                	xor    $0x31,%al
	...

000005fc <ls_call41>:
CS550LSSYSCALL(ls_call41)
 5fc:	b8 f2 05 00 00       	mov    $0x5f2,%eax
 601:	cd 41                	int    $0x41
 603:	c3                   	ret    

00000604 <str_ls_call42>:
 604:	6c                   	insb   (%dx),%es:(%edi)
 605:	73 5f                	jae    666 <str_ls_call47+0x8>
 607:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 60a:	6c                   	insb   (%dx),%es:(%edi)
 60b:	34 32                	xor    $0x32,%al
	...

0000060e <ls_call42>:
CS550LSSYSCALL(ls_call42)
 60e:	b8 04 06 00 00       	mov    $0x604,%eax
 613:	cd 41                	int    $0x41
 615:	c3                   	ret    

00000616 <str_ls_call43>:
 616:	6c                   	insb   (%dx),%es:(%edi)
 617:	73 5f                	jae    678 <str_ls_call48+0x8>
 619:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 61c:	6c                   	insb   (%dx),%es:(%edi)
 61d:	34 33                	xor    $0x33,%al
	...

00000620 <ls_call43>:
CS550LSSYSCALL(ls_call43)
 620:	b8 16 06 00 00       	mov    $0x616,%eax
 625:	cd 41                	int    $0x41
 627:	c3                   	ret    

00000628 <str_ls_call44>:
 628:	6c                   	insb   (%dx),%es:(%edi)
 629:	73 5f                	jae    68a <str_ls_call49+0x8>
 62b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 62e:	6c                   	insb   (%dx),%es:(%edi)
 62f:	34 34                	xor    $0x34,%al
	...

00000632 <ls_call44>:
CS550LSSYSCALL(ls_call44)
 632:	b8 28 06 00 00       	mov    $0x628,%eax
 637:	cd 41                	int    $0x41
 639:	c3                   	ret    

0000063a <str_ls_call45>:
 63a:	6c                   	insb   (%dx),%es:(%edi)
 63b:	73 5f                	jae    69c <str_ls_call50+0x8>
 63d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 640:	6c                   	insb   (%dx),%es:(%edi)
 641:	34 35                	xor    $0x35,%al
	...

00000644 <ls_call45>:
CS550LSSYSCALL(ls_call45)
 644:	b8 3a 06 00 00       	mov    $0x63a,%eax
 649:	cd 41                	int    $0x41
 64b:	c3                   	ret    

0000064c <str_ls_call46>:
 64c:	6c                   	insb   (%dx),%es:(%edi)
 64d:	73 5f                	jae    6ae <str_ht_call1+0x8>
 64f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 652:	6c                   	insb   (%dx),%es:(%edi)
 653:	34 36                	xor    $0x36,%al
	...

00000656 <ls_call46>:
CS550LSSYSCALL(ls_call46)
 656:	b8 4c 06 00 00       	mov    $0x64c,%eax
 65b:	cd 41                	int    $0x41
 65d:	c3                   	ret    

0000065e <str_ls_call47>:
 65e:	6c                   	insb   (%dx),%es:(%edi)
 65f:	73 5f                	jae    6c0 <ht_call2>
 661:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 664:	6c                   	insb   (%dx),%es:(%edi)
 665:	34 37                	xor    $0x37,%al
	...

00000668 <ls_call47>:
CS550LSSYSCALL(ls_call47)
 668:	b8 5e 06 00 00       	mov    $0x65e,%eax
 66d:	cd 41                	int    $0x41
 66f:	c3                   	ret    

00000670 <str_ls_call48>:
 670:	6c                   	insb   (%dx),%es:(%edi)
 671:	73 5f                	jae    6d2 <ht_call3+0x1>
 673:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 676:	6c                   	insb   (%dx),%es:(%edi)
 677:	34 38                	xor    $0x38,%al
	...

0000067a <ls_call48>:
CS550LSSYSCALL(ls_call48)
 67a:	b8 70 06 00 00       	mov    $0x670,%eax
 67f:	cd 41                	int    $0x41
 681:	c3                   	ret    

00000682 <str_ls_call49>:
 682:	6c                   	insb   (%dx),%es:(%edi)
 683:	73 5f                	jae    6e4 <ht_call4+0x2>
 685:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 688:	6c                   	insb   (%dx),%es:(%edi)
 689:	34 39                	xor    $0x39,%al
	...

0000068c <ls_call49>:
CS550LSSYSCALL(ls_call49)
 68c:	b8 82 06 00 00       	mov    $0x682,%eax
 691:	cd 41                	int    $0x41
 693:	c3                   	ret    

00000694 <str_ls_call50>:
 694:	6c                   	insb   (%dx),%es:(%edi)
 695:	73 5f                	jae    6f6 <ht_call5+0x3>
 697:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 69a:	6c                   	insb   (%dx),%es:(%edi)
 69b:	35                   	.byte 0x35
 69c:	30 00                	xor    %al,(%eax)

0000069e <ls_call50>:
CS550LSSYSCALL(ls_call50)
 69e:	b8 94 06 00 00       	mov    $0x694,%eax
 6a3:	cd 41                	int    $0x41
 6a5:	c3                   	ret    

000006a6 <str_ht_call1>:
 6a6:	68 74 5f 63 61       	push   $0x61635f74
 6ab:	6c                   	insb   (%dx),%es:(%edi)
 6ac:	6c                   	insb   (%dx),%es:(%edi)
 6ad:	31 00                	xor    %eax,(%eax)

000006af <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
 6af:	b8 a6 06 00 00       	mov    $0x6a6,%eax
 6b4:	cd 42                	int    $0x42
 6b6:	c3                   	ret    

000006b7 <str_ht_call2>:
 6b7:	68 74 5f 63 61       	push   $0x61635f74
 6bc:	6c                   	insb   (%dx),%es:(%edi)
 6bd:	6c                   	insb   (%dx),%es:(%edi)
 6be:	32 00                	xor    (%eax),%al

000006c0 <ht_call2>:
CS550HTSYSCALL(ht_call2)
 6c0:	b8 b7 06 00 00       	mov    $0x6b7,%eax
 6c5:	cd 42                	int    $0x42
 6c7:	c3                   	ret    

000006c8 <str_ht_call3>:
 6c8:	68 74 5f 63 61       	push   $0x61635f74
 6cd:	6c                   	insb   (%dx),%es:(%edi)
 6ce:	6c                   	insb   (%dx),%es:(%edi)
 6cf:	33 00                	xor    (%eax),%eax

000006d1 <ht_call3>:
CS550HTSYSCALL(ht_call3)
 6d1:	b8 c8 06 00 00       	mov    $0x6c8,%eax
 6d6:	cd 42                	int    $0x42
 6d8:	c3                   	ret    

000006d9 <str_ht_call4>:
 6d9:	68 74 5f 63 61       	push   $0x61635f74
 6de:	6c                   	insb   (%dx),%es:(%edi)
 6df:	6c                   	insb   (%dx),%es:(%edi)
 6e0:	34 00                	xor    $0x0,%al

000006e2 <ht_call4>:
CS550HTSYSCALL(ht_call4)
 6e2:	b8 d9 06 00 00       	mov    $0x6d9,%eax
 6e7:	cd 42                	int    $0x42
 6e9:	c3                   	ret    

000006ea <str_ht_call5>:
 6ea:	68 74 5f 63 61       	push   $0x61635f74
 6ef:	6c                   	insb   (%dx),%es:(%edi)
 6f0:	6c                   	insb   (%dx),%es:(%edi)
 6f1:	35                   	.byte 0x35
	...

000006f3 <ht_call5>:
CS550HTSYSCALL(ht_call5)
 6f3:	b8 ea 06 00 00       	mov    $0x6ea,%eax
 6f8:	cd 42                	int    $0x42
 6fa:	c3                   	ret    

000006fb <str_ht_call6>:
 6fb:	68 74 5f 63 61       	push   $0x61635f74
 700:	6c                   	insb   (%dx),%es:(%edi)
 701:	6c                   	insb   (%dx),%es:(%edi)
 702:	36                   	ss
	...

00000704 <ht_call6>:
CS550HTSYSCALL(ht_call6)
 704:	b8 fb 06 00 00       	mov    $0x6fb,%eax
 709:	cd 42                	int    $0x42
 70b:	c3                   	ret    

0000070c <str_ht_call7>:
 70c:	68 74 5f 63 61       	push   $0x61635f74
 711:	6c                   	insb   (%dx),%es:(%edi)
 712:	6c                   	insb   (%dx),%es:(%edi)
 713:	37                   	aaa    
	...

00000715 <ht_call7>:
CS550HTSYSCALL(ht_call7)
 715:	b8 0c 07 00 00       	mov    $0x70c,%eax
 71a:	cd 42                	int    $0x42
 71c:	c3                   	ret    

0000071d <str_ht_call8>:
 71d:	68 74 5f 63 61       	push   $0x61635f74
 722:	6c                   	insb   (%dx),%es:(%edi)
 723:	6c                   	insb   (%dx),%es:(%edi)
 724:	38 00                	cmp    %al,(%eax)

00000726 <ht_call8>:
CS550HTSYSCALL(ht_call8)
 726:	b8 1d 07 00 00       	mov    $0x71d,%eax
 72b:	cd 42                	int    $0x42
 72d:	c3                   	ret    

0000072e <str_ht_call9>:
 72e:	68 74 5f 63 61       	push   $0x61635f74
 733:	6c                   	insb   (%dx),%es:(%edi)
 734:	6c                   	insb   (%dx),%es:(%edi)
 735:	39 00                	cmp    %eax,(%eax)

00000737 <ht_call9>:
CS550HTSYSCALL(ht_call9)
 737:	b8 2e 07 00 00       	mov    $0x72e,%eax
 73c:	cd 42                	int    $0x42
 73e:	c3                   	ret    

0000073f <str_ht_call10>:
 73f:	68 74 5f 63 61       	push   $0x61635f74
 744:	6c                   	insb   (%dx),%es:(%edi)
 745:	6c                   	insb   (%dx),%es:(%edi)
 746:	31 30                	xor    %esi,(%eax)
	...

00000749 <ht_call10>:
CS550HTSYSCALL(ht_call10)
 749:	b8 3f 07 00 00       	mov    $0x73f,%eax
 74e:	cd 42                	int    $0x42
 750:	c3                   	ret    

00000751 <str_ht_call11>:
 751:	68 74 5f 63 61       	push   $0x61635f74
 756:	6c                   	insb   (%dx),%es:(%edi)
 757:	6c                   	insb   (%dx),%es:(%edi)
 758:	31 31                	xor    %esi,(%ecx)
	...

0000075b <ht_call11>:
CS550HTSYSCALL(ht_call11)
 75b:	b8 51 07 00 00       	mov    $0x751,%eax
 760:	cd 42                	int    $0x42
 762:	c3                   	ret    

00000763 <str_ht_call12>:
 763:	68 74 5f 63 61       	push   $0x61635f74
 768:	6c                   	insb   (%dx),%es:(%edi)
 769:	6c                   	insb   (%dx),%es:(%edi)
 76a:	31 32                	xor    %esi,(%edx)
	...

0000076d <ht_call12>:
CS550HTSYSCALL(ht_call12)
 76d:	b8 63 07 00 00       	mov    $0x763,%eax
 772:	cd 42                	int    $0x42
 774:	c3                   	ret    

00000775 <str_ht_call13>:
 775:	68 74 5f 63 61       	push   $0x61635f74
 77a:	6c                   	insb   (%dx),%es:(%edi)
 77b:	6c                   	insb   (%dx),%es:(%edi)
 77c:	31 33                	xor    %esi,(%ebx)
	...

0000077f <ht_call13>:
CS550HTSYSCALL(ht_call13)
 77f:	b8 75 07 00 00       	mov    $0x775,%eax
 784:	cd 42                	int    $0x42
 786:	c3                   	ret    

00000787 <str_ht_call14>:
 787:	68 74 5f 63 61       	push   $0x61635f74
 78c:	6c                   	insb   (%dx),%es:(%edi)
 78d:	6c                   	insb   (%dx),%es:(%edi)
 78e:	31 34 00             	xor    %esi,(%eax,%eax,1)

00000791 <ht_call14>:
CS550HTSYSCALL(ht_call14)
 791:	b8 87 07 00 00       	mov    $0x787,%eax
 796:	cd 42                	int    $0x42
 798:	c3                   	ret    

00000799 <str_ht_call15>:
 799:	68 74 5f 63 61       	push   $0x61635f74
 79e:	6c                   	insb   (%dx),%es:(%edi)
 79f:	6c                   	insb   (%dx),%es:(%edi)
 7a0:	31                   	.byte 0x31
 7a1:	35                   	.byte 0x35
	...

000007a3 <ht_call15>:
CS550HTSYSCALL(ht_call15)
 7a3:	b8 99 07 00 00       	mov    $0x799,%eax
 7a8:	cd 42                	int    $0x42
 7aa:	c3                   	ret    

000007ab <str_ht_call16>:
 7ab:	68 74 5f 63 61       	push   $0x61635f74
 7b0:	6c                   	insb   (%dx),%es:(%edi)
 7b1:	6c                   	insb   (%dx),%es:(%edi)
 7b2:	31 36                	xor    %esi,(%esi)
	...

000007b5 <ht_call16>:
CS550HTSYSCALL(ht_call16)
 7b5:	b8 ab 07 00 00       	mov    $0x7ab,%eax
 7ba:	cd 42                	int    $0x42
 7bc:	c3                   	ret    

000007bd <str_ht_call17>:
 7bd:	68 74 5f 63 61       	push   $0x61635f74
 7c2:	6c                   	insb   (%dx),%es:(%edi)
 7c3:	6c                   	insb   (%dx),%es:(%edi)
 7c4:	31 37                	xor    %esi,(%edi)
	...

000007c7 <ht_call17>:
CS550HTSYSCALL(ht_call17)
 7c7:	b8 bd 07 00 00       	mov    $0x7bd,%eax
 7cc:	cd 42                	int    $0x42
 7ce:	c3                   	ret    

000007cf <str_ht_call18>:
 7cf:	68 74 5f 63 61       	push   $0x61635f74
 7d4:	6c                   	insb   (%dx),%es:(%edi)
 7d5:	6c                   	insb   (%dx),%es:(%edi)
 7d6:	31 38                	xor    %edi,(%eax)
	...

000007d9 <ht_call18>:
CS550HTSYSCALL(ht_call18)
 7d9:	b8 cf 07 00 00       	mov    $0x7cf,%eax
 7de:	cd 42                	int    $0x42
 7e0:	c3                   	ret    

000007e1 <str_ht_call19>:
 7e1:	68 74 5f 63 61       	push   $0x61635f74
 7e6:	6c                   	insb   (%dx),%es:(%edi)
 7e7:	6c                   	insb   (%dx),%es:(%edi)
 7e8:	31 39                	xor    %edi,(%ecx)
	...

000007eb <ht_call19>:
CS550HTSYSCALL(ht_call19)
 7eb:	b8 e1 07 00 00       	mov    $0x7e1,%eax
 7f0:	cd 42                	int    $0x42
 7f2:	c3                   	ret    

000007f3 <str_ht_call20>:
 7f3:	68 74 5f 63 61       	push   $0x61635f74
 7f8:	6c                   	insb   (%dx),%es:(%edi)
 7f9:	6c                   	insb   (%dx),%es:(%edi)
 7fa:	32 30                	xor    (%eax),%dh
	...

000007fd <ht_call20>:
CS550HTSYSCALL(ht_call20)
 7fd:	b8 f3 07 00 00       	mov    $0x7f3,%eax
 802:	cd 42                	int    $0x42
 804:	c3                   	ret    

00000805 <str_ht_call21>:
 805:	68 74 5f 63 61       	push   $0x61635f74
 80a:	6c                   	insb   (%dx),%es:(%edi)
 80b:	6c                   	insb   (%dx),%es:(%edi)
 80c:	32 31                	xor    (%ecx),%dh
	...

0000080f <ht_call21>:
CS550HTSYSCALL(ht_call21)
 80f:	b8 05 08 00 00       	mov    $0x805,%eax
 814:	cd 42                	int    $0x42
 816:	c3                   	ret    

00000817 <str_ht_call22>:
 817:	68 74 5f 63 61       	push   $0x61635f74
 81c:	6c                   	insb   (%dx),%es:(%edi)
 81d:	6c                   	insb   (%dx),%es:(%edi)
 81e:	32 32                	xor    (%edx),%dh
	...

00000821 <ht_call22>:
CS550HTSYSCALL(ht_call22)
 821:	b8 17 08 00 00       	mov    $0x817,%eax
 826:	cd 42                	int    $0x42
 828:	c3                   	ret    

00000829 <str_ht_call23>:
 829:	68 74 5f 63 61       	push   $0x61635f74
 82e:	6c                   	insb   (%dx),%es:(%edi)
 82f:	6c                   	insb   (%dx),%es:(%edi)
 830:	32 33                	xor    (%ebx),%dh
	...

00000833 <ht_call23>:
CS550HTSYSCALL(ht_call23)
 833:	b8 29 08 00 00       	mov    $0x829,%eax
 838:	cd 42                	int    $0x42
 83a:	c3                   	ret    

0000083b <str_ht_call24>:
 83b:	68 74 5f 63 61       	push   $0x61635f74
 840:	6c                   	insb   (%dx),%es:(%edi)
 841:	6c                   	insb   (%dx),%es:(%edi)
 842:	32 34 00             	xor    (%eax,%eax,1),%dh

00000845 <ht_call24>:
CS550HTSYSCALL(ht_call24)
 845:	b8 3b 08 00 00       	mov    $0x83b,%eax
 84a:	cd 42                	int    $0x42
 84c:	c3                   	ret    

0000084d <str_ht_call25>:
 84d:	68 74 5f 63 61       	push   $0x61635f74
 852:	6c                   	insb   (%dx),%es:(%edi)
 853:	6c                   	insb   (%dx),%es:(%edi)
 854:	32                   	.byte 0x32
 855:	35                   	.byte 0x35
	...

00000857 <ht_call25>:
CS550HTSYSCALL(ht_call25)
 857:	b8 4d 08 00 00       	mov    $0x84d,%eax
 85c:	cd 42                	int    $0x42
 85e:	c3                   	ret    

0000085f <str_ht_call26>:
 85f:	68 74 5f 63 61       	push   $0x61635f74
 864:	6c                   	insb   (%dx),%es:(%edi)
 865:	6c                   	insb   (%dx),%es:(%edi)
 866:	32 36                	xor    (%esi),%dh
	...

00000869 <ht_call26>:
CS550HTSYSCALL(ht_call26)
 869:	b8 5f 08 00 00       	mov    $0x85f,%eax
 86e:	cd 42                	int    $0x42
 870:	c3                   	ret    

00000871 <str_ht_call27>:
 871:	68 74 5f 63 61       	push   $0x61635f74
 876:	6c                   	insb   (%dx),%es:(%edi)
 877:	6c                   	insb   (%dx),%es:(%edi)
 878:	32 37                	xor    (%edi),%dh
	...

0000087b <ht_call27>:
CS550HTSYSCALL(ht_call27)
 87b:	b8 71 08 00 00       	mov    $0x871,%eax
 880:	cd 42                	int    $0x42
 882:	c3                   	ret    

00000883 <str_ht_call28>:
 883:	68 74 5f 63 61       	push   $0x61635f74
 888:	6c                   	insb   (%dx),%es:(%edi)
 889:	6c                   	insb   (%dx),%es:(%edi)
 88a:	32 38                	xor    (%eax),%bh
	...

0000088d <ht_call28>:
CS550HTSYSCALL(ht_call28)
 88d:	b8 83 08 00 00       	mov    $0x883,%eax
 892:	cd 42                	int    $0x42
 894:	c3                   	ret    

00000895 <str_ht_call29>:
 895:	68 74 5f 63 61       	push   $0x61635f74
 89a:	6c                   	insb   (%dx),%es:(%edi)
 89b:	6c                   	insb   (%dx),%es:(%edi)
 89c:	32 39                	xor    (%ecx),%bh
	...

0000089f <ht_call29>:
CS550HTSYSCALL(ht_call29)
 89f:	b8 95 08 00 00       	mov    $0x895,%eax
 8a4:	cd 42                	int    $0x42
 8a6:	c3                   	ret    

000008a7 <str_ht_call30>:
 8a7:	68 74 5f 63 61       	push   $0x61635f74
 8ac:	6c                   	insb   (%dx),%es:(%edi)
 8ad:	6c                   	insb   (%dx),%es:(%edi)
 8ae:	33 30                	xor    (%eax),%esi
	...

000008b1 <ht_call30>:
CS550HTSYSCALL(ht_call30)
 8b1:	b8 a7 08 00 00       	mov    $0x8a7,%eax
 8b6:	cd 42                	int    $0x42
 8b8:	c3                   	ret    

000008b9 <str_ht_call31>:
 8b9:	68 74 5f 63 61       	push   $0x61635f74
 8be:	6c                   	insb   (%dx),%es:(%edi)
 8bf:	6c                   	insb   (%dx),%es:(%edi)
 8c0:	33 31                	xor    (%ecx),%esi
	...

000008c3 <ht_call31>:
CS550HTSYSCALL(ht_call31)
 8c3:	b8 b9 08 00 00       	mov    $0x8b9,%eax
 8c8:	cd 42                	int    $0x42
 8ca:	c3                   	ret    

000008cb <str_ht_call32>:
 8cb:	68 74 5f 63 61       	push   $0x61635f74
 8d0:	6c                   	insb   (%dx),%es:(%edi)
 8d1:	6c                   	insb   (%dx),%es:(%edi)
 8d2:	33 32                	xor    (%edx),%esi
	...

000008d5 <ht_call32>:
CS550HTSYSCALL(ht_call32)
 8d5:	b8 cb 08 00 00       	mov    $0x8cb,%eax
 8da:	cd 42                	int    $0x42
 8dc:	c3                   	ret    

000008dd <str_ht_call33>:
 8dd:	68 74 5f 63 61       	push   $0x61635f74
 8e2:	6c                   	insb   (%dx),%es:(%edi)
 8e3:	6c                   	insb   (%dx),%es:(%edi)
 8e4:	33 33                	xor    (%ebx),%esi
	...

000008e7 <ht_call33>:
CS550HTSYSCALL(ht_call33)
 8e7:	b8 dd 08 00 00       	mov    $0x8dd,%eax
 8ec:	cd 42                	int    $0x42
 8ee:	c3                   	ret    

000008ef <str_ht_call34>:
 8ef:	68 74 5f 63 61       	push   $0x61635f74
 8f4:	6c                   	insb   (%dx),%es:(%edi)
 8f5:	6c                   	insb   (%dx),%es:(%edi)
 8f6:	33 34 00             	xor    (%eax,%eax,1),%esi

000008f9 <ht_call34>:
CS550HTSYSCALL(ht_call34)
 8f9:	b8 ef 08 00 00       	mov    $0x8ef,%eax
 8fe:	cd 42                	int    $0x42
 900:	c3                   	ret    

00000901 <str_ht_call35>:
 901:	68 74 5f 63 61       	push   $0x61635f74
 906:	6c                   	insb   (%dx),%es:(%edi)
 907:	6c                   	insb   (%dx),%es:(%edi)
 908:	33                   	.byte 0x33
 909:	35                   	.byte 0x35
	...

0000090b <ht_call35>:
CS550HTSYSCALL(ht_call35)
 90b:	b8 01 09 00 00       	mov    $0x901,%eax
 910:	cd 42                	int    $0x42
 912:	c3                   	ret    

00000913 <str_ht_call36>:
 913:	68 74 5f 63 61       	push   $0x61635f74
 918:	6c                   	insb   (%dx),%es:(%edi)
 919:	6c                   	insb   (%dx),%es:(%edi)
 91a:	33 36                	xor    (%esi),%esi
	...

0000091d <ht_call36>:
CS550HTSYSCALL(ht_call36)
 91d:	b8 13 09 00 00       	mov    $0x913,%eax
 922:	cd 42                	int    $0x42
 924:	c3                   	ret    

00000925 <str_ht_call37>:
 925:	68 74 5f 63 61       	push   $0x61635f74
 92a:	6c                   	insb   (%dx),%es:(%edi)
 92b:	6c                   	insb   (%dx),%es:(%edi)
 92c:	33 37                	xor    (%edi),%esi
	...

0000092f <ht_call37>:
CS550HTSYSCALL(ht_call37)
 92f:	b8 25 09 00 00       	mov    $0x925,%eax
 934:	cd 42                	int    $0x42
 936:	c3                   	ret    

00000937 <str_ht_call38>:
 937:	68 74 5f 63 61       	push   $0x61635f74
 93c:	6c                   	insb   (%dx),%es:(%edi)
 93d:	6c                   	insb   (%dx),%es:(%edi)
 93e:	33 38                	xor    (%eax),%edi
	...

00000941 <ht_call38>:
CS550HTSYSCALL(ht_call38)
 941:	b8 37 09 00 00       	mov    $0x937,%eax
 946:	cd 42                	int    $0x42
 948:	c3                   	ret    

00000949 <str_ht_call39>:
 949:	68 74 5f 63 61       	push   $0x61635f74
 94e:	6c                   	insb   (%dx),%es:(%edi)
 94f:	6c                   	insb   (%dx),%es:(%edi)
 950:	33 39                	xor    (%ecx),%edi
	...

00000953 <ht_call39>:
CS550HTSYSCALL(ht_call39)
 953:	b8 49 09 00 00       	mov    $0x949,%eax
 958:	cd 42                	int    $0x42
 95a:	c3                   	ret    

0000095b <str_ht_call40>:
 95b:	68 74 5f 63 61       	push   $0x61635f74
 960:	6c                   	insb   (%dx),%es:(%edi)
 961:	6c                   	insb   (%dx),%es:(%edi)
 962:	34 30                	xor    $0x30,%al
	...

00000965 <ht_call40>:
CS550HTSYSCALL(ht_call40)
 965:	b8 5b 09 00 00       	mov    $0x95b,%eax
 96a:	cd 42                	int    $0x42
 96c:	c3                   	ret    

0000096d <str_ht_call41>:
 96d:	68 74 5f 63 61       	push   $0x61635f74
 972:	6c                   	insb   (%dx),%es:(%edi)
 973:	6c                   	insb   (%dx),%es:(%edi)
 974:	34 31                	xor    $0x31,%al
	...

00000977 <ht_call41>:
CS550HTSYSCALL(ht_call41)
 977:	b8 6d 09 00 00       	mov    $0x96d,%eax
 97c:	cd 42                	int    $0x42
 97e:	c3                   	ret    

0000097f <str_ht_call42>:
 97f:	68 74 5f 63 61       	push   $0x61635f74
 984:	6c                   	insb   (%dx),%es:(%edi)
 985:	6c                   	insb   (%dx),%es:(%edi)
 986:	34 32                	xor    $0x32,%al
	...

00000989 <ht_call42>:
CS550HTSYSCALL(ht_call42)
 989:	b8 7f 09 00 00       	mov    $0x97f,%eax
 98e:	cd 42                	int    $0x42
 990:	c3                   	ret    

00000991 <str_ht_call43>:
 991:	68 74 5f 63 61       	push   $0x61635f74
 996:	6c                   	insb   (%dx),%es:(%edi)
 997:	6c                   	insb   (%dx),%es:(%edi)
 998:	34 33                	xor    $0x33,%al
	...

0000099b <ht_call43>:
CS550HTSYSCALL(ht_call43)
 99b:	b8 91 09 00 00       	mov    $0x991,%eax
 9a0:	cd 42                	int    $0x42
 9a2:	c3                   	ret    

000009a3 <str_ht_call44>:
 9a3:	68 74 5f 63 61       	push   $0x61635f74
 9a8:	6c                   	insb   (%dx),%es:(%edi)
 9a9:	6c                   	insb   (%dx),%es:(%edi)
 9aa:	34 34                	xor    $0x34,%al
	...

000009ad <ht_call44>:
CS550HTSYSCALL(ht_call44)
 9ad:	b8 a3 09 00 00       	mov    $0x9a3,%eax
 9b2:	cd 42                	int    $0x42
 9b4:	c3                   	ret    

000009b5 <str_ht_call45>:
 9b5:	68 74 5f 63 61       	push   $0x61635f74
 9ba:	6c                   	insb   (%dx),%es:(%edi)
 9bb:	6c                   	insb   (%dx),%es:(%edi)
 9bc:	34 35                	xor    $0x35,%al
	...

000009bf <ht_call45>:
CS550HTSYSCALL(ht_call45)
 9bf:	b8 b5 09 00 00       	mov    $0x9b5,%eax
 9c4:	cd 42                	int    $0x42
 9c6:	c3                   	ret    

000009c7 <str_ht_call46>:
 9c7:	68 74 5f 63 61       	push   $0x61635f74
 9cc:	6c                   	insb   (%dx),%es:(%edi)
 9cd:	6c                   	insb   (%dx),%es:(%edi)
 9ce:	34 36                	xor    $0x36,%al
	...

000009d1 <ht_call46>:
CS550HTSYSCALL(ht_call46)
 9d1:	b8 c7 09 00 00       	mov    $0x9c7,%eax
 9d6:	cd 42                	int    $0x42
 9d8:	c3                   	ret    

000009d9 <str_ht_call47>:
 9d9:	68 74 5f 63 61       	push   $0x61635f74
 9de:	6c                   	insb   (%dx),%es:(%edi)
 9df:	6c                   	insb   (%dx),%es:(%edi)
 9e0:	34 37                	xor    $0x37,%al
	...

000009e3 <ht_call47>:
CS550HTSYSCALL(ht_call47)
 9e3:	b8 d9 09 00 00       	mov    $0x9d9,%eax
 9e8:	cd 42                	int    $0x42
 9ea:	c3                   	ret    

000009eb <str_ht_call48>:
 9eb:	68 74 5f 63 61       	push   $0x61635f74
 9f0:	6c                   	insb   (%dx),%es:(%edi)
 9f1:	6c                   	insb   (%dx),%es:(%edi)
 9f2:	34 38                	xor    $0x38,%al
	...

000009f5 <ht_call48>:
CS550HTSYSCALL(ht_call48)
 9f5:	b8 eb 09 00 00       	mov    $0x9eb,%eax
 9fa:	cd 42                	int    $0x42
 9fc:	c3                   	ret    

000009fd <str_ht_call49>:
 9fd:	68 74 5f 63 61       	push   $0x61635f74
 a02:	6c                   	insb   (%dx),%es:(%edi)
 a03:	6c                   	insb   (%dx),%es:(%edi)
 a04:	34 39                	xor    $0x39,%al
	...

00000a07 <ht_call49>:
CS550HTSYSCALL(ht_call49)
 a07:	b8 fd 09 00 00       	mov    $0x9fd,%eax
 a0c:	cd 42                	int    $0x42
 a0e:	c3                   	ret    

00000a0f <str_ht_call50>:
 a0f:	68 74 5f 63 61       	push   $0x61635f74
 a14:	6c                   	insb   (%dx),%es:(%edi)
 a15:	6c                   	insb   (%dx),%es:(%edi)
 a16:	35                   	.byte 0x35
 a17:	30 00                	xor    %al,(%eax)

00000a19 <ht_call50>:
CS550HTSYSCALL(ht_call50)
 a19:	b8 0f 0a 00 00       	mov    $0xa0f,%eax
 a1e:	cd 42                	int    $0x42
 a20:	c3                   	ret    

00000a21 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 a21:	55                   	push   %ebp
 a22:	89 e5                	mov    %esp,%ebp
 a24:	83 ec 18             	sub    $0x18,%esp
 a27:	8b 45 0c             	mov    0xc(%ebp),%eax
 a2a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 a2d:	83 ec 04             	sub    $0x4,%esp
 a30:	6a 01                	push   $0x1
 a32:	8d 45 f4             	lea    -0xc(%ebp),%eax
 a35:	50                   	push   %eax
 a36:	ff 75 08             	pushl  0x8(%ebp)
 a39:	e8 65 f8 ff ff       	call   2a3 <write>
 a3e:	83 c4 10             	add    $0x10,%esp
}
 a41:	90                   	nop
 a42:	c9                   	leave  
 a43:	c3                   	ret    

00000a44 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 a44:	55                   	push   %ebp
 a45:	89 e5                	mov    %esp,%ebp
 a47:	53                   	push   %ebx
 a48:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 a4b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 a52:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 a56:	74 17                	je     a6f <printint+0x2b>
 a58:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 a5c:	79 11                	jns    a6f <printint+0x2b>
    neg = 1;
 a5e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 a65:	8b 45 0c             	mov    0xc(%ebp),%eax
 a68:	f7 d8                	neg    %eax
 a6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 a6d:	eb 06                	jmp    a75 <printint+0x31>
  } else {
    x = xx;
 a6f:	8b 45 0c             	mov    0xc(%ebp),%eax
 a72:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 a75:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 a7c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 a7f:	8d 41 01             	lea    0x1(%ecx),%eax
 a82:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a85:	8b 5d 10             	mov    0x10(%ebp),%ebx
 a88:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a8b:	ba 00 00 00 00       	mov    $0x0,%edx
 a90:	f7 f3                	div    %ebx
 a92:	89 d0                	mov    %edx,%eax
 a94:	0f b6 80 00 11 00 00 	movzbl 0x1100(%eax),%eax
 a9b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 a9f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 aa2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aa5:	ba 00 00 00 00       	mov    $0x0,%edx
 aaa:	f7 f3                	div    %ebx
 aac:	89 45 ec             	mov    %eax,-0x14(%ebp)
 aaf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 ab3:	75 c7                	jne    a7c <printint+0x38>
  if(neg)
 ab5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 ab9:	74 2d                	je     ae8 <printint+0xa4>
    buf[i++] = '-';
 abb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 abe:	8d 50 01             	lea    0x1(%eax),%edx
 ac1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 ac4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 ac9:	eb 1d                	jmp    ae8 <printint+0xa4>
    putc(fd, buf[i]);
 acb:	8d 55 dc             	lea    -0x24(%ebp),%edx
 ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad1:	01 d0                	add    %edx,%eax
 ad3:	0f b6 00             	movzbl (%eax),%eax
 ad6:	0f be c0             	movsbl %al,%eax
 ad9:	83 ec 08             	sub    $0x8,%esp
 adc:	50                   	push   %eax
 add:	ff 75 08             	pushl  0x8(%ebp)
 ae0:	e8 3c ff ff ff       	call   a21 <putc>
 ae5:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 ae8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 aec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 af0:	79 d9                	jns    acb <printint+0x87>
    putc(fd, buf[i]);
}
 af2:	90                   	nop
 af3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 af6:	c9                   	leave  
 af7:	c3                   	ret    

00000af8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 af8:	55                   	push   %ebp
 af9:	89 e5                	mov    %esp,%ebp
 afb:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 afe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 b05:	8d 45 0c             	lea    0xc(%ebp),%eax
 b08:	83 c0 04             	add    $0x4,%eax
 b0b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 b0e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 b15:	e9 59 01 00 00       	jmp    c73 <printf+0x17b>
    c = fmt[i] & 0xff;
 b1a:	8b 55 0c             	mov    0xc(%ebp),%edx
 b1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b20:	01 d0                	add    %edx,%eax
 b22:	0f b6 00             	movzbl (%eax),%eax
 b25:	0f be c0             	movsbl %al,%eax
 b28:	25 ff 00 00 00       	and    $0xff,%eax
 b2d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 b30:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b34:	75 2c                	jne    b62 <printf+0x6a>
      if(c == '%'){
 b36:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 b3a:	75 0c                	jne    b48 <printf+0x50>
        state = '%';
 b3c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 b43:	e9 27 01 00 00       	jmp    c6f <printf+0x177>
      } else {
        putc(fd, c);
 b48:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 b4b:	0f be c0             	movsbl %al,%eax
 b4e:	83 ec 08             	sub    $0x8,%esp
 b51:	50                   	push   %eax
 b52:	ff 75 08             	pushl  0x8(%ebp)
 b55:	e8 c7 fe ff ff       	call   a21 <putc>
 b5a:	83 c4 10             	add    $0x10,%esp
 b5d:	e9 0d 01 00 00       	jmp    c6f <printf+0x177>
      }
    } else if(state == '%'){
 b62:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 b66:	0f 85 03 01 00 00    	jne    c6f <printf+0x177>
      if(c == 'd'){
 b6c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 b70:	75 1e                	jne    b90 <printf+0x98>
        printint(fd, *ap, 10, 1);
 b72:	8b 45 e8             	mov    -0x18(%ebp),%eax
 b75:	8b 00                	mov    (%eax),%eax
 b77:	6a 01                	push   $0x1
 b79:	6a 0a                	push   $0xa
 b7b:	50                   	push   %eax
 b7c:	ff 75 08             	pushl  0x8(%ebp)
 b7f:	e8 c0 fe ff ff       	call   a44 <printint>
 b84:	83 c4 10             	add    $0x10,%esp
        ap++;
 b87:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 b8b:	e9 d8 00 00 00       	jmp    c68 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 b90:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 b94:	74 06                	je     b9c <printf+0xa4>
 b96:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 b9a:	75 1e                	jne    bba <printf+0xc2>
        printint(fd, *ap, 16, 0);
 b9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 b9f:	8b 00                	mov    (%eax),%eax
 ba1:	6a 00                	push   $0x0
 ba3:	6a 10                	push   $0x10
 ba5:	50                   	push   %eax
 ba6:	ff 75 08             	pushl  0x8(%ebp)
 ba9:	e8 96 fe ff ff       	call   a44 <printint>
 bae:	83 c4 10             	add    $0x10,%esp
        ap++;
 bb1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 bb5:	e9 ae 00 00 00       	jmp    c68 <printf+0x170>
      } else if(c == 's'){
 bba:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 bbe:	75 43                	jne    c03 <printf+0x10b>
        s = (char*)*ap;
 bc0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 bc3:	8b 00                	mov    (%eax),%eax
 bc5:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 bc8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 bcc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 bd0:	75 25                	jne    bf7 <printf+0xff>
          s = "(null)";
 bd2:	c7 45 f4 ae 0e 00 00 	movl   $0xeae,-0xc(%ebp)
        while(*s != 0){
 bd9:	eb 1c                	jmp    bf7 <printf+0xff>
          putc(fd, *s);
 bdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bde:	0f b6 00             	movzbl (%eax),%eax
 be1:	0f be c0             	movsbl %al,%eax
 be4:	83 ec 08             	sub    $0x8,%esp
 be7:	50                   	push   %eax
 be8:	ff 75 08             	pushl  0x8(%ebp)
 beb:	e8 31 fe ff ff       	call   a21 <putc>
 bf0:	83 c4 10             	add    $0x10,%esp
          s++;
 bf3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 bf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bfa:	0f b6 00             	movzbl (%eax),%eax
 bfd:	84 c0                	test   %al,%al
 bff:	75 da                	jne    bdb <printf+0xe3>
 c01:	eb 65                	jmp    c68 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 c03:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 c07:	75 1d                	jne    c26 <printf+0x12e>
        putc(fd, *ap);
 c09:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c0c:	8b 00                	mov    (%eax),%eax
 c0e:	0f be c0             	movsbl %al,%eax
 c11:	83 ec 08             	sub    $0x8,%esp
 c14:	50                   	push   %eax
 c15:	ff 75 08             	pushl  0x8(%ebp)
 c18:	e8 04 fe ff ff       	call   a21 <putc>
 c1d:	83 c4 10             	add    $0x10,%esp
        ap++;
 c20:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 c24:	eb 42                	jmp    c68 <printf+0x170>
      } else if(c == '%'){
 c26:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 c2a:	75 17                	jne    c43 <printf+0x14b>
        putc(fd, c);
 c2c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c2f:	0f be c0             	movsbl %al,%eax
 c32:	83 ec 08             	sub    $0x8,%esp
 c35:	50                   	push   %eax
 c36:	ff 75 08             	pushl  0x8(%ebp)
 c39:	e8 e3 fd ff ff       	call   a21 <putc>
 c3e:	83 c4 10             	add    $0x10,%esp
 c41:	eb 25                	jmp    c68 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 c43:	83 ec 08             	sub    $0x8,%esp
 c46:	6a 25                	push   $0x25
 c48:	ff 75 08             	pushl  0x8(%ebp)
 c4b:	e8 d1 fd ff ff       	call   a21 <putc>
 c50:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 c53:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c56:	0f be c0             	movsbl %al,%eax
 c59:	83 ec 08             	sub    $0x8,%esp
 c5c:	50                   	push   %eax
 c5d:	ff 75 08             	pushl  0x8(%ebp)
 c60:	e8 bc fd ff ff       	call   a21 <putc>
 c65:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 c68:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 c6f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 c73:	8b 55 0c             	mov    0xc(%ebp),%edx
 c76:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c79:	01 d0                	add    %edx,%eax
 c7b:	0f b6 00             	movzbl (%eax),%eax
 c7e:	84 c0                	test   %al,%al
 c80:	0f 85 94 fe ff ff    	jne    b1a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 c86:	90                   	nop
 c87:	c9                   	leave  
 c88:	c3                   	ret    

00000c89 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 c89:	55                   	push   %ebp
 c8a:	89 e5                	mov    %esp,%ebp
 c8c:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 c8f:	8b 45 08             	mov    0x8(%ebp),%eax
 c92:	83 e8 08             	sub    $0x8,%eax
 c95:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c98:	a1 1c 11 00 00       	mov    0x111c,%eax
 c9d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 ca0:	eb 24                	jmp    cc6 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ca2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ca5:	8b 00                	mov    (%eax),%eax
 ca7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 caa:	77 12                	ja     cbe <free+0x35>
 cac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 caf:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 cb2:	77 24                	ja     cd8 <free+0x4f>
 cb4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cb7:	8b 00                	mov    (%eax),%eax
 cb9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 cbc:	77 1a                	ja     cd8 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cbe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cc1:	8b 00                	mov    (%eax),%eax
 cc3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 cc6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 cc9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 ccc:	76 d4                	jbe    ca2 <free+0x19>
 cce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cd1:	8b 00                	mov    (%eax),%eax
 cd3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 cd6:	76 ca                	jbe    ca2 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 cd8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 cdb:	8b 40 04             	mov    0x4(%eax),%eax
 cde:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 ce5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ce8:	01 c2                	add    %eax,%edx
 cea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ced:	8b 00                	mov    (%eax),%eax
 cef:	39 c2                	cmp    %eax,%edx
 cf1:	75 24                	jne    d17 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 cf3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 cf6:	8b 50 04             	mov    0x4(%eax),%edx
 cf9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cfc:	8b 00                	mov    (%eax),%eax
 cfe:	8b 40 04             	mov    0x4(%eax),%eax
 d01:	01 c2                	add    %eax,%edx
 d03:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d06:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 d09:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d0c:	8b 00                	mov    (%eax),%eax
 d0e:	8b 10                	mov    (%eax),%edx
 d10:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d13:	89 10                	mov    %edx,(%eax)
 d15:	eb 0a                	jmp    d21 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 d17:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d1a:	8b 10                	mov    (%eax),%edx
 d1c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d1f:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 d21:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d24:	8b 40 04             	mov    0x4(%eax),%eax
 d27:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 d2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d31:	01 d0                	add    %edx,%eax
 d33:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d36:	75 20                	jne    d58 <free+0xcf>
    p->s.size += bp->s.size;
 d38:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d3b:	8b 50 04             	mov    0x4(%eax),%edx
 d3e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d41:	8b 40 04             	mov    0x4(%eax),%eax
 d44:	01 c2                	add    %eax,%edx
 d46:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d49:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 d4c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d4f:	8b 10                	mov    (%eax),%edx
 d51:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d54:	89 10                	mov    %edx,(%eax)
 d56:	eb 08                	jmp    d60 <free+0xd7>
  } else
    p->s.ptr = bp;
 d58:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d5b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 d5e:	89 10                	mov    %edx,(%eax)
  freep = p;
 d60:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d63:	a3 1c 11 00 00       	mov    %eax,0x111c
}
 d68:	90                   	nop
 d69:	c9                   	leave  
 d6a:	c3                   	ret    

00000d6b <morecore>:

static Header*
morecore(uint nu)
{
 d6b:	55                   	push   %ebp
 d6c:	89 e5                	mov    %esp,%ebp
 d6e:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 d71:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 d78:	77 07                	ja     d81 <morecore+0x16>
    nu = 4096;
 d7a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 d81:	8b 45 08             	mov    0x8(%ebp),%eax
 d84:	c1 e0 03             	shl    $0x3,%eax
 d87:	83 ec 0c             	sub    $0xc,%esp
 d8a:	50                   	push   %eax
 d8b:	e8 7b f5 ff ff       	call   30b <sbrk>
 d90:	83 c4 10             	add    $0x10,%esp
 d93:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 d96:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 d9a:	75 07                	jne    da3 <morecore+0x38>
    return 0;
 d9c:	b8 00 00 00 00       	mov    $0x0,%eax
 da1:	eb 26                	jmp    dc9 <morecore+0x5e>
  hp = (Header*)p;
 da3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 da6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 da9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 dac:	8b 55 08             	mov    0x8(%ebp),%edx
 daf:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 db2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 db5:	83 c0 08             	add    $0x8,%eax
 db8:	83 ec 0c             	sub    $0xc,%esp
 dbb:	50                   	push   %eax
 dbc:	e8 c8 fe ff ff       	call   c89 <free>
 dc1:	83 c4 10             	add    $0x10,%esp
  return freep;
 dc4:	a1 1c 11 00 00       	mov    0x111c,%eax
}
 dc9:	c9                   	leave  
 dca:	c3                   	ret    

00000dcb <malloc>:

void*
malloc(uint nbytes)
{
 dcb:	55                   	push   %ebp
 dcc:	89 e5                	mov    %esp,%ebp
 dce:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 dd1:	8b 45 08             	mov    0x8(%ebp),%eax
 dd4:	83 c0 07             	add    $0x7,%eax
 dd7:	c1 e8 03             	shr    $0x3,%eax
 dda:	83 c0 01             	add    $0x1,%eax
 ddd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 de0:	a1 1c 11 00 00       	mov    0x111c,%eax
 de5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 de8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 dec:	75 23                	jne    e11 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 dee:	c7 45 f0 14 11 00 00 	movl   $0x1114,-0x10(%ebp)
 df5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 df8:	a3 1c 11 00 00       	mov    %eax,0x111c
 dfd:	a1 1c 11 00 00       	mov    0x111c,%eax
 e02:	a3 14 11 00 00       	mov    %eax,0x1114
    base.s.size = 0;
 e07:	c7 05 18 11 00 00 00 	movl   $0x0,0x1118
 e0e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e11:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e14:	8b 00                	mov    (%eax),%eax
 e16:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 e19:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e1c:	8b 40 04             	mov    0x4(%eax),%eax
 e1f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 e22:	72 4d                	jb     e71 <malloc+0xa6>
      if(p->s.size == nunits)
 e24:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e27:	8b 40 04             	mov    0x4(%eax),%eax
 e2a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 e2d:	75 0c                	jne    e3b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 e2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e32:	8b 10                	mov    (%eax),%edx
 e34:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e37:	89 10                	mov    %edx,(%eax)
 e39:	eb 26                	jmp    e61 <malloc+0x96>
      else {
        p->s.size -= nunits;
 e3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e3e:	8b 40 04             	mov    0x4(%eax),%eax
 e41:	2b 45 ec             	sub    -0x14(%ebp),%eax
 e44:	89 c2                	mov    %eax,%edx
 e46:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e49:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 e4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e4f:	8b 40 04             	mov    0x4(%eax),%eax
 e52:	c1 e0 03             	shl    $0x3,%eax
 e55:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 e58:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e5b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 e5e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 e61:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e64:	a3 1c 11 00 00       	mov    %eax,0x111c
      return (void*)(p + 1);
 e69:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e6c:	83 c0 08             	add    $0x8,%eax
 e6f:	eb 3b                	jmp    eac <malloc+0xe1>
    }
    if(p == freep)
 e71:	a1 1c 11 00 00       	mov    0x111c,%eax
 e76:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 e79:	75 1e                	jne    e99 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 e7b:	83 ec 0c             	sub    $0xc,%esp
 e7e:	ff 75 ec             	pushl  -0x14(%ebp)
 e81:	e8 e5 fe ff ff       	call   d6b <morecore>
 e86:	83 c4 10             	add    $0x10,%esp
 e89:	89 45 f4             	mov    %eax,-0xc(%ebp)
 e8c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 e90:	75 07                	jne    e99 <malloc+0xce>
        return 0;
 e92:	b8 00 00 00 00       	mov    $0x0,%eax
 e97:	eb 13                	jmp    eac <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e99:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e9c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 e9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ea2:	8b 00                	mov    (%eax),%eax
 ea4:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 ea7:	e9 6d ff ff ff       	jmp    e19 <malloc+0x4e>
}
 eac:	c9                   	leave  
 ead:	c3                   	ret    
