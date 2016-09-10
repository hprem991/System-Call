
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  11:	83 ec 08             	sub    $0x8,%esp
  14:	6a 02                	push   $0x2
  16:	68 86 0f 00 00       	push   $0xf86
  1b:	e8 78 03 00 00       	call   398 <open>
  20:	83 c4 10             	add    $0x10,%esp
  23:	85 c0                	test   %eax,%eax
  25:	79 26                	jns    4d <main+0x4d>
    mknod("console", 1, 1);
  27:	83 ec 04             	sub    $0x4,%esp
  2a:	6a 01                	push   $0x1
  2c:	6a 01                	push   $0x1
  2e:	68 86 0f 00 00       	push   $0xf86
  33:	e8 68 03 00 00       	call   3a0 <mknod>
  38:	83 c4 10             	add    $0x10,%esp
    open("console", O_RDWR);
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	6a 02                	push   $0x2
  40:	68 86 0f 00 00       	push   $0xf86
  45:	e8 4e 03 00 00       	call   398 <open>
  4a:	83 c4 10             	add    $0x10,%esp
  }
  dup(0);  // stdout
  4d:	83 ec 0c             	sub    $0xc,%esp
  50:	6a 00                	push   $0x0
  52:	e8 79 03 00 00       	call   3d0 <dup>
  57:	83 c4 10             	add    $0x10,%esp
  dup(0);  // stderr
  5a:	83 ec 0c             	sub    $0xc,%esp
  5d:	6a 00                	push   $0x0
  5f:	e8 6c 03 00 00       	call   3d0 <dup>
  64:	83 c4 10             	add    $0x10,%esp

  for(;;){
    printf(1, "init: starting sh\n");
  67:	83 ec 08             	sub    $0x8,%esp
  6a:	68 8e 0f 00 00       	push   $0xf8e
  6f:	6a 01                	push   $0x1
  71:	e8 57 0b 00 00       	call   bcd <printf>
  76:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  79:	e8 d2 02 00 00       	call   350 <fork>
  7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(pid < 0){
  81:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  85:	79 17                	jns    9e <main+0x9e>
      printf(1, "init: fork failed\n");
  87:	83 ec 08             	sub    $0x8,%esp
  8a:	68 a1 0f 00 00       	push   $0xfa1
  8f:	6a 01                	push   $0x1
  91:	e8 37 0b 00 00       	call   bcd <printf>
  96:	83 c4 10             	add    $0x10,%esp
      exit();
  99:	e8 ba 02 00 00       	call   358 <exit>
    }
    if(pid == 0){
  9e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  a2:	75 3e                	jne    e2 <main+0xe2>
      exec("sh", argv);
  a4:	83 ec 08             	sub    $0x8,%esp
  a7:	68 24 12 00 00       	push   $0x1224
  ac:	68 83 0f 00 00       	push   $0xf83
  b1:	e8 da 02 00 00       	call   390 <exec>
  b6:	83 c4 10             	add    $0x10,%esp
      printf(1, "init: exec sh failed\n");
  b9:	83 ec 08             	sub    $0x8,%esp
  bc:	68 b4 0f 00 00       	push   $0xfb4
  c1:	6a 01                	push   $0x1
  c3:	e8 05 0b 00 00       	call   bcd <printf>
  c8:	83 c4 10             	add    $0x10,%esp
      exit();
  cb:	e8 88 02 00 00       	call   358 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  d0:	83 ec 08             	sub    $0x8,%esp
  d3:	68 ca 0f 00 00       	push   $0xfca
  d8:	6a 01                	push   $0x1
  da:	e8 ee 0a 00 00       	call   bcd <printf>
  df:	83 c4 10             	add    $0x10,%esp
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  e2:	e8 79 02 00 00       	call   360 <wait>
  e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ea:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  ee:	0f 88 73 ff ff ff    	js     67 <main+0x67>
  f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  f7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  fa:	75 d4                	jne    d0 <main+0xd0>
      printf(1, "zombie!\n");
  }
  fc:	e9 66 ff ff ff       	jmp    67 <main+0x67>

00000101 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 101:	55                   	push   %ebp
 102:	89 e5                	mov    %esp,%ebp
 104:	57                   	push   %edi
 105:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 106:	8b 4d 08             	mov    0x8(%ebp),%ecx
 109:	8b 55 10             	mov    0x10(%ebp),%edx
 10c:	8b 45 0c             	mov    0xc(%ebp),%eax
 10f:	89 cb                	mov    %ecx,%ebx
 111:	89 df                	mov    %ebx,%edi
 113:	89 d1                	mov    %edx,%ecx
 115:	fc                   	cld    
 116:	f3 aa                	rep stos %al,%es:(%edi)
 118:	89 ca                	mov    %ecx,%edx
 11a:	89 fb                	mov    %edi,%ebx
 11c:	89 5d 08             	mov    %ebx,0x8(%ebp)
 11f:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 122:	90                   	nop
 123:	5b                   	pop    %ebx
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    

00000127 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 127:	55                   	push   %ebp
 128:	89 e5                	mov    %esp,%ebp
 12a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 12d:	8b 45 08             	mov    0x8(%ebp),%eax
 130:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 133:	90                   	nop
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	8d 50 01             	lea    0x1(%eax),%edx
 13a:	89 55 08             	mov    %edx,0x8(%ebp)
 13d:	8b 55 0c             	mov    0xc(%ebp),%edx
 140:	8d 4a 01             	lea    0x1(%edx),%ecx
 143:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 146:	0f b6 12             	movzbl (%edx),%edx
 149:	88 10                	mov    %dl,(%eax)
 14b:	0f b6 00             	movzbl (%eax),%eax
 14e:	84 c0                	test   %al,%al
 150:	75 e2                	jne    134 <strcpy+0xd>
    ;
  return os;
 152:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 155:	c9                   	leave  
 156:	c3                   	ret    

00000157 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 157:	55                   	push   %ebp
 158:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 15a:	eb 08                	jmp    164 <strcmp+0xd>
    p++, q++;
 15c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 160:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	0f b6 00             	movzbl (%eax),%eax
 16a:	84 c0                	test   %al,%al
 16c:	74 10                	je     17e <strcmp+0x27>
 16e:	8b 45 08             	mov    0x8(%ebp),%eax
 171:	0f b6 10             	movzbl (%eax),%edx
 174:	8b 45 0c             	mov    0xc(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	38 c2                	cmp    %al,%dl
 17c:	74 de                	je     15c <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 17e:	8b 45 08             	mov    0x8(%ebp),%eax
 181:	0f b6 00             	movzbl (%eax),%eax
 184:	0f b6 d0             	movzbl %al,%edx
 187:	8b 45 0c             	mov    0xc(%ebp),%eax
 18a:	0f b6 00             	movzbl (%eax),%eax
 18d:	0f b6 c0             	movzbl %al,%eax
 190:	29 c2                	sub    %eax,%edx
 192:	89 d0                	mov    %edx,%eax
}
 194:	5d                   	pop    %ebp
 195:	c3                   	ret    

00000196 <strlen>:

uint
strlen(char *s)
{
 196:	55                   	push   %ebp
 197:	89 e5                	mov    %esp,%ebp
 199:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 19c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1a3:	eb 04                	jmp    1a9 <strlen+0x13>
 1a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1a9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ac:	8b 45 08             	mov    0x8(%ebp),%eax
 1af:	01 d0                	add    %edx,%eax
 1b1:	0f b6 00             	movzbl (%eax),%eax
 1b4:	84 c0                	test   %al,%al
 1b6:	75 ed                	jne    1a5 <strlen+0xf>
    ;
  return n;
 1b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1bb:	c9                   	leave  
 1bc:	c3                   	ret    

000001bd <memset>:

void*
memset(void *dst, int c, uint n)
{
 1bd:	55                   	push   %ebp
 1be:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1c0:	8b 45 10             	mov    0x10(%ebp),%eax
 1c3:	50                   	push   %eax
 1c4:	ff 75 0c             	pushl  0xc(%ebp)
 1c7:	ff 75 08             	pushl  0x8(%ebp)
 1ca:	e8 32 ff ff ff       	call   101 <stosb>
 1cf:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1d2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1d5:	c9                   	leave  
 1d6:	c3                   	ret    

000001d7 <strchr>:

char*
strchr(const char *s, char c)
{
 1d7:	55                   	push   %ebp
 1d8:	89 e5                	mov    %esp,%ebp
 1da:	83 ec 04             	sub    $0x4,%esp
 1dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e0:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1e3:	eb 14                	jmp    1f9 <strchr+0x22>
    if(*s == c)
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	0f b6 00             	movzbl (%eax),%eax
 1eb:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1ee:	75 05                	jne    1f5 <strchr+0x1e>
      return (char*)s;
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	eb 13                	jmp    208 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1f5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1f9:	8b 45 08             	mov    0x8(%ebp),%eax
 1fc:	0f b6 00             	movzbl (%eax),%eax
 1ff:	84 c0                	test   %al,%al
 201:	75 e2                	jne    1e5 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 203:	b8 00 00 00 00       	mov    $0x0,%eax
}
 208:	c9                   	leave  
 209:	c3                   	ret    

0000020a <gets>:

char*
gets(char *buf, int max)
{
 20a:	55                   	push   %ebp
 20b:	89 e5                	mov    %esp,%ebp
 20d:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 210:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 217:	eb 42                	jmp    25b <gets+0x51>
    cc = read(0, &c, 1);
 219:	83 ec 04             	sub    $0x4,%esp
 21c:	6a 01                	push   $0x1
 21e:	8d 45 ef             	lea    -0x11(%ebp),%eax
 221:	50                   	push   %eax
 222:	6a 00                	push   $0x0
 224:	e8 47 01 00 00       	call   370 <read>
 229:	83 c4 10             	add    $0x10,%esp
 22c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 22f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 233:	7e 33                	jle    268 <gets+0x5e>
      break;
    buf[i++] = c;
 235:	8b 45 f4             	mov    -0xc(%ebp),%eax
 238:	8d 50 01             	lea    0x1(%eax),%edx
 23b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 23e:	89 c2                	mov    %eax,%edx
 240:	8b 45 08             	mov    0x8(%ebp),%eax
 243:	01 c2                	add    %eax,%edx
 245:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 249:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 24b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 24f:	3c 0a                	cmp    $0xa,%al
 251:	74 16                	je     269 <gets+0x5f>
 253:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 257:	3c 0d                	cmp    $0xd,%al
 259:	74 0e                	je     269 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 25b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25e:	83 c0 01             	add    $0x1,%eax
 261:	3b 45 0c             	cmp    0xc(%ebp),%eax
 264:	7c b3                	jl     219 <gets+0xf>
 266:	eb 01                	jmp    269 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 268:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 269:	8b 55 f4             	mov    -0xc(%ebp),%edx
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	01 d0                	add    %edx,%eax
 271:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 274:	8b 45 08             	mov    0x8(%ebp),%eax
}
 277:	c9                   	leave  
 278:	c3                   	ret    

00000279 <stat>:

int
stat(char *n, struct stat *st)
{
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
 27c:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 27f:	83 ec 08             	sub    $0x8,%esp
 282:	6a 00                	push   $0x0
 284:	ff 75 08             	pushl  0x8(%ebp)
 287:	e8 0c 01 00 00       	call   398 <open>
 28c:	83 c4 10             	add    $0x10,%esp
 28f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 292:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 296:	79 07                	jns    29f <stat+0x26>
    return -1;
 298:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 29d:	eb 25                	jmp    2c4 <stat+0x4b>
  r = fstat(fd, st);
 29f:	83 ec 08             	sub    $0x8,%esp
 2a2:	ff 75 0c             	pushl  0xc(%ebp)
 2a5:	ff 75 f4             	pushl  -0xc(%ebp)
 2a8:	e8 03 01 00 00       	call   3b0 <fstat>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2b3:	83 ec 0c             	sub    $0xc,%esp
 2b6:	ff 75 f4             	pushl  -0xc(%ebp)
 2b9:	e8 c2 00 00 00       	call   380 <close>
 2be:	83 c4 10             	add    $0x10,%esp
  return r;
 2c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2c4:	c9                   	leave  
 2c5:	c3                   	ret    

000002c6 <atoi>:

int
atoi(const char *s)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2cc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2d3:	eb 25                	jmp    2fa <atoi+0x34>
    n = n*10 + *s++ - '0';
 2d5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2d8:	89 d0                	mov    %edx,%eax
 2da:	c1 e0 02             	shl    $0x2,%eax
 2dd:	01 d0                	add    %edx,%eax
 2df:	01 c0                	add    %eax,%eax
 2e1:	89 c1                	mov    %eax,%ecx
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	8d 50 01             	lea    0x1(%eax),%edx
 2e9:	89 55 08             	mov    %edx,0x8(%ebp)
 2ec:	0f b6 00             	movzbl (%eax),%eax
 2ef:	0f be c0             	movsbl %al,%eax
 2f2:	01 c8                	add    %ecx,%eax
 2f4:	83 e8 30             	sub    $0x30,%eax
 2f7:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2fa:	8b 45 08             	mov    0x8(%ebp),%eax
 2fd:	0f b6 00             	movzbl (%eax),%eax
 300:	3c 2f                	cmp    $0x2f,%al
 302:	7e 0a                	jle    30e <atoi+0x48>
 304:	8b 45 08             	mov    0x8(%ebp),%eax
 307:	0f b6 00             	movzbl (%eax),%eax
 30a:	3c 39                	cmp    $0x39,%al
 30c:	7e c7                	jle    2d5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 30e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 311:	c9                   	leave  
 312:	c3                   	ret    

00000313 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 313:	55                   	push   %ebp
 314:	89 e5                	mov    %esp,%ebp
 316:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 319:	8b 45 08             	mov    0x8(%ebp),%eax
 31c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 31f:	8b 45 0c             	mov    0xc(%ebp),%eax
 322:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 325:	eb 17                	jmp    33e <memmove+0x2b>
    *dst++ = *src++;
 327:	8b 45 fc             	mov    -0x4(%ebp),%eax
 32a:	8d 50 01             	lea    0x1(%eax),%edx
 32d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 330:	8b 55 f8             	mov    -0x8(%ebp),%edx
 333:	8d 4a 01             	lea    0x1(%edx),%ecx
 336:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 339:	0f b6 12             	movzbl (%edx),%edx
 33c:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 33e:	8b 45 10             	mov    0x10(%ebp),%eax
 341:	8d 50 ff             	lea    -0x1(%eax),%edx
 344:	89 55 10             	mov    %edx,0x10(%ebp)
 347:	85 c0                	test   %eax,%eax
 349:	7f dc                	jg     327 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 34e:	c9                   	leave  
 34f:	c3                   	ret    

00000350 <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
 350:	b8 01 00 00 00       	mov    $0x1,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <exit>:
SYSCALL(exit)
 358:	b8 02 00 00 00       	mov    $0x2,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <wait>:
SYSCALL(wait)
 360:	b8 03 00 00 00       	mov    $0x3,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <pipe>:
SYSCALL(pipe)
 368:	b8 04 00 00 00       	mov    $0x4,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <read>:
SYSCALL(read)
 370:	b8 05 00 00 00       	mov    $0x5,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <write>:
SYSCALL(write)
 378:	b8 10 00 00 00       	mov    $0x10,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <close>:
SYSCALL(close)
 380:	b8 15 00 00 00       	mov    $0x15,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <kill>:
SYSCALL(kill)
 388:	b8 06 00 00 00       	mov    $0x6,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <exec>:
SYSCALL(exec)
 390:	b8 07 00 00 00       	mov    $0x7,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <open>:
SYSCALL(open)
 398:	b8 0f 00 00 00       	mov    $0xf,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <mknod>:
SYSCALL(mknod)
 3a0:	b8 11 00 00 00       	mov    $0x11,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <unlink>:
SYSCALL(unlink)
 3a8:	b8 12 00 00 00       	mov    $0x12,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <fstat>:
SYSCALL(fstat)
 3b0:	b8 08 00 00 00       	mov    $0x8,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <link>:
SYSCALL(link)
 3b8:	b8 13 00 00 00       	mov    $0x13,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <mkdir>:
SYSCALL(mkdir)
 3c0:	b8 14 00 00 00       	mov    $0x14,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <chdir>:
SYSCALL(chdir)
 3c8:	b8 09 00 00 00       	mov    $0x9,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <dup>:
SYSCALL(dup)
 3d0:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <getpid>:
SYSCALL(getpid)
 3d8:	b8 0b 00 00 00       	mov    $0xb,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <sbrk>:
SYSCALL(sbrk)
 3e0:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <sleep>:
SYSCALL(sleep)
 3e8:	b8 0d 00 00 00       	mov    $0xd,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <uptime>:
SYSCALL(uptime)
 3f0:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <date>:

// Assignment starts here

SYSCALL(date)
 3f8:	b8 16 00 00 00       	mov    $0x16,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <str_ls_call1>:
 400:	6c                   	insb   (%dx),%es:(%edi)
 401:	73 5f                	jae    462 <ls_call6+0x4>
 403:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 406:	6c                   	insb   (%dx),%es:(%edi)
 407:	31 00                	xor    %eax,(%eax)

00000409 <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
 409:	b8 00 04 00 00       	mov    $0x400,%eax
 40e:	cd 41                	int    $0x41
 410:	c3                   	ret    

00000411 <str_ls_call2>:
 411:	6c                   	insb   (%dx),%es:(%edi)
 412:	73 5f                	jae    473 <ls_call7+0x4>
 414:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 417:	6c                   	insb   (%dx),%es:(%edi)
 418:	32 00                	xor    (%eax),%al

0000041a <ls_call2>:
CS550LSSYSCALL(ls_call2)
 41a:	b8 11 04 00 00       	mov    $0x411,%eax
 41f:	cd 41                	int    $0x41
 421:	c3                   	ret    

00000422 <str_ls_call3>:
 422:	6c                   	insb   (%dx),%es:(%edi)
 423:	73 5f                	jae    484 <ls_call8+0x4>
 425:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 428:	6c                   	insb   (%dx),%es:(%edi)
 429:	33 00                	xor    (%eax),%eax

0000042b <ls_call3>:
CS550LSSYSCALL(ls_call3)
 42b:	b8 22 04 00 00       	mov    $0x422,%eax
 430:	cd 41                	int    $0x41
 432:	c3                   	ret    

00000433 <str_ls_call4>:
 433:	6c                   	insb   (%dx),%es:(%edi)
 434:	73 5f                	jae    495 <ls_call9+0x4>
 436:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 439:	6c                   	insb   (%dx),%es:(%edi)
 43a:	34 00                	xor    $0x0,%al

0000043c <ls_call4>:
CS550LSSYSCALL(ls_call4)
 43c:	b8 33 04 00 00       	mov    $0x433,%eax
 441:	cd 41                	int    $0x41
 443:	c3                   	ret    

00000444 <str_ls_call5>:
 444:	6c                   	insb   (%dx),%es:(%edi)
 445:	73 5f                	jae    4a6 <ls_call10+0x3>
 447:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 44a:	6c                   	insb   (%dx),%es:(%edi)
 44b:	35                   	.byte 0x35
	...

0000044d <ls_call5>:
CS550LSSYSCALL(ls_call5)
 44d:	b8 44 04 00 00       	mov    $0x444,%eax
 452:	cd 41                	int    $0x41
 454:	c3                   	ret    

00000455 <str_ls_call6>:
 455:	6c                   	insb   (%dx),%es:(%edi)
 456:	73 5f                	jae    4b7 <ls_call11+0x2>
 458:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 45b:	6c                   	insb   (%dx),%es:(%edi)
 45c:	36                   	ss
	...

0000045e <ls_call6>:
CS550LSSYSCALL(ls_call6)
 45e:	b8 55 04 00 00       	mov    $0x455,%eax
 463:	cd 41                	int    $0x41
 465:	c3                   	ret    

00000466 <str_ls_call7>:
 466:	6c                   	insb   (%dx),%es:(%edi)
 467:	73 5f                	jae    4c8 <ls_call12+0x1>
 469:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 46c:	6c                   	insb   (%dx),%es:(%edi)
 46d:	37                   	aaa    
	...

0000046f <ls_call7>:
CS550LSSYSCALL(ls_call7)
 46f:	b8 66 04 00 00       	mov    $0x466,%eax
 474:	cd 41                	int    $0x41
 476:	c3                   	ret    

00000477 <str_ls_call8>:
 477:	6c                   	insb   (%dx),%es:(%edi)
 478:	73 5f                	jae    4d9 <ls_call13>
 47a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 47d:	6c                   	insb   (%dx),%es:(%edi)
 47e:	38 00                	cmp    %al,(%eax)

00000480 <ls_call8>:
CS550LSSYSCALL(ls_call8)
 480:	b8 77 04 00 00       	mov    $0x477,%eax
 485:	cd 41                	int    $0x41
 487:	c3                   	ret    

00000488 <str_ls_call9>:
 488:	6c                   	insb   (%dx),%es:(%edi)
 489:	73 5f                	jae    4ea <str_ls_call14+0x9>
 48b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 48e:	6c                   	insb   (%dx),%es:(%edi)
 48f:	39 00                	cmp    %eax,(%eax)

00000491 <ls_call9>:
CS550LSSYSCALL(ls_call9)
 491:	b8 88 04 00 00       	mov    $0x488,%eax
 496:	cd 41                	int    $0x41
 498:	c3                   	ret    

00000499 <str_ls_call10>:
 499:	6c                   	insb   (%dx),%es:(%edi)
 49a:	73 5f                	jae    4fb <str_ls_call15+0x8>
 49c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 49f:	6c                   	insb   (%dx),%es:(%edi)
 4a0:	31 30                	xor    %esi,(%eax)
	...

000004a3 <ls_call10>:
CS550LSSYSCALL(ls_call10)
 4a3:	b8 99 04 00 00       	mov    $0x499,%eax
 4a8:	cd 41                	int    $0x41
 4aa:	c3                   	ret    

000004ab <str_ls_call11>:
 4ab:	6c                   	insb   (%dx),%es:(%edi)
 4ac:	73 5f                	jae    50d <str_ls_call16+0x8>
 4ae:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4b1:	6c                   	insb   (%dx),%es:(%edi)
 4b2:	31 31                	xor    %esi,(%ecx)
	...

000004b5 <ls_call11>:
CS550LSSYSCALL(ls_call11)
 4b5:	b8 ab 04 00 00       	mov    $0x4ab,%eax
 4ba:	cd 41                	int    $0x41
 4bc:	c3                   	ret    

000004bd <str_ls_call12>:
 4bd:	6c                   	insb   (%dx),%es:(%edi)
 4be:	73 5f                	jae    51f <str_ls_call17+0x8>
 4c0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4c3:	6c                   	insb   (%dx),%es:(%edi)
 4c4:	31 32                	xor    %esi,(%edx)
	...

000004c7 <ls_call12>:
CS550LSSYSCALL(ls_call12)
 4c7:	b8 bd 04 00 00       	mov    $0x4bd,%eax
 4cc:	cd 41                	int    $0x41
 4ce:	c3                   	ret    

000004cf <str_ls_call13>:
 4cf:	6c                   	insb   (%dx),%es:(%edi)
 4d0:	73 5f                	jae    531 <str_ls_call18+0x8>
 4d2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4d5:	6c                   	insb   (%dx),%es:(%edi)
 4d6:	31 33                	xor    %esi,(%ebx)
	...

000004d9 <ls_call13>:
CS550LSSYSCALL(ls_call13)
 4d9:	b8 cf 04 00 00       	mov    $0x4cf,%eax
 4de:	cd 41                	int    $0x41
 4e0:	c3                   	ret    

000004e1 <str_ls_call14>:
 4e1:	6c                   	insb   (%dx),%es:(%edi)
 4e2:	73 5f                	jae    543 <str_ls_call19+0x8>
 4e4:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4e7:	6c                   	insb   (%dx),%es:(%edi)
 4e8:	31 34 00             	xor    %esi,(%eax,%eax,1)

000004eb <ls_call14>:
CS550LSSYSCALL(ls_call14)
 4eb:	b8 e1 04 00 00       	mov    $0x4e1,%eax
 4f0:	cd 41                	int    $0x41
 4f2:	c3                   	ret    

000004f3 <str_ls_call15>:
 4f3:	6c                   	insb   (%dx),%es:(%edi)
 4f4:	73 5f                	jae    555 <str_ls_call20+0x8>
 4f6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4f9:	6c                   	insb   (%dx),%es:(%edi)
 4fa:	31                   	.byte 0x31
 4fb:	35                   	.byte 0x35
	...

000004fd <ls_call15>:
CS550LSSYSCALL(ls_call15)
 4fd:	b8 f3 04 00 00       	mov    $0x4f3,%eax
 502:	cd 41                	int    $0x41
 504:	c3                   	ret    

00000505 <str_ls_call16>:
 505:	6c                   	insb   (%dx),%es:(%edi)
 506:	73 5f                	jae    567 <str_ls_call21+0x8>
 508:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 50b:	6c                   	insb   (%dx),%es:(%edi)
 50c:	31 36                	xor    %esi,(%esi)
	...

0000050f <ls_call16>:
CS550LSSYSCALL(ls_call16)
 50f:	b8 05 05 00 00       	mov    $0x505,%eax
 514:	cd 41                	int    $0x41
 516:	c3                   	ret    

00000517 <str_ls_call17>:
 517:	6c                   	insb   (%dx),%es:(%edi)
 518:	73 5f                	jae    579 <str_ls_call22+0x8>
 51a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 51d:	6c                   	insb   (%dx),%es:(%edi)
 51e:	31 37                	xor    %esi,(%edi)
	...

00000521 <ls_call17>:
CS550LSSYSCALL(ls_call17)
 521:	b8 17 05 00 00       	mov    $0x517,%eax
 526:	cd 41                	int    $0x41
 528:	c3                   	ret    

00000529 <str_ls_call18>:
 529:	6c                   	insb   (%dx),%es:(%edi)
 52a:	73 5f                	jae    58b <str_ls_call23+0x8>
 52c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 52f:	6c                   	insb   (%dx),%es:(%edi)
 530:	31 38                	xor    %edi,(%eax)
	...

00000533 <ls_call18>:
CS550LSSYSCALL(ls_call18)
 533:	b8 29 05 00 00       	mov    $0x529,%eax
 538:	cd 41                	int    $0x41
 53a:	c3                   	ret    

0000053b <str_ls_call19>:
 53b:	6c                   	insb   (%dx),%es:(%edi)
 53c:	73 5f                	jae    59d <str_ls_call24+0x8>
 53e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 541:	6c                   	insb   (%dx),%es:(%edi)
 542:	31 39                	xor    %edi,(%ecx)
	...

00000545 <ls_call19>:
CS550LSSYSCALL(ls_call19)
 545:	b8 3b 05 00 00       	mov    $0x53b,%eax
 54a:	cd 41                	int    $0x41
 54c:	c3                   	ret    

0000054d <str_ls_call20>:
 54d:	6c                   	insb   (%dx),%es:(%edi)
 54e:	73 5f                	jae    5af <str_ls_call25+0x8>
 550:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 553:	6c                   	insb   (%dx),%es:(%edi)
 554:	32 30                	xor    (%eax),%dh
	...

00000557 <ls_call20>:
CS550LSSYSCALL(ls_call20)
 557:	b8 4d 05 00 00       	mov    $0x54d,%eax
 55c:	cd 41                	int    $0x41
 55e:	c3                   	ret    

0000055f <str_ls_call21>:
 55f:	6c                   	insb   (%dx),%es:(%edi)
 560:	73 5f                	jae    5c1 <str_ls_call26+0x8>
 562:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 565:	6c                   	insb   (%dx),%es:(%edi)
 566:	32 31                	xor    (%ecx),%dh
	...

00000569 <ls_call21>:
CS550LSSYSCALL(ls_call21)
 569:	b8 5f 05 00 00       	mov    $0x55f,%eax
 56e:	cd 41                	int    $0x41
 570:	c3                   	ret    

00000571 <str_ls_call22>:
 571:	6c                   	insb   (%dx),%es:(%edi)
 572:	73 5f                	jae    5d3 <str_ls_call27+0x8>
 574:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 577:	6c                   	insb   (%dx),%es:(%edi)
 578:	32 32                	xor    (%edx),%dh
	...

0000057b <ls_call22>:
CS550LSSYSCALL(ls_call22)
 57b:	b8 71 05 00 00       	mov    $0x571,%eax
 580:	cd 41                	int    $0x41
 582:	c3                   	ret    

00000583 <str_ls_call23>:
 583:	6c                   	insb   (%dx),%es:(%edi)
 584:	73 5f                	jae    5e5 <str_ls_call28+0x8>
 586:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 589:	6c                   	insb   (%dx),%es:(%edi)
 58a:	32 33                	xor    (%ebx),%dh
	...

0000058d <ls_call23>:
CS550LSSYSCALL(ls_call23)
 58d:	b8 83 05 00 00       	mov    $0x583,%eax
 592:	cd 41                	int    $0x41
 594:	c3                   	ret    

00000595 <str_ls_call24>:
 595:	6c                   	insb   (%dx),%es:(%edi)
 596:	73 5f                	jae    5f7 <str_ls_call29+0x8>
 598:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 59b:	6c                   	insb   (%dx),%es:(%edi)
 59c:	32 34 00             	xor    (%eax,%eax,1),%dh

0000059f <ls_call24>:
CS550LSSYSCALL(ls_call24)
 59f:	b8 95 05 00 00       	mov    $0x595,%eax
 5a4:	cd 41                	int    $0x41
 5a6:	c3                   	ret    

000005a7 <str_ls_call25>:
 5a7:	6c                   	insb   (%dx),%es:(%edi)
 5a8:	73 5f                	jae    609 <str_ls_call30+0x8>
 5aa:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5ad:	6c                   	insb   (%dx),%es:(%edi)
 5ae:	32                   	.byte 0x32
 5af:	35                   	.byte 0x35
	...

000005b1 <ls_call25>:
CS550LSSYSCALL(ls_call25)
 5b1:	b8 a7 05 00 00       	mov    $0x5a7,%eax
 5b6:	cd 41                	int    $0x41
 5b8:	c3                   	ret    

000005b9 <str_ls_call26>:
 5b9:	6c                   	insb   (%dx),%es:(%edi)
 5ba:	73 5f                	jae    61b <str_ls_call31+0x8>
 5bc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5bf:	6c                   	insb   (%dx),%es:(%edi)
 5c0:	32 36                	xor    (%esi),%dh
	...

000005c3 <ls_call26>:
CS550LSSYSCALL(ls_call26)
 5c3:	b8 b9 05 00 00       	mov    $0x5b9,%eax
 5c8:	cd 41                	int    $0x41
 5ca:	c3                   	ret    

000005cb <str_ls_call27>:
 5cb:	6c                   	insb   (%dx),%es:(%edi)
 5cc:	73 5f                	jae    62d <str_ls_call32+0x8>
 5ce:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5d1:	6c                   	insb   (%dx),%es:(%edi)
 5d2:	32 37                	xor    (%edi),%dh
	...

000005d5 <ls_call27>:
CS550LSSYSCALL(ls_call27)
 5d5:	b8 cb 05 00 00       	mov    $0x5cb,%eax
 5da:	cd 41                	int    $0x41
 5dc:	c3                   	ret    

000005dd <str_ls_call28>:
 5dd:	6c                   	insb   (%dx),%es:(%edi)
 5de:	73 5f                	jae    63f <str_ls_call33+0x8>
 5e0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5e3:	6c                   	insb   (%dx),%es:(%edi)
 5e4:	32 38                	xor    (%eax),%bh
	...

000005e7 <ls_call28>:
CS550LSSYSCALL(ls_call28)
 5e7:	b8 dd 05 00 00       	mov    $0x5dd,%eax
 5ec:	cd 41                	int    $0x41
 5ee:	c3                   	ret    

000005ef <str_ls_call29>:
 5ef:	6c                   	insb   (%dx),%es:(%edi)
 5f0:	73 5f                	jae    651 <str_ls_call34+0x8>
 5f2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5f5:	6c                   	insb   (%dx),%es:(%edi)
 5f6:	32 39                	xor    (%ecx),%bh
	...

000005f9 <ls_call29>:
CS550LSSYSCALL(ls_call29)
 5f9:	b8 ef 05 00 00       	mov    $0x5ef,%eax
 5fe:	cd 41                	int    $0x41
 600:	c3                   	ret    

00000601 <str_ls_call30>:
 601:	6c                   	insb   (%dx),%es:(%edi)
 602:	73 5f                	jae    663 <str_ls_call35+0x8>
 604:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 607:	6c                   	insb   (%dx),%es:(%edi)
 608:	33 30                	xor    (%eax),%esi
	...

0000060b <ls_call30>:
CS550LSSYSCALL(ls_call30)
 60b:	b8 01 06 00 00       	mov    $0x601,%eax
 610:	cd 41                	int    $0x41
 612:	c3                   	ret    

00000613 <str_ls_call31>:
 613:	6c                   	insb   (%dx),%es:(%edi)
 614:	73 5f                	jae    675 <str_ls_call36+0x8>
 616:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 619:	6c                   	insb   (%dx),%es:(%edi)
 61a:	33 31                	xor    (%ecx),%esi
	...

0000061d <ls_call31>:
CS550LSSYSCALL(ls_call31)
 61d:	b8 13 06 00 00       	mov    $0x613,%eax
 622:	cd 41                	int    $0x41
 624:	c3                   	ret    

00000625 <str_ls_call32>:
 625:	6c                   	insb   (%dx),%es:(%edi)
 626:	73 5f                	jae    687 <str_ls_call37+0x8>
 628:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 62b:	6c                   	insb   (%dx),%es:(%edi)
 62c:	33 32                	xor    (%edx),%esi
	...

0000062f <ls_call32>:
CS550LSSYSCALL(ls_call32)
 62f:	b8 25 06 00 00       	mov    $0x625,%eax
 634:	cd 41                	int    $0x41
 636:	c3                   	ret    

00000637 <str_ls_call33>:
 637:	6c                   	insb   (%dx),%es:(%edi)
 638:	73 5f                	jae    699 <str_ls_call38+0x8>
 63a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 63d:	6c                   	insb   (%dx),%es:(%edi)
 63e:	33 33                	xor    (%ebx),%esi
	...

00000641 <ls_call33>:
CS550LSSYSCALL(ls_call33)
 641:	b8 37 06 00 00       	mov    $0x637,%eax
 646:	cd 41                	int    $0x41
 648:	c3                   	ret    

00000649 <str_ls_call34>:
 649:	6c                   	insb   (%dx),%es:(%edi)
 64a:	73 5f                	jae    6ab <str_ls_call39+0x8>
 64c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 64f:	6c                   	insb   (%dx),%es:(%edi)
 650:	33 34 00             	xor    (%eax,%eax,1),%esi

00000653 <ls_call34>:
CS550LSSYSCALL(ls_call34)
 653:	b8 49 06 00 00       	mov    $0x649,%eax
 658:	cd 41                	int    $0x41
 65a:	c3                   	ret    

0000065b <str_ls_call35>:
 65b:	6c                   	insb   (%dx),%es:(%edi)
 65c:	73 5f                	jae    6bd <str_ls_call40+0x8>
 65e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 661:	6c                   	insb   (%dx),%es:(%edi)
 662:	33                   	.byte 0x33
 663:	35                   	.byte 0x35
	...

00000665 <ls_call35>:
CS550LSSYSCALL(ls_call35)
 665:	b8 5b 06 00 00       	mov    $0x65b,%eax
 66a:	cd 41                	int    $0x41
 66c:	c3                   	ret    

0000066d <str_ls_call36>:
 66d:	6c                   	insb   (%dx),%es:(%edi)
 66e:	73 5f                	jae    6cf <str_ls_call41+0x8>
 670:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 673:	6c                   	insb   (%dx),%es:(%edi)
 674:	33 36                	xor    (%esi),%esi
	...

00000677 <ls_call36>:
CS550LSSYSCALL(ls_call36)
 677:	b8 6d 06 00 00       	mov    $0x66d,%eax
 67c:	cd 41                	int    $0x41
 67e:	c3                   	ret    

0000067f <str_ls_call37>:
 67f:	6c                   	insb   (%dx),%es:(%edi)
 680:	73 5f                	jae    6e1 <str_ls_call42+0x8>
 682:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 685:	6c                   	insb   (%dx),%es:(%edi)
 686:	33 37                	xor    (%edi),%esi
	...

00000689 <ls_call37>:
CS550LSSYSCALL(ls_call37)
 689:	b8 7f 06 00 00       	mov    $0x67f,%eax
 68e:	cd 41                	int    $0x41
 690:	c3                   	ret    

00000691 <str_ls_call38>:
 691:	6c                   	insb   (%dx),%es:(%edi)
 692:	73 5f                	jae    6f3 <str_ls_call43+0x8>
 694:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 697:	6c                   	insb   (%dx),%es:(%edi)
 698:	33 38                	xor    (%eax),%edi
	...

0000069b <ls_call38>:
CS550LSSYSCALL(ls_call38)
 69b:	b8 91 06 00 00       	mov    $0x691,%eax
 6a0:	cd 41                	int    $0x41
 6a2:	c3                   	ret    

000006a3 <str_ls_call39>:
 6a3:	6c                   	insb   (%dx),%es:(%edi)
 6a4:	73 5f                	jae    705 <str_ls_call44+0x8>
 6a6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6a9:	6c                   	insb   (%dx),%es:(%edi)
 6aa:	33 39                	xor    (%ecx),%edi
	...

000006ad <ls_call39>:
CS550LSSYSCALL(ls_call39)
 6ad:	b8 a3 06 00 00       	mov    $0x6a3,%eax
 6b2:	cd 41                	int    $0x41
 6b4:	c3                   	ret    

000006b5 <str_ls_call40>:
 6b5:	6c                   	insb   (%dx),%es:(%edi)
 6b6:	73 5f                	jae    717 <str_ls_call45+0x8>
 6b8:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6bb:	6c                   	insb   (%dx),%es:(%edi)
 6bc:	34 30                	xor    $0x30,%al
	...

000006bf <ls_call40>:
CS550LSSYSCALL(ls_call40)
 6bf:	b8 b5 06 00 00       	mov    $0x6b5,%eax
 6c4:	cd 41                	int    $0x41
 6c6:	c3                   	ret    

000006c7 <str_ls_call41>:
 6c7:	6c                   	insb   (%dx),%es:(%edi)
 6c8:	73 5f                	jae    729 <str_ls_call46+0x8>
 6ca:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6cd:	6c                   	insb   (%dx),%es:(%edi)
 6ce:	34 31                	xor    $0x31,%al
	...

000006d1 <ls_call41>:
CS550LSSYSCALL(ls_call41)
 6d1:	b8 c7 06 00 00       	mov    $0x6c7,%eax
 6d6:	cd 41                	int    $0x41
 6d8:	c3                   	ret    

000006d9 <str_ls_call42>:
 6d9:	6c                   	insb   (%dx),%es:(%edi)
 6da:	73 5f                	jae    73b <str_ls_call47+0x8>
 6dc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6df:	6c                   	insb   (%dx),%es:(%edi)
 6e0:	34 32                	xor    $0x32,%al
	...

000006e3 <ls_call42>:
CS550LSSYSCALL(ls_call42)
 6e3:	b8 d9 06 00 00       	mov    $0x6d9,%eax
 6e8:	cd 41                	int    $0x41
 6ea:	c3                   	ret    

000006eb <str_ls_call43>:
 6eb:	6c                   	insb   (%dx),%es:(%edi)
 6ec:	73 5f                	jae    74d <str_ls_call48+0x8>
 6ee:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6f1:	6c                   	insb   (%dx),%es:(%edi)
 6f2:	34 33                	xor    $0x33,%al
	...

000006f5 <ls_call43>:
CS550LSSYSCALL(ls_call43)
 6f5:	b8 eb 06 00 00       	mov    $0x6eb,%eax
 6fa:	cd 41                	int    $0x41
 6fc:	c3                   	ret    

000006fd <str_ls_call44>:
 6fd:	6c                   	insb   (%dx),%es:(%edi)
 6fe:	73 5f                	jae    75f <str_ls_call49+0x8>
 700:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 703:	6c                   	insb   (%dx),%es:(%edi)
 704:	34 34                	xor    $0x34,%al
	...

00000707 <ls_call44>:
CS550LSSYSCALL(ls_call44)
 707:	b8 fd 06 00 00       	mov    $0x6fd,%eax
 70c:	cd 41                	int    $0x41
 70e:	c3                   	ret    

0000070f <str_ls_call45>:
 70f:	6c                   	insb   (%dx),%es:(%edi)
 710:	73 5f                	jae    771 <str_ls_call50+0x8>
 712:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 715:	6c                   	insb   (%dx),%es:(%edi)
 716:	34 35                	xor    $0x35,%al
	...

00000719 <ls_call45>:
CS550LSSYSCALL(ls_call45)
 719:	b8 0f 07 00 00       	mov    $0x70f,%eax
 71e:	cd 41                	int    $0x41
 720:	c3                   	ret    

00000721 <str_ls_call46>:
 721:	6c                   	insb   (%dx),%es:(%edi)
 722:	73 5f                	jae    783 <str_ht_call1+0x8>
 724:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 727:	6c                   	insb   (%dx),%es:(%edi)
 728:	34 36                	xor    $0x36,%al
	...

0000072b <ls_call46>:
CS550LSSYSCALL(ls_call46)
 72b:	b8 21 07 00 00       	mov    $0x721,%eax
 730:	cd 41                	int    $0x41
 732:	c3                   	ret    

00000733 <str_ls_call47>:
 733:	6c                   	insb   (%dx),%es:(%edi)
 734:	73 5f                	jae    795 <ht_call2>
 736:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 739:	6c                   	insb   (%dx),%es:(%edi)
 73a:	34 37                	xor    $0x37,%al
	...

0000073d <ls_call47>:
CS550LSSYSCALL(ls_call47)
 73d:	b8 33 07 00 00       	mov    $0x733,%eax
 742:	cd 41                	int    $0x41
 744:	c3                   	ret    

00000745 <str_ls_call48>:
 745:	6c                   	insb   (%dx),%es:(%edi)
 746:	73 5f                	jae    7a7 <ht_call3+0x1>
 748:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 74b:	6c                   	insb   (%dx),%es:(%edi)
 74c:	34 38                	xor    $0x38,%al
	...

0000074f <ls_call48>:
CS550LSSYSCALL(ls_call48)
 74f:	b8 45 07 00 00       	mov    $0x745,%eax
 754:	cd 41                	int    $0x41
 756:	c3                   	ret    

00000757 <str_ls_call49>:
 757:	6c                   	insb   (%dx),%es:(%edi)
 758:	73 5f                	jae    7b9 <ht_call4+0x2>
 75a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 75d:	6c                   	insb   (%dx),%es:(%edi)
 75e:	34 39                	xor    $0x39,%al
	...

00000761 <ls_call49>:
CS550LSSYSCALL(ls_call49)
 761:	b8 57 07 00 00       	mov    $0x757,%eax
 766:	cd 41                	int    $0x41
 768:	c3                   	ret    

00000769 <str_ls_call50>:
 769:	6c                   	insb   (%dx),%es:(%edi)
 76a:	73 5f                	jae    7cb <ht_call5+0x3>
 76c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 76f:	6c                   	insb   (%dx),%es:(%edi)
 770:	35                   	.byte 0x35
 771:	30 00                	xor    %al,(%eax)

00000773 <ls_call50>:
CS550LSSYSCALL(ls_call50)
 773:	b8 69 07 00 00       	mov    $0x769,%eax
 778:	cd 41                	int    $0x41
 77a:	c3                   	ret    

0000077b <str_ht_call1>:
 77b:	68 74 5f 63 61       	push   $0x61635f74
 780:	6c                   	insb   (%dx),%es:(%edi)
 781:	6c                   	insb   (%dx),%es:(%edi)
 782:	31 00                	xor    %eax,(%eax)

00000784 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
 784:	b8 7b 07 00 00       	mov    $0x77b,%eax
 789:	cd 42                	int    $0x42
 78b:	c3                   	ret    

0000078c <str_ht_call2>:
 78c:	68 74 5f 63 61       	push   $0x61635f74
 791:	6c                   	insb   (%dx),%es:(%edi)
 792:	6c                   	insb   (%dx),%es:(%edi)
 793:	32 00                	xor    (%eax),%al

00000795 <ht_call2>:
CS550HTSYSCALL(ht_call2)
 795:	b8 8c 07 00 00       	mov    $0x78c,%eax
 79a:	cd 42                	int    $0x42
 79c:	c3                   	ret    

0000079d <str_ht_call3>:
 79d:	68 74 5f 63 61       	push   $0x61635f74
 7a2:	6c                   	insb   (%dx),%es:(%edi)
 7a3:	6c                   	insb   (%dx),%es:(%edi)
 7a4:	33 00                	xor    (%eax),%eax

000007a6 <ht_call3>:
CS550HTSYSCALL(ht_call3)
 7a6:	b8 9d 07 00 00       	mov    $0x79d,%eax
 7ab:	cd 42                	int    $0x42
 7ad:	c3                   	ret    

000007ae <str_ht_call4>:
 7ae:	68 74 5f 63 61       	push   $0x61635f74
 7b3:	6c                   	insb   (%dx),%es:(%edi)
 7b4:	6c                   	insb   (%dx),%es:(%edi)
 7b5:	34 00                	xor    $0x0,%al

000007b7 <ht_call4>:
CS550HTSYSCALL(ht_call4)
 7b7:	b8 ae 07 00 00       	mov    $0x7ae,%eax
 7bc:	cd 42                	int    $0x42
 7be:	c3                   	ret    

000007bf <str_ht_call5>:
 7bf:	68 74 5f 63 61       	push   $0x61635f74
 7c4:	6c                   	insb   (%dx),%es:(%edi)
 7c5:	6c                   	insb   (%dx),%es:(%edi)
 7c6:	35                   	.byte 0x35
	...

000007c8 <ht_call5>:
CS550HTSYSCALL(ht_call5)
 7c8:	b8 bf 07 00 00       	mov    $0x7bf,%eax
 7cd:	cd 42                	int    $0x42
 7cf:	c3                   	ret    

000007d0 <str_ht_call6>:
 7d0:	68 74 5f 63 61       	push   $0x61635f74
 7d5:	6c                   	insb   (%dx),%es:(%edi)
 7d6:	6c                   	insb   (%dx),%es:(%edi)
 7d7:	36                   	ss
	...

000007d9 <ht_call6>:
CS550HTSYSCALL(ht_call6)
 7d9:	b8 d0 07 00 00       	mov    $0x7d0,%eax
 7de:	cd 42                	int    $0x42
 7e0:	c3                   	ret    

000007e1 <str_ht_call7>:
 7e1:	68 74 5f 63 61       	push   $0x61635f74
 7e6:	6c                   	insb   (%dx),%es:(%edi)
 7e7:	6c                   	insb   (%dx),%es:(%edi)
 7e8:	37                   	aaa    
	...

000007ea <ht_call7>:
CS550HTSYSCALL(ht_call7)
 7ea:	b8 e1 07 00 00       	mov    $0x7e1,%eax
 7ef:	cd 42                	int    $0x42
 7f1:	c3                   	ret    

000007f2 <str_ht_call8>:
 7f2:	68 74 5f 63 61       	push   $0x61635f74
 7f7:	6c                   	insb   (%dx),%es:(%edi)
 7f8:	6c                   	insb   (%dx),%es:(%edi)
 7f9:	38 00                	cmp    %al,(%eax)

000007fb <ht_call8>:
CS550HTSYSCALL(ht_call8)
 7fb:	b8 f2 07 00 00       	mov    $0x7f2,%eax
 800:	cd 42                	int    $0x42
 802:	c3                   	ret    

00000803 <str_ht_call9>:
 803:	68 74 5f 63 61       	push   $0x61635f74
 808:	6c                   	insb   (%dx),%es:(%edi)
 809:	6c                   	insb   (%dx),%es:(%edi)
 80a:	39 00                	cmp    %eax,(%eax)

0000080c <ht_call9>:
CS550HTSYSCALL(ht_call9)
 80c:	b8 03 08 00 00       	mov    $0x803,%eax
 811:	cd 42                	int    $0x42
 813:	c3                   	ret    

00000814 <str_ht_call10>:
 814:	68 74 5f 63 61       	push   $0x61635f74
 819:	6c                   	insb   (%dx),%es:(%edi)
 81a:	6c                   	insb   (%dx),%es:(%edi)
 81b:	31 30                	xor    %esi,(%eax)
	...

0000081e <ht_call10>:
CS550HTSYSCALL(ht_call10)
 81e:	b8 14 08 00 00       	mov    $0x814,%eax
 823:	cd 42                	int    $0x42
 825:	c3                   	ret    

00000826 <str_ht_call11>:
 826:	68 74 5f 63 61       	push   $0x61635f74
 82b:	6c                   	insb   (%dx),%es:(%edi)
 82c:	6c                   	insb   (%dx),%es:(%edi)
 82d:	31 31                	xor    %esi,(%ecx)
	...

00000830 <ht_call11>:
CS550HTSYSCALL(ht_call11)
 830:	b8 26 08 00 00       	mov    $0x826,%eax
 835:	cd 42                	int    $0x42
 837:	c3                   	ret    

00000838 <str_ht_call12>:
 838:	68 74 5f 63 61       	push   $0x61635f74
 83d:	6c                   	insb   (%dx),%es:(%edi)
 83e:	6c                   	insb   (%dx),%es:(%edi)
 83f:	31 32                	xor    %esi,(%edx)
	...

00000842 <ht_call12>:
CS550HTSYSCALL(ht_call12)
 842:	b8 38 08 00 00       	mov    $0x838,%eax
 847:	cd 42                	int    $0x42
 849:	c3                   	ret    

0000084a <str_ht_call13>:
 84a:	68 74 5f 63 61       	push   $0x61635f74
 84f:	6c                   	insb   (%dx),%es:(%edi)
 850:	6c                   	insb   (%dx),%es:(%edi)
 851:	31 33                	xor    %esi,(%ebx)
	...

00000854 <ht_call13>:
CS550HTSYSCALL(ht_call13)
 854:	b8 4a 08 00 00       	mov    $0x84a,%eax
 859:	cd 42                	int    $0x42
 85b:	c3                   	ret    

0000085c <str_ht_call14>:
 85c:	68 74 5f 63 61       	push   $0x61635f74
 861:	6c                   	insb   (%dx),%es:(%edi)
 862:	6c                   	insb   (%dx),%es:(%edi)
 863:	31 34 00             	xor    %esi,(%eax,%eax,1)

00000866 <ht_call14>:
CS550HTSYSCALL(ht_call14)
 866:	b8 5c 08 00 00       	mov    $0x85c,%eax
 86b:	cd 42                	int    $0x42
 86d:	c3                   	ret    

0000086e <str_ht_call15>:
 86e:	68 74 5f 63 61       	push   $0x61635f74
 873:	6c                   	insb   (%dx),%es:(%edi)
 874:	6c                   	insb   (%dx),%es:(%edi)
 875:	31                   	.byte 0x31
 876:	35                   	.byte 0x35
	...

00000878 <ht_call15>:
CS550HTSYSCALL(ht_call15)
 878:	b8 6e 08 00 00       	mov    $0x86e,%eax
 87d:	cd 42                	int    $0x42
 87f:	c3                   	ret    

00000880 <str_ht_call16>:
 880:	68 74 5f 63 61       	push   $0x61635f74
 885:	6c                   	insb   (%dx),%es:(%edi)
 886:	6c                   	insb   (%dx),%es:(%edi)
 887:	31 36                	xor    %esi,(%esi)
	...

0000088a <ht_call16>:
CS550HTSYSCALL(ht_call16)
 88a:	b8 80 08 00 00       	mov    $0x880,%eax
 88f:	cd 42                	int    $0x42
 891:	c3                   	ret    

00000892 <str_ht_call17>:
 892:	68 74 5f 63 61       	push   $0x61635f74
 897:	6c                   	insb   (%dx),%es:(%edi)
 898:	6c                   	insb   (%dx),%es:(%edi)
 899:	31 37                	xor    %esi,(%edi)
	...

0000089c <ht_call17>:
CS550HTSYSCALL(ht_call17)
 89c:	b8 92 08 00 00       	mov    $0x892,%eax
 8a1:	cd 42                	int    $0x42
 8a3:	c3                   	ret    

000008a4 <str_ht_call18>:
 8a4:	68 74 5f 63 61       	push   $0x61635f74
 8a9:	6c                   	insb   (%dx),%es:(%edi)
 8aa:	6c                   	insb   (%dx),%es:(%edi)
 8ab:	31 38                	xor    %edi,(%eax)
	...

000008ae <ht_call18>:
CS550HTSYSCALL(ht_call18)
 8ae:	b8 a4 08 00 00       	mov    $0x8a4,%eax
 8b3:	cd 42                	int    $0x42
 8b5:	c3                   	ret    

000008b6 <str_ht_call19>:
 8b6:	68 74 5f 63 61       	push   $0x61635f74
 8bb:	6c                   	insb   (%dx),%es:(%edi)
 8bc:	6c                   	insb   (%dx),%es:(%edi)
 8bd:	31 39                	xor    %edi,(%ecx)
	...

000008c0 <ht_call19>:
CS550HTSYSCALL(ht_call19)
 8c0:	b8 b6 08 00 00       	mov    $0x8b6,%eax
 8c5:	cd 42                	int    $0x42
 8c7:	c3                   	ret    

000008c8 <str_ht_call20>:
 8c8:	68 74 5f 63 61       	push   $0x61635f74
 8cd:	6c                   	insb   (%dx),%es:(%edi)
 8ce:	6c                   	insb   (%dx),%es:(%edi)
 8cf:	32 30                	xor    (%eax),%dh
	...

000008d2 <ht_call20>:
CS550HTSYSCALL(ht_call20)
 8d2:	b8 c8 08 00 00       	mov    $0x8c8,%eax
 8d7:	cd 42                	int    $0x42
 8d9:	c3                   	ret    

000008da <str_ht_call21>:
 8da:	68 74 5f 63 61       	push   $0x61635f74
 8df:	6c                   	insb   (%dx),%es:(%edi)
 8e0:	6c                   	insb   (%dx),%es:(%edi)
 8e1:	32 31                	xor    (%ecx),%dh
	...

000008e4 <ht_call21>:
CS550HTSYSCALL(ht_call21)
 8e4:	b8 da 08 00 00       	mov    $0x8da,%eax
 8e9:	cd 42                	int    $0x42
 8eb:	c3                   	ret    

000008ec <str_ht_call22>:
 8ec:	68 74 5f 63 61       	push   $0x61635f74
 8f1:	6c                   	insb   (%dx),%es:(%edi)
 8f2:	6c                   	insb   (%dx),%es:(%edi)
 8f3:	32 32                	xor    (%edx),%dh
	...

000008f6 <ht_call22>:
CS550HTSYSCALL(ht_call22)
 8f6:	b8 ec 08 00 00       	mov    $0x8ec,%eax
 8fb:	cd 42                	int    $0x42
 8fd:	c3                   	ret    

000008fe <str_ht_call23>:
 8fe:	68 74 5f 63 61       	push   $0x61635f74
 903:	6c                   	insb   (%dx),%es:(%edi)
 904:	6c                   	insb   (%dx),%es:(%edi)
 905:	32 33                	xor    (%ebx),%dh
	...

00000908 <ht_call23>:
CS550HTSYSCALL(ht_call23)
 908:	b8 fe 08 00 00       	mov    $0x8fe,%eax
 90d:	cd 42                	int    $0x42
 90f:	c3                   	ret    

00000910 <str_ht_call24>:
 910:	68 74 5f 63 61       	push   $0x61635f74
 915:	6c                   	insb   (%dx),%es:(%edi)
 916:	6c                   	insb   (%dx),%es:(%edi)
 917:	32 34 00             	xor    (%eax,%eax,1),%dh

0000091a <ht_call24>:
CS550HTSYSCALL(ht_call24)
 91a:	b8 10 09 00 00       	mov    $0x910,%eax
 91f:	cd 42                	int    $0x42
 921:	c3                   	ret    

00000922 <str_ht_call25>:
 922:	68 74 5f 63 61       	push   $0x61635f74
 927:	6c                   	insb   (%dx),%es:(%edi)
 928:	6c                   	insb   (%dx),%es:(%edi)
 929:	32                   	.byte 0x32
 92a:	35                   	.byte 0x35
	...

0000092c <ht_call25>:
CS550HTSYSCALL(ht_call25)
 92c:	b8 22 09 00 00       	mov    $0x922,%eax
 931:	cd 42                	int    $0x42
 933:	c3                   	ret    

00000934 <str_ht_call26>:
 934:	68 74 5f 63 61       	push   $0x61635f74
 939:	6c                   	insb   (%dx),%es:(%edi)
 93a:	6c                   	insb   (%dx),%es:(%edi)
 93b:	32 36                	xor    (%esi),%dh
	...

0000093e <ht_call26>:
CS550HTSYSCALL(ht_call26)
 93e:	b8 34 09 00 00       	mov    $0x934,%eax
 943:	cd 42                	int    $0x42
 945:	c3                   	ret    

00000946 <str_ht_call27>:
 946:	68 74 5f 63 61       	push   $0x61635f74
 94b:	6c                   	insb   (%dx),%es:(%edi)
 94c:	6c                   	insb   (%dx),%es:(%edi)
 94d:	32 37                	xor    (%edi),%dh
	...

00000950 <ht_call27>:
CS550HTSYSCALL(ht_call27)
 950:	b8 46 09 00 00       	mov    $0x946,%eax
 955:	cd 42                	int    $0x42
 957:	c3                   	ret    

00000958 <str_ht_call28>:
 958:	68 74 5f 63 61       	push   $0x61635f74
 95d:	6c                   	insb   (%dx),%es:(%edi)
 95e:	6c                   	insb   (%dx),%es:(%edi)
 95f:	32 38                	xor    (%eax),%bh
	...

00000962 <ht_call28>:
CS550HTSYSCALL(ht_call28)
 962:	b8 58 09 00 00       	mov    $0x958,%eax
 967:	cd 42                	int    $0x42
 969:	c3                   	ret    

0000096a <str_ht_call29>:
 96a:	68 74 5f 63 61       	push   $0x61635f74
 96f:	6c                   	insb   (%dx),%es:(%edi)
 970:	6c                   	insb   (%dx),%es:(%edi)
 971:	32 39                	xor    (%ecx),%bh
	...

00000974 <ht_call29>:
CS550HTSYSCALL(ht_call29)
 974:	b8 6a 09 00 00       	mov    $0x96a,%eax
 979:	cd 42                	int    $0x42
 97b:	c3                   	ret    

0000097c <str_ht_call30>:
 97c:	68 74 5f 63 61       	push   $0x61635f74
 981:	6c                   	insb   (%dx),%es:(%edi)
 982:	6c                   	insb   (%dx),%es:(%edi)
 983:	33 30                	xor    (%eax),%esi
	...

00000986 <ht_call30>:
CS550HTSYSCALL(ht_call30)
 986:	b8 7c 09 00 00       	mov    $0x97c,%eax
 98b:	cd 42                	int    $0x42
 98d:	c3                   	ret    

0000098e <str_ht_call31>:
 98e:	68 74 5f 63 61       	push   $0x61635f74
 993:	6c                   	insb   (%dx),%es:(%edi)
 994:	6c                   	insb   (%dx),%es:(%edi)
 995:	33 31                	xor    (%ecx),%esi
	...

00000998 <ht_call31>:
CS550HTSYSCALL(ht_call31)
 998:	b8 8e 09 00 00       	mov    $0x98e,%eax
 99d:	cd 42                	int    $0x42
 99f:	c3                   	ret    

000009a0 <str_ht_call32>:
 9a0:	68 74 5f 63 61       	push   $0x61635f74
 9a5:	6c                   	insb   (%dx),%es:(%edi)
 9a6:	6c                   	insb   (%dx),%es:(%edi)
 9a7:	33 32                	xor    (%edx),%esi
	...

000009aa <ht_call32>:
CS550HTSYSCALL(ht_call32)
 9aa:	b8 a0 09 00 00       	mov    $0x9a0,%eax
 9af:	cd 42                	int    $0x42
 9b1:	c3                   	ret    

000009b2 <str_ht_call33>:
 9b2:	68 74 5f 63 61       	push   $0x61635f74
 9b7:	6c                   	insb   (%dx),%es:(%edi)
 9b8:	6c                   	insb   (%dx),%es:(%edi)
 9b9:	33 33                	xor    (%ebx),%esi
	...

000009bc <ht_call33>:
CS550HTSYSCALL(ht_call33)
 9bc:	b8 b2 09 00 00       	mov    $0x9b2,%eax
 9c1:	cd 42                	int    $0x42
 9c3:	c3                   	ret    

000009c4 <str_ht_call34>:
 9c4:	68 74 5f 63 61       	push   $0x61635f74
 9c9:	6c                   	insb   (%dx),%es:(%edi)
 9ca:	6c                   	insb   (%dx),%es:(%edi)
 9cb:	33 34 00             	xor    (%eax,%eax,1),%esi

000009ce <ht_call34>:
CS550HTSYSCALL(ht_call34)
 9ce:	b8 c4 09 00 00       	mov    $0x9c4,%eax
 9d3:	cd 42                	int    $0x42
 9d5:	c3                   	ret    

000009d6 <str_ht_call35>:
 9d6:	68 74 5f 63 61       	push   $0x61635f74
 9db:	6c                   	insb   (%dx),%es:(%edi)
 9dc:	6c                   	insb   (%dx),%es:(%edi)
 9dd:	33                   	.byte 0x33
 9de:	35                   	.byte 0x35
	...

000009e0 <ht_call35>:
CS550HTSYSCALL(ht_call35)
 9e0:	b8 d6 09 00 00       	mov    $0x9d6,%eax
 9e5:	cd 42                	int    $0x42
 9e7:	c3                   	ret    

000009e8 <str_ht_call36>:
 9e8:	68 74 5f 63 61       	push   $0x61635f74
 9ed:	6c                   	insb   (%dx),%es:(%edi)
 9ee:	6c                   	insb   (%dx),%es:(%edi)
 9ef:	33 36                	xor    (%esi),%esi
	...

000009f2 <ht_call36>:
CS550HTSYSCALL(ht_call36)
 9f2:	b8 e8 09 00 00       	mov    $0x9e8,%eax
 9f7:	cd 42                	int    $0x42
 9f9:	c3                   	ret    

000009fa <str_ht_call37>:
 9fa:	68 74 5f 63 61       	push   $0x61635f74
 9ff:	6c                   	insb   (%dx),%es:(%edi)
 a00:	6c                   	insb   (%dx),%es:(%edi)
 a01:	33 37                	xor    (%edi),%esi
	...

00000a04 <ht_call37>:
CS550HTSYSCALL(ht_call37)
 a04:	b8 fa 09 00 00       	mov    $0x9fa,%eax
 a09:	cd 42                	int    $0x42
 a0b:	c3                   	ret    

00000a0c <str_ht_call38>:
 a0c:	68 74 5f 63 61       	push   $0x61635f74
 a11:	6c                   	insb   (%dx),%es:(%edi)
 a12:	6c                   	insb   (%dx),%es:(%edi)
 a13:	33 38                	xor    (%eax),%edi
	...

00000a16 <ht_call38>:
CS550HTSYSCALL(ht_call38)
 a16:	b8 0c 0a 00 00       	mov    $0xa0c,%eax
 a1b:	cd 42                	int    $0x42
 a1d:	c3                   	ret    

00000a1e <str_ht_call39>:
 a1e:	68 74 5f 63 61       	push   $0x61635f74
 a23:	6c                   	insb   (%dx),%es:(%edi)
 a24:	6c                   	insb   (%dx),%es:(%edi)
 a25:	33 39                	xor    (%ecx),%edi
	...

00000a28 <ht_call39>:
CS550HTSYSCALL(ht_call39)
 a28:	b8 1e 0a 00 00       	mov    $0xa1e,%eax
 a2d:	cd 42                	int    $0x42
 a2f:	c3                   	ret    

00000a30 <str_ht_call40>:
 a30:	68 74 5f 63 61       	push   $0x61635f74
 a35:	6c                   	insb   (%dx),%es:(%edi)
 a36:	6c                   	insb   (%dx),%es:(%edi)
 a37:	34 30                	xor    $0x30,%al
	...

00000a3a <ht_call40>:
CS550HTSYSCALL(ht_call40)
 a3a:	b8 30 0a 00 00       	mov    $0xa30,%eax
 a3f:	cd 42                	int    $0x42
 a41:	c3                   	ret    

00000a42 <str_ht_call41>:
 a42:	68 74 5f 63 61       	push   $0x61635f74
 a47:	6c                   	insb   (%dx),%es:(%edi)
 a48:	6c                   	insb   (%dx),%es:(%edi)
 a49:	34 31                	xor    $0x31,%al
	...

00000a4c <ht_call41>:
CS550HTSYSCALL(ht_call41)
 a4c:	b8 42 0a 00 00       	mov    $0xa42,%eax
 a51:	cd 42                	int    $0x42
 a53:	c3                   	ret    

00000a54 <str_ht_call42>:
 a54:	68 74 5f 63 61       	push   $0x61635f74
 a59:	6c                   	insb   (%dx),%es:(%edi)
 a5a:	6c                   	insb   (%dx),%es:(%edi)
 a5b:	34 32                	xor    $0x32,%al
	...

00000a5e <ht_call42>:
CS550HTSYSCALL(ht_call42)
 a5e:	b8 54 0a 00 00       	mov    $0xa54,%eax
 a63:	cd 42                	int    $0x42
 a65:	c3                   	ret    

00000a66 <str_ht_call43>:
 a66:	68 74 5f 63 61       	push   $0x61635f74
 a6b:	6c                   	insb   (%dx),%es:(%edi)
 a6c:	6c                   	insb   (%dx),%es:(%edi)
 a6d:	34 33                	xor    $0x33,%al
	...

00000a70 <ht_call43>:
CS550HTSYSCALL(ht_call43)
 a70:	b8 66 0a 00 00       	mov    $0xa66,%eax
 a75:	cd 42                	int    $0x42
 a77:	c3                   	ret    

00000a78 <str_ht_call44>:
 a78:	68 74 5f 63 61       	push   $0x61635f74
 a7d:	6c                   	insb   (%dx),%es:(%edi)
 a7e:	6c                   	insb   (%dx),%es:(%edi)
 a7f:	34 34                	xor    $0x34,%al
	...

00000a82 <ht_call44>:
CS550HTSYSCALL(ht_call44)
 a82:	b8 78 0a 00 00       	mov    $0xa78,%eax
 a87:	cd 42                	int    $0x42
 a89:	c3                   	ret    

00000a8a <str_ht_call45>:
 a8a:	68 74 5f 63 61       	push   $0x61635f74
 a8f:	6c                   	insb   (%dx),%es:(%edi)
 a90:	6c                   	insb   (%dx),%es:(%edi)
 a91:	34 35                	xor    $0x35,%al
	...

00000a94 <ht_call45>:
CS550HTSYSCALL(ht_call45)
 a94:	b8 8a 0a 00 00       	mov    $0xa8a,%eax
 a99:	cd 42                	int    $0x42
 a9b:	c3                   	ret    

00000a9c <str_ht_call46>:
 a9c:	68 74 5f 63 61       	push   $0x61635f74
 aa1:	6c                   	insb   (%dx),%es:(%edi)
 aa2:	6c                   	insb   (%dx),%es:(%edi)
 aa3:	34 36                	xor    $0x36,%al
	...

00000aa6 <ht_call46>:
CS550HTSYSCALL(ht_call46)
 aa6:	b8 9c 0a 00 00       	mov    $0xa9c,%eax
 aab:	cd 42                	int    $0x42
 aad:	c3                   	ret    

00000aae <str_ht_call47>:
 aae:	68 74 5f 63 61       	push   $0x61635f74
 ab3:	6c                   	insb   (%dx),%es:(%edi)
 ab4:	6c                   	insb   (%dx),%es:(%edi)
 ab5:	34 37                	xor    $0x37,%al
	...

00000ab8 <ht_call47>:
CS550HTSYSCALL(ht_call47)
 ab8:	b8 ae 0a 00 00       	mov    $0xaae,%eax
 abd:	cd 42                	int    $0x42
 abf:	c3                   	ret    

00000ac0 <str_ht_call48>:
 ac0:	68 74 5f 63 61       	push   $0x61635f74
 ac5:	6c                   	insb   (%dx),%es:(%edi)
 ac6:	6c                   	insb   (%dx),%es:(%edi)
 ac7:	34 38                	xor    $0x38,%al
	...

00000aca <ht_call48>:
CS550HTSYSCALL(ht_call48)
 aca:	b8 c0 0a 00 00       	mov    $0xac0,%eax
 acf:	cd 42                	int    $0x42
 ad1:	c3                   	ret    

00000ad2 <str_ht_call49>:
 ad2:	68 74 5f 63 61       	push   $0x61635f74
 ad7:	6c                   	insb   (%dx),%es:(%edi)
 ad8:	6c                   	insb   (%dx),%es:(%edi)
 ad9:	34 39                	xor    $0x39,%al
	...

00000adc <ht_call49>:
CS550HTSYSCALL(ht_call49)
 adc:	b8 d2 0a 00 00       	mov    $0xad2,%eax
 ae1:	cd 42                	int    $0x42
 ae3:	c3                   	ret    

00000ae4 <str_ht_call50>:
 ae4:	68 74 5f 63 61       	push   $0x61635f74
 ae9:	6c                   	insb   (%dx),%es:(%edi)
 aea:	6c                   	insb   (%dx),%es:(%edi)
 aeb:	35                   	.byte 0x35
 aec:	30 00                	xor    %al,(%eax)

00000aee <ht_call50>:
CS550HTSYSCALL(ht_call50)
 aee:	b8 e4 0a 00 00       	mov    $0xae4,%eax
 af3:	cd 42                	int    $0x42
 af5:	c3                   	ret    

00000af6 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 af6:	55                   	push   %ebp
 af7:	89 e5                	mov    %esp,%ebp
 af9:	83 ec 18             	sub    $0x18,%esp
 afc:	8b 45 0c             	mov    0xc(%ebp),%eax
 aff:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 b02:	83 ec 04             	sub    $0x4,%esp
 b05:	6a 01                	push   $0x1
 b07:	8d 45 f4             	lea    -0xc(%ebp),%eax
 b0a:	50                   	push   %eax
 b0b:	ff 75 08             	pushl  0x8(%ebp)
 b0e:	e8 65 f8 ff ff       	call   378 <write>
 b13:	83 c4 10             	add    $0x10,%esp
}
 b16:	90                   	nop
 b17:	c9                   	leave  
 b18:	c3                   	ret    

00000b19 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 b19:	55                   	push   %ebp
 b1a:	89 e5                	mov    %esp,%ebp
 b1c:	53                   	push   %ebx
 b1d:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 b20:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 b27:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 b2b:	74 17                	je     b44 <printint+0x2b>
 b2d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 b31:	79 11                	jns    b44 <printint+0x2b>
    neg = 1;
 b33:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 b3a:	8b 45 0c             	mov    0xc(%ebp),%eax
 b3d:	f7 d8                	neg    %eax
 b3f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 b42:	eb 06                	jmp    b4a <printint+0x31>
  } else {
    x = xx;
 b44:	8b 45 0c             	mov    0xc(%ebp),%eax
 b47:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 b4a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 b51:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 b54:	8d 41 01             	lea    0x1(%ecx),%eax
 b57:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b5a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 b5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b60:	ba 00 00 00 00       	mov    $0x0,%edx
 b65:	f7 f3                	div    %ebx
 b67:	89 d0                	mov    %edx,%eax
 b69:	0f b6 80 2c 12 00 00 	movzbl 0x122c(%eax),%eax
 b70:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 b74:	8b 5d 10             	mov    0x10(%ebp),%ebx
 b77:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b7a:	ba 00 00 00 00       	mov    $0x0,%edx
 b7f:	f7 f3                	div    %ebx
 b81:	89 45 ec             	mov    %eax,-0x14(%ebp)
 b84:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b88:	75 c7                	jne    b51 <printint+0x38>
  if(neg)
 b8a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b8e:	74 2d                	je     bbd <printint+0xa4>
    buf[i++] = '-';
 b90:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b93:	8d 50 01             	lea    0x1(%eax),%edx
 b96:	89 55 f4             	mov    %edx,-0xc(%ebp)
 b99:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 b9e:	eb 1d                	jmp    bbd <printint+0xa4>
    putc(fd, buf[i]);
 ba0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 ba3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba6:	01 d0                	add    %edx,%eax
 ba8:	0f b6 00             	movzbl (%eax),%eax
 bab:	0f be c0             	movsbl %al,%eax
 bae:	83 ec 08             	sub    $0x8,%esp
 bb1:	50                   	push   %eax
 bb2:	ff 75 08             	pushl  0x8(%ebp)
 bb5:	e8 3c ff ff ff       	call   af6 <putc>
 bba:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 bbd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 bc1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 bc5:	79 d9                	jns    ba0 <printint+0x87>
    putc(fd, buf[i]);
}
 bc7:	90                   	nop
 bc8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 bcb:	c9                   	leave  
 bcc:	c3                   	ret    

00000bcd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 bcd:	55                   	push   %ebp
 bce:	89 e5                	mov    %esp,%ebp
 bd0:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 bd3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 bda:	8d 45 0c             	lea    0xc(%ebp),%eax
 bdd:	83 c0 04             	add    $0x4,%eax
 be0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 be3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 bea:	e9 59 01 00 00       	jmp    d48 <printf+0x17b>
    c = fmt[i] & 0xff;
 bef:	8b 55 0c             	mov    0xc(%ebp),%edx
 bf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bf5:	01 d0                	add    %edx,%eax
 bf7:	0f b6 00             	movzbl (%eax),%eax
 bfa:	0f be c0             	movsbl %al,%eax
 bfd:	25 ff 00 00 00       	and    $0xff,%eax
 c02:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 c05:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c09:	75 2c                	jne    c37 <printf+0x6a>
      if(c == '%'){
 c0b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 c0f:	75 0c                	jne    c1d <printf+0x50>
        state = '%';
 c11:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 c18:	e9 27 01 00 00       	jmp    d44 <printf+0x177>
      } else {
        putc(fd, c);
 c1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c20:	0f be c0             	movsbl %al,%eax
 c23:	83 ec 08             	sub    $0x8,%esp
 c26:	50                   	push   %eax
 c27:	ff 75 08             	pushl  0x8(%ebp)
 c2a:	e8 c7 fe ff ff       	call   af6 <putc>
 c2f:	83 c4 10             	add    $0x10,%esp
 c32:	e9 0d 01 00 00       	jmp    d44 <printf+0x177>
      }
    } else if(state == '%'){
 c37:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 c3b:	0f 85 03 01 00 00    	jne    d44 <printf+0x177>
      if(c == 'd'){
 c41:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 c45:	75 1e                	jne    c65 <printf+0x98>
        printint(fd, *ap, 10, 1);
 c47:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c4a:	8b 00                	mov    (%eax),%eax
 c4c:	6a 01                	push   $0x1
 c4e:	6a 0a                	push   $0xa
 c50:	50                   	push   %eax
 c51:	ff 75 08             	pushl  0x8(%ebp)
 c54:	e8 c0 fe ff ff       	call   b19 <printint>
 c59:	83 c4 10             	add    $0x10,%esp
        ap++;
 c5c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 c60:	e9 d8 00 00 00       	jmp    d3d <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 c65:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 c69:	74 06                	je     c71 <printf+0xa4>
 c6b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 c6f:	75 1e                	jne    c8f <printf+0xc2>
        printint(fd, *ap, 16, 0);
 c71:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c74:	8b 00                	mov    (%eax),%eax
 c76:	6a 00                	push   $0x0
 c78:	6a 10                	push   $0x10
 c7a:	50                   	push   %eax
 c7b:	ff 75 08             	pushl  0x8(%ebp)
 c7e:	e8 96 fe ff ff       	call   b19 <printint>
 c83:	83 c4 10             	add    $0x10,%esp
        ap++;
 c86:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 c8a:	e9 ae 00 00 00       	jmp    d3d <printf+0x170>
      } else if(c == 's'){
 c8f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 c93:	75 43                	jne    cd8 <printf+0x10b>
        s = (char*)*ap;
 c95:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c98:	8b 00                	mov    (%eax),%eax
 c9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 c9d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 ca1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ca5:	75 25                	jne    ccc <printf+0xff>
          s = "(null)";
 ca7:	c7 45 f4 d3 0f 00 00 	movl   $0xfd3,-0xc(%ebp)
        while(*s != 0){
 cae:	eb 1c                	jmp    ccc <printf+0xff>
          putc(fd, *s);
 cb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cb3:	0f b6 00             	movzbl (%eax),%eax
 cb6:	0f be c0             	movsbl %al,%eax
 cb9:	83 ec 08             	sub    $0x8,%esp
 cbc:	50                   	push   %eax
 cbd:	ff 75 08             	pushl  0x8(%ebp)
 cc0:	e8 31 fe ff ff       	call   af6 <putc>
 cc5:	83 c4 10             	add    $0x10,%esp
          s++;
 cc8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 ccc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ccf:	0f b6 00             	movzbl (%eax),%eax
 cd2:	84 c0                	test   %al,%al
 cd4:	75 da                	jne    cb0 <printf+0xe3>
 cd6:	eb 65                	jmp    d3d <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 cd8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 cdc:	75 1d                	jne    cfb <printf+0x12e>
        putc(fd, *ap);
 cde:	8b 45 e8             	mov    -0x18(%ebp),%eax
 ce1:	8b 00                	mov    (%eax),%eax
 ce3:	0f be c0             	movsbl %al,%eax
 ce6:	83 ec 08             	sub    $0x8,%esp
 ce9:	50                   	push   %eax
 cea:	ff 75 08             	pushl  0x8(%ebp)
 ced:	e8 04 fe ff ff       	call   af6 <putc>
 cf2:	83 c4 10             	add    $0x10,%esp
        ap++;
 cf5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 cf9:	eb 42                	jmp    d3d <printf+0x170>
      } else if(c == '%'){
 cfb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 cff:	75 17                	jne    d18 <printf+0x14b>
        putc(fd, c);
 d01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 d04:	0f be c0             	movsbl %al,%eax
 d07:	83 ec 08             	sub    $0x8,%esp
 d0a:	50                   	push   %eax
 d0b:	ff 75 08             	pushl  0x8(%ebp)
 d0e:	e8 e3 fd ff ff       	call   af6 <putc>
 d13:	83 c4 10             	add    $0x10,%esp
 d16:	eb 25                	jmp    d3d <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 d18:	83 ec 08             	sub    $0x8,%esp
 d1b:	6a 25                	push   $0x25
 d1d:	ff 75 08             	pushl  0x8(%ebp)
 d20:	e8 d1 fd ff ff       	call   af6 <putc>
 d25:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 d28:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 d2b:	0f be c0             	movsbl %al,%eax
 d2e:	83 ec 08             	sub    $0x8,%esp
 d31:	50                   	push   %eax
 d32:	ff 75 08             	pushl  0x8(%ebp)
 d35:	e8 bc fd ff ff       	call   af6 <putc>
 d3a:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 d3d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 d44:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 d48:	8b 55 0c             	mov    0xc(%ebp),%edx
 d4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d4e:	01 d0                	add    %edx,%eax
 d50:	0f b6 00             	movzbl (%eax),%eax
 d53:	84 c0                	test   %al,%al
 d55:	0f 85 94 fe ff ff    	jne    bef <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 d5b:	90                   	nop
 d5c:	c9                   	leave  
 d5d:	c3                   	ret    

00000d5e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 d5e:	55                   	push   %ebp
 d5f:	89 e5                	mov    %esp,%ebp
 d61:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 d64:	8b 45 08             	mov    0x8(%ebp),%eax
 d67:	83 e8 08             	sub    $0x8,%eax
 d6a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d6d:	a1 48 12 00 00       	mov    0x1248,%eax
 d72:	89 45 fc             	mov    %eax,-0x4(%ebp)
 d75:	eb 24                	jmp    d9b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 d77:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d7a:	8b 00                	mov    (%eax),%eax
 d7c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 d7f:	77 12                	ja     d93 <free+0x35>
 d81:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d84:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 d87:	77 24                	ja     dad <free+0x4f>
 d89:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d8c:	8b 00                	mov    (%eax),%eax
 d8e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d91:	77 1a                	ja     dad <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d93:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d96:	8b 00                	mov    (%eax),%eax
 d98:	89 45 fc             	mov    %eax,-0x4(%ebp)
 d9b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d9e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 da1:	76 d4                	jbe    d77 <free+0x19>
 da3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 da6:	8b 00                	mov    (%eax),%eax
 da8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 dab:	76 ca                	jbe    d77 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 dad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 db0:	8b 40 04             	mov    0x4(%eax),%eax
 db3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 dba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 dbd:	01 c2                	add    %eax,%edx
 dbf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 dc2:	8b 00                	mov    (%eax),%eax
 dc4:	39 c2                	cmp    %eax,%edx
 dc6:	75 24                	jne    dec <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 dc8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 dcb:	8b 50 04             	mov    0x4(%eax),%edx
 dce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 dd1:	8b 00                	mov    (%eax),%eax
 dd3:	8b 40 04             	mov    0x4(%eax),%eax
 dd6:	01 c2                	add    %eax,%edx
 dd8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ddb:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 dde:	8b 45 fc             	mov    -0x4(%ebp),%eax
 de1:	8b 00                	mov    (%eax),%eax
 de3:	8b 10                	mov    (%eax),%edx
 de5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 de8:	89 10                	mov    %edx,(%eax)
 dea:	eb 0a                	jmp    df6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 dec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 def:	8b 10                	mov    (%eax),%edx
 df1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 df4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 df6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 df9:	8b 40 04             	mov    0x4(%eax),%eax
 dfc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 e03:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e06:	01 d0                	add    %edx,%eax
 e08:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 e0b:	75 20                	jne    e2d <free+0xcf>
    p->s.size += bp->s.size;
 e0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e10:	8b 50 04             	mov    0x4(%eax),%edx
 e13:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e16:	8b 40 04             	mov    0x4(%eax),%eax
 e19:	01 c2                	add    %eax,%edx
 e1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e1e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 e21:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e24:	8b 10                	mov    (%eax),%edx
 e26:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e29:	89 10                	mov    %edx,(%eax)
 e2b:	eb 08                	jmp    e35 <free+0xd7>
  } else
    p->s.ptr = bp;
 e2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e30:	8b 55 f8             	mov    -0x8(%ebp),%edx
 e33:	89 10                	mov    %edx,(%eax)
  freep = p;
 e35:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e38:	a3 48 12 00 00       	mov    %eax,0x1248
}
 e3d:	90                   	nop
 e3e:	c9                   	leave  
 e3f:	c3                   	ret    

00000e40 <morecore>:

static Header*
morecore(uint nu)
{
 e40:	55                   	push   %ebp
 e41:	89 e5                	mov    %esp,%ebp
 e43:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 e46:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 e4d:	77 07                	ja     e56 <morecore+0x16>
    nu = 4096;
 e4f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 e56:	8b 45 08             	mov    0x8(%ebp),%eax
 e59:	c1 e0 03             	shl    $0x3,%eax
 e5c:	83 ec 0c             	sub    $0xc,%esp
 e5f:	50                   	push   %eax
 e60:	e8 7b f5 ff ff       	call   3e0 <sbrk>
 e65:	83 c4 10             	add    $0x10,%esp
 e68:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 e6b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 e6f:	75 07                	jne    e78 <morecore+0x38>
    return 0;
 e71:	b8 00 00 00 00       	mov    $0x0,%eax
 e76:	eb 26                	jmp    e9e <morecore+0x5e>
  hp = (Header*)p;
 e78:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 e7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e81:	8b 55 08             	mov    0x8(%ebp),%edx
 e84:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 e87:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e8a:	83 c0 08             	add    $0x8,%eax
 e8d:	83 ec 0c             	sub    $0xc,%esp
 e90:	50                   	push   %eax
 e91:	e8 c8 fe ff ff       	call   d5e <free>
 e96:	83 c4 10             	add    $0x10,%esp
  return freep;
 e99:	a1 48 12 00 00       	mov    0x1248,%eax
}
 e9e:	c9                   	leave  
 e9f:	c3                   	ret    

00000ea0 <malloc>:

void*
malloc(uint nbytes)
{
 ea0:	55                   	push   %ebp
 ea1:	89 e5                	mov    %esp,%ebp
 ea3:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ea6:	8b 45 08             	mov    0x8(%ebp),%eax
 ea9:	83 c0 07             	add    $0x7,%eax
 eac:	c1 e8 03             	shr    $0x3,%eax
 eaf:	83 c0 01             	add    $0x1,%eax
 eb2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 eb5:	a1 48 12 00 00       	mov    0x1248,%eax
 eba:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ebd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 ec1:	75 23                	jne    ee6 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 ec3:	c7 45 f0 40 12 00 00 	movl   $0x1240,-0x10(%ebp)
 eca:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ecd:	a3 48 12 00 00       	mov    %eax,0x1248
 ed2:	a1 48 12 00 00       	mov    0x1248,%eax
 ed7:	a3 40 12 00 00       	mov    %eax,0x1240
    base.s.size = 0;
 edc:	c7 05 44 12 00 00 00 	movl   $0x0,0x1244
 ee3:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ee6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ee9:	8b 00                	mov    (%eax),%eax
 eeb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 eee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ef1:	8b 40 04             	mov    0x4(%eax),%eax
 ef4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 ef7:	72 4d                	jb     f46 <malloc+0xa6>
      if(p->s.size == nunits)
 ef9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 efc:	8b 40 04             	mov    0x4(%eax),%eax
 eff:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 f02:	75 0c                	jne    f10 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 f04:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f07:	8b 10                	mov    (%eax),%edx
 f09:	8b 45 f0             	mov    -0x10(%ebp),%eax
 f0c:	89 10                	mov    %edx,(%eax)
 f0e:	eb 26                	jmp    f36 <malloc+0x96>
      else {
        p->s.size -= nunits;
 f10:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f13:	8b 40 04             	mov    0x4(%eax),%eax
 f16:	2b 45 ec             	sub    -0x14(%ebp),%eax
 f19:	89 c2                	mov    %eax,%edx
 f1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f1e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 f21:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f24:	8b 40 04             	mov    0x4(%eax),%eax
 f27:	c1 e0 03             	shl    $0x3,%eax
 f2a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 f2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f30:	8b 55 ec             	mov    -0x14(%ebp),%edx
 f33:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 f36:	8b 45 f0             	mov    -0x10(%ebp),%eax
 f39:	a3 48 12 00 00       	mov    %eax,0x1248
      return (void*)(p + 1);
 f3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f41:	83 c0 08             	add    $0x8,%eax
 f44:	eb 3b                	jmp    f81 <malloc+0xe1>
    }
    if(p == freep)
 f46:	a1 48 12 00 00       	mov    0x1248,%eax
 f4b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 f4e:	75 1e                	jne    f6e <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 f50:	83 ec 0c             	sub    $0xc,%esp
 f53:	ff 75 ec             	pushl  -0x14(%ebp)
 f56:	e8 e5 fe ff ff       	call   e40 <morecore>
 f5b:	83 c4 10             	add    $0x10,%esp
 f5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 f61:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 f65:	75 07                	jne    f6e <malloc+0xce>
        return 0;
 f67:	b8 00 00 00 00       	mov    $0x0,%eax
 f6c:	eb 13                	jmp    f81 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f71:	89 45 f0             	mov    %eax,-0x10(%ebp)
 f74:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f77:	8b 00                	mov    (%eax),%eax
 f79:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 f7c:	e9 6d ff ff ff       	jmp    eee <malloc+0x4e>
}
 f81:	c9                   	leave  
 f82:	c3                   	ret    
