
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
  write(fd, s, strlen(s));
   6:	83 ec 0c             	sub    $0xc,%esp
   9:	ff 75 0c             	pushl  0xc(%ebp)
   c:	e8 97 01 00 00       	call   1a8 <strlen>
  11:	83 c4 10             	add    $0x10,%esp
  14:	83 ec 04             	sub    $0x4,%esp
  17:	50                   	push   %eax
  18:	ff 75 0c             	pushl  0xc(%ebp)
  1b:	ff 75 08             	pushl  0x8(%ebp)
  1e:	e8 67 03 00 00       	call   38a <write>
  23:	83 c4 10             	add    $0x10,%esp
}
  26:	90                   	nop
  27:	c9                   	leave  
  28:	c3                   	ret    

00000029 <forktest>:

void
forktest(void)
{
  29:	55                   	push   %ebp
  2a:	89 e5                	mov    %esp,%ebp
  2c:	83 ec 18             	sub    $0x18,%esp
  int n, pid;

  printf(1, "fork test\n");
  2f:	83 ec 08             	sub    $0x8,%esp
  32:	68 08 0b 00 00       	push   $0xb08
  37:	6a 01                	push   $0x1
  39:	e8 c2 ff ff ff       	call   0 <printf>
  3e:	83 c4 10             	add    $0x10,%esp

  for(n=0; n<N; n++){
  41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  48:	eb 1d                	jmp    67 <forktest+0x3e>
    pid = fork();
  4a:	e8 13 03 00 00       	call   362 <fork>
  4f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
  52:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  56:	78 1a                	js     72 <forktest+0x49>
      break;
    if(pid == 0)
  58:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  5c:	75 05                	jne    63 <forktest+0x3a>
      exit();
  5e:	e8 07 03 00 00       	call   36a <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  63:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  67:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  6e:	7e da                	jle    4a <forktest+0x21>
  70:	eb 01                	jmp    73 <forktest+0x4a>
    pid = fork();
    if(pid < 0)
      break;
  72:	90                   	nop
    if(pid == 0)
      exit();
  }
  
  if(n == N){
  73:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
  7a:	75 40                	jne    bc <forktest+0x93>
    printf(1, "fork claimed to work N times!\n", N);
  7c:	83 ec 04             	sub    $0x4,%esp
  7f:	68 e8 03 00 00       	push   $0x3e8
  84:	68 14 0b 00 00       	push   $0xb14
  89:	6a 01                	push   $0x1
  8b:	e8 70 ff ff ff       	call   0 <printf>
  90:	83 c4 10             	add    $0x10,%esp
    exit();
  93:	e8 d2 02 00 00       	call   36a <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
  98:	e8 d5 02 00 00       	call   372 <wait>
  9d:	85 c0                	test   %eax,%eax
  9f:	79 17                	jns    b8 <forktest+0x8f>
      printf(1, "wait stopped early\n");
  a1:	83 ec 08             	sub    $0x8,%esp
  a4:	68 33 0b 00 00       	push   $0xb33
  a9:	6a 01                	push   $0x1
  ab:	e8 50 ff ff ff       	call   0 <printf>
  b0:	83 c4 10             	add    $0x10,%esp
      exit();
  b3:	e8 b2 02 00 00       	call   36a <exit>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }
  
  for(; n > 0; n--){
  b8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  c0:	7f d6                	jg     98 <forktest+0x6f>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
  c2:	e8 ab 02 00 00       	call   372 <wait>
  c7:	83 f8 ff             	cmp    $0xffffffff,%eax
  ca:	74 17                	je     e3 <forktest+0xba>
    printf(1, "wait got too many\n");
  cc:	83 ec 08             	sub    $0x8,%esp
  cf:	68 47 0b 00 00       	push   $0xb47
  d4:	6a 01                	push   $0x1
  d6:	e8 25 ff ff ff       	call   0 <printf>
  db:	83 c4 10             	add    $0x10,%esp
    exit();
  de:	e8 87 02 00 00       	call   36a <exit>
  }
  
  printf(1, "fork test OK\n");
  e3:	83 ec 08             	sub    $0x8,%esp
  e6:	68 5a 0b 00 00       	push   $0xb5a
  eb:	6a 01                	push   $0x1
  ed:	e8 0e ff ff ff       	call   0 <printf>
  f2:	83 c4 10             	add    $0x10,%esp
}
  f5:	90                   	nop
  f6:	c9                   	leave  
  f7:	c3                   	ret    

000000f8 <main>:

int
main(void)
{
  f8:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  fc:	83 e4 f0             	and    $0xfffffff0,%esp
  ff:	ff 71 fc             	pushl  -0x4(%ecx)
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	51                   	push   %ecx
 106:	83 ec 04             	sub    $0x4,%esp
  forktest();
 109:	e8 1b ff ff ff       	call   29 <forktest>
  exit();
 10e:	e8 57 02 00 00       	call   36a <exit>

00000113 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	57                   	push   %edi
 117:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 118:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11b:	8b 55 10             	mov    0x10(%ebp),%edx
 11e:	8b 45 0c             	mov    0xc(%ebp),%eax
 121:	89 cb                	mov    %ecx,%ebx
 123:	89 df                	mov    %ebx,%edi
 125:	89 d1                	mov    %edx,%ecx
 127:	fc                   	cld    
 128:	f3 aa                	rep stos %al,%es:(%edi)
 12a:	89 ca                	mov    %ecx,%edx
 12c:	89 fb                	mov    %edi,%ebx
 12e:	89 5d 08             	mov    %ebx,0x8(%ebp)
 131:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 134:	90                   	nop
 135:	5b                   	pop    %ebx
 136:	5f                   	pop    %edi
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    

00000139 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 139:	55                   	push   %ebp
 13a:	89 e5                	mov    %esp,%ebp
 13c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13f:	8b 45 08             	mov    0x8(%ebp),%eax
 142:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 145:	90                   	nop
 146:	8b 45 08             	mov    0x8(%ebp),%eax
 149:	8d 50 01             	lea    0x1(%eax),%edx
 14c:	89 55 08             	mov    %edx,0x8(%ebp)
 14f:	8b 55 0c             	mov    0xc(%ebp),%edx
 152:	8d 4a 01             	lea    0x1(%edx),%ecx
 155:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 158:	0f b6 12             	movzbl (%edx),%edx
 15b:	88 10                	mov    %dl,(%eax)
 15d:	0f b6 00             	movzbl (%eax),%eax
 160:	84 c0                	test   %al,%al
 162:	75 e2                	jne    146 <strcpy+0xd>
    ;
  return os;
 164:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 167:	c9                   	leave  
 168:	c3                   	ret    

00000169 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 16c:	eb 08                	jmp    176 <strcmp+0xd>
    p++, q++;
 16e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 172:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 176:	8b 45 08             	mov    0x8(%ebp),%eax
 179:	0f b6 00             	movzbl (%eax),%eax
 17c:	84 c0                	test   %al,%al
 17e:	74 10                	je     190 <strcmp+0x27>
 180:	8b 45 08             	mov    0x8(%ebp),%eax
 183:	0f b6 10             	movzbl (%eax),%edx
 186:	8b 45 0c             	mov    0xc(%ebp),%eax
 189:	0f b6 00             	movzbl (%eax),%eax
 18c:	38 c2                	cmp    %al,%dl
 18e:	74 de                	je     16e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	0f b6 d0             	movzbl %al,%edx
 199:	8b 45 0c             	mov    0xc(%ebp),%eax
 19c:	0f b6 00             	movzbl (%eax),%eax
 19f:	0f b6 c0             	movzbl %al,%eax
 1a2:	29 c2                	sub    %eax,%edx
 1a4:	89 d0                	mov    %edx,%eax
}
 1a6:	5d                   	pop    %ebp
 1a7:	c3                   	ret    

000001a8 <strlen>:

uint
strlen(char *s)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
 1ab:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1ae:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b5:	eb 04                	jmp    1bb <strlen+0x13>
 1b7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1bb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	01 d0                	add    %edx,%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	84 c0                	test   %al,%al
 1c8:	75 ed                	jne    1b7 <strlen+0xf>
    ;
  return n;
 1ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1cd:	c9                   	leave  
 1ce:	c3                   	ret    

000001cf <memset>:

