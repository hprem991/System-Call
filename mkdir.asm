
_mkdir:     file format elf32-i386


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
   f:	83 ec 10             	sub    $0x10,%esp
  12:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
  14:	83 3b 01             	cmpl   $0x1,(%ebx)
  17:	7f 17                	jg     30 <main+0x30>
    printf(2, "Usage: mkdir files...\n");
  19:	83 ec 08             	sub    $0x8,%esp
  1c:	68 12 0f 00 00       	push   $0xf12
  21:	6a 02                	push   $0x2
  23:	e8 34 0b 00 00       	call   b5c <printf>
  28:	83 c4 10             	add    $0x10,%esp
    exit();
  2b:	e8 b7 02 00 00       	call   2e7 <exit>
  }

  for(i = 1; i < argc; i++){
  30:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  37:	eb 4b                	jmp    84 <main+0x84>
    if(mkdir(argv[i]) < 0){
  39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  43:	8b 43 04             	mov    0x4(%ebx),%eax
  46:	01 d0                	add    %edx,%eax
  48:	8b 00                	mov    (%eax),%eax
  4a:	83 ec 0c             	sub    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	e8 fc 02 00 00       	call   34f <mkdir>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 26                	jns    80 <main+0x80>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  64:	8b 43 04             	mov    0x4(%ebx),%eax
  67:	01 d0                	add    %edx,%eax
  69:	8b 00                	mov    (%eax),%eax
  6b:	83 ec 04             	sub    $0x4,%esp
  6e:	50                   	push   %eax
  6f:	68 29 0f 00 00       	push   $0xf29
  74:	6a 02                	push   $0x2
  76:	e8 e1 0a 00 00       	call   b5c <printf>
  7b:	83 c4 10             	add    $0x10,%esp
      break;
  7e:	eb 0b                	jmp    8b <main+0x8b>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  80:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  87:	3b 03                	cmp    (%ebx),%eax
  89:	7c ae                	jl     39 <main+0x39>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  8b:	e8 57 02 00 00       	call   2e7 <exit>

00000090 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	57                   	push   %edi
  94:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  95:	8b 4d 08             	mov    0x8(%ebp),%ecx
  98:	8b 55 10             	mov    0x10(%ebp),%edx
  9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  9e:	89 cb                	mov    %ecx,%ebx
  a0:	89 df                	mov    %ebx,%edi
  a2:	89 d1                	mov    %edx,%ecx
  a4:	fc                   	cld    
  a5:	f3 aa                	rep stos %al,%es:(%edi)
  a7:	89 ca                	mov    %ecx,%edx
  a9:	89 fb                	mov    %edi,%ebx
  ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ae:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b1:	90                   	nop
  b2:	5b                   	pop    %ebx
  b3:	5f                   	pop    %edi
  b4:	5d                   	pop    %ebp
  b5:	c3                   	ret    

000000b6 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  b6:	55                   	push   %ebp
  b7:	89 e5                	mov    %esp,%ebp
  b9:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  bc:	8b 45 08             	mov    0x8(%ebp),%eax
  bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c2:	90                   	nop
  c3:	8b 45 08             	mov    0x8(%ebp),%eax
  c6:	8d 50 01             	lea    0x1(%eax),%edx
  c9:	89 55 08             	mov    %edx,0x8(%ebp)
  cc:	8b 55 0c             	mov    0xc(%ebp),%edx
  cf:	8d 4a 01             	lea    0x1(%edx),%ecx
  d2:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  d5:	0f b6 12             	movzbl (%edx),%edx
  d8:	88 10                	mov    %dl,(%eax)
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	75 e2                	jne    c3 <strcpy+0xd>
    ;
  return os;
  e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e4:	c9                   	leave  
  e5:	c3                   	ret    

000000e6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e6:	55                   	push   %ebp
  e7:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e9:	eb 08                	jmp    f3 <strcmp+0xd>
    p++, q++;
  eb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ef:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 00             	movzbl (%eax),%eax
  f9:	84 c0                	test   %al,%al
  fb:	74 10                	je     10d <strcmp+0x27>
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
 100:	0f b6 10             	movzbl (%eax),%edx
 103:	8b 45 0c             	mov    0xc(%ebp),%eax
 106:	0f b6 00             	movzbl (%eax),%eax
 109:	38 c2                	cmp    %al,%dl
 10b:	74 de                	je     eb <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 10d:	8b 45 08             	mov    0x8(%ebp),%eax
 110:	0f b6 00             	movzbl (%eax),%eax
 113:	0f b6 d0             	movzbl %al,%edx
 116:	8b 45 0c             	mov    0xc(%ebp),%eax
 119:	0f b6 00             	movzbl (%eax),%eax
 11c:	0f b6 c0             	movzbl %al,%eax
 11f:	29 c2                	sub    %eax,%edx
 121:	89 d0                	mov    %edx,%eax
}
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <strlen>:

uint
strlen(char *s)
{
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 12b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 132:	eb 04                	jmp    138 <strlen+0x13>
 134:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 138:	8b 55 fc             	mov    -0x4(%ebp),%edx
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	01 d0                	add    %edx,%eax
 140:	0f b6 00             	movzbl (%eax),%eax
 143:	84 c0                	test   %al,%al
 145:	75 ed                	jne    134 <strlen+0xf>
    ;
  return n;
 147:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 14a:	c9                   	leave  
 14b:	c3                   	ret    

0000014c <memset>:

void*
memset(void *dst, int c, uint n)
{
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 14f:	8b 45 10             	mov    0x10(%ebp),%eax
 152:	50                   	push   %eax
 153:	ff 75 0c             	pushl  0xc(%ebp)
 156:	ff 75 08             	pushl  0x8(%ebp)
 159:	e8 32 ff ff ff       	call   90 <stosb>
 15e:	83 c4 0c             	add    $0xc,%esp
  return dst;
 161:	8b 45 08             	mov    0x8(%ebp),%eax
}
 164:	c9                   	leave  
 165:	c3                   	ret    

00000166 <strchr>:

char*
strchr(const char *s, char c)
{
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	83 ec 04             	sub    $0x4,%esp
 16c:	8b 45 0c             	mov    0xc(%ebp),%eax
 16f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 172:	eb 14                	jmp    188 <strchr+0x22>
    if(*s == c)
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 17d:	75 05                	jne    184 <strchr+0x1e>
      return (char*)s;
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	eb 13                	jmp    197 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 184:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 188:	8b 45 08             	mov    0x8(%ebp),%eax
 18b:	0f b6 00             	movzbl (%eax),%eax
 18e:	84 c0                	test   %al,%al
 190:	75 e2                	jne    174 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 192:	b8 00 00 00 00       	mov    $0x0,%eax
}
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <gets>:

char*
gets(char *buf, int max)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1a6:	eb 42                	jmp    1ea <gets+0x51>
    cc = read(0, &c, 1);
 1a8:	83 ec 04             	sub    $0x4,%esp
 1ab:	6a 01                	push   $0x1
 1ad:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1b0:	50                   	push   %eax
 1b1:	6a 00                	push   $0x0
 1b3:	e8 47 01 00 00       	call   2ff <read>
 1b8:	83 c4 10             	add    $0x10,%esp
 1bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1c2:	7e 33                	jle    1f7 <gets+0x5e>
      break;
    buf[i++] = c;
 1c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c7:	8d 50 01             	lea    0x1(%eax),%edx
 1ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1cd:	89 c2                	mov    %eax,%edx
 1cf:	8b 45 08             	mov    0x8(%ebp),%eax
 1d2:	01 c2                	add    %eax,%edx
 1d4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1da:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1de:	3c 0a                	cmp    $0xa,%al
 1e0:	74 16                	je     1f8 <gets+0x5f>
 1e2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e6:	3c 0d                	cmp    $0xd,%al
 1e8:	74 0e                	je     1f8 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ed:	83 c0 01             	add    $0x1,%eax
 1f0:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1f3:	7c b3                	jl     1a8 <gets+0xf>
 1f5:	eb 01                	jmp    1f8 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1f7:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	01 d0                	add    %edx,%eax
 200:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 203:	8b 45 08             	mov    0x8(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <stat>:

int
stat(char *n, struct stat *st)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 20e:	83 ec 08             	sub    $0x8,%esp
 211:	6a 00                	push   $0x0
 213:	ff 75 08             	pushl  0x8(%ebp)
 216:	e8 0c 01 00 00       	call   327 <open>
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 221:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 225:	79 07                	jns    22e <stat+0x26>
    return -1;
 227:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 22c:	eb 25                	jmp    253 <stat+0x4b>
  r = fstat(fd, st);
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	ff 75 0c             	pushl  0xc(%ebp)
 234:	ff 75 f4             	pushl  -0xc(%ebp)
 237:	e8 03 01 00 00       	call   33f <fstat>
 23c:	83 c4 10             	add    $0x10,%esp
 23f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 242:	83 ec 0c             	sub    $0xc,%esp
 245:	ff 75 f4             	pushl  -0xc(%ebp)
 248:	e8 c2 00 00 00       	call   30f <close>
 24d:	83 c4 10             	add    $0x10,%esp
  return r;
 250:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 253:	c9                   	leave  
 254:	c3                   	ret    

00000255 <atoi>:

int
atoi(const char *s)
{
 255:	55                   	push   %ebp
 256:	89 e5                	mov    %esp,%ebp
 258:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 25b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 262:	eb 25                	jmp    289 <atoi+0x34>
    n = n*10 + *s++ - '0';
 264:	8b 55 fc             	mov    -0x4(%ebp),%edx
 267:	89 d0                	mov    %edx,%eax
 269:	c1 e0 02             	shl    $0x2,%eax
 26c:	01 d0                	add    %edx,%eax
 26e:	01 c0                	add    %eax,%eax
 270:	89 c1                	mov    %eax,%ecx
 272:	8b 45 08             	mov    0x8(%ebp),%eax
 275:	8d 50 01             	lea    0x1(%eax),%edx
 278:	89 55 08             	mov    %edx,0x8(%ebp)
 27b:	0f b6 00             	movzbl (%eax),%eax
 27e:	0f be c0             	movsbl %al,%eax
 281:	01 c8                	add    %ecx,%eax
 283:	83 e8 30             	sub    $0x30,%eax
 286:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 289:	8b 45 08             	mov    0x8(%ebp),%eax
 28c:	0f b6 00             	movzbl (%eax),%eax
 28f:	3c 2f                	cmp    $0x2f,%al
 291:	7e 0a                	jle    29d <atoi+0x48>
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	0f b6 00             	movzbl (%eax),%eax
 299:	3c 39                	cmp    $0x39,%al
 29b:	7e c7                	jle    264 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 29d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a0:	c9                   	leave  
 2a1:	c3                   	ret    

000002a2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2b4:	eb 17                	jmp    2cd <memmove+0x2b>
    *dst++ = *src++;
 2b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b9:	8d 50 01             	lea    0x1(%eax),%edx
 2bc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2bf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2c2:	8d 4a 01             	lea    0x1(%edx),%ecx
 2c5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2c8:	0f b6 12             	movzbl (%edx),%edx
 2cb:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2cd:	8b 45 10             	mov    0x10(%ebp),%eax
 2d0:	8d 50 ff             	lea    -0x1(%eax),%edx
 2d3:	89 55 10             	mov    %edx,0x10(%ebp)
 2d6:	85 c0                	test   %eax,%eax
 2d8:	7f dc                	jg     2b6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2dd:	c9                   	leave  
 2de:	c3                   	ret    

000002df <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
 2df:	b8 01 00 00 00       	mov    $0x1,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <exit>:
SYSCALL(exit)
 2e7:	b8 02 00 00 00       	mov    $0x2,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <wait>:
SYSCALL(wait)
 2ef:	b8 03 00 00 00       	mov    $0x3,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <pipe>:
SYSCALL(pipe)
 2f7:	b8 04 00 00 00       	mov    $0x4,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <read>:
SYSCALL(read)
 2ff:	b8 05 00 00 00       	mov    $0x5,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <write>:
SYSCALL(write)
 307:	b8 10 00 00 00       	mov    $0x10,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <close>:
SYSCALL(close)
 30f:	b8 15 00 00 00       	mov    $0x15,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <kill>:
SYSCALL(kill)
 317:	b8 06 00 00 00       	mov    $0x6,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <exec>:
SYSCALL(exec)
 31f:	b8 07 00 00 00       	mov    $0x7,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <open>:
SYSCALL(open)
 327:	b8 0f 00 00 00       	mov    $0xf,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <mknod>:
SYSCALL(mknod)
 32f:	b8 11 00 00 00       	mov    $0x11,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <unlink>:
SYSCALL(unlink)
 337:	b8 12 00 00 00       	mov    $0x12,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <fstat>:
SYSCALL(fstat)
 33f:	b8 08 00 00 00       	mov    $0x8,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <link>:
SYSCALL(link)
 347:	b8 13 00 00 00       	mov    $0x13,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <mkdir>:
SYSCALL(mkdir)
 34f:	b8 14 00 00 00       	mov    $0x14,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <chdir>:
SYSCALL(chdir)
 357:	b8 09 00 00 00       	mov    $0x9,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <dup>:
SYSCALL(dup)
 35f:	b8 0a 00 00 00       	mov    $0xa,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <getpid>:
SYSCALL(getpid)
 367:	b8 0b 00 00 00       	mov    $0xb,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <sbrk>:
SYSCALL(sbrk)
 36f:	b8 0c 00 00 00       	mov    $0xc,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <sleep>:
SYSCALL(sleep)
 377:	b8 0d 00 00 00       	mov    $0xd,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <uptime>:
SYSCALL(uptime)
 37f:	b8 0e 00 00 00       	mov    $0xe,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <date>:

// Assignment starts here

SYSCALL(date)
 387:	b8 16 00 00 00       	mov    $0x16,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <str_ls_call1>:
 38f:	6c                   	insb   (%dx),%es:(%edi)
 390:	73 5f                	jae    3f1 <ls_call6+0x4>
 392:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 395:	6c                   	insb   (%dx),%es:(%edi)
 396:	31 00                	xor    %eax,(%eax)

00000398 <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
 398:	b8 8f 03 00 00       	mov    $0x38f,%eax
 39d:	cd 41                	int    $0x41
 39f:	c3                   	ret    

000003a0 <str_ls_call2>:
 3a0:	6c                   	insb   (%dx),%es:(%edi)
 3a1:	73 5f                	jae    402 <ls_call7+0x4>
 3a3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3a6:	6c                   	insb   (%dx),%es:(%edi)
 3a7:	32 00                	xor    (%eax),%al

000003a9 <ls_call2>:
CS550LSSYSCALL(ls_call2)
 3a9:	b8 a0 03 00 00       	mov    $0x3a0,%eax
 3ae:	cd 41                	int    $0x41
 3b0:	c3                   	ret    

000003b1 <str_ls_call3>:
 3b1:	6c                   	insb   (%dx),%es:(%edi)
 3b2:	73 5f                	jae    413 <ls_call8+0x4>
 3b4:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3b7:	6c                   	insb   (%dx),%es:(%edi)
 3b8:	33 00                	xor    (%eax),%eax

000003ba <ls_call3>:
CS550LSSYSCALL(ls_call3)
 3ba:	b8 b1 03 00 00       	mov    $0x3b1,%eax
 3bf:	cd 41                	int    $0x41
 3c1:	c3                   	ret    

000003c2 <str_ls_call4>:
 3c2:	6c                   	insb   (%dx),%es:(%edi)
 3c3:	73 5f                	jae    424 <ls_call9+0x4>
 3c5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3c8:	6c                   	insb   (%dx),%es:(%edi)
 3c9:	34 00                	xor    $0x0,%al

000003cb <ls_call4>:
CS550LSSYSCALL(ls_call4)
 3cb:	b8 c2 03 00 00       	mov    $0x3c2,%eax
 3d0:	cd 41                	int    $0x41
 3d2:	c3                   	ret    

000003d3 <str_ls_call5>:
 3d3:	6c                   	insb   (%dx),%es:(%edi)
 3d4:	73 5f                	jae    435 <ls_call10+0x3>
 3d6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3d9:	6c                   	insb   (%dx),%es:(%edi)
 3da:	35                   	.byte 0x35
	...

000003dc <ls_call5>:
CS550LSSYSCALL(ls_call5)
 3dc:	b8 d3 03 00 00       	mov    $0x3d3,%eax
 3e1:	cd 41                	int    $0x41
 3e3:	c3                   	ret    

000003e4 <str_ls_call6>:
 3e4:	6c                   	insb   (%dx),%es:(%edi)
 3e5:	73 5f                	jae    446 <ls_call11+0x2>
 3e7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3ea:	6c                   	insb   (%dx),%es:(%edi)
 3eb:	36                   	ss
	...

000003ed <ls_call6>:
CS550LSSYSCALL(ls_call6)
 3ed:	b8 e4 03 00 00       	mov    $0x3e4,%eax
 3f2:	cd 41                	int    $0x41
 3f4:	c3                   	ret    

000003f5 <str_ls_call7>:
 3f5:	6c                   	insb   (%dx),%es:(%edi)
 3f6:	73 5f                	jae    457 <ls_call12+0x1>
 3f8:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3fb:	6c                   	insb   (%dx),%es:(%edi)
 3fc:	37                   	aaa    
	...

000003fe <ls_call7>:
CS550LSSYSCALL(ls_call7)
 3fe:	b8 f5 03 00 00       	mov    $0x3f5,%eax
 403:	cd 41                	int    $0x41
 405:	c3                   	ret    

00000406 <str_ls_call8>:
 406:	6c                   	insb   (%dx),%es:(%edi)
 407:	73 5f                	jae    468 <ls_call13>
 409:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 40c:	6c                   	insb   (%dx),%es:(%edi)
 40d:	38 00                	cmp    %al,(%eax)

0000040f <ls_call8>:
CS550LSSYSCALL(ls_call8)
 40f:	b8 06 04 00 00       	mov    $0x406,%eax
 414:	cd 41                	int    $0x41
 416:	c3                   	ret    

00000417 <str_ls_call9>:
 417:	6c                   	insb   (%dx),%es:(%edi)
 418:	73 5f                	jae    479 <str_ls_call14+0x9>
 41a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 41d:	6c                   	insb   (%dx),%es:(%edi)
 41e:	39 00                	cmp    %eax,(%eax)

00000420 <ls_call9>:
CS550LSSYSCALL(ls_call9)
 420:	b8 17 04 00 00       	mov    $0x417,%eax
 425:	cd 41                	int    $0x41
 427:	c3                   	ret    

00000428 <str_ls_call10>:
 428:	6c                   	insb   (%dx),%es:(%edi)
 429:	73 5f                	jae    48a <str_ls_call15+0x8>
 42b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 42e:	6c                   	insb   (%dx),%es:(%edi)
 42f:	31 30                	xor    %esi,(%eax)
	...

00000432 <ls_call10>:
CS550LSSYSCALL(ls_call10)
 432:	b8 28 04 00 00       	mov    $0x428,%eax
 437:	cd 41                	int    $0x41
 439:	c3                   	ret    

0000043a <str_ls_call11>:
 43a:	6c                   	insb   (%dx),%es:(%edi)
 43b:	73 5f                	jae    49c <str_ls_call16+0x8>
 43d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 440:	6c                   	insb   (%dx),%es:(%edi)
 441:	31 31                	xor    %esi,(%ecx)
	...

00000444 <ls_call11>:
CS550LSSYSCALL(ls_call11)
 444:	b8 3a 04 00 00       	mov    $0x43a,%eax
 449:	cd 41                	int    $0x41
 44b:	c3                   	ret    

0000044c <str_ls_call12>:
 44c:	6c                   	insb   (%dx),%es:(%edi)
 44d:	73 5f                	jae    4ae <str_ls_call17+0x8>
 44f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 452:	6c                   	insb   (%dx),%es:(%edi)
 453:	31 32                	xor    %esi,(%edx)
	...

00000456 <ls_call12>:
CS550LSSYSCALL(ls_call12)
 456:	b8 4c 04 00 00       	mov    $0x44c,%eax
 45b:	cd 41                	int    $0x41
 45d:	c3                   	ret    

0000045e <str_ls_call13>:
 45e:	6c                   	insb   (%dx),%es:(%edi)
 45f:	73 5f                	jae    4c0 <str_ls_call18+0x8>
 461:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 464:	6c                   	insb   (%dx),%es:(%edi)
 465:	31 33                	xor    %esi,(%ebx)
	...

00000468 <ls_call13>:
CS550LSSYSCALL(ls_call13)
 468:	b8 5e 04 00 00       	mov    $0x45e,%eax
 46d:	cd 41                	int    $0x41
 46f:	c3                   	ret    

00000470 <str_ls_call14>:
 470:	6c                   	insb   (%dx),%es:(%edi)
 471:	73 5f                	jae    4d2 <str_ls_call19+0x8>
 473:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 476:	6c                   	insb   (%dx),%es:(%edi)
 477:	31 34 00             	xor    %esi,(%eax,%eax,1)

0000047a <ls_call14>:
CS550LSSYSCALL(ls_call14)
 47a:	b8 70 04 00 00       	mov    $0x470,%eax
 47f:	cd 41                	int    $0x41
 481:	c3                   	ret    

00000482 <str_ls_call15>:
 482:	6c                   	insb   (%dx),%es:(%edi)
 483:	73 5f                	jae    4e4 <str_ls_call20+0x8>
 485:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 488:	6c                   	insb   (%dx),%es:(%edi)
 489:	31                   	.byte 0x31
 48a:	35                   	.byte 0x35
	...

0000048c <ls_call15>:
CS550LSSYSCALL(ls_call15)
 48c:	b8 82 04 00 00       	mov    $0x482,%eax
 491:	cd 41                	int    $0x41
 493:	c3                   	ret    

00000494 <str_ls_call16>:
 494:	6c                   	insb   (%dx),%es:(%edi)
 495:	73 5f                	jae    4f6 <str_ls_call21+0x8>
 497:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 49a:	6c                   	insb   (%dx),%es:(%edi)
 49b:	31 36                	xor    %esi,(%esi)
	...

0000049e <ls_call16>:
CS550LSSYSCALL(ls_call16)
 49e:	b8 94 04 00 00       	mov    $0x494,%eax
 4a3:	cd 41                	int    $0x41
 4a5:	c3                   	ret    

000004a6 <str_ls_call17>:
 4a6:	6c                   	insb   (%dx),%es:(%edi)
 4a7:	73 5f                	jae    508 <str_ls_call22+0x8>
 4a9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4ac:	6c                   	insb   (%dx),%es:(%edi)
 4ad:	31 37                	xor    %esi,(%edi)
	...

000004b0 <ls_call17>:
CS550LSSYSCALL(ls_call17)
 4b0:	b8 a6 04 00 00       	mov    $0x4a6,%eax
 4b5:	cd 41                	int    $0x41
 4b7:	c3                   	ret    

000004b8 <str_ls_call18>:
 4b8:	6c                   	insb   (%dx),%es:(%edi)
 4b9:	73 5f                	jae    51a <str_ls_call23+0x8>
 4bb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4be:	6c                   	insb   (%dx),%es:(%edi)
 4bf:	31 38                	xor    %edi,(%eax)
	...

000004c2 <ls_call18>:
CS550LSSYSCALL(ls_call18)
 4c2:	b8 b8 04 00 00       	mov    $0x4b8,%eax
 4c7:	cd 41                	int    $0x41
 4c9:	c3                   	ret    

000004ca <str_ls_call19>:
 4ca:	6c                   	insb   (%dx),%es:(%edi)
 4cb:	73 5f                	jae    52c <str_ls_call24+0x8>
 4cd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4d0:	6c                   	insb   (%dx),%es:(%edi)
 4d1:	31 39                	xor    %edi,(%ecx)
	...

000004d4 <ls_call19>:
CS550LSSYSCALL(ls_call19)
 4d4:	b8 ca 04 00 00       	mov    $0x4ca,%eax
 4d9:	cd 41                	int    $0x41
 4db:	c3                   	ret    

000004dc <str_ls_call20>:
 4dc:	6c                   	insb   (%dx),%es:(%edi)
 4dd:	73 5f                	jae    53e <str_ls_call25+0x8>
 4df:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4e2:	6c                   	insb   (%dx),%es:(%edi)
 4e3:	32 30                	xor    (%eax),%dh
	...

000004e6 <ls_call20>:
CS550LSSYSCALL(ls_call20)
 4e6:	b8 dc 04 00 00       	mov    $0x4dc,%eax
 4eb:	cd 41                	int    $0x41
 4ed:	c3                   	ret    

000004ee <str_ls_call21>:
 4ee:	6c                   	insb   (%dx),%es:(%edi)
 4ef:	73 5f                	jae    550 <str_ls_call26+0x8>
 4f1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4f4:	6c                   	insb   (%dx),%es:(%edi)
 4f5:	32 31                	xor    (%ecx),%dh
	...

000004f8 <ls_call21>:
CS550LSSYSCALL(ls_call21)
 4f8:	b8 ee 04 00 00       	mov    $0x4ee,%eax
 4fd:	cd 41                	int    $0x41
 4ff:	c3                   	ret    

00000500 <str_ls_call22>:
 500:	6c                   	insb   (%dx),%es:(%edi)
 501:	73 5f                	jae    562 <str_ls_call27+0x8>
 503:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 506:	6c                   	insb   (%dx),%es:(%edi)
 507:	32 32                	xor    (%edx),%dh
	...

0000050a <ls_call22>:
CS550LSSYSCALL(ls_call22)
 50a:	b8 00 05 00 00       	mov    $0x500,%eax
 50f:	cd 41                	int    $0x41
 511:	c3                   	ret    

00000512 <str_ls_call23>:
 512:	6c                   	insb   (%dx),%es:(%edi)
 513:	73 5f                	jae    574 <str_ls_call28+0x8>
 515:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 518:	6c                   	insb   (%dx),%es:(%edi)
 519:	32 33                	xor    (%ebx),%dh
	...

0000051c <ls_call23>:
CS550LSSYSCALL(ls_call23)
 51c:	b8 12 05 00 00       	mov    $0x512,%eax
 521:	cd 41                	int    $0x41
 523:	c3                   	ret    

00000524 <str_ls_call24>:
 524:	6c                   	insb   (%dx),%es:(%edi)
 525:	73 5f                	jae    586 <str_ls_call29+0x8>
 527:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 52a:	6c                   	insb   (%dx),%es:(%edi)
 52b:	32 34 00             	xor    (%eax,%eax,1),%dh

0000052e <ls_call24>:
CS550LSSYSCALL(ls_call24)
 52e:	b8 24 05 00 00       	mov    $0x524,%eax
 533:	cd 41                	int    $0x41
 535:	c3                   	ret    

00000536 <str_ls_call25>:
 536:	6c                   	insb   (%dx),%es:(%edi)
 537:	73 5f                	jae    598 <str_ls_call30+0x8>
 539:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 53c:	6c                   	insb   (%dx),%es:(%edi)
 53d:	32                   	.byte 0x32
 53e:	35                   	.byte 0x35
	...

00000540 <ls_call25>:
CS550LSSYSCALL(ls_call25)
 540:	b8 36 05 00 00       	mov    $0x536,%eax
 545:	cd 41                	int    $0x41
 547:	c3                   	ret    

00000548 <str_ls_call26>:
 548:	6c                   	insb   (%dx),%es:(%edi)
 549:	73 5f                	jae    5aa <str_ls_call31+0x8>
 54b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 54e:	6c                   	insb   (%dx),%es:(%edi)
 54f:	32 36                	xor    (%esi),%dh
	...

00000552 <ls_call26>:
CS550LSSYSCALL(ls_call26)
 552:	b8 48 05 00 00       	mov    $0x548,%eax
 557:	cd 41                	int    $0x41
 559:	c3                   	ret    

0000055a <str_ls_call27>:
 55a:	6c                   	insb   (%dx),%es:(%edi)
 55b:	73 5f                	jae    5bc <str_ls_call32+0x8>
 55d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 560:	6c                   	insb   (%dx),%es:(%edi)
 561:	32 37                	xor    (%edi),%dh
	...

00000564 <ls_call27>:
CS550LSSYSCALL(ls_call27)
 564:	b8 5a 05 00 00       	mov    $0x55a,%eax
 569:	cd 41                	int    $0x41
 56b:	c3                   	ret    

0000056c <str_ls_call28>:
 56c:	6c                   	insb   (%dx),%es:(%edi)
 56d:	73 5f                	jae    5ce <str_ls_call33+0x8>
 56f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 572:	6c                   	insb   (%dx),%es:(%edi)
 573:	32 38                	xor    (%eax),%bh
	...

00000576 <ls_call28>:
CS550LSSYSCALL(ls_call28)
 576:	b8 6c 05 00 00       	mov    $0x56c,%eax
 57b:	cd 41                	int    $0x41
 57d:	c3                   	ret    

0000057e <str_ls_call29>:
 57e:	6c                   	insb   (%dx),%es:(%edi)
 57f:	73 5f                	jae    5e0 <str_ls_call34+0x8>
 581:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 584:	6c                   	insb   (%dx),%es:(%edi)
 585:	32 39                	xor    (%ecx),%bh
	...

00000588 <ls_call29>:
CS550LSSYSCALL(ls_call29)
 588:	b8 7e 05 00 00       	mov    $0x57e,%eax
 58d:	cd 41                	int    $0x41
 58f:	c3                   	ret    

00000590 <str_ls_call30>:
 590:	6c                   	insb   (%dx),%es:(%edi)
 591:	73 5f                	jae    5f2 <str_ls_call35+0x8>
 593:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 596:	6c                   	insb   (%dx),%es:(%edi)
 597:	33 30                	xor    (%eax),%esi
	...

0000059a <ls_call30>:
CS550LSSYSCALL(ls_call30)
 59a:	b8 90 05 00 00       	mov    $0x590,%eax
 59f:	cd 41                	int    $0x41
 5a1:	c3                   	ret    

000005a2 <str_ls_call31>:
 5a2:	6c                   	insb   (%dx),%es:(%edi)
 5a3:	73 5f                	jae    604 <str_ls_call36+0x8>
 5a5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5a8:	6c                   	insb   (%dx),%es:(%edi)
 5a9:	33 31                	xor    (%ecx),%esi
	...

000005ac <ls_call31>:
CS550LSSYSCALL(ls_call31)
 5ac:	b8 a2 05 00 00       	mov    $0x5a2,%eax
 5b1:	cd 41                	int    $0x41
 5b3:	c3                   	ret    

000005b4 <str_ls_call32>:
 5b4:	6c                   	insb   (%dx),%es:(%edi)
 5b5:	73 5f                	jae    616 <str_ls_call37+0x8>
 5b7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5ba:	6c                   	insb   (%dx),%es:(%edi)
 5bb:	33 32                	xor    (%edx),%esi
	...

000005be <ls_call32>:
CS550LSSYSCALL(ls_call32)
 5be:	b8 b4 05 00 00       	mov    $0x5b4,%eax
 5c3:	cd 41                	int    $0x41
 5c5:	c3                   	ret    

000005c6 <str_ls_call33>:
 5c6:	6c                   	insb   (%dx),%es:(%edi)
 5c7:	73 5f                	jae    628 <str_ls_call38+0x8>
 5c9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5cc:	6c                   	insb   (%dx),%es:(%edi)
 5cd:	33 33                	xor    (%ebx),%esi
	...

000005d0 <ls_call33>:
CS550LSSYSCALL(ls_call33)
 5d0:	b8 c6 05 00 00       	mov    $0x5c6,%eax
 5d5:	cd 41                	int    $0x41
 5d7:	c3                   	ret    

000005d8 <str_ls_call34>:
 5d8:	6c                   	insb   (%dx),%es:(%edi)
 5d9:	73 5f                	jae    63a <str_ls_call39+0x8>
 5db:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5de:	6c                   	insb   (%dx),%es:(%edi)
 5df:	33 34 00             	xor    (%eax,%eax,1),%esi

000005e2 <ls_call34>:
CS550LSSYSCALL(ls_call34)
 5e2:	b8 d8 05 00 00       	mov    $0x5d8,%eax
 5e7:	cd 41                	int    $0x41
 5e9:	c3                   	ret    

000005ea <str_ls_call35>:
 5ea:	6c                   	insb   (%dx),%es:(%edi)
 5eb:	73 5f                	jae    64c <str_ls_call40+0x8>
 5ed:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5f0:	6c                   	insb   (%dx),%es:(%edi)
 5f1:	33                   	.byte 0x33
 5f2:	35                   	.byte 0x35
	...

000005f4 <ls_call35>:
CS550LSSYSCALL(ls_call35)
 5f4:	b8 ea 05 00 00       	mov    $0x5ea,%eax
 5f9:	cd 41                	int    $0x41
 5fb:	c3                   	ret    

000005fc <str_ls_call36>:
 5fc:	6c                   	insb   (%dx),%es:(%edi)
 5fd:	73 5f                	jae    65e <str_ls_call41+0x8>
 5ff:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 602:	6c                   	insb   (%dx),%es:(%edi)
 603:	33 36                	xor    (%esi),%esi
	...

00000606 <ls_call36>:
CS550LSSYSCALL(ls_call36)
 606:	b8 fc 05 00 00       	mov    $0x5fc,%eax
 60b:	cd 41                	int    $0x41
 60d:	c3                   	ret    

0000060e <str_ls_call37>:
 60e:	6c                   	insb   (%dx),%es:(%edi)
 60f:	73 5f                	jae    670 <str_ls_call42+0x8>
 611:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 614:	6c                   	insb   (%dx),%es:(%edi)
 615:	33 37                	xor    (%edi),%esi
	...

00000618 <ls_call37>:
CS550LSSYSCALL(ls_call37)
 618:	b8 0e 06 00 00       	mov    $0x60e,%eax
 61d:	cd 41                	int    $0x41
 61f:	c3                   	ret    

00000620 <str_ls_call38>:
 620:	6c                   	insb   (%dx),%es:(%edi)
 621:	73 5f                	jae    682 <str_ls_call43+0x8>
 623:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 626:	6c                   	insb   (%dx),%es:(%edi)
 627:	33 38                	xor    (%eax),%edi
	...

0000062a <ls_call38>:
CS550LSSYSCALL(ls_call38)
 62a:	b8 20 06 00 00       	mov    $0x620,%eax
 62f:	cd 41                	int    $0x41
 631:	c3                   	ret    

00000632 <str_ls_call39>:
 632:	6c                   	insb   (%dx),%es:(%edi)
 633:	73 5f                	jae    694 <str_ls_call44+0x8>
 635:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 638:	6c                   	insb   (%dx),%es:(%edi)
 639:	33 39                	xor    (%ecx),%edi
	...

0000063c <ls_call39>:
CS550LSSYSCALL(ls_call39)
 63c:	b8 32 06 00 00       	mov    $0x632,%eax
 641:	cd 41                	int    $0x41
 643:	c3                   	ret    

00000644 <str_ls_call40>:
 644:	6c                   	insb   (%dx),%es:(%edi)
 645:	73 5f                	jae    6a6 <str_ls_call45+0x8>
 647:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 64a:	6c                   	insb   (%dx),%es:(%edi)
 64b:	34 30                	xor    $0x30,%al
	...

0000064e <ls_call40>:
CS550LSSYSCALL(ls_call40)
 64e:	b8 44 06 00 00       	mov    $0x644,%eax
 653:	cd 41                	int    $0x41
 655:	c3                   	ret    

00000656 <str_ls_call41>:
 656:	6c                   	insb   (%dx),%es:(%edi)
 657:	73 5f                	jae    6b8 <str_ls_call46+0x8>
 659:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 65c:	6c                   	insb   (%dx),%es:(%edi)
 65d:	34 31                	xor    $0x31,%al
	...

00000660 <ls_call41>:
CS550LSSYSCALL(ls_call41)
 660:	b8 56 06 00 00       	mov    $0x656,%eax
 665:	cd 41                	int    $0x41
 667:	c3                   	ret    

00000668 <str_ls_call42>:
 668:	6c                   	insb   (%dx),%es:(%edi)
 669:	73 5f                	jae    6ca <str_ls_call47+0x8>
 66b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 66e:	6c                   	insb   (%dx),%es:(%edi)
 66f:	34 32                	xor    $0x32,%al
	...

00000672 <ls_call42>:
CS550LSSYSCALL(ls_call42)
 672:	b8 68 06 00 00       	mov    $0x668,%eax
 677:	cd 41                	int    $0x41
 679:	c3                   	ret    

0000067a <str_ls_call43>:
 67a:	6c                   	insb   (%dx),%es:(%edi)
 67b:	73 5f                	jae    6dc <str_ls_call48+0x8>
 67d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 680:	6c                   	insb   (%dx),%es:(%edi)
 681:	34 33                	xor    $0x33,%al
	...

00000684 <ls_call43>:
CS550LSSYSCALL(ls_call43)
 684:	b8 7a 06 00 00       	mov    $0x67a,%eax
 689:	cd 41                	int    $0x41
 68b:	c3                   	ret    

0000068c <str_ls_call44>:
 68c:	6c                   	insb   (%dx),%es:(%edi)
 68d:	73 5f                	jae    6ee <str_ls_call49+0x8>
 68f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 692:	6c                   	insb   (%dx),%es:(%edi)
 693:	34 34                	xor    $0x34,%al
	...

00000696 <ls_call44>:
CS550LSSYSCALL(ls_call44)
 696:	b8 8c 06 00 00       	mov    $0x68c,%eax
 69b:	cd 41                	int    $0x41
 69d:	c3                   	ret    

0000069e <str_ls_call45>:
 69e:	6c                   	insb   (%dx),%es:(%edi)
 69f:	73 5f                	jae    700 <str_ls_call50+0x8>
 6a1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6a4:	6c                   	insb   (%dx),%es:(%edi)
 6a5:	34 35                	xor    $0x35,%al
	...

000006a8 <ls_call45>:
CS550LSSYSCALL(ls_call45)
 6a8:	b8 9e 06 00 00       	mov    $0x69e,%eax
 6ad:	cd 41                	int    $0x41
 6af:	c3                   	ret    

000006b0 <str_ls_call46>:
 6b0:	6c                   	insb   (%dx),%es:(%edi)
 6b1:	73 5f                	jae    712 <str_ht_call1+0x8>
 6b3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6b6:	6c                   	insb   (%dx),%es:(%edi)
 6b7:	34 36                	xor    $0x36,%al
	...

000006ba <ls_call46>:
CS550LSSYSCALL(ls_call46)
 6ba:	b8 b0 06 00 00       	mov    $0x6b0,%eax
 6bf:	cd 41                	int    $0x41
 6c1:	c3                   	ret    

000006c2 <str_ls_call47>:
 6c2:	6c                   	insb   (%dx),%es:(%edi)
 6c3:	73 5f                	jae    724 <ht_call2>
 6c5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6c8:	6c                   	insb   (%dx),%es:(%edi)
 6c9:	34 37                	xor    $0x37,%al
	...

000006cc <ls_call47>:
CS550LSSYSCALL(ls_call47)
 6cc:	b8 c2 06 00 00       	mov    $0x6c2,%eax
 6d1:	cd 41                	int    $0x41
 6d3:	c3                   	ret    

000006d4 <str_ls_call48>:
 6d4:	6c                   	insb   (%dx),%es:(%edi)
 6d5:	73 5f                	jae    736 <ht_call3+0x1>
 6d7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6da:	6c                   	insb   (%dx),%es:(%edi)
 6db:	34 38                	xor    $0x38,%al
	...

000006de <ls_call48>:
CS550LSSYSCALL(ls_call48)
 6de:	b8 d4 06 00 00       	mov    $0x6d4,%eax
 6e3:	cd 41                	int    $0x41
 6e5:	c3                   	ret    

000006e6 <str_ls_call49>:
 6e6:	6c                   	insb   (%dx),%es:(%edi)
 6e7:	73 5f                	jae    748 <ht_call4+0x2>
 6e9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6ec:	6c                   	insb   (%dx),%es:(%edi)
 6ed:	34 39                	xor    $0x39,%al
	...

000006f0 <ls_call49>:
CS550LSSYSCALL(ls_call49)
 6f0:	b8 e6 06 00 00       	mov    $0x6e6,%eax
 6f5:	cd 41                	int    $0x41
 6f7:	c3                   	ret    

000006f8 <str_ls_call50>:
 6f8:	6c                   	insb   (%dx),%es:(%edi)
 6f9:	73 5f                	jae    75a <ht_call5+0x3>
 6fb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6fe:	6c                   	insb   (%dx),%es:(%edi)
 6ff:	35                   	.byte 0x35
 700:	30 00                	xor    %al,(%eax)

00000702 <ls_call50>:
CS550LSSYSCALL(ls_call50)
 702:	b8 f8 06 00 00       	mov    $0x6f8,%eax
 707:	cd 41                	int    $0x41
 709:	c3                   	ret    

0000070a <str_ht_call1>:
 70a:	68 74 5f 63 61       	push   $0x61635f74
 70f:	6c                   	insb   (%dx),%es:(%edi)
 710:	6c                   	insb   (%dx),%es:(%edi)
 711:	31 00                	xor    %eax,(%eax)

00000713 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
 713:	b8 0a 07 00 00       	mov    $0x70a,%eax
 718:	cd 42                	int    $0x42
 71a:	c3                   	ret    

0000071b <str_ht_call2>:
 71b:	68 74 5f 63 61       	push   $0x61635f74
 720:	6c                   	insb   (%dx),%es:(%edi)
 721:	6c                   	insb   (%dx),%es:(%edi)
 722:	32 00                	xor    (%eax),%al

00000724 <ht_call2>:
CS550HTSYSCALL(ht_call2)
 724:	b8 1b 07 00 00       	mov    $0x71b,%eax
 729:	cd 42                	int    $0x42
 72b:	c3                   	ret    

0000072c <str_ht_call3>:
 72c:	68 74 5f 63 61       	push   $0x61635f74
 731:	6c                   	insb   (%dx),%es:(%edi)
 732:	6c                   	insb   (%dx),%es:(%edi)
 733:	33 00                	xor    (%eax),%eax

00000735 <ht_call3>:
CS550HTSYSCALL(ht_call3)
 735:	b8 2c 07 00 00       	mov    $0x72c,%eax
 73a:	cd 42                	int    $0x42
 73c:	c3                   	ret    

0000073d <str_ht_call4>:
 73d:	68 74 5f 63 61       	push   $0x61635f74
 742:	6c                   	insb   (%dx),%es:(%edi)
 743:	6c                   	insb   (%dx),%es:(%edi)
 744:	34 00                	xor    $0x0,%al

00000746 <ht_call4>:
CS550HTSYSCALL(ht_call4)
 746:	b8 3d 07 00 00       	mov    $0x73d,%eax
 74b:	cd 42                	int    $0x42
 74d:	c3                   	ret    

0000074e <str_ht_call5>:
 74e:	68 74 5f 63 61       	push   $0x61635f74
 753:	6c                   	insb   (%dx),%es:(%edi)
 754:	6c                   	insb   (%dx),%es:(%edi)
 755:	35                   	.byte 0x35
	...

00000757 <ht_call5>:
CS550HTSYSCALL(ht_call5)
 757:	b8 4e 07 00 00       	mov    $0x74e,%eax
 75c:	cd 42                	int    $0x42
 75e:	c3                   	ret    

0000075f <str_ht_call6>:
 75f:	68 74 5f 63 61       	push   $0x61635f74
 764:	6c                   	insb   (%dx),%es:(%edi)
 765:	6c                   	insb   (%dx),%es:(%edi)
 766:	36                   	ss
	...

00000768 <ht_call6>:
CS550HTSYSCALL(ht_call6)
 768:	b8 5f 07 00 00       	mov    $0x75f,%eax
 76d:	cd 42                	int    $0x42
 76f:	c3                   	ret    

00000770 <str_ht_call7>:
 770:	68 74 5f 63 61       	push   $0x61635f74
 775:	6c                   	insb   (%dx),%es:(%edi)
 776:	6c                   	insb   (%dx),%es:(%edi)
 777:	37                   	aaa    
	...

00000779 <ht_call7>:
CS550HTSYSCALL(ht_call7)
 779:	b8 70 07 00 00       	mov    $0x770,%eax
 77e:	cd 42                	int    $0x42
 780:	c3                   	ret    

00000781 <str_ht_call8>:
 781:	68 74 5f 63 61       	push   $0x61635f74
 786:	6c                   	insb   (%dx),%es:(%edi)
 787:	6c                   	insb   (%dx),%es:(%edi)
 788:	38 00                	cmp    %al,(%eax)

0000078a <ht_call8>:
CS550HTSYSCALL(ht_call8)
 78a:	b8 81 07 00 00       	mov    $0x781,%eax
 78f:	cd 42                	int    $0x42
 791:	c3                   	ret    

00000792 <str_ht_call9>:
 792:	68 74 5f 63 61       	push   $0x61635f74
 797:	6c                   	insb   (%dx),%es:(%edi)
 798:	6c                   	insb   (%dx),%es:(%edi)
 799:	39 00                	cmp    %eax,(%eax)

0000079b <ht_call9>:
CS550HTSYSCALL(ht_call9)
 79b:	b8 92 07 00 00       	mov    $0x792,%eax
 7a0:	cd 42                	int    $0x42
 7a2:	c3                   	ret    

000007a3 <str_ht_call10>:
 7a3:	68 74 5f 63 61       	push   $0x61635f74
 7a8:	6c                   	insb   (%dx),%es:(%edi)
 7a9:	6c                   	insb   (%dx),%es:(%edi)
 7aa:	31 30                	xor    %esi,(%eax)
	...

000007ad <ht_call10>:
CS550HTSYSCALL(ht_call10)
 7ad:	b8 a3 07 00 00       	mov    $0x7a3,%eax
 7b2:	cd 42                	int    $0x42
 7b4:	c3                   	ret    

000007b5 <str_ht_call11>:
 7b5:	68 74 5f 63 61       	push   $0x61635f74
 7ba:	6c                   	insb   (%dx),%es:(%edi)
 7bb:	6c                   	insb   (%dx),%es:(%edi)
 7bc:	31 31                	xor    %esi,(%ecx)
	...

000007bf <ht_call11>:
CS550HTSYSCALL(ht_call11)
 7bf:	b8 b5 07 00 00       	mov    $0x7b5,%eax
 7c4:	cd 42                	int    $0x42
 7c6:	c3                   	ret    

000007c7 <str_ht_call12>:
 7c7:	68 74 5f 63 61       	push   $0x61635f74
 7cc:	6c                   	insb   (%dx),%es:(%edi)
 7cd:	6c                   	insb   (%dx),%es:(%edi)
 7ce:	31 32                	xor    %esi,(%edx)
	...

000007d1 <ht_call12>:
CS550HTSYSCALL(ht_call12)
 7d1:	b8 c7 07 00 00       	mov    $0x7c7,%eax
 7d6:	cd 42                	int    $0x42
 7d8:	c3                   	ret    

000007d9 <str_ht_call13>:
 7d9:	68 74 5f 63 61       	push   $0x61635f74
 7de:	6c                   	insb   (%dx),%es:(%edi)
 7df:	6c                   	insb   (%dx),%es:(%edi)
 7e0:	31 33                	xor    %esi,(%ebx)
	...

000007e3 <ht_call13>:
CS550HTSYSCALL(ht_call13)
 7e3:	b8 d9 07 00 00       	mov    $0x7d9,%eax
 7e8:	cd 42                	int    $0x42
 7ea:	c3                   	ret    

000007eb <str_ht_call14>:
 7eb:	68 74 5f 63 61       	push   $0x61635f74
 7f0:	6c                   	insb   (%dx),%es:(%edi)
 7f1:	6c                   	insb   (%dx),%es:(%edi)
 7f2:	31 34 00             	xor    %esi,(%eax,%eax,1)

000007f5 <ht_call14>:
CS550HTSYSCALL(ht_call14)
 7f5:	b8 eb 07 00 00       	mov    $0x7eb,%eax
 7fa:	cd 42                	int    $0x42
 7fc:	c3                   	ret    

000007fd <str_ht_call15>:
 7fd:	68 74 5f 63 61       	push   $0x61635f74
 802:	6c                   	insb   (%dx),%es:(%edi)
 803:	6c                   	insb   (%dx),%es:(%edi)
 804:	31                   	.byte 0x31
 805:	35                   	.byte 0x35
	...

00000807 <ht_call15>:
CS550HTSYSCALL(ht_call15)
 807:	b8 fd 07 00 00       	mov    $0x7fd,%eax
 80c:	cd 42                	int    $0x42
 80e:	c3                   	ret    

0000080f <str_ht_call16>:
 80f:	68 74 5f 63 61       	push   $0x61635f74
 814:	6c                   	insb   (%dx),%es:(%edi)
 815:	6c                   	insb   (%dx),%es:(%edi)
 816:	31 36                	xor    %esi,(%esi)
	...

00000819 <ht_call16>:
CS550HTSYSCALL(ht_call16)
 819:	b8 0f 08 00 00       	mov    $0x80f,%eax
 81e:	cd 42                	int    $0x42
 820:	c3                   	ret    

00000821 <str_ht_call17>:
 821:	68 74 5f 63 61       	push   $0x61635f74
 826:	6c                   	insb   (%dx),%es:(%edi)
 827:	6c                   	insb   (%dx),%es:(%edi)
 828:	31 37                	xor    %esi,(%edi)
	...

0000082b <ht_call17>:
CS550HTSYSCALL(ht_call17)
 82b:	b8 21 08 00 00       	mov    $0x821,%eax
 830:	cd 42                	int    $0x42
 832:	c3                   	ret    

00000833 <str_ht_call18>:
 833:	68 74 5f 63 61       	push   $0x61635f74
 838:	6c                   	insb   (%dx),%es:(%edi)
 839:	6c                   	insb   (%dx),%es:(%edi)
 83a:	31 38                	xor    %edi,(%eax)
	...

0000083d <ht_call18>:
CS550HTSYSCALL(ht_call18)
 83d:	b8 33 08 00 00       	mov    $0x833,%eax
 842:	cd 42                	int    $0x42
 844:	c3                   	ret    

00000845 <str_ht_call19>:
 845:	68 74 5f 63 61       	push   $0x61635f74
 84a:	6c                   	insb   (%dx),%es:(%edi)
 84b:	6c                   	insb   (%dx),%es:(%edi)
 84c:	31 39                	xor    %edi,(%ecx)
	...

0000084f <ht_call19>:
CS550HTSYSCALL(ht_call19)
 84f:	b8 45 08 00 00       	mov    $0x845,%eax
 854:	cd 42                	int    $0x42
 856:	c3                   	ret    

00000857 <str_ht_call20>:
 857:	68 74 5f 63 61       	push   $0x61635f74
 85c:	6c                   	insb   (%dx),%es:(%edi)
 85d:	6c                   	insb   (%dx),%es:(%edi)
 85e:	32 30                	xor    (%eax),%dh
	...

00000861 <ht_call20>:
CS550HTSYSCALL(ht_call20)
 861:	b8 57 08 00 00       	mov    $0x857,%eax
 866:	cd 42                	int    $0x42
 868:	c3                   	ret    

00000869 <str_ht_call21>:
 869:	68 74 5f 63 61       	push   $0x61635f74
 86e:	6c                   	insb   (%dx),%es:(%edi)
 86f:	6c                   	insb   (%dx),%es:(%edi)
 870:	32 31                	xor    (%ecx),%dh
	...

00000873 <ht_call21>:
CS550HTSYSCALL(ht_call21)
 873:	b8 69 08 00 00       	mov    $0x869,%eax
 878:	cd 42                	int    $0x42
 87a:	c3                   	ret    

0000087b <str_ht_call22>:
 87b:	68 74 5f 63 61       	push   $0x61635f74
 880:	6c                   	insb   (%dx),%es:(%edi)
 881:	6c                   	insb   (%dx),%es:(%edi)
 882:	32 32                	xor    (%edx),%dh
	...

00000885 <ht_call22>:
CS550HTSYSCALL(ht_call22)
 885:	b8 7b 08 00 00       	mov    $0x87b,%eax
 88a:	cd 42                	int    $0x42
 88c:	c3                   	ret    

0000088d <str_ht_call23>:
 88d:	68 74 5f 63 61       	push   $0x61635f74
 892:	6c                   	insb   (%dx),%es:(%edi)
 893:	6c                   	insb   (%dx),%es:(%edi)
 894:	32 33                	xor    (%ebx),%dh
	...

00000897 <ht_call23>:
CS550HTSYSCALL(ht_call23)
 897:	b8 8d 08 00 00       	mov    $0x88d,%eax
 89c:	cd 42                	int    $0x42
 89e:	c3                   	ret    

0000089f <str_ht_call24>:
 89f:	68 74 5f 63 61       	push   $0x61635f74
 8a4:	6c                   	insb   (%dx),%es:(%edi)
 8a5:	6c                   	insb   (%dx),%es:(%edi)
 8a6:	32 34 00             	xor    (%eax,%eax,1),%dh

000008a9 <ht_call24>:
CS550HTSYSCALL(ht_call24)
 8a9:	b8 9f 08 00 00       	mov    $0x89f,%eax
 8ae:	cd 42                	int    $0x42
 8b0:	c3                   	ret    

000008b1 <str_ht_call25>:
 8b1:	68 74 5f 63 61       	push   $0x61635f74
 8b6:	6c                   	insb   (%dx),%es:(%edi)
 8b7:	6c                   	insb   (%dx),%es:(%edi)
 8b8:	32                   	.byte 0x32
 8b9:	35                   	.byte 0x35
	...

000008bb <ht_call25>:
CS550HTSYSCALL(ht_call25)
 8bb:	b8 b1 08 00 00       	mov    $0x8b1,%eax
 8c0:	cd 42                	int    $0x42
 8c2:	c3                   	ret    

000008c3 <str_ht_call26>:
 8c3:	68 74 5f 63 61       	push   $0x61635f74
 8c8:	6c                   	insb   (%dx),%es:(%edi)
 8c9:	6c                   	insb   (%dx),%es:(%edi)
 8ca:	32 36                	xor    (%esi),%dh
	...

000008cd <ht_call26>:
CS550HTSYSCALL(ht_call26)
 8cd:	b8 c3 08 00 00       	mov    $0x8c3,%eax
 8d2:	cd 42                	int    $0x42
 8d4:	c3                   	ret    

000008d5 <str_ht_call27>:
 8d5:	68 74 5f 63 61       	push   $0x61635f74
 8da:	6c                   	insb   (%dx),%es:(%edi)
 8db:	6c                   	insb   (%dx),%es:(%edi)
 8dc:	32 37                	xor    (%edi),%dh
	...

000008df <ht_call27>:
CS550HTSYSCALL(ht_call27)
 8df:	b8 d5 08 00 00       	mov    $0x8d5,%eax
 8e4:	cd 42                	int    $0x42
 8e6:	c3                   	ret    

000008e7 <str_ht_call28>:
 8e7:	68 74 5f 63 61       	push   $0x61635f74
 8ec:	6c                   	insb   (%dx),%es:(%edi)
 8ed:	6c                   	insb   (%dx),%es:(%edi)
 8ee:	32 38                	xor    (%eax),%bh
	...

000008f1 <ht_call28>:
CS550HTSYSCALL(ht_call28)
 8f1:	b8 e7 08 00 00       	mov    $0x8e7,%eax
 8f6:	cd 42                	int    $0x42
 8f8:	c3                   	ret    

000008f9 <str_ht_call29>:
 8f9:	68 74 5f 63 61       	push   $0x61635f74
 8fe:	6c                   	insb   (%dx),%es:(%edi)
 8ff:	6c                   	insb   (%dx),%es:(%edi)
 900:	32 39                	xor    (%ecx),%bh
	...

00000903 <ht_call29>:
CS550HTSYSCALL(ht_call29)
 903:	b8 f9 08 00 00       	mov    $0x8f9,%eax
 908:	cd 42                	int    $0x42
 90a:	c3                   	ret    

0000090b <str_ht_call30>:
 90b:	68 74 5f 63 61       	push   $0x61635f74
 910:	6c                   	insb   (%dx),%es:(%edi)
 911:	6c                   	insb   (%dx),%es:(%edi)
 912:	33 30                	xor    (%eax),%esi
	...

00000915 <ht_call30>:
CS550HTSYSCALL(ht_call30)
 915:	b8 0b 09 00 00       	mov    $0x90b,%eax
 91a:	cd 42                	int    $0x42
 91c:	c3                   	ret    

0000091d <str_ht_call31>:
 91d:	68 74 5f 63 61       	push   $0x61635f74
 922:	6c                   	insb   (%dx),%es:(%edi)
 923:	6c                   	insb   (%dx),%es:(%edi)
 924:	33 31                	xor    (%ecx),%esi
	...

00000927 <ht_call31>:
CS550HTSYSCALL(ht_call31)
 927:	b8 1d 09 00 00       	mov    $0x91d,%eax
 92c:	cd 42                	int    $0x42
 92e:	c3                   	ret    

0000092f <str_ht_call32>:
 92f:	68 74 5f 63 61       	push   $0x61635f74
 934:	6c                   	insb   (%dx),%es:(%edi)
 935:	6c                   	insb   (%dx),%es:(%edi)
 936:	33 32                	xor    (%edx),%esi
	...

00000939 <ht_call32>:
CS550HTSYSCALL(ht_call32)
 939:	b8 2f 09 00 00       	mov    $0x92f,%eax
 93e:	cd 42                	int    $0x42
 940:	c3                   	ret    

00000941 <str_ht_call33>:
 941:	68 74 5f 63 61       	push   $0x61635f74
 946:	6c                   	insb   (%dx),%es:(%edi)
 947:	6c                   	insb   (%dx),%es:(%edi)
 948:	33 33                	xor    (%ebx),%esi
	...

0000094b <ht_call33>:
CS550HTSYSCALL(ht_call33)
 94b:	b8 41 09 00 00       	mov    $0x941,%eax
 950:	cd 42                	int    $0x42
 952:	c3                   	ret    

00000953 <str_ht_call34>:
 953:	68 74 5f 63 61       	push   $0x61635f74
 958:	6c                   	insb   (%dx),%es:(%edi)
 959:	6c                   	insb   (%dx),%es:(%edi)
 95a:	33 34 00             	xor    (%eax,%eax,1),%esi

0000095d <ht_call34>:
CS550HTSYSCALL(ht_call34)
 95d:	b8 53 09 00 00       	mov    $0x953,%eax
 962:	cd 42                	int    $0x42
 964:	c3                   	ret    

00000965 <str_ht_call35>:
 965:	68 74 5f 63 61       	push   $0x61635f74
 96a:	6c                   	insb   (%dx),%es:(%edi)
 96b:	6c                   	insb   (%dx),%es:(%edi)
 96c:	33                   	.byte 0x33
 96d:	35                   	.byte 0x35
	...

0000096f <ht_call35>:
CS550HTSYSCALL(ht_call35)
 96f:	b8 65 09 00 00       	mov    $0x965,%eax
 974:	cd 42                	int    $0x42
 976:	c3                   	ret    

00000977 <str_ht_call36>:
 977:	68 74 5f 63 61       	push   $0x61635f74
 97c:	6c                   	insb   (%dx),%es:(%edi)
 97d:	6c                   	insb   (%dx),%es:(%edi)
 97e:	33 36                	xor    (%esi),%esi
	...

00000981 <ht_call36>:
CS550HTSYSCALL(ht_call36)
 981:	b8 77 09 00 00       	mov    $0x977,%eax
 986:	cd 42                	int    $0x42
 988:	c3                   	ret    

00000989 <str_ht_call37>:
 989:	68 74 5f 63 61       	push   $0x61635f74
 98e:	6c                   	insb   (%dx),%es:(%edi)
 98f:	6c                   	insb   (%dx),%es:(%edi)
 990:	33 37                	xor    (%edi),%esi
	...

00000993 <ht_call37>:
CS550HTSYSCALL(ht_call37)
 993:	b8 89 09 00 00       	mov    $0x989,%eax
 998:	cd 42                	int    $0x42
 99a:	c3                   	ret    

0000099b <str_ht_call38>:
 99b:	68 74 5f 63 61       	push   $0x61635f74
 9a0:	6c                   	insb   (%dx),%es:(%edi)
 9a1:	6c                   	insb   (%dx),%es:(%edi)
 9a2:	33 38                	xor    (%eax),%edi
	...

000009a5 <ht_call38>:
CS550HTSYSCALL(ht_call38)
 9a5:	b8 9b 09 00 00       	mov    $0x99b,%eax
 9aa:	cd 42                	int    $0x42
 9ac:	c3                   	ret    

000009ad <str_ht_call39>:
 9ad:	68 74 5f 63 61       	push   $0x61635f74
 9b2:	6c                   	insb   (%dx),%es:(%edi)
 9b3:	6c                   	insb   (%dx),%es:(%edi)
 9b4:	33 39                	xor    (%ecx),%edi
	...

000009b7 <ht_call39>:
CS550HTSYSCALL(ht_call39)
 9b7:	b8 ad 09 00 00       	mov    $0x9ad,%eax
 9bc:	cd 42                	int    $0x42
 9be:	c3                   	ret    

000009bf <str_ht_call40>:
 9bf:	68 74 5f 63 61       	push   $0x61635f74
 9c4:	6c                   	insb   (%dx),%es:(%edi)
 9c5:	6c                   	insb   (%dx),%es:(%edi)
 9c6:	34 30                	xor    $0x30,%al
	...

000009c9 <ht_call40>:
CS550HTSYSCALL(ht_call40)
 9c9:	b8 bf 09 00 00       	mov    $0x9bf,%eax
 9ce:	cd 42                	int    $0x42
 9d0:	c3                   	ret    

000009d1 <str_ht_call41>:
 9d1:	68 74 5f 63 61       	push   $0x61635f74
 9d6:	6c                   	insb   (%dx),%es:(%edi)
 9d7:	6c                   	insb   (%dx),%es:(%edi)
 9d8:	34 31                	xor    $0x31,%al
	...

000009db <ht_call41>:
CS550HTSYSCALL(ht_call41)
 9db:	b8 d1 09 00 00       	mov    $0x9d1,%eax
 9e0:	cd 42                	int    $0x42
 9e2:	c3                   	ret    

000009e3 <str_ht_call42>:
 9e3:	68 74 5f 63 61       	push   $0x61635f74
 9e8:	6c                   	insb   (%dx),%es:(%edi)
 9e9:	6c                   	insb   (%dx),%es:(%edi)
 9ea:	34 32                	xor    $0x32,%al
	...

000009ed <ht_call42>:
CS550HTSYSCALL(ht_call42)
 9ed:	b8 e3 09 00 00       	mov    $0x9e3,%eax
 9f2:	cd 42                	int    $0x42
 9f4:	c3                   	ret    

000009f5 <str_ht_call43>:
 9f5:	68 74 5f 63 61       	push   $0x61635f74
 9fa:	6c                   	insb   (%dx),%es:(%edi)
 9fb:	6c                   	insb   (%dx),%es:(%edi)
 9fc:	34 33                	xor    $0x33,%al
	...

000009ff <ht_call43>:
CS550HTSYSCALL(ht_call43)
 9ff:	b8 f5 09 00 00       	mov    $0x9f5,%eax
 a04:	cd 42                	int    $0x42
 a06:	c3                   	ret    

00000a07 <str_ht_call44>:
 a07:	68 74 5f 63 61       	push   $0x61635f74
 a0c:	6c                   	insb   (%dx),%es:(%edi)
 a0d:	6c                   	insb   (%dx),%es:(%edi)
 a0e:	34 34                	xor    $0x34,%al
	...

00000a11 <ht_call44>:
CS550HTSYSCALL(ht_call44)
 a11:	b8 07 0a 00 00       	mov    $0xa07,%eax
 a16:	cd 42                	int    $0x42
 a18:	c3                   	ret    

00000a19 <str_ht_call45>:
 a19:	68 74 5f 63 61       	push   $0x61635f74
 a1e:	6c                   	insb   (%dx),%es:(%edi)
 a1f:	6c                   	insb   (%dx),%es:(%edi)
 a20:	34 35                	xor    $0x35,%al
	...

00000a23 <ht_call45>:
CS550HTSYSCALL(ht_call45)
 a23:	b8 19 0a 00 00       	mov    $0xa19,%eax
 a28:	cd 42                	int    $0x42
 a2a:	c3                   	ret    

00000a2b <str_ht_call46>:
 a2b:	68 74 5f 63 61       	push   $0x61635f74
 a30:	6c                   	insb   (%dx),%es:(%edi)
 a31:	6c                   	insb   (%dx),%es:(%edi)
 a32:	34 36                	xor    $0x36,%al
	...

00000a35 <ht_call46>:
CS550HTSYSCALL(ht_call46)
 a35:	b8 2b 0a 00 00       	mov    $0xa2b,%eax
 a3a:	cd 42                	int    $0x42
 a3c:	c3                   	ret    

00000a3d <str_ht_call47>:
 a3d:	68 74 5f 63 61       	push   $0x61635f74
 a42:	6c                   	insb   (%dx),%es:(%edi)
 a43:	6c                   	insb   (%dx),%es:(%edi)
 a44:	34 37                	xor    $0x37,%al
	...

00000a47 <ht_call47>:
CS550HTSYSCALL(ht_call47)
 a47:	b8 3d 0a 00 00       	mov    $0xa3d,%eax
 a4c:	cd 42                	int    $0x42
 a4e:	c3                   	ret    

00000a4f <str_ht_call48>:
 a4f:	68 74 5f 63 61       	push   $0x61635f74
 a54:	6c                   	insb   (%dx),%es:(%edi)
 a55:	6c                   	insb   (%dx),%es:(%edi)
 a56:	34 38                	xor    $0x38,%al
	...

00000a59 <ht_call48>:
CS550HTSYSCALL(ht_call48)
 a59:	b8 4f 0a 00 00       	mov    $0xa4f,%eax
 a5e:	cd 42                	int    $0x42
 a60:	c3                   	ret    

00000a61 <str_ht_call49>:
 a61:	68 74 5f 63 61       	push   $0x61635f74
 a66:	6c                   	insb   (%dx),%es:(%edi)
 a67:	6c                   	insb   (%dx),%es:(%edi)
 a68:	34 39                	xor    $0x39,%al
	...

00000a6b <ht_call49>:
CS550HTSYSCALL(ht_call49)
 a6b:	b8 61 0a 00 00       	mov    $0xa61,%eax
 a70:	cd 42                	int    $0x42
 a72:	c3                   	ret    

00000a73 <str_ht_call50>:
 a73:	68 74 5f 63 61       	push   $0x61635f74
 a78:	6c                   	insb   (%dx),%es:(%edi)
 a79:	6c                   	insb   (%dx),%es:(%edi)
 a7a:	35                   	.byte 0x35
 a7b:	30 00                	xor    %al,(%eax)

00000a7d <ht_call50>:
CS550HTSYSCALL(ht_call50)
 a7d:	b8 73 0a 00 00       	mov    $0xa73,%eax
 a82:	cd 42                	int    $0x42
 a84:	c3                   	ret    

00000a85 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 a85:	55                   	push   %ebp
 a86:	89 e5                	mov    %esp,%ebp
 a88:	83 ec 18             	sub    $0x18,%esp
 a8b:	8b 45 0c             	mov    0xc(%ebp),%eax
 a8e:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 a91:	83 ec 04             	sub    $0x4,%esp
 a94:	6a 01                	push   $0x1
 a96:	8d 45 f4             	lea    -0xc(%ebp),%eax
 a99:	50                   	push   %eax
 a9a:	ff 75 08             	pushl  0x8(%ebp)
 a9d:	e8 65 f8 ff ff       	call   307 <write>
 aa2:	83 c4 10             	add    $0x10,%esp
}
 aa5:	90                   	nop
 aa6:	c9                   	leave  
 aa7:	c3                   	ret    

00000aa8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 aa8:	55                   	push   %ebp
 aa9:	89 e5                	mov    %esp,%ebp
 aab:	53                   	push   %ebx
 aac:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 aaf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 ab6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 aba:	74 17                	je     ad3 <printint+0x2b>
 abc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 ac0:	79 11                	jns    ad3 <printint+0x2b>
    neg = 1;
 ac2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 ac9:	8b 45 0c             	mov    0xc(%ebp),%eax
 acc:	f7 d8                	neg    %eax
 ace:	89 45 ec             	mov    %eax,-0x14(%ebp)
 ad1:	eb 06                	jmp    ad9 <printint+0x31>
  } else {
    x = xx;
 ad3:	8b 45 0c             	mov    0xc(%ebp),%eax
 ad6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 ad9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 ae0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 ae3:	8d 41 01             	lea    0x1(%ecx),%eax
 ae6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ae9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 aec:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aef:	ba 00 00 00 00       	mov    $0x0,%edx
 af4:	f7 f3                	div    %ebx
 af6:	89 d0                	mov    %edx,%eax
 af8:	0f b6 80 98 11 00 00 	movzbl 0x1198(%eax),%eax
 aff:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 b03:	8b 5d 10             	mov    0x10(%ebp),%ebx
 b06:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b09:	ba 00 00 00 00       	mov    $0x0,%edx
 b0e:	f7 f3                	div    %ebx
 b10:	89 45 ec             	mov    %eax,-0x14(%ebp)
 b13:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b17:	75 c7                	jne    ae0 <printint+0x38>
  if(neg)
 b19:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b1d:	74 2d                	je     b4c <printint+0xa4>
    buf[i++] = '-';
 b1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b22:	8d 50 01             	lea    0x1(%eax),%edx
 b25:	89 55 f4             	mov    %edx,-0xc(%ebp)
 b28:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 b2d:	eb 1d                	jmp    b4c <printint+0xa4>
    putc(fd, buf[i]);
 b2f:	8d 55 dc             	lea    -0x24(%ebp),%edx
 b32:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b35:	01 d0                	add    %edx,%eax
 b37:	0f b6 00             	movzbl (%eax),%eax
 b3a:	0f be c0             	movsbl %al,%eax
 b3d:	83 ec 08             	sub    $0x8,%esp
 b40:	50                   	push   %eax
 b41:	ff 75 08             	pushl  0x8(%ebp)
 b44:	e8 3c ff ff ff       	call   a85 <putc>
 b49:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 b4c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 b50:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b54:	79 d9                	jns    b2f <printint+0x87>
    putc(fd, buf[i]);
}
 b56:	90                   	nop
 b57:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b5a:	c9                   	leave  
 b5b:	c3                   	ret    

00000b5c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 b5c:	55                   	push   %ebp
 b5d:	89 e5                	mov    %esp,%ebp
 b5f:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 b62:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 b69:	8d 45 0c             	lea    0xc(%ebp),%eax
 b6c:	83 c0 04             	add    $0x4,%eax
 b6f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 b72:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 b79:	e9 59 01 00 00       	jmp    cd7 <printf+0x17b>
    c = fmt[i] & 0xff;
 b7e:	8b 55 0c             	mov    0xc(%ebp),%edx
 b81:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b84:	01 d0                	add    %edx,%eax
 b86:	0f b6 00             	movzbl (%eax),%eax
 b89:	0f be c0             	movsbl %al,%eax
 b8c:	25 ff 00 00 00       	and    $0xff,%eax
 b91:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 b94:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b98:	75 2c                	jne    bc6 <printf+0x6a>
      if(c == '%'){
 b9a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 b9e:	75 0c                	jne    bac <printf+0x50>
        state = '%';
 ba0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 ba7:	e9 27 01 00 00       	jmp    cd3 <printf+0x177>
      } else {
        putc(fd, c);
 bac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 baf:	0f be c0             	movsbl %al,%eax
 bb2:	83 ec 08             	sub    $0x8,%esp
 bb5:	50                   	push   %eax
 bb6:	ff 75 08             	pushl  0x8(%ebp)
 bb9:	e8 c7 fe ff ff       	call   a85 <putc>
 bbe:	83 c4 10             	add    $0x10,%esp
 bc1:	e9 0d 01 00 00       	jmp    cd3 <printf+0x177>
      }
    } else if(state == '%'){
 bc6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 bca:	0f 85 03 01 00 00    	jne    cd3 <printf+0x177>
      if(c == 'd'){
 bd0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 bd4:	75 1e                	jne    bf4 <printf+0x98>
        printint(fd, *ap, 10, 1);
 bd6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 bd9:	8b 00                	mov    (%eax),%eax
 bdb:	6a 01                	push   $0x1
 bdd:	6a 0a                	push   $0xa
 bdf:	50                   	push   %eax
 be0:	ff 75 08             	pushl  0x8(%ebp)
 be3:	e8 c0 fe ff ff       	call   aa8 <printint>
 be8:	83 c4 10             	add    $0x10,%esp
        ap++;
 beb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 bef:	e9 d8 00 00 00       	jmp    ccc <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 bf4:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 bf8:	74 06                	je     c00 <printf+0xa4>
 bfa:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 bfe:	75 1e                	jne    c1e <printf+0xc2>
        printint(fd, *ap, 16, 0);
 c00:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c03:	8b 00                	mov    (%eax),%eax
 c05:	6a 00                	push   $0x0
 c07:	6a 10                	push   $0x10
 c09:	50                   	push   %eax
 c0a:	ff 75 08             	pushl  0x8(%ebp)
 c0d:	e8 96 fe ff ff       	call   aa8 <printint>
 c12:	83 c4 10             	add    $0x10,%esp
        ap++;
 c15:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 c19:	e9 ae 00 00 00       	jmp    ccc <printf+0x170>
      } else if(c == 's'){
 c1e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 c22:	75 43                	jne    c67 <printf+0x10b>
        s = (char*)*ap;
 c24:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c27:	8b 00                	mov    (%eax),%eax
 c29:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 c2c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 c30:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c34:	75 25                	jne    c5b <printf+0xff>
          s = "(null)";
 c36:	c7 45 f4 45 0f 00 00 	movl   $0xf45,-0xc(%ebp)
        while(*s != 0){
 c3d:	eb 1c                	jmp    c5b <printf+0xff>
          putc(fd, *s);
 c3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c42:	0f b6 00             	movzbl (%eax),%eax
 c45:	0f be c0             	movsbl %al,%eax
 c48:	83 ec 08             	sub    $0x8,%esp
 c4b:	50                   	push   %eax
 c4c:	ff 75 08             	pushl  0x8(%ebp)
 c4f:	e8 31 fe ff ff       	call   a85 <putc>
 c54:	83 c4 10             	add    $0x10,%esp
          s++;
 c57:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 c5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c5e:	0f b6 00             	movzbl (%eax),%eax
 c61:	84 c0                	test   %al,%al
 c63:	75 da                	jne    c3f <printf+0xe3>
 c65:	eb 65                	jmp    ccc <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 c67:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 c6b:	75 1d                	jne    c8a <printf+0x12e>
        putc(fd, *ap);
 c6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c70:	8b 00                	mov    (%eax),%eax
 c72:	0f be c0             	movsbl %al,%eax
 c75:	83 ec 08             	sub    $0x8,%esp
 c78:	50                   	push   %eax
 c79:	ff 75 08             	pushl  0x8(%ebp)
 c7c:	e8 04 fe ff ff       	call   a85 <putc>
 c81:	83 c4 10             	add    $0x10,%esp
        ap++;
 c84:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 c88:	eb 42                	jmp    ccc <printf+0x170>
      } else if(c == '%'){
 c8a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 c8e:	75 17                	jne    ca7 <printf+0x14b>
        putc(fd, c);
 c90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c93:	0f be c0             	movsbl %al,%eax
 c96:	83 ec 08             	sub    $0x8,%esp
 c99:	50                   	push   %eax
 c9a:	ff 75 08             	pushl  0x8(%ebp)
 c9d:	e8 e3 fd ff ff       	call   a85 <putc>
 ca2:	83 c4 10             	add    $0x10,%esp
 ca5:	eb 25                	jmp    ccc <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 ca7:	83 ec 08             	sub    $0x8,%esp
 caa:	6a 25                	push   $0x25
 cac:	ff 75 08             	pushl  0x8(%ebp)
 caf:	e8 d1 fd ff ff       	call   a85 <putc>
 cb4:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 cb7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 cba:	0f be c0             	movsbl %al,%eax
 cbd:	83 ec 08             	sub    $0x8,%esp
 cc0:	50                   	push   %eax
 cc1:	ff 75 08             	pushl  0x8(%ebp)
 cc4:	e8 bc fd ff ff       	call   a85 <putc>
 cc9:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 ccc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 cd3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 cd7:	8b 55 0c             	mov    0xc(%ebp),%edx
 cda:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cdd:	01 d0                	add    %edx,%eax
 cdf:	0f b6 00             	movzbl (%eax),%eax
 ce2:	84 c0                	test   %al,%al
 ce4:	0f 85 94 fe ff ff    	jne    b7e <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 cea:	90                   	nop
 ceb:	c9                   	leave  
 cec:	c3                   	ret    

00000ced <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ced:	55                   	push   %ebp
 cee:	89 e5                	mov    %esp,%ebp
 cf0:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 cf3:	8b 45 08             	mov    0x8(%ebp),%eax
 cf6:	83 e8 08             	sub    $0x8,%eax
 cf9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cfc:	a1 b4 11 00 00       	mov    0x11b4,%eax
 d01:	89 45 fc             	mov    %eax,-0x4(%ebp)
 d04:	eb 24                	jmp    d2a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 d06:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d09:	8b 00                	mov    (%eax),%eax
 d0b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 d0e:	77 12                	ja     d22 <free+0x35>
 d10:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d13:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 d16:	77 24                	ja     d3c <free+0x4f>
 d18:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d1b:	8b 00                	mov    (%eax),%eax
 d1d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d20:	77 1a                	ja     d3c <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d22:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d25:	8b 00                	mov    (%eax),%eax
 d27:	89 45 fc             	mov    %eax,-0x4(%ebp)
 d2a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d2d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 d30:	76 d4                	jbe    d06 <free+0x19>
 d32:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d35:	8b 00                	mov    (%eax),%eax
 d37:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d3a:	76 ca                	jbe    d06 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 d3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d3f:	8b 40 04             	mov    0x4(%eax),%eax
 d42:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 d49:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d4c:	01 c2                	add    %eax,%edx
 d4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d51:	8b 00                	mov    (%eax),%eax
 d53:	39 c2                	cmp    %eax,%edx
 d55:	75 24                	jne    d7b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 d57:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d5a:	8b 50 04             	mov    0x4(%eax),%edx
 d5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d60:	8b 00                	mov    (%eax),%eax
 d62:	8b 40 04             	mov    0x4(%eax),%eax
 d65:	01 c2                	add    %eax,%edx
 d67:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d6a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 d6d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d70:	8b 00                	mov    (%eax),%eax
 d72:	8b 10                	mov    (%eax),%edx
 d74:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d77:	89 10                	mov    %edx,(%eax)
 d79:	eb 0a                	jmp    d85 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 d7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d7e:	8b 10                	mov    (%eax),%edx
 d80:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d83:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 d85:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d88:	8b 40 04             	mov    0x4(%eax),%eax
 d8b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 d92:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d95:	01 d0                	add    %edx,%eax
 d97:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d9a:	75 20                	jne    dbc <free+0xcf>
    p->s.size += bp->s.size;
 d9c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d9f:	8b 50 04             	mov    0x4(%eax),%edx
 da2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 da5:	8b 40 04             	mov    0x4(%eax),%eax
 da8:	01 c2                	add    %eax,%edx
 daa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 dad:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 db0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 db3:	8b 10                	mov    (%eax),%edx
 db5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 db8:	89 10                	mov    %edx,(%eax)
 dba:	eb 08                	jmp    dc4 <free+0xd7>
  } else
    p->s.ptr = bp;
 dbc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 dbf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 dc2:	89 10                	mov    %edx,(%eax)
  freep = p;
 dc4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 dc7:	a3 b4 11 00 00       	mov    %eax,0x11b4
}
 dcc:	90                   	nop
 dcd:	c9                   	leave  
 dce:	c3                   	ret    

00000dcf <morecore>:

static Header*
morecore(uint nu)
{
 dcf:	55                   	push   %ebp
 dd0:	89 e5                	mov    %esp,%ebp
 dd2:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 dd5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 ddc:	77 07                	ja     de5 <morecore+0x16>
    nu = 4096;
 dde:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 de5:	8b 45 08             	mov    0x8(%ebp),%eax
 de8:	c1 e0 03             	shl    $0x3,%eax
 deb:	83 ec 0c             	sub    $0xc,%esp
 dee:	50                   	push   %eax
 def:	e8 7b f5 ff ff       	call   36f <sbrk>
 df4:	83 c4 10             	add    $0x10,%esp
 df7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 dfa:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 dfe:	75 07                	jne    e07 <morecore+0x38>
    return 0;
 e00:	b8 00 00 00 00       	mov    $0x0,%eax
 e05:	eb 26                	jmp    e2d <morecore+0x5e>
  hp = (Header*)p;
 e07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 e0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e10:	8b 55 08             	mov    0x8(%ebp),%edx
 e13:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 e16:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e19:	83 c0 08             	add    $0x8,%eax
 e1c:	83 ec 0c             	sub    $0xc,%esp
 e1f:	50                   	push   %eax
 e20:	e8 c8 fe ff ff       	call   ced <free>
 e25:	83 c4 10             	add    $0x10,%esp
  return freep;
 e28:	a1 b4 11 00 00       	mov    0x11b4,%eax
}
 e2d:	c9                   	leave  
 e2e:	c3                   	ret    

00000e2f <malloc>:

void*
malloc(uint nbytes)
{
 e2f:	55                   	push   %ebp
 e30:	89 e5                	mov    %esp,%ebp
 e32:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 e35:	8b 45 08             	mov    0x8(%ebp),%eax
 e38:	83 c0 07             	add    $0x7,%eax
 e3b:	c1 e8 03             	shr    $0x3,%eax
 e3e:	83 c0 01             	add    $0x1,%eax
 e41:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 e44:	a1 b4 11 00 00       	mov    0x11b4,%eax
 e49:	89 45 f0             	mov    %eax,-0x10(%ebp)
 e4c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 e50:	75 23                	jne    e75 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 e52:	c7 45 f0 ac 11 00 00 	movl   $0x11ac,-0x10(%ebp)
 e59:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e5c:	a3 b4 11 00 00       	mov    %eax,0x11b4
 e61:	a1 b4 11 00 00       	mov    0x11b4,%eax
 e66:	a3 ac 11 00 00       	mov    %eax,0x11ac
    base.s.size = 0;
 e6b:	c7 05 b0 11 00 00 00 	movl   $0x0,0x11b0
 e72:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e75:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e78:	8b 00                	mov    (%eax),%eax
 e7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 e7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e80:	8b 40 04             	mov    0x4(%eax),%eax
 e83:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 e86:	72 4d                	jb     ed5 <malloc+0xa6>
      if(p->s.size == nunits)
 e88:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e8b:	8b 40 04             	mov    0x4(%eax),%eax
 e8e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 e91:	75 0c                	jne    e9f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 e93:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e96:	8b 10                	mov    (%eax),%edx
 e98:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e9b:	89 10                	mov    %edx,(%eax)
 e9d:	eb 26                	jmp    ec5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 e9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ea2:	8b 40 04             	mov    0x4(%eax),%eax
 ea5:	2b 45 ec             	sub    -0x14(%ebp),%eax
 ea8:	89 c2                	mov    %eax,%edx
 eaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ead:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 eb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 eb3:	8b 40 04             	mov    0x4(%eax),%eax
 eb6:	c1 e0 03             	shl    $0x3,%eax
 eb9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 ebc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ebf:	8b 55 ec             	mov    -0x14(%ebp),%edx
 ec2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ec5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ec8:	a3 b4 11 00 00       	mov    %eax,0x11b4
      return (void*)(p + 1);
 ecd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ed0:	83 c0 08             	add    $0x8,%eax
 ed3:	eb 3b                	jmp    f10 <malloc+0xe1>
    }
    if(p == freep)
 ed5:	a1 b4 11 00 00       	mov    0x11b4,%eax
 eda:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 edd:	75 1e                	jne    efd <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 edf:	83 ec 0c             	sub    $0xc,%esp
 ee2:	ff 75 ec             	pushl  -0x14(%ebp)
 ee5:	e8 e5 fe ff ff       	call   dcf <morecore>
 eea:	83 c4 10             	add    $0x10,%esp
 eed:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ef0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ef4:	75 07                	jne    efd <malloc+0xce>
        return 0;
 ef6:	b8 00 00 00 00       	mov    $0x0,%eax
 efb:	eb 13                	jmp    f10 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 efd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f00:	89 45 f0             	mov    %eax,-0x10(%ebp)
 f03:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f06:	8b 00                	mov    (%eax),%eax
 f08:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 f0b:	e9 6d ff ff ff       	jmp    e7d <malloc+0x4e>
}
 f10:	c9                   	leave  
 f11:	c3                   	ret    