void*
memset(void *dst, int c, uint n)
{
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1d2:	8b 45 10             	mov    0x10(%ebp),%eax
 1d5:	50                   	push   %eax
 1d6:	ff 75 0c             	pushl  0xc(%ebp)
 1d9:	ff 75 08             	pushl  0x8(%ebp)
 1dc:	e8 32 ff ff ff       	call   113 <stosb>
 1e1:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1e7:	c9                   	leave  
 1e8:	c3                   	ret    

000001e9 <strchr>:

char*
strchr(const char *s, char c)
{
 1e9:	55                   	push   %ebp
 1ea:	89 e5                	mov    %esp,%ebp
 1ec:	83 ec 04             	sub    $0x4,%esp
 1ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f2:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1f5:	eb 14                	jmp    20b <strchr+0x22>
    if(*s == c)
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
 1fa:	0f b6 00             	movzbl (%eax),%eax
 1fd:	3a 45 fc             	cmp    -0x4(%ebp),%al
 200:	75 05                	jne    207 <strchr+0x1e>
      return (char*)s;
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	eb 13                	jmp    21a <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 207:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	0f b6 00             	movzbl (%eax),%eax
 211:	84 c0                	test   %al,%al
 213:	75 e2                	jne    1f7 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 215:	b8 00 00 00 00       	mov    $0x0,%eax
}
 21a:	c9                   	leave  
 21b:	c3                   	ret    

0000021c <gets>:

char*
gets(char *buf, int max)
{
 21c:	55                   	push   %ebp
 21d:	89 e5                	mov    %esp,%ebp
 21f:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 222:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 229:	eb 42                	jmp    26d <gets+0x51>
    cc = read(0, &c, 1);
 22b:	83 ec 04             	sub    $0x4,%esp
 22e:	6a 01                	push   $0x1
 230:	8d 45 ef             	lea    -0x11(%ebp),%eax
 233:	50                   	push   %eax
 234:	6a 00                	push   $0x0
 236:	e8 47 01 00 00       	call   382 <read>
 23b:	83 c4 10             	add    $0x10,%esp
 23e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 241:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 245:	7e 33                	jle    27a <gets+0x5e>
      break;
    buf[i++] = c;
 247:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 250:	89 c2                	mov    %eax,%edx
 252:	8b 45 08             	mov    0x8(%ebp),%eax
 255:	01 c2                	add    %eax,%edx
 257:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 25b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 25d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 261:	3c 0a                	cmp    $0xa,%al
 263:	74 16                	je     27b <gets+0x5f>
 265:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 269:	3c 0d                	cmp    $0xd,%al
 26b:	74 0e                	je     27b <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 26d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 270:	83 c0 01             	add    $0x1,%eax
 273:	3b 45 0c             	cmp    0xc(%ebp),%eax
 276:	7c b3                	jl     22b <gets+0xf>
 278:	eb 01                	jmp    27b <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 27a:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 27b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
 281:	01 d0                	add    %edx,%eax
 283:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 286:	8b 45 08             	mov    0x8(%ebp),%eax
}
 289:	c9                   	leave  
 28a:	c3                   	ret    

0000028b <stat>:

int
stat(char *n, struct stat *st)
{
 28b:	55                   	push   %ebp
 28c:	89 e5                	mov    %esp,%ebp
 28e:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 291:	83 ec 08             	sub    $0x8,%esp
 294:	6a 00                	push   $0x0
 296:	ff 75 08             	pushl  0x8(%ebp)
 299:	e8 0c 01 00 00       	call   3aa <open>
 29e:	83 c4 10             	add    $0x10,%esp
 2a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2a8:	79 07                	jns    2b1 <stat+0x26>
    return -1;
 2aa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2af:	eb 25                	jmp    2d6 <stat+0x4b>
  r = fstat(fd, st);
 2b1:	83 ec 08             	sub    $0x8,%esp
 2b4:	ff 75 0c             	pushl  0xc(%ebp)
 2b7:	ff 75 f4             	pushl  -0xc(%ebp)
 2ba:	e8 03 01 00 00       	call   3c2 <fstat>
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2c5:	83 ec 0c             	sub    $0xc,%esp
 2c8:	ff 75 f4             	pushl  -0xc(%ebp)
 2cb:	e8 c2 00 00 00       	call   392 <close>
 2d0:	83 c4 10             	add    $0x10,%esp
  return r;
 2d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2d6:	c9                   	leave  
 2d7:	c3                   	ret    

000002d8 <atoi>:

int
atoi(const char *s)
{
 2d8:	55                   	push   %ebp
 2d9:	89 e5                	mov    %esp,%ebp
 2db:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2de:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2e5:	eb 25                	jmp    30c <atoi+0x34>
    n = n*10 + *s++ - '0';
 2e7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2ea:	89 d0                	mov    %edx,%eax
 2ec:	c1 e0 02             	shl    $0x2,%eax
 2ef:	01 d0                	add    %edx,%eax
 2f1:	01 c0                	add    %eax,%eax
 2f3:	89 c1                	mov    %eax,%ecx
 2f5:	8b 45 08             	mov    0x8(%ebp),%eax
 2f8:	8d 50 01             	lea    0x1(%eax),%edx
 2fb:	89 55 08             	mov    %edx,0x8(%ebp)
 2fe:	0f b6 00             	movzbl (%eax),%eax
 301:	0f be c0             	movsbl %al,%eax
 304:	01 c8                	add    %ecx,%eax
 306:	83 e8 30             	sub    $0x30,%eax
 309:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 30c:	8b 45 08             	mov    0x8(%ebp),%eax
 30f:	0f b6 00             	movzbl (%eax),%eax
 312:	3c 2f                	cmp    $0x2f,%al
 314:	7e 0a                	jle    320 <atoi+0x48>
 316:	8b 45 08             	mov    0x8(%ebp),%eax
 319:	0f b6 00             	movzbl (%eax),%eax
 31c:	3c 39                	cmp    $0x39,%al
 31e:	7e c7                	jle    2e7 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 320:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 323:	c9                   	leave  
 324:	c3                   	ret    

00000325 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 325:	55                   	push   %ebp
 326:	89 e5                	mov    %esp,%ebp
 328:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 331:	8b 45 0c             	mov    0xc(%ebp),%eax
 334:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 337:	eb 17                	jmp    350 <memmove+0x2b>
    *dst++ = *src++;
 339:	8b 45 fc             	mov    -0x4(%ebp),%eax
 33c:	8d 50 01             	lea    0x1(%eax),%edx
 33f:	89 55 fc             	mov    %edx,-0x4(%ebp)
 342:	8b 55 f8             	mov    -0x8(%ebp),%edx
 345:	8d 4a 01             	lea    0x1(%edx),%ecx
 348:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 34b:	0f b6 12             	movzbl (%edx),%edx
 34e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 350:	8b 45 10             	mov    0x10(%ebp),%eax
 353:	8d 50 ff             	lea    -0x1(%eax),%edx
 356:	89 55 10             	mov    %edx,0x10(%ebp)
 359:	85 c0                	test   %eax,%eax
 35b:	7f dc                	jg     339 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 35d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 360:	c9                   	leave  
 361:	c3                   	ret    

00000362 <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
 362:	b8 01 00 00 00       	mov    $0x1,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <exit>:
SYSCALL(exit)
 36a:	b8 02 00 00 00       	mov    $0x2,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <wait>:
SYSCALL(wait)
 372:	b8 03 00 00 00       	mov    $0x3,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <pipe>:
SYSCALL(pipe)
 37a:	b8 04 00 00 00       	mov    $0x4,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <read>:
SYSCALL(read)
 382:	b8 05 00 00 00       	mov    $0x5,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <write>:
SYSCALL(write)
 38a:	b8 10 00 00 00       	mov    $0x10,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <close>:
SYSCALL(close)
 392:	b8 15 00 00 00       	mov    $0x15,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <kill>:
SYSCALL(kill)
 39a:	b8 06 00 00 00       	mov    $0x6,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <exec>:
SYSCALL(exec)
 3a2:	b8 07 00 00 00       	mov    $0x7,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <open>:
SYSCALL(open)
 3aa:	b8 0f 00 00 00       	mov    $0xf,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <mknod>:
SYSCALL(mknod)
 3b2:	b8 11 00 00 00       	mov    $0x11,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <unlink>:
SYSCALL(unlink)
 3ba:	b8 12 00 00 00       	mov    $0x12,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <fstat>:
SYSCALL(fstat)
 3c2:	b8 08 00 00 00       	mov    $0x8,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <link>:
SYSCALL(link)
 3ca:	b8 13 00 00 00       	mov    $0x13,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <mkdir>:
SYSCALL(mkdir)
 3d2:	b8 14 00 00 00       	mov    $0x14,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <chdir>:
SYSCALL(chdir)
 3da:	b8 09 00 00 00       	mov    $0x9,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <dup>:
SYSCALL(dup)
 3e2:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <getpid>:
SYSCALL(getpid)
 3ea:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <sbrk>:
SYSCALL(sbrk)
 3f2:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <sleep>:
SYSCALL(sleep)
 3fa:	b8 0d 00 00 00       	mov    $0xd,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <uptime>:
SYSCALL(uptime)
 402:	b8 0e 00 00 00       	mov    $0xe,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <date>:

// Assignment starts here

SYSCALL(date)
 40a:	b8 16 00 00 00       	mov    $0x16,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <str_ls_call1>:
 412:	6c                   	insb   (%dx),%es:(%edi)
 413:	73 5f                	jae    474 <ls_call6+0x4>
 415:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 418:	6c                   	insb   (%dx),%es:(%edi)
 419:	31 00                	xor    %eax,(%eax)

0000041b <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
 41b:	b8 12 04 00 00       	mov    $0x412,%eax
 420:	cd 41                	int    $0x41
 422:	c3                   	ret    

00000423 <str_ls_call2>:
 423:	6c                   	insb   (%dx),%es:(%edi)
 424:	73 5f                	jae    485 <ls_call7+0x4>
 426:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 429:	6c                   	insb   (%dx),%es:(%edi)
 42a:	32 00                	xor    (%eax),%al

0000042c <ls_call2>:
CS550LSSYSCALL(ls_call2)
 42c:	b8 23 04 00 00       	mov    $0x423,%eax
 431:	cd 41                	int    $0x41
 433:	c3                   	ret    

00000434 <str_ls_call3>:
 434:	6c                   	insb   (%dx),%es:(%edi)
 435:	73 5f                	jae    496 <ls_call8+0x4>
 437:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 43a:	6c                   	insb   (%dx),%es:(%edi)
 43b:	33 00                	xor    (%eax),%eax

0000043d <ls_call3>:
CS550LSSYSCALL(ls_call3)
 43d:	b8 34 04 00 00       	mov    $0x434,%eax
 442:	cd 41                	int    $0x41
 444:	c3                   	ret    

00000445 <str_ls_call4>:
 445:	6c                   	insb   (%dx),%es:(%edi)
 446:	73 5f                	jae    4a7 <ls_call9+0x4>
 448:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 44b:	6c                   	insb   (%dx),%es:(%edi)
 44c:	34 00                	xor    $0x0,%al

0000044e <ls_call4>:
CS550LSSYSCALL(ls_call4)
 44e:	b8 45 04 00 00       	mov    $0x445,%eax
 453:	cd 41                	int    $0x41
 455:	c3                   	ret    

00000456 <str_ls_call5>:
 456:	6c                   	insb   (%dx),%es:(%edi)
 457:	73 5f                	jae    4b8 <ls_call10+0x3>
 459:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 45c:	6c                   	insb   (%dx),%es:(%edi)
 45d:	35                   	.byte 0x35
	...

0000045f <ls_call5>:
CS550LSSYSCALL(ls_call5)
 45f:	b8 56 04 00 00       	mov    $0x456,%eax
 464:	cd 41                	int    $0x41
 466:	c3                   	ret    

00000467 <str_ls_call6>:
 467:	6c                   	insb   (%dx),%es:(%edi)
 468:	73 5f                	jae    4c9 <ls_call11+0x2>
 46a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 46d:	6c                   	insb   (%dx),%es:(%edi)
 46e:	36                   	ss
	...

00000470 <ls_call6>:
CS550LSSYSCALL(ls_call6)
 470:	b8 67 04 00 00       	mov    $0x467,%eax
 475:	cd 41                	int    $0x41
 477:	c3                   	ret    

00000478 <str_ls_call7>:
 478:	6c                   	insb   (%dx),%es:(%edi)
 479:	73 5f                	jae    4da <ls_call12+0x1>
 47b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 47e:	6c                   	insb   (%dx),%es:(%edi)
 47f:	37                   	aaa    
	...

00000481 <ls_call7>:
CS550LSSYSCALL(ls_call7)
 481:	b8 78 04 00 00       	mov    $0x478,%eax
 486:	cd 41                	int    $0x41
 488:	c3                   	ret    

00000489 <str_ls_call8>:
 489:	6c                   	insb   (%dx),%es:(%edi)
 48a:	73 5f                	jae    4eb <ls_call13>
 48c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 48f:	6c                   	insb   (%dx),%es:(%edi)
 490:	38 00                	cmp    %al,(%eax)

00000492 <ls_call8>:
CS550LSSYSCALL(ls_call8)
 492:	b8 89 04 00 00       	mov    $0x489,%eax
 497:	cd 41                	int    $0x41
 499:	c3                   	ret    

0000049a <str_ls_call9>:
 49a:	6c                   	insb   (%dx),%es:(%edi)
 49b:	73 5f                	jae    4fc <str_ls_call14+0x9>
 49d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4a0:	6c                   	insb   (%dx),%es:(%edi)
 4a1:	39 00                	cmp    %eax,(%eax)

000004a3 <ls_call9>:
CS550LSSYSCALL(ls_call9)
 4a3:	b8 9a 04 00 00       	mov    $0x49a,%eax
 4a8:	cd 41                	int    $0x41
 4aa:	c3                   	ret    

000004ab <str_ls_call10>:
 4ab:	6c                   	insb   (%dx),%es:(%edi)
 4ac:	73 5f                	jae    50d <str_ls_call15+0x8>
 4ae:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4b1:	6c                   	insb   (%dx),%es:(%edi)
 4b2:	31 30                	xor    %esi,(%eax)
	...

000004b5 <ls_call10>:
CS550LSSYSCALL(ls_call10)
 4b5:	b8 ab 04 00 00       	mov    $0x4ab,%eax
 4ba:	cd 41                	int    $0x41
 4bc:	c3                   	ret    

000004bd <str_ls_call11>:
 4bd:	6c                   	insb   (%dx),%es:(%edi)
 4be:	73 5f                	jae    51f <str_ls_call16+0x8>
 4c0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4c3:	6c                   	insb   (%dx),%es:(%edi)
 4c4:	31 31                	xor    %esi,(%ecx)
	...

000004c7 <ls_call11>:
CS550LSSYSCALL(ls_call11)
 4c7:	b8 bd 04 00 00       	mov    $0x4bd,%eax
 4cc:	cd 41                	int    $0x41
 4ce:	c3                   	ret    

000004cf <str_ls_call12>:
 4cf:	6c                   	insb   (%dx),%es:(%edi)
 4d0:	73 5f                	jae    531 <str_ls_call17+0x8>
 4d2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4d5:	6c                   	insb   (%dx),%es:(%edi)
 4d6:	31 32                	xor    %esi,(%edx)
	...

000004d9 <ls_call12>:
CS550LSSYSCALL(ls_call12)
 4d9:	b8 cf 04 00 00       	mov    $0x4cf,%eax
 4de:	cd 41                	int    $0x41
 4e0:	c3                   	ret    

000004e1 <str_ls_call13>:
 4e1:	6c                   	insb   (%dx),%es:(%edi)
 4e2:	73 5f                	jae    543 <str_ls_call18+0x8>
 4e4:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4e7:	6c                   	insb   (%dx),%es:(%edi)
 4e8:	31 33                	xor    %esi,(%ebx)
	...

000004eb <ls_call13>:
CS550LSSYSCALL(ls_call13)
 4eb:	b8 e1 04 00 00       	mov    $0x4e1,%eax
 4f0:	cd 41                	int    $0x41
 4f2:	c3                   	ret    

000004f3 <str_ls_call14>:
 4f3:	6c                   	insb   (%dx),%es:(%edi)
 4f4:	73 5f                	jae    555 <str_ls_call19+0x8>
 4f6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4f9:	6c                   	insb   (%dx),%es:(%edi)
 4fa:	31 34 00             	xor    %esi,(%eax,%eax,1)

000004fd <ls_call14>:
CS550LSSYSCALL(ls_call14)
 4fd:	b8 f3 04 00 00       	mov    $0x4f3,%eax
 502:	cd 41                	int    $0x41
 504:	c3                   	ret    

00000505 <str_ls_call15>:
 505:	6c                   	insb   (%dx),%es:(%edi)
 506:	73 5f                	jae    567 <str_ls_call20+0x8>
 508:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 50b:	6c                   	insb   (%dx),%es:(%edi)
 50c:	31                   	.byte 0x31
 50d:	35                   	.byte 0x35
	...

0000050f <ls_call15>:
CS550LSSYSCALL(ls_call15)
 50f:	b8 05 05 00 00       	mov    $0x505,%eax
 514:	cd 41                	int    $0x41
 516:	c3                   	ret    

00000517 <str_ls_call16>:
 517:	6c                   	insb   (%dx),%es:(%edi)
 518:	73 5f                	jae    579 <str_ls_call21+0x8>
 51a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 51d:	6c                   	insb   (%dx),%es:(%edi)
 51e:	31 36                	xor    %esi,(%esi)
	...

00000521 <ls_call16>:
CS550LSSYSCALL(ls_call16)
 521:	b8 17 05 00 00       	mov    $0x517,%eax
 526:	cd 41                	int    $0x41
 528:	c3                   	ret    

00000529 <str_ls_call17>:
 529:	6c                   	insb   (%dx),%es:(%edi)
 52a:	73 5f                	jae    58b <str_ls_call22+0x8>
 52c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 52f:	6c                   	insb   (%dx),%es:(%edi)
 530:	31 37                	xor    %esi,(%edi)
	...

00000533 <ls_call17>:
CS550LSSYSCALL(ls_call17)
 533:	b8 29 05 00 00       	mov    $0x529,%eax
 538:	cd 41                	int    $0x41
 53a:	c3                   	ret    

0000053b <str_ls_call18>:
 53b:	6c                   	insb   (%dx),%es:(%edi)
 53c:	73 5f                	jae    59d <str_ls_call23+0x8>
 53e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 541:	6c                   	insb   (%dx),%es:(%edi)
 542:	31 38                	xor    %edi,(%eax)
	...

00000545 <ls_call18>:
CS550LSSYSCALL(ls_call18)
 545:	b8 3b 05 00 00       	mov    $0x53b,%eax
 54a:	cd 41                	int    $0x41
 54c:	c3                   	ret    

0000054d <str_ls_call19>:
 54d:	6c                   	insb   (%dx),%es:(%edi)
 54e:	73 5f                	jae    5af <str_ls_call24+0x8>
 550:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 553:	6c                   	insb   (%dx),%es:(%edi)
 554:	31 39                	xor    %edi,(%ecx)
	...

00000557 <ls_call19>:
CS550LSSYSCALL(ls_call19)
 557:	b8 4d 05 00 00       	mov    $0x54d,%eax
 55c:	cd 41                	int    $0x41
 55e:	c3                   	ret    

0000055f <str_ls_call20>:
 55f:	6c                   	insb   (%dx),%es:(%edi)
 560:	73 5f                	jae    5c1 <str_ls_call25+0x8>
 562:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 565:	6c                   	insb   (%dx),%es:(%edi)
 566:	32 30                	xor    (%eax),%dh
	...

00000569 <ls_call20>:
CS550LSSYSCALL(ls_call20)
 569:	b8 5f 05 00 00       	mov    $0x55f,%eax
 56e:	cd 41                	int    $0x41
 570:	c3                   	ret    

00000571 <str_ls_call21>:
 571:	6c                   	insb   (%dx),%es:(%edi)
 572:	73 5f                	jae    5d3 <str_ls_call26+0x8>
 574:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 577:	6c                   	insb   (%dx),%es:(%edi)
 578:	32 31                	xor    (%ecx),%dh
	...

0000057b <ls_call21>:
CS550LSSYSCALL(ls_call21)
 57b:	b8 71 05 00 00       	mov    $0x571,%eax
 580:	cd 41                	int    $0x41
 582:	c3                   	ret    

00000583 <str_ls_call22>:
 583:	6c                   	insb   (%dx),%es:(%edi)
 584:	73 5f                	jae    5e5 <str_ls_call27+0x8>
 586:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 589:	6c                   	insb   (%dx),%es:(%edi)
 58a:	32 32                	xor    (%edx),%dh
	...

0000058d <ls_call22>:
CS550LSSYSCALL(ls_call22)
 58d:	b8 83 05 00 00       	mov    $0x583,%eax
 592:	cd 41                	int    $0x41
 594:	c3                   	ret    

00000595 <str_ls_call23>:
 595:	6c                   	insb   (%dx),%es:(%edi)
 596:	73 5f                	jae    5f7 <str_ls_call28+0x8>
 598:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 59b:	6c                   	insb   (%dx),%es:(%edi)
 59c:	32 33                	xor    (%ebx),%dh
	...

0000059f <ls_call23>:
CS550LSSYSCALL(ls_call23)
 59f:	b8 95 05 00 00       	mov    $0x595,%eax
 5a4:	cd 41                	int    $0x41
 5a6:	c3                   	ret    

000005a7 <str_ls_call24>:
 5a7:	6c                   	insb   (%dx),%es:(%edi)
 5a8:	73 5f                	jae    609 <str_ls_call29+0x8>
 5aa:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5ad:	6c                   	insb   (%dx),%es:(%edi)
 5ae:	32 34 00             	xor    (%eax,%eax,1),%dh

000005b1 <ls_call24>:
CS550LSSYSCALL(ls_call24)
 5b1:	b8 a7 05 00 00       	mov    $0x5a7,%eax
 5b6:	cd 41                	int    $0x41
 5b8:	c3                   	ret    

000005b9 <str_ls_call25>:
 5b9:	6c                   	insb   (%dx),%es:(%edi)
 5ba:	73 5f                	jae    61b <str_ls_call30+0x8>
 5bc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5bf:	6c                   	insb   (%dx),%es:(%edi)
 5c0:	32                   	.byte 0x32
 5c1:	35                   	.byte 0x35
	...

000005c3 <ls_call25>:
CS550LSSYSCALL(ls_call25)
 5c3:	b8 b9 05 00 00       	mov    $0x5b9,%eax
 5c8:	cd 41                	int    $0x41
 5ca:	c3                   	ret    

000005cb <str_ls_call26>:
 5cb:	6c                   	insb   (%dx),%es:(%edi)
 5cc:	73 5f                	jae    62d <str_ls_call31+0x8>
 5ce:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5d1:	6c                   	insb   (%dx),%es:(%edi)
 5d2:	32 36                	xor    (%esi),%dh
	...

000005d5 <ls_call26>:
CS550LSSYSCALL(ls_call26)
 5d5:	b8 cb 05 00 00       	mov    $0x5cb,%eax
 5da:	cd 41                	int    $0x41
 5dc:	c3                   	ret    

000005dd <str_ls_call27>:
 5dd:	6c                   	insb   (%dx),%es:(%edi)
 5de:	73 5f                	jae    63f <str_ls_call32+0x8>
 5e0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5e3:	6c                   	insb   (%dx),%es:(%edi)
 5e4:	32 37                	xor    (%edi),%dh
	...

000005e7 <ls_call27>:
CS550LSSYSCALL(ls_call27)
 5e7:	b8 dd 05 00 00       	mov    $0x5dd,%eax
 5ec:	cd 41                	int    $0x41
 5ee:	c3                   	ret    

000005ef <str_ls_call28>:
 5ef:	6c                   	insb   (%dx),%es:(%edi)
 5f0:	73 5f                	jae    651 <str_ls_call33+0x8>
 5f2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5f5:	6c                   	insb   (%dx),%es:(%edi)
 5f6:	32 38                	xor    (%eax),%bh
	...

000005f9 <ls_call28>:
CS550LSSYSCALL(ls_call28)
 5f9:	b8 ef 05 00 00       	mov    $0x5ef,%eax
 5fe:	cd 41                	int    $0x41
 600:	c3                   	ret    

00000601 <str_ls_call29>:
 601:	6c                   	insb   (%dx),%es:(%edi)
 602:	73 5f                	jae    663 <str_ls_call34+0x8>
 604:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 607:	6c                   	insb   (%dx),%es:(%edi)
 608:	32 39                	xor    (%ecx),%bh
	...

0000060b <ls_call29>:
CS550LSSYSCALL(ls_call29)
 60b:	b8 01 06 00 00       	mov    $0x601,%eax
 610:	cd 41                	int    $0x41
 612:	c3                   	ret    

00000613 <str_ls_call30>:
 613:	6c                   	insb   (%dx),%es:(%edi)
 614:	73 5f                	jae    675 <str_ls_call35+0x8>
 616:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 619:	6c                   	insb   (%dx),%es:(%edi)
 61a:	33 30                	xor    (%eax),%esi
	...

0000061d <ls_call30>:
CS550LSSYSCALL(ls_call30)
 61d:	b8 13 06 00 00       	mov    $0x613,%eax
 622:	cd 41                	int    $0x41
 624:	c3                   	ret    

00000625 <str_ls_call31>:
 625:	6c                   	insb   (%dx),%es:(%edi)
 626:	73 5f                	jae    687 <str_ls_call36+0x8>
 628:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 62b:	6c                   	insb   (%dx),%es:(%edi)
 62c:	33 31                	xor    (%ecx),%esi
	...

0000062f <ls_call31>:
CS550LSSYSCALL(ls_call31)
 62f:	b8 25 06 00 00       	mov    $0x625,%eax
 634:	cd 41                	int    $0x41
 636:	c3                   	ret    

00000637 <str_ls_call32>:
 637:	6c                   	insb   (%dx),%es:(%edi)
 638:	73 5f                	jae    699 <str_ls_call37+0x8>
 63a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 63d:	6c                   	insb   (%dx),%es:(%edi)
 63e:	33 32                	xor    (%edx),%esi
	...

00000641 <ls_call32>:
CS550LSSYSCALL(ls_call32)
 641:	b8 37 06 00 00       	mov    $0x637,%eax
 646:	cd 41                	int    $0x41
 648:	c3                   	ret    

00000649 <str_ls_call33>:
 649:	6c                   	insb   (%dx),%es:(%edi)
 64a:	73 5f                	jae    6ab <str_ls_call38+0x8>
 64c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 64f:	6c                   	insb   (%dx),%es:(%edi)
 650:	33 33                	xor    (%ebx),%esi
	...

00000653 <ls_call33>:
CS550LSSYSCALL(ls_call33)
 653:	b8 49 06 00 00       	mov    $0x649,%eax
 658:	cd 41                	int    $0x41
 65a:	c3                   	ret    

0000065b <str_ls_call34>:
 65b:	6c                   	insb   (%dx),%es:(%edi)
 65c:	73 5f                	jae    6bd <str_ls_call39+0x8>
 65e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 661:	6c                   	insb   (%dx),%es:(%edi)
 662:	33 34 00             	xor    (%eax,%eax,1),%esi

00000665 <ls_call34>:
CS550LSSYSCALL(ls_call34)
 665:	b8 5b 06 00 00       	mov    $0x65b,%eax
 66a:	cd 41                	int    $0x41
 66c:	c3                   	ret    

0000066d <str_ls_call35>:
 66d:	6c                   	insb   (%dx),%es:(%edi)
 66e:	73 5f                	jae    6cf <str_ls_call40+0x8>
 670:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 673:	6c                   	insb   (%dx),%es:(%edi)
 674:	33                   	.byte 0x33
 675:	35                   	.byte 0x35
	...

00000677 <ls_call35>:
CS550LSSYSCALL(ls_call35)
 677:	b8 6d 06 00 00       	mov    $0x66d,%eax
 67c:	cd 41                	int    $0x41
 67e:	c3                   	ret    

0000067f <str_ls_call36>:
 67f:	6c                   	insb   (%dx),%es:(%edi)
 680:	73 5f                	jae    6e1 <str_ls_call41+0x8>
 682:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 685:	6c                   	insb   (%dx),%es:(%edi)
 686:	33 36                	xor    (%esi),%esi
	...

00000689 <ls_call36>:
CS550LSSYSCALL(ls_call36)
 689:	b8 7f 06 00 00       	mov    $0x67f,%eax
 68e:	cd 41                	int    $0x41
 690:	c3                   	ret    

00000691 <str_ls_call37>:
 691:	6c                   	insb   (%dx),%es:(%edi)
 692:	73 5f                	jae    6f3 <str_ls_call42+0x8>
 694:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 697:	6c                   	insb   (%dx),%es:(%edi)
 698:	33 37                	xor    (%edi),%esi
	...

0000069b <ls_call37>:
CS550LSSYSCALL(ls_call37)
 69b:	b8 91 06 00 00       	mov    $0x691,%eax
 6a0:	cd 41                	int    $0x41
 6a2:	c3                   	ret    

000006a3 <str_ls_call38>:
 6a3:	6c                   	insb   (%dx),%es:(%edi)
 6a4:	73 5f                	jae    705 <str_ls_call43+0x8>
 6a6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6a9:	6c                   	insb   (%dx),%es:(%edi)
 6aa:	33 38                	xor    (%eax),%edi
	...

000006ad <ls_call38>:
CS550LSSYSCALL(ls_call38)
 6ad:	b8 a3 06 00 00       	mov    $0x6a3,%eax
 6b2:	cd 41                	int    $0x41
 6b4:	c3                   	ret    

000006b5 <str_ls_call39>:
 6b5:	6c                   	insb   (%dx),%es:(%edi)
 6b6:	73 5f                	jae    717 <str_ls_call44+0x8>
 6b8:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6bb:	6c                   	insb   (%dx),%es:(%edi)
 6bc:	33 39                	xor    (%ecx),%edi
	...

000006bf <ls_call39>:
CS550LSSYSCALL(ls_call39)
 6bf:	b8 b5 06 00 00       	mov    $0x6b5,%eax
 6c4:	cd 41                	int    $0x41
 6c6:	c3                   	ret    

000006c7 <str_ls_call40>:
 6c7:	6c                   	insb   (%dx),%es:(%edi)
 6c8:	73 5f                	jae    729 <str_ls_call45+0x8>
 6ca:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6cd:	6c                   	insb   (%dx),%es:(%edi)
 6ce:	34 30                	xor    $0x30,%al
	...

000006d1 <ls_call40>:
CS550LSSYSCALL(ls_call40)
 6d1:	b8 c7 06 00 00       	mov    $0x6c7,%eax
 6d6:	cd 41                	int    $0x41
 6d8:	c3                   	ret    

000006d9 <str_ls_call41>:
 6d9:	6c                   	insb   (%dx),%es:(%edi)
 6da:	73 5f                	jae    73b <str_ls_call46+0x8>
 6dc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6df:	6c                   	insb   (%dx),%es:(%edi)
 6e0:	34 31                	xor    $0x31,%al
	...

000006e3 <ls_call41>:
CS550LSSYSCALL(ls_call41)
 6e3:	b8 d9 06 00 00       	mov    $0x6d9,%eax
 6e8:	cd 41                	int    $0x41
 6ea:	c3                   	ret    

000006eb <str_ls_call42>:
 6eb:	6c                   	insb   (%dx),%es:(%edi)
 6ec:	73 5f                	jae    74d <str_ls_call47+0x8>
 6ee:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6f1:	6c                   	insb   (%dx),%es:(%edi)
 6f2:	34 32                	xor    $0x32,%al
	...

000006f5 <ls_call42>:
CS550LSSYSCALL(ls_call42)
 6f5:	b8 eb 06 00 00       	mov    $0x6eb,%eax
 6fa:	cd 41                	int    $0x41
 6fc:	c3                   	ret    

000006fd <str_ls_call43>:
 6fd:	6c                   	insb   (%dx),%es:(%edi)
 6fe:	73 5f                	jae    75f <str_ls_call48+0x8>
 700:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 703:	6c                   	insb   (%dx),%es:(%edi)
 704:	34 33                	xor    $0x33,%al
	...

00000707 <ls_call43>:
CS550LSSYSCALL(ls_call43)
 707:	b8 fd 06 00 00       	mov    $0x6fd,%eax
 70c:	cd 41                	int    $0x41
 70e:	c3                   	ret    

0000070f <str_ls_call44>:
 70f:	6c                   	insb   (%dx),%es:(%edi)
 710:	73 5f                	jae    771 <str_ls_call49+0x8>
 712:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 715:	6c                   	insb   (%dx),%es:(%edi)
 716:	34 34                	xor    $0x34,%al
	...

00000719 <ls_call44>:
CS550LSSYSCALL(ls_call44)
 719:	b8 0f 07 00 00       	mov    $0x70f,%eax
 71e:	cd 41                	int    $0x41
 720:	c3                   	ret    

00000721 <str_ls_call45>:
 721:	6c                   	insb   (%dx),%es:(%edi)
 722:	73 5f                	jae    783 <str_ls_call50+0x8>
 724:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 727:	6c                   	insb   (%dx),%es:(%edi)
 728:	34 35                	xor    $0x35,%al
	...

0000072b <ls_call45>:
CS550LSSYSCALL(ls_call45)
 72b:	b8 21 07 00 00       	mov    $0x721,%eax
 730:	cd 41                	int    $0x41
 732:	c3                   	ret    

00000733 <str_ls_call46>:
 733:	6c                   	insb   (%dx),%es:(%edi)
 734:	73 5f                	jae    795 <str_ht_call1+0x8>
 736:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 739:	6c                   	insb   (%dx),%es:(%edi)
 73a:	34 36                	xor    $0x36,%al
	...

0000073d <ls_call46>:
CS550LSSYSCALL(ls_call46)
 73d:	b8 33 07 00 00       	mov    $0x733,%eax
 742:	cd 41                	int    $0x41
 744:	c3                   	ret    

00000745 <str_ls_call47>:
 745:	6c                   	insb   (%dx),%es:(%edi)
 746:	73 5f                	jae    7a7 <ht_call2>
 748:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 74b:	6c                   	insb   (%dx),%es:(%edi)
 74c:	34 37                	xor    $0x37,%al
	...

0000074f <ls_call47>:
CS550LSSYSCALL(ls_call47)
 74f:	b8 45 07 00 00       	mov    $0x745,%eax
 754:	cd 41                	int    $0x41
 756:	c3                   	ret    

00000757 <str_ls_call48>:
 757:	6c                   	insb   (%dx),%es:(%edi)
 758:	73 5f                	jae    7b9 <ht_call3+0x1>
 75a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 75d:	6c                   	insb   (%dx),%es:(%edi)
 75e:	34 38                	xor    $0x38,%al
	...

00000761 <ls_call48>:
CS550LSSYSCALL(ls_call48)
 761:	b8 57 07 00 00       	mov    $0x757,%eax
 766:	cd 41                	int    $0x41
 768:	c3                   	ret    

00000769 <str_ls_call49>:
 769:	6c                   	insb   (%dx),%es:(%edi)
 76a:	73 5f                	jae    7cb <ht_call4+0x2>
 76c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 76f:	6c                   	insb   (%dx),%es:(%edi)
 770:	34 39                	xor    $0x39,%al
	...

00000773 <ls_call49>:
CS550LSSYSCALL(ls_call49)
 773:	b8 69 07 00 00       	mov    $0x769,%eax
 778:	cd 41                	int    $0x41
 77a:	c3                   	ret    

0000077b <str_ls_call50>:
 77b:	6c                   	insb   (%dx),%es:(%edi)
 77c:	73 5f                	jae    7dd <ht_call5+0x3>
 77e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 781:	6c                   	insb   (%dx),%es:(%edi)
 782:	35                   	.byte 0x35
 783:	30 00                	xor    %al,(%eax)

00000785 <ls_call50>:
CS550LSSYSCALL(ls_call50)
 785:	b8 7b 07 00 00       	mov    $0x77b,%eax
 78a:	cd 41                	int    $0x41
 78c:	c3                   	ret    

0000078d <str_ht_call1>:
 78d:	68 74 5f 63 61       	push   $0x61635f74
 792:	6c                   	insb   (%dx),%es:(%edi)
 793:	6c                   	insb   (%dx),%es:(%edi)
 794:	31 00                	xor    %eax,(%eax)

00000796 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
 796:	b8 8d 07 00 00       	mov    $0x78d,%eax
 79b:	cd 42                	int    $0x42
 79d:	c3                   	ret    

0000079e <str_ht_call2>:
 79e:	68 74 5f 63 61       	push   $0x61635f74
 7a3:	6c                   	insb   (%dx),%es:(%edi)
 7a4:	6c                   	insb   (%dx),%es:(%edi)
 7a5:	32 00                	xor    (%eax),%al

000007a7 <ht_call2>:
CS550HTSYSCALL(ht_call2)
 7a7:	b8 9e 07 00 00       	mov    $0x79e,%eax
 7ac:	cd 42                	int    $0x42
 7ae:	c3                   	ret    

000007af <str_ht_call3>:
 7af:	68 74 5f 63 61       	push   $0x61635f74
 7b4:	6c                   	insb   (%dx),%es:(%edi)
 7b5:	6c                   	insb   (%dx),%es:(%edi)
 7b6:	33 00                	xor    (%eax),%eax

000007b8 <ht_call3>:
CS550HTSYSCALL(ht_call3)
 7b8:	b8 af 07 00 00       	mov    $0x7af,%eax
 7bd:	cd 42                	int    $0x42
 7bf:	c3                   	ret    

000007c0 <str_ht_call4>:
 7c0:	68 74 5f 63 61       	push   $0x61635f74
 7c5:	6c                   	insb   (%dx),%es:(%edi)
 7c6:	6c                   	insb   (%dx),%es:(%edi)
 7c7:	34 00                	xor    $0x0,%al

000007c9 <ht_call4>:
CS550HTSYSCALL(ht_call4)
 7c9:	b8 c0 07 00 00       	mov    $0x7c0,%eax
 7ce:	cd 42                	int    $0x42
 7d0:	c3                   	ret    

000007d1 <str_ht_call5>:
 7d1:	68 74 5f 63 61       	push   $0x61635f74
 7d6:	6c                   	insb   (%dx),%es:(%edi)
 7d7:	6c                   	insb   (%dx),%es:(%edi)
 7d8:	35                   	.byte 0x35
	...

000007da <ht_call5>:
CS550HTSYSCALL(ht_call5)
 7da:	b8 d1 07 00 00       	mov    $0x7d1,%eax
 7df:	cd 42                	int    $0x42
 7e1:	c3                   	ret    

000007e2 <str_ht_call6>:
 7e2:	68 74 5f 63 61       	push   $0x61635f74
 7e7:	6c                   	insb   (%dx),%es:(%edi)
 7e8:	6c                   	insb   (%dx),%es:(%edi)
 7e9:	36                   	ss
	...

000007eb <ht_call6>:
CS550HTSYSCALL(ht_call6)
 7eb:	b8 e2 07 00 00       	mov    $0x7e2,%eax
 7f0:	cd 42                	int    $0x42
 7f2:	c3                   	ret    

000007f3 <str_ht_call7>:
 7f3:	68 74 5f 63 61       	push   $0x61635f74
 7f8:	6c                   	insb   (%dx),%es:(%edi)
 7f9:	6c                   	insb   (%dx),%es:(%edi)
 7fa:	37                   	aaa    
	...

000007fc <ht_call7>:
CS550HTSYSCALL(ht_call7)
 7fc:	b8 f3 07 00 00       	mov    $0x7f3,%eax
 801:	cd 42                	int    $0x42
 803:	c3                   	ret    

00000804 <str_ht_call8>:
 804:	68 74 5f 63 61       	push   $0x61635f74
 809:	6c                   	insb   (%dx),%es:(%edi)
 80a:	6c                   	insb   (%dx),%es:(%edi)
 80b:	38 00                	cmp    %al,(%eax)

0000080d <ht_call8>:
CS550HTSYSCALL(ht_call8)
 80d:	b8 04 08 00 00       	mov    $0x804,%eax
 812:	cd 42                	int    $0x42
 814:	c3                   	ret    

00000815 <str_ht_call9>:
 815:	68 74 5f 63 61       	push   $0x61635f74
 81a:	6c                   	insb   (%dx),%es:(%edi)
 81b:	6c                   	insb   (%dx),%es:(%edi)
 81c:	39 00                	cmp    %eax,(%eax)

0000081e <ht_call9>:
CS550HTSYSCALL(ht_call9)
 81e:	b8 15 08 00 00       	mov    $0x815,%eax
 823:	cd 42                	int    $0x42
 825:	c3                   	ret    

00000826 <str_ht_call10>:
 826:	68 74 5f 63 61       	push   $0x61635f74
 82b:	6c                   	insb   (%dx),%es:(%edi)
 82c:	6c                   	insb   (%dx),%es:(%edi)
 82d:	31 30                	xor    %esi,(%eax)
	...

00000830 <ht_call10>:
CS550HTSYSCALL(ht_call10)
 830:	b8 26 08 00 00       	mov    $0x826,%eax
 835:	cd 42                	int    $0x42
 837:	c3                   	ret    

00000838 <str_ht_call11>:
 838:	68 74 5f 63 61       	push   $0x61635f74
 83d:	6c                   	insb   (%dx),%es:(%edi)
 83e:	6c                   	insb   (%dx),%es:(%edi)
 83f:	31 31                	xor    %esi,(%ecx)
	...

00000842 <ht_call11>:
CS550HTSYSCALL(ht_call11)
 842:	b8 38 08 00 00       	mov    $0x838,%eax
 847:	cd 42                	int    $0x42
 849:	c3                   	ret    

0000084a <str_ht_call12>:
 84a:	68 74 5f 63 61       	push   $0x61635f74
 84f:	6c                   	insb   (%dx),%es:(%edi)
 850:	6c                   	insb   (%dx),%es:(%edi)
 851:	31 32                	xor    %esi,(%edx)
	...

00000854 <ht_call12>:
CS550HTSYSCALL(ht_call12)
 854:	b8 4a 08 00 00       	mov    $0x84a,%eax
 859:	cd 42                	int    $0x42
 85b:	c3                   	ret    

0000085c <str_ht_call13>:
 85c:	68 74 5f 63 61       	push   $0x61635f74
 861:	6c                   	insb   (%dx),%es:(%edi)
 862:	6c                   	insb   (%dx),%es:(%edi)
 863:	31 33                	xor    %esi,(%ebx)
	...

00000866 <ht_call13>:
CS550HTSYSCALL(ht_call13)
 866:	b8 5c 08 00 00       	mov    $0x85c,%eax
 86b:	cd 42                	int    $0x42
 86d:	c3                   	ret    

0000086e <str_ht_call14>:
 86e:	68 74 5f 63 61       	push   $0x61635f74
 873:	6c                   	insb   (%dx),%es:(%edi)
 874:	6c                   	insb   (%dx),%es:(%edi)
 875:	31 34 00             	xor    %esi,(%eax,%eax,1)

00000878 <ht_call14>:
CS550HTSYSCALL(ht_call14)
 878:	b8 6e 08 00 00       	mov    $0x86e,%eax
 87d:	cd 42                	int    $0x42
 87f:	c3                   	ret    

00000880 <str_ht_call15>:
 880:	68 74 5f 63 61       	push   $0x61635f74
 885:	6c                   	insb   (%dx),%es:(%edi)
 886:	6c                   	insb   (%dx),%es:(%edi)
 887:	31                   	.byte 0x31
 888:	35                   	.byte 0x35
	...

0000088a <ht_call15>:
CS550HTSYSCALL(ht_call15)
 88a:	b8 80 08 00 00       	mov    $0x880,%eax
 88f:	cd 42                	int    $0x42
 891:	c3                   	ret    

00000892 <str_ht_call16>:
 892:	68 74 5f 63 61       	push   $0x61635f74
 897:	6c                   	insb   (%dx),%es:(%edi)
 898:	6c                   	insb   (%dx),%es:(%edi)
 899:	31 36                	xor    %esi,(%esi)
	...

0000089c <ht_call16>:
CS550HTSYSCALL(ht_call16)
 89c:	b8 92 08 00 00       	mov    $0x892,%eax
 8a1:	cd 42                	int    $0x42
 8a3:	c3                   	ret    

000008a4 <str_ht_call17>:
 8a4:	68 74 5f 63 61       	push   $0x61635f74
 8a9:	6c                   	insb   (%dx),%es:(%edi)
 8aa:	6c                   	insb   (%dx),%es:(%edi)
 8ab:	31 37                	xor    %esi,(%edi)
	...

000008ae <ht_call17>:
CS550HTSYSCALL(ht_call17)
 8ae:	b8 a4 08 00 00       	mov    $0x8a4,%eax
 8b3:	cd 42                	int    $0x42
 8b5:	c3                   	ret    

000008b6 <str_ht_call18>:
 8b6:	68 74 5f 63 61       	push   $0x61635f74
 8bb:	6c                   	insb   (%dx),%es:(%edi)
 8bc:	6c                   	insb   (%dx),%es:(%edi)
 8bd:	31 38                	xor    %edi,(%eax)
	...

000008c0 <ht_call18>:
CS550HTSYSCALL(ht_call18)
 8c0:	b8 b6 08 00 00       	mov    $0x8b6,%eax
 8c5:	cd 42                	int    $0x42
 8c7:	c3                   	ret    

000008c8 <str_ht_call19>:
 8c8:	68 74 5f 63 61       	push   $0x61635f74
 8cd:	6c                   	insb   (%dx),%es:(%edi)
 8ce:	6c                   	insb   (%dx),%es:(%edi)
 8cf:	31 39                	xor    %edi,(%ecx)
	...

000008d2 <ht_call19>:
CS550HTSYSCALL(ht_call19)
 8d2:	b8 c8 08 00 00       	mov    $0x8c8,%eax
 8d7:	cd 42                	int    $0x42
 8d9:	c3                   	ret    

000008da <str_ht_call20>:
 8da:	68 74 5f 63 61       	push   $0x61635f74
 8df:	6c                   	insb   (%dx),%es:(%edi)
 8e0:	6c                   	insb   (%dx),%es:(%edi)
 8e1:	32 30                	xor    (%eax),%dh
	...

000008e4 <ht_call20>:
CS550HTSYSCALL(ht_call20)
 8e4:	b8 da 08 00 00       	mov    $0x8da,%eax
 8e9:	cd 42                	int    $0x42
 8eb:	c3                   	ret    

000008ec <str_ht_call21>:
 8ec:	68 74 5f 63 61       	push   $0x61635f74
 8f1:	6c                   	insb   (%dx),%es:(%edi)
 8f2:	6c                   	insb   (%dx),%es:(%edi)
 8f3:	32 31                	xor    (%ecx),%dh
	...

000008f6 <ht_call21>:
CS550HTSYSCALL(ht_call21)
 8f6:	b8 ec 08 00 00       	mov    $0x8ec,%eax
 8fb:	cd 42                	int    $0x42
 8fd:	c3                   	ret    

000008fe <str_ht_call22>:
 8fe:	68 74 5f 63 61       	push   $0x61635f74
 903:	6c                   	insb   (%dx),%es:(%edi)
 904:	6c                   	insb   (%dx),%es:(%edi)
 905:	32 32                	xor    (%edx),%dh
	...

00000908 <ht_call22>:
CS550HTSYSCALL(ht_call22)
 908:	b8 fe 08 00 00       	mov    $0x8fe,%eax
 90d:	cd 42                	int    $0x42
 90f:	c3                   	ret    

00000910 <str_ht_call23>:
 910:	68 74 5f 63 61       	push   $0x61635f74
 915:	6c                   	insb   (%dx),%es:(%edi)
 916:	6c                   	insb   (%dx),%es:(%edi)
 917:	32 33                	xor    (%ebx),%dh
	...

0000091a <ht_call23>:
CS550HTSYSCALL(ht_call23)
 91a:	b8 10 09 00 00       	mov    $0x910,%eax
 91f:	cd 42                	int    $0x42
 921:	c3                   	ret    

00000922 <str_ht_call24>:
 922:	68 74 5f 63 61       	push   $0x61635f74
 927:	6c                   	insb   (%dx),%es:(%edi)
 928:	6c                   	insb   (%dx),%es:(%edi)
 929:	32 34 00             	xor    (%eax,%eax,1),%dh

0000092c <ht_call24>:
CS550HTSYSCALL(ht_call24)
 92c:	b8 22 09 00 00       	mov    $0x922,%eax
 931:	cd 42                	int    $0x42
 933:	c3                   	ret    

00000934 <str_ht_call25>:
 934:	68 74 5f 63 61       	push   $0x61635f74
 939:	6c                   	insb   (%dx),%es:(%edi)
 93a:	6c                   	insb   (%dx),%es:(%edi)
 93b:	32                   	.byte 0x32
 93c:	35                   	.byte 0x35
	...

0000093e <ht_call25>:
CS550HTSYSCALL(ht_call25)
 93e:	b8 34 09 00 00       	mov    $0x934,%eax
 943:	cd 42                	int    $0x42
 945:	c3                   	ret    

00000946 <str_ht_call26>:
 946:	68 74 5f 63 61       	push   $0x61635f74
 94b:	6c                   	insb   (%dx),%es:(%edi)
 94c:	6c                   	insb   (%dx),%es:(%edi)
 94d:	32 36                	xor    (%esi),%dh
	...

00000950 <ht_call26>:
CS550HTSYSCALL(ht_call26)
 950:	b8 46 09 00 00       	mov    $0x946,%eax
 955:	cd 42                	int    $0x42
 957:	c3                   	ret    

00000958 <str_ht_call27>:
 958:	68 74 5f 63 61       	push   $0x61635f74
 95d:	6c                   	insb   (%dx),%es:(%edi)
 95e:	6c                   	insb   (%dx),%es:(%edi)
 95f:	32 37                	xor    (%edi),%dh
	...

00000962 <ht_call27>:
CS550HTSYSCALL(ht_call27)
 962:	b8 58 09 00 00       	mov    $0x958,%eax
 967:	cd 42                	int    $0x42
 969:	c3                   	ret    

0000096a <str_ht_call28>:
 96a:	68 74 5f 63 61       	push   $0x61635f74
 96f:	6c                   	insb   (%dx),%es:(%edi)
 970:	6c                   	insb   (%dx),%es:(%edi)
 971:	32 38                	xor    (%eax),%bh
	...

00000974 <ht_call28>:
CS550HTSYSCALL(ht_call28)
 974:	b8 6a 09 00 00       	mov    $0x96a,%eax
 979:	cd 42                	int    $0x42
 97b:	c3                   	ret    

0000097c <str_ht_call29>:
 97c:	68 74 5f 63 61       	push   $0x61635f74
 981:	6c                   	insb   (%dx),%es:(%edi)
 982:	6c                   	insb   (%dx),%es:(%edi)
 983:	32 39                	xor    (%ecx),%bh
	...

00000986 <ht_call29>:
CS550HTSYSCALL(ht_call29)
 986:	b8 7c 09 00 00       	mov    $0x97c,%eax
 98b:	cd 42                	int    $0x42
 98d:	c3                   	ret    

0000098e <str_ht_call30>:
 98e:	68 74 5f 63 61       	push   $0x61635f74
 993:	6c                   	insb   (%dx),%es:(%edi)
 994:	6c                   	insb   (%dx),%es:(%edi)
 995:	33 30                	xor    (%eax),%esi
	...

00000998 <ht_call30>:
CS550HTSYSCALL(ht_call30)
 998:	b8 8e 09 00 00       	mov    $0x98e,%eax
 99d:	cd 42                	int    $0x42
 99f:	c3                   	ret    

000009a0 <str_ht_call31>:
 9a0:	68 74 5f 63 61       	push   $0x61635f74
 9a5:	6c                   	insb   (%dx),%es:(%edi)
 9a6:	6c                   	insb   (%dx),%es:(%edi)
 9a7:	33 31                	xor    (%ecx),%esi
	...

000009aa <ht_call31>:
CS550HTSYSCALL(ht_call31)
 9aa:	b8 a0 09 00 00       	mov    $0x9a0,%eax
 9af:	cd 42                	int    $0x42
 9b1:	c3                   	ret    

000009b2 <str_ht_call32>:
 9b2:	68 74 5f 63 61       	push   $0x61635f74
 9b7:	6c                   	insb   (%dx),%es:(%edi)
 9b8:	6c                   	insb   (%dx),%es:(%edi)
 9b9:	33 32                	xor    (%edx),%esi
	...

000009bc <ht_call32>:
CS550HTSYSCALL(ht_call32)
 9bc:	b8 b2 09 00 00       	mov    $0x9b2,%eax
 9c1:	cd 42                	int    $0x42
 9c3:	c3                   	ret    

000009c4 <str_ht_call33>:
 9c4:	68 74 5f 63 61       	push   $0x61635f74
 9c9:	6c                   	insb   (%dx),%es:(%edi)
 9ca:	6c                   	insb   (%dx),%es:(%edi)
 9cb:	33 33                	xor    (%ebx),%esi
	...

000009ce <ht_call33>:
CS550HTSYSCALL(ht_call33)
 9ce:	b8 c4 09 00 00       	mov    $0x9c4,%eax
 9d3:	cd 42                	int    $0x42
 9d5:	c3                   	ret    

000009d6 <str_ht_call34>:
 9d6:	68 74 5f 63 61       	push   $0x61635f74
 9db:	6c                   	insb   (%dx),%es:(%edi)
 9dc:	6c                   	insb   (%dx),%es:(%edi)
 9dd:	33 34 00             	xor    (%eax,%eax,1),%esi

000009e0 <ht_call34>:
CS550HTSYSCALL(ht_call34)
 9e0:	b8 d6 09 00 00       	mov    $0x9d6,%eax
 9e5:	cd 42                	int    $0x42
 9e7:	c3                   	ret    

000009e8 <str_ht_call35>:
 9e8:	68 74 5f 63 61       	push   $0x61635f74
 9ed:	6c                   	insb   (%dx),%es:(%edi)
 9ee:	6c                   	insb   (%dx),%es:(%edi)
 9ef:	33                   	.byte 0x33
 9f0:	35                   	.byte 0x35
	...

000009f2 <ht_call35>:
CS550HTSYSCALL(ht_call35)
 9f2:	b8 e8 09 00 00       	mov    $0x9e8,%eax
 9f7:	cd 42                	int    $0x42
 9f9:	c3                   	ret    

000009fa <str_ht_call36>:
 9fa:	68 74 5f 63 61       	push   $0x61635f74
 9ff:	6c                   	insb   (%dx),%es:(%edi)
 a00:	6c                   	insb   (%dx),%es:(%edi)
 a01:	33 36                	xor    (%esi),%esi
	...

00000a04 <ht_call36>:
CS550HTSYSCALL(ht_call36)
 a04:	b8 fa 09 00 00       	mov    $0x9fa,%eax
 a09:	cd 42                	int    $0x42
 a0b:	c3                   	ret    

00000a0c <str_ht_call37>:
 a0c:	68 74 5f 63 61       	push   $0x61635f74
 a11:	6c                   	insb   (%dx),%es:(%edi)
 a12:	6c                   	insb   (%dx),%es:(%edi)
 a13:	33 37                	xor    (%edi),%esi
	...

00000a16 <ht_call37>:
CS550HTSYSCALL(ht_call37)
 a16:	b8 0c 0a 00 00       	mov    $0xa0c,%eax
 a1b:	cd 42                	int    $0x42
 a1d:	c3                   	ret    

00000a1e <str_ht_call38>:
 a1e:	68 74 5f 63 61       	push   $0x61635f74
 a23:	6c                   	insb   (%dx),%es:(%edi)
 a24:	6c                   	insb   (%dx),%es:(%edi)
 a25:	33 38                	xor    (%eax),%edi
	...

00000a28 <ht_call38>:
CS550HTSYSCALL(ht_call38)
 a28:	b8 1e 0a 00 00       	mov    $0xa1e,%eax
 a2d:	cd 42                	int    $0x42
 a2f:	c3                   	ret    

00000a30 <str_ht_call39>:
 a30:	68 74 5f 63 61       	push   $0x61635f74
 a35:	6c                   	insb   (%dx),%es:(%edi)
 a36:	6c                   	insb   (%dx),%es:(%edi)
 a37:	33 39                	xor    (%ecx),%edi
	...

00000a3a <ht_call39>:
CS550HTSYSCALL(ht_call39)
 a3a:	b8 30 0a 00 00       	mov    $0xa30,%eax
 a3f:	cd 42                	int    $0x42
 a41:	c3                   	ret    

00000a42 <str_ht_call40>:
 a42:	68 74 5f 63 61       	push   $0x61635f74
 a47:	6c                   	insb   (%dx),%es:(%edi)
 a48:	6c                   	insb   (%dx),%es:(%edi)
 a49:	34 30                	xor    $0x30,%al
	...

00000a4c <ht_call40>:
CS550HTSYSCALL(ht_call40)
 a4c:	b8 42 0a 00 00       	mov    $0xa42,%eax
 a51:	cd 42                	int    $0x42
 a53:	c3                   	ret    

00000a54 <str_ht_call41>:
 a54:	68 74 5f 63 61       	push   $0x61635f74
 a59:	6c                   	insb   (%dx),%es:(%edi)
 a5a:	6c                   	insb   (%dx),%es:(%edi)
 a5b:	34 31                	xor    $0x31,%al
	...

00000a5e <ht_call41>:
CS550HTSYSCALL(ht_call41)
 a5e:	b8 54 0a 00 00       	mov    $0xa54,%eax
 a63:	cd 42                	int    $0x42
 a65:	c3                   	ret    

00000a66 <str_ht_call42>:
 a66:	68 74 5f 63 61       	push   $0x61635f74
 a6b:	6c                   	insb   (%dx),%es:(%edi)
 a6c:	6c                   	insb   (%dx),%es:(%edi)
 a6d:	34 32                	xor    $0x32,%al
	...

00000a70 <ht_call42>:
CS550HTSYSCALL(ht_call42)
 a70:	b8 66 0a 00 00       	mov    $0xa66,%eax
 a75:	cd 42                	int    $0x42
 a77:	c3                   	ret    

00000a78 <str_ht_call43>:
 a78:	68 74 5f 63 61       	push   $0x61635f74
 a7d:	6c                   	insb   (%dx),%es:(%edi)
 a7e:	6c                   	insb   (%dx),%es:(%edi)
 a7f:	34 33                	xor    $0x33,%al
	...

00000a82 <ht_call43>:
CS550HTSYSCALL(ht_call43)
 a82:	b8 78 0a 00 00       	mov    $0xa78,%eax
 a87:	cd 42                	int    $0x42
 a89:	c3                   	ret    

00000a8a <str_ht_call44>:
 a8a:	68 74 5f 63 61       	push   $0x61635f74
 a8f:	6c                   	insb   (%dx),%es:(%edi)
 a90:	6c                   	insb   (%dx),%es:(%edi)
 a91:	34 34                	xor    $0x34,%al
	...

00000a94 <ht_call44>:
CS550HTSYSCALL(ht_call44)
 a94:	b8 8a 0a 00 00       	mov    $0xa8a,%eax
 a99:	cd 42                	int    $0x42
 a9b:	c3                   	ret    

00000a9c <str_ht_call45>:
 a9c:	68 74 5f 63 61       	push   $0x61635f74
 aa1:	6c                   	insb   (%dx),%es:(%edi)
 aa2:	6c                   	insb   (%dx),%es:(%edi)
 aa3:	34 35                	xor    $0x35,%al
	...

00000aa6 <ht_call45>:
CS550HTSYSCALL(ht_call45)
 aa6:	b8 9c 0a 00 00       	mov    $0xa9c,%eax
 aab:	cd 42                	int    $0x42
 aad:	c3                   	ret    

00000aae <str_ht_call46>:
 aae:	68 74 5f 63 61       	push   $0x61635f74
 ab3:	6c                   	insb   (%dx),%es:(%edi)
 ab4:	6c                   	insb   (%dx),%es:(%edi)
 ab5:	34 36                	xor    $0x36,%al
	...

00000ab8 <ht_call46>:
CS550HTSYSCALL(ht_call46)
 ab8:	b8 ae 0a 00 00       	mov    $0xaae,%eax
 abd:	cd 42                	int    $0x42
 abf:	c3                   	ret    

00000ac0 <str_ht_call47>:
 ac0:	68 74 5f 63 61       	push   $0x61635f74
 ac5:	6c                   	insb   (%dx),%es:(%edi)
 ac6:	6c                   	insb   (%dx),%es:(%edi)
 ac7:	34 37                	xor    $0x37,%al
	...

00000aca <ht_call47>:
CS550HTSYSCALL(ht_call47)
 aca:	b8 c0 0a 00 00       	mov    $0xac0,%eax
 acf:	cd 42                	int    $0x42
 ad1:	c3                   	ret    

00000ad2 <str_ht_call48>:
 ad2:	68 74 5f 63 61       	push   $0x61635f74
 ad7:	6c                   	insb   (%dx),%es:(%edi)
 ad8:	6c                   	insb   (%dx),%es:(%edi)
 ad9:	34 38                	xor    $0x38,%al
	...

00000adc <ht_call48>:
CS550HTSYSCALL(ht_call48)
 adc:	b8 d2 0a 00 00       	mov    $0xad2,%eax
 ae1:	cd 42                	int    $0x42
 ae3:	c3                   	ret    

00000ae4 <str_ht_call49>:
 ae4:	68 74 5f 63 61       	push   $0x61635f74
 ae9:	6c                   	insb   (%dx),%es:(%edi)
 aea:	6c                   	insb   (%dx),%es:(%edi)
 aeb:	34 39                	xor    $0x39,%al
	...

00000aee <ht_call49>:
CS550HTSYSCALL(ht_call49)
 aee:	b8 e4 0a 00 00       	mov    $0xae4,%eax
 af3:	cd 42                	int    $0x42
 af5:	c3                   	ret    

00000af6 <str_ht_call50>:
 af6:	68 74 5f 63 61       	push   $0x61635f74
 afb:	6c                   	insb   (%dx),%es:(%edi)
 afc:	6c                   	insb   (%dx),%es:(%edi)
 afd:	35                   	.byte 0x35
 afe:	30 00                	xor    %al,(%eax)

00000b00 <ht_call50>:
CS550HTSYSCALL(ht_call50)
 b00:	b8 f6 0a 00 00       	mov    $0xaf6,%eax
 b05:	cd 42                	int    $0x42
 b07:	c3                   	ret    
