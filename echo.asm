
_echo:     file format elf32-i386


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

  for(i = 1; i < argc; i++)
  14:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  1b:	eb 3c                	jmp    59 <main+0x59>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20:	83 c0 01             	add    $0x1,%eax
  23:	3b 03                	cmp    (%ebx),%eax
  25:	7d 07                	jge    2e <main+0x2e>
  27:	ba e7 0e 00 00       	mov    $0xee7,%edx
  2c:	eb 05                	jmp    33 <main+0x33>
  2e:	ba e9 0e 00 00       	mov    $0xee9,%edx
  33:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  3d:	8b 43 04             	mov    0x4(%ebx),%eax
  40:	01 c8                	add    %ecx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	52                   	push   %edx
  45:	50                   	push   %eax
  46:	68 eb 0e 00 00       	push   $0xeeb
  4b:	6a 01                	push   $0x1
  4d:	e8 df 0a 00 00       	call   b31 <printf>
  52:	83 c4 10             	add    $0x10,%esp
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
  55:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5c:	3b 03                	cmp    (%ebx),%eax
  5e:	7c bd                	jl     1d <main+0x1d>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit();
  60:	e8 57 02 00 00       	call   2bc <exit>

00000065 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	57                   	push   %edi
  69:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6d:	8b 55 10             	mov    0x10(%ebp),%edx
  70:	8b 45 0c             	mov    0xc(%ebp),%eax
  73:	89 cb                	mov    %ecx,%ebx
  75:	89 df                	mov    %ebx,%edi
  77:	89 d1                	mov    %edx,%ecx
  79:	fc                   	cld    
  7a:	f3 aa                	rep stos %al,%es:(%edi)
  7c:	89 ca                	mov    %ecx,%edx
  7e:	89 fb                	mov    %edi,%ebx
  80:	89 5d 08             	mov    %ebx,0x8(%ebp)
  83:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  86:	90                   	nop
  87:	5b                   	pop    %ebx
  88:	5f                   	pop    %edi
  89:	5d                   	pop    %ebp
  8a:	c3                   	ret    

0000008b <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  8b:	55                   	push   %ebp
  8c:	89 e5                	mov    %esp,%ebp
  8e:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  91:	8b 45 08             	mov    0x8(%ebp),%eax
  94:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  97:	90                   	nop
  98:	8b 45 08             	mov    0x8(%ebp),%eax
  9b:	8d 50 01             	lea    0x1(%eax),%edx
  9e:	89 55 08             	mov    %edx,0x8(%ebp)
  a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  a4:	8d 4a 01             	lea    0x1(%edx),%ecx
  a7:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  aa:	0f b6 12             	movzbl (%edx),%edx
  ad:	88 10                	mov    %dl,(%eax)
  af:	0f b6 00             	movzbl (%eax),%eax
  b2:	84 c0                	test   %al,%al
  b4:	75 e2                	jne    98 <strcpy+0xd>
    ;
  return os;
  b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  b9:	c9                   	leave  
  ba:	c3                   	ret    

000000bb <strcmp>:

int
strcmp(const char *p, const char *q)
{
  bb:	55                   	push   %ebp
  bc:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  be:	eb 08                	jmp    c8 <strcmp+0xd>
    p++, q++;
  c0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c8:	8b 45 08             	mov    0x8(%ebp),%eax
  cb:	0f b6 00             	movzbl (%eax),%eax
  ce:	84 c0                	test   %al,%al
  d0:	74 10                	je     e2 <strcmp+0x27>
  d2:	8b 45 08             	mov    0x8(%ebp),%eax
  d5:	0f b6 10             	movzbl (%eax),%edx
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	0f b6 00             	movzbl (%eax),%eax
  de:	38 c2                	cmp    %al,%dl
  e0:	74 de                	je     c0 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e2:	8b 45 08             	mov    0x8(%ebp),%eax
  e5:	0f b6 00             	movzbl (%eax),%eax
  e8:	0f b6 d0             	movzbl %al,%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	0f b6 00             	movzbl (%eax),%eax
  f1:	0f b6 c0             	movzbl %al,%eax
  f4:	29 c2                	sub    %eax,%edx
  f6:	89 d0                	mov    %edx,%eax
}
  f8:	5d                   	pop    %ebp
  f9:	c3                   	ret    

000000fa <strlen>:

uint
strlen(char *s)
{
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 100:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 107:	eb 04                	jmp    10d <strlen+0x13>
 109:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 10d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	01 d0                	add    %edx,%eax
 115:	0f b6 00             	movzbl (%eax),%eax
 118:	84 c0                	test   %al,%al
 11a:	75 ed                	jne    109 <strlen+0xf>
    ;
  return n;
 11c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 11f:	c9                   	leave  
 120:	c3                   	ret    

00000121 <memset>:

void*
memset(void *dst, int c, uint n)
{
 121:	55                   	push   %ebp
 122:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 124:	8b 45 10             	mov    0x10(%ebp),%eax
 127:	50                   	push   %eax
 128:	ff 75 0c             	pushl  0xc(%ebp)
 12b:	ff 75 08             	pushl  0x8(%ebp)
 12e:	e8 32 ff ff ff       	call   65 <stosb>
 133:	83 c4 0c             	add    $0xc,%esp
  return dst;
 136:	8b 45 08             	mov    0x8(%ebp),%eax
}
 139:	c9                   	leave  
 13a:	c3                   	ret    

0000013b <strchr>:

char*
strchr(const char *s, char c)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	83 ec 04             	sub    $0x4,%esp
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 147:	eb 14                	jmp    15d <strchr+0x22>
    if(*s == c)
 149:	8b 45 08             	mov    0x8(%ebp),%eax
 14c:	0f b6 00             	movzbl (%eax),%eax
 14f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 152:	75 05                	jne    159 <strchr+0x1e>
      return (char*)s;
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	eb 13                	jmp    16c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 159:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 15d:	8b 45 08             	mov    0x8(%ebp),%eax
 160:	0f b6 00             	movzbl (%eax),%eax
 163:	84 c0                	test   %al,%al
 165:	75 e2                	jne    149 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 167:	b8 00 00 00 00       	mov    $0x0,%eax
}
 16c:	c9                   	leave  
 16d:	c3                   	ret    

0000016e <gets>:

char*
gets(char *buf, int max)
{
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 174:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 17b:	eb 42                	jmp    1bf <gets+0x51>
    cc = read(0, &c, 1);
 17d:	83 ec 04             	sub    $0x4,%esp
 180:	6a 01                	push   $0x1
 182:	8d 45 ef             	lea    -0x11(%ebp),%eax
 185:	50                   	push   %eax
 186:	6a 00                	push   $0x0
 188:	e8 47 01 00 00       	call   2d4 <read>
 18d:	83 c4 10             	add    $0x10,%esp
 190:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 193:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 197:	7e 33                	jle    1cc <gets+0x5e>
      break;
    buf[i++] = c;
 199:	8b 45 f4             	mov    -0xc(%ebp),%eax
 19c:	8d 50 01             	lea    0x1(%eax),%edx
 19f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1a2:	89 c2                	mov    %eax,%edx
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	01 c2                	add    %eax,%edx
 1a9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ad:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1af:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1b3:	3c 0a                	cmp    $0xa,%al
 1b5:	74 16                	je     1cd <gets+0x5f>
 1b7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1bb:	3c 0d                	cmp    $0xd,%al
 1bd:	74 0e                	je     1cd <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c2:	83 c0 01             	add    $0x1,%eax
 1c5:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1c8:	7c b3                	jl     17d <gets+0xf>
 1ca:	eb 01                	jmp    1cd <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1cc:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	01 d0                	add    %edx,%eax
 1d5:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1d8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1db:	c9                   	leave  
 1dc:	c3                   	ret    

000001dd <stat>:

int
stat(char *n, struct stat *st)
{
 1dd:	55                   	push   %ebp
 1de:	89 e5                	mov    %esp,%ebp
 1e0:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e3:	83 ec 08             	sub    $0x8,%esp
 1e6:	6a 00                	push   $0x0
 1e8:	ff 75 08             	pushl  0x8(%ebp)
 1eb:	e8 0c 01 00 00       	call   2fc <open>
 1f0:	83 c4 10             	add    $0x10,%esp
 1f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1fa:	79 07                	jns    203 <stat+0x26>
    return -1;
 1fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 201:	eb 25                	jmp    228 <stat+0x4b>
  r = fstat(fd, st);
 203:	83 ec 08             	sub    $0x8,%esp
 206:	ff 75 0c             	pushl  0xc(%ebp)
 209:	ff 75 f4             	pushl  -0xc(%ebp)
 20c:	e8 03 01 00 00       	call   314 <fstat>
 211:	83 c4 10             	add    $0x10,%esp
 214:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 217:	83 ec 0c             	sub    $0xc,%esp
 21a:	ff 75 f4             	pushl  -0xc(%ebp)
 21d:	e8 c2 00 00 00       	call   2e4 <close>
 222:	83 c4 10             	add    $0x10,%esp
  return r;
 225:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 228:	c9                   	leave  
 229:	c3                   	ret    

0000022a <atoi>:

int
atoi(const char *s)
{
 22a:	55                   	push   %ebp
 22b:	89 e5                	mov    %esp,%ebp
 22d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 230:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 237:	eb 25                	jmp    25e <atoi+0x34>
    n = n*10 + *s++ - '0';
 239:	8b 55 fc             	mov    -0x4(%ebp),%edx
 23c:	89 d0                	mov    %edx,%eax
 23e:	c1 e0 02             	shl    $0x2,%eax
 241:	01 d0                	add    %edx,%eax
 243:	01 c0                	add    %eax,%eax
 245:	89 c1                	mov    %eax,%ecx
 247:	8b 45 08             	mov    0x8(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 08             	mov    %edx,0x8(%ebp)
 250:	0f b6 00             	movzbl (%eax),%eax
 253:	0f be c0             	movsbl %al,%eax
 256:	01 c8                	add    %ecx,%eax
 258:	83 e8 30             	sub    $0x30,%eax
 25b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 25e:	8b 45 08             	mov    0x8(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	3c 2f                	cmp    $0x2f,%al
 266:	7e 0a                	jle    272 <atoi+0x48>
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	0f b6 00             	movzbl (%eax),%eax
 26e:	3c 39                	cmp    $0x39,%al
 270:	7e c7                	jle    239 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 272:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 275:	c9                   	leave  
 276:	c3                   	ret    

00000277 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 277:	55                   	push   %ebp
 278:	89 e5                	mov    %esp,%ebp
 27a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 27d:	8b 45 08             	mov    0x8(%ebp),%eax
 280:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 283:	8b 45 0c             	mov    0xc(%ebp),%eax
 286:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 289:	eb 17                	jmp    2a2 <memmove+0x2b>
    *dst++ = *src++;
 28b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 28e:	8d 50 01             	lea    0x1(%eax),%edx
 291:	89 55 fc             	mov    %edx,-0x4(%ebp)
 294:	8b 55 f8             	mov    -0x8(%ebp),%edx
 297:	8d 4a 01             	lea    0x1(%edx),%ecx
 29a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 29d:	0f b6 12             	movzbl (%edx),%edx
 2a0:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a2:	8b 45 10             	mov    0x10(%ebp),%eax
 2a5:	8d 50 ff             	lea    -0x1(%eax),%edx
 2a8:	89 55 10             	mov    %edx,0x10(%ebp)
 2ab:	85 c0                	test   %eax,%eax
 2ad:	7f dc                	jg     28b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2af:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b2:	c9                   	leave  
 2b3:	c3                   	ret    

000002b4 <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
 2b4:	b8 01 00 00 00       	mov    $0x1,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <exit>:
SYSCALL(exit)
 2bc:	b8 02 00 00 00       	mov    $0x2,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <wait>:
SYSCALL(wait)
 2c4:	b8 03 00 00 00       	mov    $0x3,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <pipe>:
SYSCALL(pipe)
 2cc:	b8 04 00 00 00       	mov    $0x4,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <read>:
SYSCALL(read)
 2d4:	b8 05 00 00 00       	mov    $0x5,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <write>:
SYSCALL(write)
 2dc:	b8 10 00 00 00       	mov    $0x10,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <close>:
SYSCALL(close)
 2e4:	b8 15 00 00 00       	mov    $0x15,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <kill>:
SYSCALL(kill)
 2ec:	b8 06 00 00 00       	mov    $0x6,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <exec>:
SYSCALL(exec)
 2f4:	b8 07 00 00 00       	mov    $0x7,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <open>:
SYSCALL(open)
 2fc:	b8 0f 00 00 00       	mov    $0xf,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <mknod>:
SYSCALL(mknod)
 304:	b8 11 00 00 00       	mov    $0x11,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <unlink>:
SYSCALL(unlink)
 30c:	b8 12 00 00 00       	mov    $0x12,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <fstat>:
SYSCALL(fstat)
 314:	b8 08 00 00 00       	mov    $0x8,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <link>:
SYSCALL(link)
 31c:	b8 13 00 00 00       	mov    $0x13,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <mkdir>:
SYSCALL(mkdir)
 324:	b8 14 00 00 00       	mov    $0x14,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <chdir>:
SYSCALL(chdir)
 32c:	b8 09 00 00 00       	mov    $0x9,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <dup>:
SYSCALL(dup)
 334:	b8 0a 00 00 00       	mov    $0xa,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <getpid>:
SYSCALL(getpid)
 33c:	b8 0b 00 00 00       	mov    $0xb,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <sbrk>:
SYSCALL(sbrk)
 344:	b8 0c 00 00 00       	mov    $0xc,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <sleep>:
SYSCALL(sleep)
 34c:	b8 0d 00 00 00       	mov    $0xd,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <uptime>:
SYSCALL(uptime)
 354:	b8 0e 00 00 00       	mov    $0xe,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <date>:

// Assignment starts here

SYSCALL(date)
 35c:	b8 16 00 00 00       	mov    $0x16,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <str_ls_call1>:
 364:	6c                   	insb   (%dx),%es:(%edi)
 365:	73 5f                	jae    3c6 <ls_call6+0x4>
 367:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 36a:	6c                   	insb   (%dx),%es:(%edi)
 36b:	31 00                	xor    %eax,(%eax)

0000036d <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
 36d:	b8 64 03 00 00       	mov    $0x364,%eax
 372:	cd 41                	int    $0x41
 374:	c3                   	ret    

00000375 <str_ls_call2>:
 375:	6c                   	insb   (%dx),%es:(%edi)
 376:	73 5f                	jae    3d7 <ls_call7+0x4>
 378:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 37b:	6c                   	insb   (%dx),%es:(%edi)
 37c:	32 00                	xor    (%eax),%al

0000037e <ls_call2>:
CS550LSSYSCALL(ls_call2)
 37e:	b8 75 03 00 00       	mov    $0x375,%eax
 383:	cd 41                	int    $0x41
 385:	c3                   	ret    

00000386 <str_ls_call3>:
 386:	6c                   	insb   (%dx),%es:(%edi)
 387:	73 5f                	jae    3e8 <ls_call8+0x4>
 389:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 38c:	6c                   	insb   (%dx),%es:(%edi)
 38d:	33 00                	xor    (%eax),%eax

0000038f <ls_call3>:
CS550LSSYSCALL(ls_call3)
 38f:	b8 86 03 00 00       	mov    $0x386,%eax
 394:	cd 41                	int    $0x41
 396:	c3                   	ret    

00000397 <str_ls_call4>:
 397:	6c                   	insb   (%dx),%es:(%edi)
 398:	73 5f                	jae    3f9 <ls_call9+0x4>
 39a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 39d:	6c                   	insb   (%dx),%es:(%edi)
 39e:	34 00                	xor    $0x0,%al

000003a0 <ls_call4>:
CS550LSSYSCALL(ls_call4)
 3a0:	b8 97 03 00 00       	mov    $0x397,%eax
 3a5:	cd 41                	int    $0x41
 3a7:	c3                   	ret    

000003a8 <str_ls_call5>:
 3a8:	6c                   	insb   (%dx),%es:(%edi)
 3a9:	73 5f                	jae    40a <ls_call10+0x3>
 3ab:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3ae:	6c                   	insb   (%dx),%es:(%edi)
 3af:	35                   	.byte 0x35
	...

000003b1 <ls_call5>:
CS550LSSYSCALL(ls_call5)
 3b1:	b8 a8 03 00 00       	mov    $0x3a8,%eax
 3b6:	cd 41                	int    $0x41
 3b8:	c3                   	ret    

000003b9 <str_ls_call6>:
 3b9:	6c                   	insb   (%dx),%es:(%edi)
 3ba:	73 5f                	jae    41b <ls_call11+0x2>
 3bc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3bf:	6c                   	insb   (%dx),%es:(%edi)
 3c0:	36                   	ss
	...

000003c2 <ls_call6>:
CS550LSSYSCALL(ls_call6)
 3c2:	b8 b9 03 00 00       	mov    $0x3b9,%eax
 3c7:	cd 41                	int    $0x41
 3c9:	c3                   	ret    

000003ca <str_ls_call7>:
 3ca:	6c                   	insb   (%dx),%es:(%edi)
 3cb:	73 5f                	jae    42c <ls_call12+0x1>
 3cd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3d0:	6c                   	insb   (%dx),%es:(%edi)
 3d1:	37                   	aaa    
	...

000003d3 <ls_call7>:
CS550LSSYSCALL(ls_call7)
 3d3:	b8 ca 03 00 00       	mov    $0x3ca,%eax
 3d8:	cd 41                	int    $0x41
 3da:	c3                   	ret    

000003db <str_ls_call8>:
 3db:	6c                   	insb   (%dx),%es:(%edi)
 3dc:	73 5f                	jae    43d <ls_call13>
 3de:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3e1:	6c                   	insb   (%dx),%es:(%edi)
 3e2:	38 00                	cmp    %al,(%eax)

000003e4 <ls_call8>:
CS550LSSYSCALL(ls_call8)
 3e4:	b8 db 03 00 00       	mov    $0x3db,%eax
 3e9:	cd 41                	int    $0x41
 3eb:	c3                   	ret    

000003ec <str_ls_call9>:
 3ec:	6c                   	insb   (%dx),%es:(%edi)
 3ed:	73 5f                	jae    44e <str_ls_call14+0x9>
 3ef:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 3f2:	6c                   	insb   (%dx),%es:(%edi)
 3f3:	39 00                	cmp    %eax,(%eax)

000003f5 <ls_call9>:
CS550LSSYSCALL(ls_call9)
 3f5:	b8 ec 03 00 00       	mov    $0x3ec,%eax
 3fa:	cd 41                	int    $0x41
 3fc:	c3                   	ret    

000003fd <str_ls_call10>:
 3fd:	6c                   	insb   (%dx),%es:(%edi)
 3fe:	73 5f                	jae    45f <str_ls_call15+0x8>
 400:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 403:	6c                   	insb   (%dx),%es:(%edi)
 404:	31 30                	xor    %esi,(%eax)
	...

00000407 <ls_call10>:
CS550LSSYSCALL(ls_call10)
 407:	b8 fd 03 00 00       	mov    $0x3fd,%eax
 40c:	cd 41                	int    $0x41
 40e:	c3                   	ret    

0000040f <str_ls_call11>:
 40f:	6c                   	insb   (%dx),%es:(%edi)
 410:	73 5f                	jae    471 <str_ls_call16+0x8>
 412:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 415:	6c                   	insb   (%dx),%es:(%edi)
 416:	31 31                	xor    %esi,(%ecx)
	...

00000419 <ls_call11>:
CS550LSSYSCALL(ls_call11)
 419:	b8 0f 04 00 00       	mov    $0x40f,%eax
 41e:	cd 41                	int    $0x41
 420:	c3                   	ret    

00000421 <str_ls_call12>:
 421:	6c                   	insb   (%dx),%es:(%edi)
 422:	73 5f                	jae    483 <str_ls_call17+0x8>
 424:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 427:	6c                   	insb   (%dx),%es:(%edi)
 428:	31 32                	xor    %esi,(%edx)
	...

0000042b <ls_call12>:
CS550LSSYSCALL(ls_call12)
 42b:	b8 21 04 00 00       	mov    $0x421,%eax
 430:	cd 41                	int    $0x41
 432:	c3                   	ret    

00000433 <str_ls_call13>:
 433:	6c                   	insb   (%dx),%es:(%edi)
 434:	73 5f                	jae    495 <str_ls_call18+0x8>
 436:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 439:	6c                   	insb   (%dx),%es:(%edi)
 43a:	31 33                	xor    %esi,(%ebx)
	...

0000043d <ls_call13>:
CS550LSSYSCALL(ls_call13)
 43d:	b8 33 04 00 00       	mov    $0x433,%eax
 442:	cd 41                	int    $0x41
 444:	c3                   	ret    

00000445 <str_ls_call14>:
 445:	6c                   	insb   (%dx),%es:(%edi)
 446:	73 5f                	jae    4a7 <str_ls_call19+0x8>
 448:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 44b:	6c                   	insb   (%dx),%es:(%edi)
 44c:	31 34 00             	xor    %esi,(%eax,%eax,1)

0000044f <ls_call14>:
CS550LSSYSCALL(ls_call14)
 44f:	b8 45 04 00 00       	mov    $0x445,%eax
 454:	cd 41                	int    $0x41
 456:	c3                   	ret    

00000457 <str_ls_call15>:
 457:	6c                   	insb   (%dx),%es:(%edi)
 458:	73 5f                	jae    4b9 <str_ls_call20+0x8>
 45a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 45d:	6c                   	insb   (%dx),%es:(%edi)
 45e:	31                   	.byte 0x31
 45f:	35                   	.byte 0x35
	...

00000461 <ls_call15>:
CS550LSSYSCALL(ls_call15)
 461:	b8 57 04 00 00       	mov    $0x457,%eax
 466:	cd 41                	int    $0x41
 468:	c3                   	ret    

00000469 <str_ls_call16>:
 469:	6c                   	insb   (%dx),%es:(%edi)
 46a:	73 5f                	jae    4cb <str_ls_call21+0x8>
 46c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 46f:	6c                   	insb   (%dx),%es:(%edi)
 470:	31 36                	xor    %esi,(%esi)
	...

00000473 <ls_call16>:
CS550LSSYSCALL(ls_call16)
 473:	b8 69 04 00 00       	mov    $0x469,%eax
 478:	cd 41                	int    $0x41
 47a:	c3                   	ret    

0000047b <str_ls_call17>:
 47b:	6c                   	insb   (%dx),%es:(%edi)
 47c:	73 5f                	jae    4dd <str_ls_call22+0x8>
 47e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 481:	6c                   	insb   (%dx),%es:(%edi)
 482:	31 37                	xor    %esi,(%edi)
	...

00000485 <ls_call17>:
CS550LSSYSCALL(ls_call17)
 485:	b8 7b 04 00 00       	mov    $0x47b,%eax
 48a:	cd 41                	int    $0x41
 48c:	c3                   	ret    

0000048d <str_ls_call18>:
 48d:	6c                   	insb   (%dx),%es:(%edi)
 48e:	73 5f                	jae    4ef <str_ls_call23+0x8>
 490:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 493:	6c                   	insb   (%dx),%es:(%edi)
 494:	31 38                	xor    %edi,(%eax)
	...

00000497 <ls_call18>:
CS550LSSYSCALL(ls_call18)
 497:	b8 8d 04 00 00       	mov    $0x48d,%eax
 49c:	cd 41                	int    $0x41
 49e:	c3                   	ret    

0000049f <str_ls_call19>:
 49f:	6c                   	insb   (%dx),%es:(%edi)
 4a0:	73 5f                	jae    501 <str_ls_call24+0x8>
 4a2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4a5:	6c                   	insb   (%dx),%es:(%edi)
 4a6:	31 39                	xor    %edi,(%ecx)
	...

000004a9 <ls_call19>:
CS550LSSYSCALL(ls_call19)
 4a9:	b8 9f 04 00 00       	mov    $0x49f,%eax
 4ae:	cd 41                	int    $0x41
 4b0:	c3                   	ret    

000004b1 <str_ls_call20>:
 4b1:	6c                   	insb   (%dx),%es:(%edi)
 4b2:	73 5f                	jae    513 <str_ls_call25+0x8>
 4b4:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4b7:	6c                   	insb   (%dx),%es:(%edi)
 4b8:	32 30                	xor    (%eax),%dh
	...

000004bb <ls_call20>:
CS550LSSYSCALL(ls_call20)
 4bb:	b8 b1 04 00 00       	mov    $0x4b1,%eax
 4c0:	cd 41                	int    $0x41
 4c2:	c3                   	ret    

000004c3 <str_ls_call21>:
 4c3:	6c                   	insb   (%dx),%es:(%edi)
 4c4:	73 5f                	jae    525 <str_ls_call26+0x8>
 4c6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4c9:	6c                   	insb   (%dx),%es:(%edi)
 4ca:	32 31                	xor    (%ecx),%dh
	...

000004cd <ls_call21>:
CS550LSSYSCALL(ls_call21)
 4cd:	b8 c3 04 00 00       	mov    $0x4c3,%eax
 4d2:	cd 41                	int    $0x41
 4d4:	c3                   	ret    

000004d5 <str_ls_call22>:
 4d5:	6c                   	insb   (%dx),%es:(%edi)
 4d6:	73 5f                	jae    537 <str_ls_call27+0x8>
 4d8:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4db:	6c                   	insb   (%dx),%es:(%edi)
 4dc:	32 32                	xor    (%edx),%dh
	...

000004df <ls_call22>:
CS550LSSYSCALL(ls_call22)
 4df:	b8 d5 04 00 00       	mov    $0x4d5,%eax
 4e4:	cd 41                	int    $0x41
 4e6:	c3                   	ret    

000004e7 <str_ls_call23>:
 4e7:	6c                   	insb   (%dx),%es:(%edi)
 4e8:	73 5f                	jae    549 <str_ls_call28+0x8>
 4ea:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4ed:	6c                   	insb   (%dx),%es:(%edi)
 4ee:	32 33                	xor    (%ebx),%dh
	...

000004f1 <ls_call23>:
CS550LSSYSCALL(ls_call23)
 4f1:	b8 e7 04 00 00       	mov    $0x4e7,%eax
 4f6:	cd 41                	int    $0x41
 4f8:	c3                   	ret    

000004f9 <str_ls_call24>:
 4f9:	6c                   	insb   (%dx),%es:(%edi)
 4fa:	73 5f                	jae    55b <str_ls_call29+0x8>
 4fc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4ff:	6c                   	insb   (%dx),%es:(%edi)
 500:	32 34 00             	xor    (%eax,%eax,1),%dh

00000503 <ls_call24>:
CS550LSSYSCALL(ls_call24)
 503:	b8 f9 04 00 00       	mov    $0x4f9,%eax
 508:	cd 41                	int    $0x41
 50a:	c3                   	ret    

0000050b <str_ls_call25>:
 50b:	6c                   	insb   (%dx),%es:(%edi)
 50c:	73 5f                	jae    56d <str_ls_call30+0x8>
 50e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 511:	6c                   	insb   (%dx),%es:(%edi)
 512:	32                   	.byte 0x32
 513:	35                   	.byte 0x35
	...

00000515 <ls_call25>:
CS550LSSYSCALL(ls_call25)
 515:	b8 0b 05 00 00       	mov    $0x50b,%eax
 51a:	cd 41                	int    $0x41
 51c:	c3                   	ret    

0000051d <str_ls_call26>:
 51d:	6c                   	insb   (%dx),%es:(%edi)
 51e:	73 5f                	jae    57f <str_ls_call31+0x8>
 520:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 523:	6c                   	insb   (%dx),%es:(%edi)
 524:	32 36                	xor    (%esi),%dh
	...

00000527 <ls_call26>:
CS550LSSYSCALL(ls_call26)
 527:	b8 1d 05 00 00       	mov    $0x51d,%eax
 52c:	cd 41                	int    $0x41
 52e:	c3                   	ret    

0000052f <str_ls_call27>:
 52f:	6c                   	insb   (%dx),%es:(%edi)
 530:	73 5f                	jae    591 <str_ls_call32+0x8>
 532:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 535:	6c                   	insb   (%dx),%es:(%edi)
 536:	32 37                	xor    (%edi),%dh
	...

00000539 <ls_call27>:
CS550LSSYSCALL(ls_call27)
 539:	b8 2f 05 00 00       	mov    $0x52f,%eax
 53e:	cd 41                	int    $0x41
 540:	c3                   	ret    

00000541 <str_ls_call28>:
 541:	6c                   	insb   (%dx),%es:(%edi)
 542:	73 5f                	jae    5a3 <str_ls_call33+0x8>
 544:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 547:	6c                   	insb   (%dx),%es:(%edi)
 548:	32 38                	xor    (%eax),%bh
	...

0000054b <ls_call28>:
CS550LSSYSCALL(ls_call28)
 54b:	b8 41 05 00 00       	mov    $0x541,%eax
 550:	cd 41                	int    $0x41
 552:	c3                   	ret    

00000553 <str_ls_call29>:
 553:	6c                   	insb   (%dx),%es:(%edi)
 554:	73 5f                	jae    5b5 <str_ls_call34+0x8>
 556:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 559:	6c                   	insb   (%dx),%es:(%edi)
 55a:	32 39                	xor    (%ecx),%bh
	...

0000055d <ls_call29>:
CS550LSSYSCALL(ls_call29)
 55d:	b8 53 05 00 00       	mov    $0x553,%eax
 562:	cd 41                	int    $0x41
 564:	c3                   	ret    

00000565 <str_ls_call30>:
 565:	6c                   	insb   (%dx),%es:(%edi)
 566:	73 5f                	jae    5c7 <str_ls_call35+0x8>
 568:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 56b:	6c                   	insb   (%dx),%es:(%edi)
 56c:	33 30                	xor    (%eax),%esi
	...

0000056f <ls_call30>:
CS550LSSYSCALL(ls_call30)
 56f:	b8 65 05 00 00       	mov    $0x565,%eax
 574:	cd 41                	int    $0x41
 576:	c3                   	ret    

00000577 <str_ls_call31>:
 577:	6c                   	insb   (%dx),%es:(%edi)
 578:	73 5f                	jae    5d9 <str_ls_call36+0x8>
 57a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 57d:	6c                   	insb   (%dx),%es:(%edi)
 57e:	33 31                	xor    (%ecx),%esi
	...

00000581 <ls_call31>:
CS550LSSYSCALL(ls_call31)
 581:	b8 77 05 00 00       	mov    $0x577,%eax
 586:	cd 41                	int    $0x41
 588:	c3                   	ret    

00000589 <str_ls_call32>:
 589:	6c                   	insb   (%dx),%es:(%edi)
 58a:	73 5f                	jae    5eb <str_ls_call37+0x8>
 58c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 58f:	6c                   	insb   (%dx),%es:(%edi)
 590:	33 32                	xor    (%edx),%esi
	...

00000593 <ls_call32>:
CS550LSSYSCALL(ls_call32)
 593:	b8 89 05 00 00       	mov    $0x589,%eax
 598:	cd 41                	int    $0x41
 59a:	c3                   	ret    

0000059b <str_ls_call33>:
 59b:	6c                   	insb   (%dx),%es:(%edi)
 59c:	73 5f                	jae    5fd <str_ls_call38+0x8>
 59e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5a1:	6c                   	insb   (%dx),%es:(%edi)
 5a2:	33 33                	xor    (%ebx),%esi
	...

000005a5 <ls_call33>:
CS550LSSYSCALL(ls_call33)
 5a5:	b8 9b 05 00 00       	mov    $0x59b,%eax
 5aa:	cd 41                	int    $0x41
 5ac:	c3                   	ret    

000005ad <str_ls_call34>:
 5ad:	6c                   	insb   (%dx),%es:(%edi)
 5ae:	73 5f                	jae    60f <str_ls_call39+0x8>
 5b0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5b3:	6c                   	insb   (%dx),%es:(%edi)
 5b4:	33 34 00             	xor    (%eax,%eax,1),%esi

000005b7 <ls_call34>:
CS550LSSYSCALL(ls_call34)
 5b7:	b8 ad 05 00 00       	mov    $0x5ad,%eax
 5bc:	cd 41                	int    $0x41
 5be:	c3                   	ret    

000005bf <str_ls_call35>:
 5bf:	6c                   	insb   (%dx),%es:(%edi)
 5c0:	73 5f                	jae    621 <str_ls_call40+0x8>
 5c2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5c5:	6c                   	insb   (%dx),%es:(%edi)
 5c6:	33                   	.byte 0x33
 5c7:	35                   	.byte 0x35
	...

000005c9 <ls_call35>:
CS550LSSYSCALL(ls_call35)
 5c9:	b8 bf 05 00 00       	mov    $0x5bf,%eax
 5ce:	cd 41                	int    $0x41
 5d0:	c3                   	ret    

000005d1 <str_ls_call36>:
 5d1:	6c                   	insb   (%dx),%es:(%edi)
 5d2:	73 5f                	jae    633 <str_ls_call41+0x8>
 5d4:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5d7:	6c                   	insb   (%dx),%es:(%edi)
 5d8:	33 36                	xor    (%esi),%esi
	...

000005db <ls_call36>:
CS550LSSYSCALL(ls_call36)
 5db:	b8 d1 05 00 00       	mov    $0x5d1,%eax
 5e0:	cd 41                	int    $0x41
 5e2:	c3                   	ret    

000005e3 <str_ls_call37>:
 5e3:	6c                   	insb   (%dx),%es:(%edi)
 5e4:	73 5f                	jae    645 <str_ls_call42+0x8>
 5e6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5e9:	6c                   	insb   (%dx),%es:(%edi)
 5ea:	33 37                	xor    (%edi),%esi
	...

000005ed <ls_call37>:
CS550LSSYSCALL(ls_call37)
 5ed:	b8 e3 05 00 00       	mov    $0x5e3,%eax
 5f2:	cd 41                	int    $0x41
 5f4:	c3                   	ret    

000005f5 <str_ls_call38>:
 5f5:	6c                   	insb   (%dx),%es:(%edi)
 5f6:	73 5f                	jae    657 <str_ls_call43+0x8>
 5f8:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5fb:	6c                   	insb   (%dx),%es:(%edi)
 5fc:	33 38                	xor    (%eax),%edi
	...

000005ff <ls_call38>:
CS550LSSYSCALL(ls_call38)
 5ff:	b8 f5 05 00 00       	mov    $0x5f5,%eax
 604:	cd 41                	int    $0x41
 606:	c3                   	ret    

00000607 <str_ls_call39>:
 607:	6c                   	insb   (%dx),%es:(%edi)
 608:	73 5f                	jae    669 <str_ls_call44+0x8>
 60a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 60d:	6c                   	insb   (%dx),%es:(%edi)
 60e:	33 39                	xor    (%ecx),%edi
	...

00000611 <ls_call39>:
CS550LSSYSCALL(ls_call39)
 611:	b8 07 06 00 00       	mov    $0x607,%eax
 616:	cd 41                	int    $0x41
 618:	c3                   	ret    

00000619 <str_ls_call40>:
 619:	6c                   	insb   (%dx),%es:(%edi)
 61a:	73 5f                	jae    67b <str_ls_call45+0x8>
 61c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 61f:	6c                   	insb   (%dx),%es:(%edi)
 620:	34 30                	xor    $0x30,%al
	...

00000623 <ls_call40>:
CS550LSSYSCALL(ls_call40)
 623:	b8 19 06 00 00       	mov    $0x619,%eax
 628:	cd 41                	int    $0x41
 62a:	c3                   	ret    

0000062b <str_ls_call41>:
 62b:	6c                   	insb   (%dx),%es:(%edi)
 62c:	73 5f                	jae    68d <str_ls_call46+0x8>
 62e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 631:	6c                   	insb   (%dx),%es:(%edi)
 632:	34 31                	xor    $0x31,%al
	...

00000635 <ls_call41>:
CS550LSSYSCALL(ls_call41)
 635:	b8 2b 06 00 00       	mov    $0x62b,%eax
 63a:	cd 41                	int    $0x41
 63c:	c3                   	ret    

0000063d <str_ls_call42>:
 63d:	6c                   	insb   (%dx),%es:(%edi)
 63e:	73 5f                	jae    69f <str_ls_call47+0x8>
 640:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 643:	6c                   	insb   (%dx),%es:(%edi)
 644:	34 32                	xor    $0x32,%al
	...

00000647 <ls_call42>:
CS550LSSYSCALL(ls_call42)
 647:	b8 3d 06 00 00       	mov    $0x63d,%eax
 64c:	cd 41                	int    $0x41
 64e:	c3                   	ret    

0000064f <str_ls_call43>:
 64f:	6c                   	insb   (%dx),%es:(%edi)
 650:	73 5f                	jae    6b1 <str_ls_call48+0x8>
 652:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 655:	6c                   	insb   (%dx),%es:(%edi)
 656:	34 33                	xor    $0x33,%al
	...

00000659 <ls_call43>:
CS550LSSYSCALL(ls_call43)
 659:	b8 4f 06 00 00       	mov    $0x64f,%eax
 65e:	cd 41                	int    $0x41
 660:	c3                   	ret    

00000661 <str_ls_call44>:
 661:	6c                   	insb   (%dx),%es:(%edi)
 662:	73 5f                	jae    6c3 <str_ls_call49+0x8>
 664:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 667:	6c                   	insb   (%dx),%es:(%edi)
 668:	34 34                	xor    $0x34,%al
	...

0000066b <ls_call44>:
CS550LSSYSCALL(ls_call44)
 66b:	b8 61 06 00 00       	mov    $0x661,%eax
 670:	cd 41                	int    $0x41
 672:	c3                   	ret    

00000673 <str_ls_call45>:
 673:	6c                   	insb   (%dx),%es:(%edi)
 674:	73 5f                	jae    6d5 <str_ls_call50+0x8>
 676:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 679:	6c                   	insb   (%dx),%es:(%edi)
 67a:	34 35                	xor    $0x35,%al
	...

0000067d <ls_call45>:
CS550LSSYSCALL(ls_call45)
 67d:	b8 73 06 00 00       	mov    $0x673,%eax
 682:	cd 41                	int    $0x41
 684:	c3                   	ret    

00000685 <str_ls_call46>:
 685:	6c                   	insb   (%dx),%es:(%edi)
 686:	73 5f                	jae    6e7 <str_ht_call1+0x8>
 688:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 68b:	6c                   	insb   (%dx),%es:(%edi)
 68c:	34 36                	xor    $0x36,%al
	...

0000068f <ls_call46>:
CS550LSSYSCALL(ls_call46)
 68f:	b8 85 06 00 00       	mov    $0x685,%eax
 694:	cd 41                	int    $0x41
 696:	c3                   	ret    

00000697 <str_ls_call47>:
 697:	6c                   	insb   (%dx),%es:(%edi)
 698:	73 5f                	jae    6f9 <ht_call2>
 69a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 69d:	6c                   	insb   (%dx),%es:(%edi)
 69e:	34 37                	xor    $0x37,%al
	...

000006a1 <ls_call47>:
CS550LSSYSCALL(ls_call47)
 6a1:	b8 97 06 00 00       	mov    $0x697,%eax
 6a6:	cd 41                	int    $0x41
 6a8:	c3                   	ret    

000006a9 <str_ls_call48>:
 6a9:	6c                   	insb   (%dx),%es:(%edi)
 6aa:	73 5f                	jae    70b <ht_call3+0x1>
 6ac:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6af:	6c                   	insb   (%dx),%es:(%edi)
 6b0:	34 38                	xor    $0x38,%al
	...

000006b3 <ls_call48>:
CS550LSSYSCALL(ls_call48)
 6b3:	b8 a9 06 00 00       	mov    $0x6a9,%eax
 6b8:	cd 41                	int    $0x41
 6ba:	c3                   	ret    

000006bb <str_ls_call49>:
 6bb:	6c                   	insb   (%dx),%es:(%edi)
 6bc:	73 5f                	jae    71d <ht_call4+0x2>
 6be:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6c1:	6c                   	insb   (%dx),%es:(%edi)
 6c2:	34 39                	xor    $0x39,%al
	...

000006c5 <ls_call49>:
CS550LSSYSCALL(ls_call49)
 6c5:	b8 bb 06 00 00       	mov    $0x6bb,%eax
 6ca:	cd 41                	int    $0x41
 6cc:	c3                   	ret    

000006cd <str_ls_call50>:
 6cd:	6c                   	insb   (%dx),%es:(%edi)
 6ce:	73 5f                	jae    72f <ht_call5+0x3>
 6d0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6d3:	6c                   	insb   (%dx),%es:(%edi)
 6d4:	35                   	.byte 0x35
 6d5:	30 00                	xor    %al,(%eax)

000006d7 <ls_call50>:
CS550LSSYSCALL(ls_call50)
 6d7:	b8 cd 06 00 00       	mov    $0x6cd,%eax
 6dc:	cd 41                	int    $0x41
 6de:	c3                   	ret    

000006df <str_ht_call1>:
 6df:	68 74 5f 63 61       	push   $0x61635f74
 6e4:	6c                   	insb   (%dx),%es:(%edi)
 6e5:	6c                   	insb   (%dx),%es:(%edi)
 6e6:	31 00                	xor    %eax,(%eax)

000006e8 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
 6e8:	b8 df 06 00 00       	mov    $0x6df,%eax
 6ed:	cd 42                	int    $0x42
 6ef:	c3                   	ret    

000006f0 <str_ht_call2>:
 6f0:	68 74 5f 63 61       	push   $0x61635f74
 6f5:	6c                   	insb   (%dx),%es:(%edi)
 6f6:	6c                   	insb   (%dx),%es:(%edi)
 6f7:	32 00                	xor    (%eax),%al

000006f9 <ht_call2>:
CS550HTSYSCALL(ht_call2)
 6f9:	b8 f0 06 00 00       	mov    $0x6f0,%eax
 6fe:	cd 42                	int    $0x42
 700:	c3                   	ret    

00000701 <str_ht_call3>:
 701:	68 74 5f 63 61       	push   $0x61635f74
 706:	6c                   	insb   (%dx),%es:(%edi)
 707:	6c                   	insb   (%dx),%es:(%edi)
 708:	33 00                	xor    (%eax),%eax

0000070a <ht_call3>:
CS550HTSYSCALL(ht_call3)
 70a:	b8 01 07 00 00       	mov    $0x701,%eax
 70f:	cd 42                	int    $0x42
 711:	c3                   	ret    

00000712 <str_ht_call4>:
 712:	68 74 5f 63 61       	push   $0x61635f74
 717:	6c                   	insb   (%dx),%es:(%edi)
 718:	6c                   	insb   (%dx),%es:(%edi)
 719:	34 00                	xor    $0x0,%al

0000071b <ht_call4>:
CS550HTSYSCALL(ht_call4)
 71b:	b8 12 07 00 00       	mov    $0x712,%eax
 720:	cd 42                	int    $0x42
 722:	c3                   	ret    

00000723 <str_ht_call5>:
 723:	68 74 5f 63 61       	push   $0x61635f74
 728:	6c                   	insb   (%dx),%es:(%edi)
 729:	6c                   	insb   (%dx),%es:(%edi)
 72a:	35                   	.byte 0x35
	...

0000072c <ht_call5>:
CS550HTSYSCALL(ht_call5)
 72c:	b8 23 07 00 00       	mov    $0x723,%eax
 731:	cd 42                	int    $0x42
 733:	c3                   	ret    

00000734 <str_ht_call6>:
 734:	68 74 5f 63 61       	push   $0x61635f74
 739:	6c                   	insb   (%dx),%es:(%edi)
 73a:	6c                   	insb   (%dx),%es:(%edi)
 73b:	36                   	ss
	...

0000073d <ht_call6>:
CS550HTSYSCALL(ht_call6)
 73d:	b8 34 07 00 00       	mov    $0x734,%eax
 742:	cd 42                	int    $0x42
 744:	c3                   	ret    

00000745 <str_ht_call7>:
 745:	68 74 5f 63 61       	push   $0x61635f74
 74a:	6c                   	insb   (%dx),%es:(%edi)
 74b:	6c                   	insb   (%dx),%es:(%edi)
 74c:	37                   	aaa    
	...

0000074e <ht_call7>:
CS550HTSYSCALL(ht_call7)
 74e:	b8 45 07 00 00       	mov    $0x745,%eax
 753:	cd 42                	int    $0x42
 755:	c3                   	ret    

00000756 <str_ht_call8>:
 756:	68 74 5f 63 61       	push   $0x61635f74
 75b:	6c                   	insb   (%dx),%es:(%edi)
 75c:	6c                   	insb   (%dx),%es:(%edi)
 75d:	38 00                	cmp    %al,(%eax)

0000075f <ht_call8>:
CS550HTSYSCALL(ht_call8)
 75f:	b8 56 07 00 00       	mov    $0x756,%eax
 764:	cd 42                	int    $0x42
 766:	c3                   	ret    

00000767 <str_ht_call9>:
 767:	68 74 5f 63 61       	push   $0x61635f74
 76c:	6c                   	insb   (%dx),%es:(%edi)
 76d:	6c                   	insb   (%dx),%es:(%edi)
 76e:	39 00                	cmp    %eax,(%eax)

00000770 <ht_call9>:
CS550HTSYSCALL(ht_call9)
 770:	b8 67 07 00 00       	mov    $0x767,%eax
 775:	cd 42                	int    $0x42
 777:	c3                   	ret    

00000778 <str_ht_call10>:
 778:	68 74 5f 63 61       	push   $0x61635f74
 77d:	6c                   	insb   (%dx),%es:(%edi)
 77e:	6c                   	insb   (%dx),%es:(%edi)
 77f:	31 30                	xor    %esi,(%eax)
	...

00000782 <ht_call10>:
CS550HTSYSCALL(ht_call10)
 782:	b8 78 07 00 00       	mov    $0x778,%eax
 787:	cd 42                	int    $0x42
 789:	c3                   	ret    

0000078a <str_ht_call11>:
 78a:	68 74 5f 63 61       	push   $0x61635f74
 78f:	6c                   	insb   (%dx),%es:(%edi)
 790:	6c                   	insb   (%dx),%es:(%edi)
 791:	31 31                	xor    %esi,(%ecx)
	...

00000794 <ht_call11>:
CS550HTSYSCALL(ht_call11)
 794:	b8 8a 07 00 00       	mov    $0x78a,%eax
 799:	cd 42                	int    $0x42
 79b:	c3                   	ret    

0000079c <str_ht_call12>:
 79c:	68 74 5f 63 61       	push   $0x61635f74
 7a1:	6c                   	insb   (%dx),%es:(%edi)
 7a2:	6c                   	insb   (%dx),%es:(%edi)
 7a3:	31 32                	xor    %esi,(%edx)
	...

000007a6 <ht_call12>:
CS550HTSYSCALL(ht_call12)
 7a6:	b8 9c 07 00 00       	mov    $0x79c,%eax
 7ab:	cd 42                	int    $0x42
 7ad:	c3                   	ret    

000007ae <str_ht_call13>:
 7ae:	68 74 5f 63 61       	push   $0x61635f74
 7b3:	6c                   	insb   (%dx),%es:(%edi)
 7b4:	6c                   	insb   (%dx),%es:(%edi)
 7b5:	31 33                	xor    %esi,(%ebx)
	...

000007b8 <ht_call13>:
CS550HTSYSCALL(ht_call13)
 7b8:	b8 ae 07 00 00       	mov    $0x7ae,%eax
 7bd:	cd 42                	int    $0x42
 7bf:	c3                   	ret    

000007c0 <str_ht_call14>:
 7c0:	68 74 5f 63 61       	push   $0x61635f74
 7c5:	6c                   	insb   (%dx),%es:(%edi)
 7c6:	6c                   	insb   (%dx),%es:(%edi)
 7c7:	31 34 00             	xor    %esi,(%eax,%eax,1)

000007ca <ht_call14>:
CS550HTSYSCALL(ht_call14)
 7ca:	b8 c0 07 00 00       	mov    $0x7c0,%eax
 7cf:	cd 42                	int    $0x42
 7d1:	c3                   	ret    

000007d2 <str_ht_call15>:
 7d2:	68 74 5f 63 61       	push   $0x61635f74
 7d7:	6c                   	insb   (%dx),%es:(%edi)
 7d8:	6c                   	insb   (%dx),%es:(%edi)
 7d9:	31                   	.byte 0x31
 7da:	35                   	.byte 0x35
	...

000007dc <ht_call15>:
CS550HTSYSCALL(ht_call15)
 7dc:	b8 d2 07 00 00       	mov    $0x7d2,%eax
 7e1:	cd 42                	int    $0x42
 7e3:	c3                   	ret    

000007e4 <str_ht_call16>:
 7e4:	68 74 5f 63 61       	push   $0x61635f74
 7e9:	6c                   	insb   (%dx),%es:(%edi)
 7ea:	6c                   	insb   (%dx),%es:(%edi)
 7eb:	31 36                	xor    %esi,(%esi)
	...

000007ee <ht_call16>:
CS550HTSYSCALL(ht_call16)
 7ee:	b8 e4 07 00 00       	mov    $0x7e4,%eax
 7f3:	cd 42                	int    $0x42
 7f5:	c3                   	ret    

000007f6 <str_ht_call17>:
 7f6:	68 74 5f 63 61       	push   $0x61635f74
 7fb:	6c                   	insb   (%dx),%es:(%edi)
 7fc:	6c                   	insb   (%dx),%es:(%edi)
 7fd:	31 37                	xor    %esi,(%edi)
	...

00000800 <ht_call17>:
CS550HTSYSCALL(ht_call17)
 800:	b8 f6 07 00 00       	mov    $0x7f6,%eax
 805:	cd 42                	int    $0x42
 807:	c3                   	ret    

00000808 <str_ht_call18>:
 808:	68 74 5f 63 61       	push   $0x61635f74
 80d:	6c                   	insb   (%dx),%es:(%edi)
 80e:	6c                   	insb   (%dx),%es:(%edi)
 80f:	31 38                	xor    %edi,(%eax)
	...

00000812 <ht_call18>:
CS550HTSYSCALL(ht_call18)
 812:	b8 08 08 00 00       	mov    $0x808,%eax
 817:	cd 42                	int    $0x42
 819:	c3                   	ret    

0000081a <str_ht_call19>:
 81a:	68 74 5f 63 61       	push   $0x61635f74
 81f:	6c                   	insb   (%dx),%es:(%edi)
 820:	6c                   	insb   (%dx),%es:(%edi)
 821:	31 39                	xor    %edi,(%ecx)
	...

00000824 <ht_call19>:
CS550HTSYSCALL(ht_call19)
 824:	b8 1a 08 00 00       	mov    $0x81a,%eax
 829:	cd 42                	int    $0x42
 82b:	c3                   	ret    

0000082c <str_ht_call20>:
 82c:	68 74 5f 63 61       	push   $0x61635f74
 831:	6c                   	insb   (%dx),%es:(%edi)
 832:	6c                   	insb   (%dx),%es:(%edi)
 833:	32 30                	xor    (%eax),%dh
	...

00000836 <ht_call20>:
CS550HTSYSCALL(ht_call20)
 836:	b8 2c 08 00 00       	mov    $0x82c,%eax
 83b:	cd 42                	int    $0x42
 83d:	c3                   	ret    

0000083e <str_ht_call21>:
 83e:	68 74 5f 63 61       	push   $0x61635f74
 843:	6c                   	insb   (%dx),%es:(%edi)
 844:	6c                   	insb   (%dx),%es:(%edi)
 845:	32 31                	xor    (%ecx),%dh
	...

00000848 <ht_call21>:
CS550HTSYSCALL(ht_call21)
 848:	b8 3e 08 00 00       	mov    $0x83e,%eax
 84d:	cd 42                	int    $0x42
 84f:	c3                   	ret    

00000850 <str_ht_call22>:
 850:	68 74 5f 63 61       	push   $0x61635f74
 855:	6c                   	insb   (%dx),%es:(%edi)
 856:	6c                   	insb   (%dx),%es:(%edi)
 857:	32 32                	xor    (%edx),%dh
	...

0000085a <ht_call22>:
CS550HTSYSCALL(ht_call22)
 85a:	b8 50 08 00 00       	mov    $0x850,%eax
 85f:	cd 42                	int    $0x42
 861:	c3                   	ret    

00000862 <str_ht_call23>:
 862:	68 74 5f 63 61       	push   $0x61635f74
 867:	6c                   	insb   (%dx),%es:(%edi)
 868:	6c                   	insb   (%dx),%es:(%edi)
 869:	32 33                	xor    (%ebx),%dh
	...

0000086c <ht_call23>:
CS550HTSYSCALL(ht_call23)
 86c:	b8 62 08 00 00       	mov    $0x862,%eax
 871:	cd 42                	int    $0x42
 873:	c3                   	ret    

00000874 <str_ht_call24>:
 874:	68 74 5f 63 61       	push   $0x61635f74
 879:	6c                   	insb   (%dx),%es:(%edi)
 87a:	6c                   	insb   (%dx),%es:(%edi)
 87b:	32 34 00             	xor    (%eax,%eax,1),%dh

0000087e <ht_call24>:
CS550HTSYSCALL(ht_call24)
 87e:	b8 74 08 00 00       	mov    $0x874,%eax
 883:	cd 42                	int    $0x42
 885:	c3                   	ret    

00000886 <str_ht_call25>:
 886:	68 74 5f 63 61       	push   $0x61635f74
 88b:	6c                   	insb   (%dx),%es:(%edi)
 88c:	6c                   	insb   (%dx),%es:(%edi)
 88d:	32                   	.byte 0x32
 88e:	35                   	.byte 0x35
	...

00000890 <ht_call25>:
CS550HTSYSCALL(ht_call25)
 890:	b8 86 08 00 00       	mov    $0x886,%eax
 895:	cd 42                	int    $0x42
 897:	c3                   	ret    

00000898 <str_ht_call26>:
 898:	68 74 5f 63 61       	push   $0x61635f74
 89d:	6c                   	insb   (%dx),%es:(%edi)
 89e:	6c                   	insb   (%dx),%es:(%edi)
 89f:	32 36                	xor    (%esi),%dh
	...

000008a2 <ht_call26>:
CS550HTSYSCALL(ht_call26)
 8a2:	b8 98 08 00 00       	mov    $0x898,%eax
 8a7:	cd 42                	int    $0x42
 8a9:	c3                   	ret    

000008aa <str_ht_call27>:
 8aa:	68 74 5f 63 61       	push   $0x61635f74
 8af:	6c                   	insb   (%dx),%es:(%edi)
 8b0:	6c                   	insb   (%dx),%es:(%edi)
 8b1:	32 37                	xor    (%edi),%dh
	...

000008b4 <ht_call27>:
CS550HTSYSCALL(ht_call27)
 8b4:	b8 aa 08 00 00       	mov    $0x8aa,%eax
 8b9:	cd 42                	int    $0x42
 8bb:	c3                   	ret    

000008bc <str_ht_call28>:
 8bc:	68 74 5f 63 61       	push   $0x61635f74
 8c1:	6c                   	insb   (%dx),%es:(%edi)
 8c2:	6c                   	insb   (%dx),%es:(%edi)
 8c3:	32 38                	xor    (%eax),%bh
	...

000008c6 <ht_call28>:
CS550HTSYSCALL(ht_call28)
 8c6:	b8 bc 08 00 00       	mov    $0x8bc,%eax
 8cb:	cd 42                	int    $0x42
 8cd:	c3                   	ret    

000008ce <str_ht_call29>:
 8ce:	68 74 5f 63 61       	push   $0x61635f74
 8d3:	6c                   	insb   (%dx),%es:(%edi)
 8d4:	6c                   	insb   (%dx),%es:(%edi)
 8d5:	32 39                	xor    (%ecx),%bh
	...

000008d8 <ht_call29>:
CS550HTSYSCALL(ht_call29)
 8d8:	b8 ce 08 00 00       	mov    $0x8ce,%eax
 8dd:	cd 42                	int    $0x42
 8df:	c3                   	ret    

000008e0 <str_ht_call30>:
 8e0:	68 74 5f 63 61       	push   $0x61635f74
 8e5:	6c                   	insb   (%dx),%es:(%edi)
 8e6:	6c                   	insb   (%dx),%es:(%edi)
 8e7:	33 30                	xor    (%eax),%esi
	...

000008ea <ht_call30>:
CS550HTSYSCALL(ht_call30)
 8ea:	b8 e0 08 00 00       	mov    $0x8e0,%eax
 8ef:	cd 42                	int    $0x42
 8f1:	c3                   	ret    

000008f2 <str_ht_call31>:
 8f2:	68 74 5f 63 61       	push   $0x61635f74
 8f7:	6c                   	insb   (%dx),%es:(%edi)
 8f8:	6c                   	insb   (%dx),%es:(%edi)
 8f9:	33 31                	xor    (%ecx),%esi
	...

000008fc <ht_call31>:
CS550HTSYSCALL(ht_call31)
 8fc:	b8 f2 08 00 00       	mov    $0x8f2,%eax
 901:	cd 42                	int    $0x42
 903:	c3                   	ret    

00000904 <str_ht_call32>:
 904:	68 74 5f 63 61       	push   $0x61635f74
 909:	6c                   	insb   (%dx),%es:(%edi)
 90a:	6c                   	insb   (%dx),%es:(%edi)
 90b:	33 32                	xor    (%edx),%esi
	...

0000090e <ht_call32>:
CS550HTSYSCALL(ht_call32)
 90e:	b8 04 09 00 00       	mov    $0x904,%eax
 913:	cd 42                	int    $0x42
 915:	c3                   	ret    

00000916 <str_ht_call33>:
 916:	68 74 5f 63 61       	push   $0x61635f74
 91b:	6c                   	insb   (%dx),%es:(%edi)
 91c:	6c                   	insb   (%dx),%es:(%edi)
 91d:	33 33                	xor    (%ebx),%esi
	...

00000920 <ht_call33>:
CS550HTSYSCALL(ht_call33)
 920:	b8 16 09 00 00       	mov    $0x916,%eax
 925:	cd 42                	int    $0x42
 927:	c3                   	ret    

00000928 <str_ht_call34>:
 928:	68 74 5f 63 61       	push   $0x61635f74
 92d:	6c                   	insb   (%dx),%es:(%edi)
 92e:	6c                   	insb   (%dx),%es:(%edi)
 92f:	33 34 00             	xor    (%eax,%eax,1),%esi

00000932 <ht_call34>:
CS550HTSYSCALL(ht_call34)
 932:	b8 28 09 00 00       	mov    $0x928,%eax
 937:	cd 42                	int    $0x42
 939:	c3                   	ret    

0000093a <str_ht_call35>:
 93a:	68 74 5f 63 61       	push   $0x61635f74
 93f:	6c                   	insb   (%dx),%es:(%edi)
 940:	6c                   	insb   (%dx),%es:(%edi)
 941:	33                   	.byte 0x33
 942:	35                   	.byte 0x35
	...

00000944 <ht_call35>:
CS550HTSYSCALL(ht_call35)
 944:	b8 3a 09 00 00       	mov    $0x93a,%eax
 949:	cd 42                	int    $0x42
 94b:	c3                   	ret    

0000094c <str_ht_call36>:
 94c:	68 74 5f 63 61       	push   $0x61635f74
 951:	6c                   	insb   (%dx),%es:(%edi)
 952:	6c                   	insb   (%dx),%es:(%edi)
 953:	33 36                	xor    (%esi),%esi
	...

00000956 <ht_call36>:
CS550HTSYSCALL(ht_call36)
 956:	b8 4c 09 00 00       	mov    $0x94c,%eax
 95b:	cd 42                	int    $0x42
 95d:	c3                   	ret    

0000095e <str_ht_call37>:
 95e:	68 74 5f 63 61       	push   $0x61635f74
 963:	6c                   	insb   (%dx),%es:(%edi)
 964:	6c                   	insb   (%dx),%es:(%edi)
 965:	33 37                	xor    (%edi),%esi
	...

00000968 <ht_call37>:
CS550HTSYSCALL(ht_call37)
 968:	b8 5e 09 00 00       	mov    $0x95e,%eax
 96d:	cd 42                	int    $0x42
 96f:	c3                   	ret    

00000970 <str_ht_call38>:
 970:	68 74 5f 63 61       	push   $0x61635f74
 975:	6c                   	insb   (%dx),%es:(%edi)
 976:	6c                   	insb   (%dx),%es:(%edi)
 977:	33 38                	xor    (%eax),%edi
	...

0000097a <ht_call38>:
CS550HTSYSCALL(ht_call38)
 97a:	b8 70 09 00 00       	mov    $0x970,%eax
 97f:	cd 42                	int    $0x42
 981:	c3                   	ret    

00000982 <str_ht_call39>:
 982:	68 74 5f 63 61       	push   $0x61635f74
 987:	6c                   	insb   (%dx),%es:(%edi)
 988:	6c                   	insb   (%dx),%es:(%edi)
 989:	33 39                	xor    (%ecx),%edi
	...

0000098c <ht_call39>:
CS550HTSYSCALL(ht_call39)
 98c:	b8 82 09 00 00       	mov    $0x982,%eax
 991:	cd 42                	int    $0x42
 993:	c3                   	ret    

00000994 <str_ht_call40>:
 994:	68 74 5f 63 61       	push   $0x61635f74
 999:	6c                   	insb   (%dx),%es:(%edi)
 99a:	6c                   	insb   (%dx),%es:(%edi)
 99b:	34 30                	xor    $0x30,%al
	...

0000099e <ht_call40>:
CS550HTSYSCALL(ht_call40)
 99e:	b8 94 09 00 00       	mov    $0x994,%eax
 9a3:	cd 42                	int    $0x42
 9a5:	c3                   	ret    

000009a6 <str_ht_call41>:
 9a6:	68 74 5f 63 61       	push   $0x61635f74
 9ab:	6c                   	insb   (%dx),%es:(%edi)
 9ac:	6c                   	insb   (%dx),%es:(%edi)
 9ad:	34 31                	xor    $0x31,%al
	...

000009b0 <ht_call41>:
CS550HTSYSCALL(ht_call41)
 9b0:	b8 a6 09 00 00       	mov    $0x9a6,%eax
 9b5:	cd 42                	int    $0x42
 9b7:	c3                   	ret    

000009b8 <str_ht_call42>:
 9b8:	68 74 5f 63 61       	push   $0x61635f74
 9bd:	6c                   	insb   (%dx),%es:(%edi)
 9be:	6c                   	insb   (%dx),%es:(%edi)
 9bf:	34 32                	xor    $0x32,%al
	...

000009c2 <ht_call42>:
CS550HTSYSCALL(ht_call42)
 9c2:	b8 b8 09 00 00       	mov    $0x9b8,%eax
 9c7:	cd 42                	int    $0x42
 9c9:	c3                   	ret    

000009ca <str_ht_call43>:
 9ca:	68 74 5f 63 61       	push   $0x61635f74
 9cf:	6c                   	insb   (%dx),%es:(%edi)
 9d0:	6c                   	insb   (%dx),%es:(%edi)
 9d1:	34 33                	xor    $0x33,%al
	...

000009d4 <ht_call43>:
CS550HTSYSCALL(ht_call43)
 9d4:	b8 ca 09 00 00       	mov    $0x9ca,%eax
 9d9:	cd 42                	int    $0x42
 9db:	c3                   	ret    

000009dc <str_ht_call44>:
 9dc:	68 74 5f 63 61       	push   $0x61635f74
 9e1:	6c                   	insb   (%dx),%es:(%edi)
 9e2:	6c                   	insb   (%dx),%es:(%edi)
 9e3:	34 34                	xor    $0x34,%al
	...

000009e6 <ht_call44>:
CS550HTSYSCALL(ht_call44)
 9e6:	b8 dc 09 00 00       	mov    $0x9dc,%eax
 9eb:	cd 42                	int    $0x42
 9ed:	c3                   	ret    

000009ee <str_ht_call45>:
 9ee:	68 74 5f 63 61       	push   $0x61635f74
 9f3:	6c                   	insb   (%dx),%es:(%edi)
 9f4:	6c                   	insb   (%dx),%es:(%edi)
 9f5:	34 35                	xor    $0x35,%al
	...

000009f8 <ht_call45>:
CS550HTSYSCALL(ht_call45)
 9f8:	b8 ee 09 00 00       	mov    $0x9ee,%eax
 9fd:	cd 42                	int    $0x42
 9ff:	c3                   	ret    

00000a00 <str_ht_call46>:
 a00:	68 74 5f 63 61       	push   $0x61635f74
 a05:	6c                   	insb   (%dx),%es:(%edi)
 a06:	6c                   	insb   (%dx),%es:(%edi)
 a07:	34 36                	xor    $0x36,%al
	...

00000a0a <ht_call46>:
CS550HTSYSCALL(ht_call46)
 a0a:	b8 00 0a 00 00       	mov    $0xa00,%eax
 a0f:	cd 42                	int    $0x42
 a11:	c3                   	ret    

00000a12 <str_ht_call47>:
 a12:	68 74 5f 63 61       	push   $0x61635f74
 a17:	6c                   	insb   (%dx),%es:(%edi)
 a18:	6c                   	insb   (%dx),%es:(%edi)
 a19:	34 37                	xor    $0x37,%al
	...

00000a1c <ht_call47>:
CS550HTSYSCALL(ht_call47)
 a1c:	b8 12 0a 00 00       	mov    $0xa12,%eax
 a21:	cd 42                	int    $0x42
 a23:	c3                   	ret    

00000a24 <str_ht_call48>:
 a24:	68 74 5f 63 61       	push   $0x61635f74
 a29:	6c                   	insb   (%dx),%es:(%edi)
 a2a:	6c                   	insb   (%dx),%es:(%edi)
 a2b:	34 38                	xor    $0x38,%al
	...

00000a2e <ht_call48>:
CS550HTSYSCALL(ht_call48)
 a2e:	b8 24 0a 00 00       	mov    $0xa24,%eax
 a33:	cd 42                	int    $0x42
 a35:	c3                   	ret    

00000a36 <str_ht_call49>:
 a36:	68 74 5f 63 61       	push   $0x61635f74
 a3b:	6c                   	insb   (%dx),%es:(%edi)
 a3c:	6c                   	insb   (%dx),%es:(%edi)
 a3d:	34 39                	xor    $0x39,%al
	...

00000a40 <ht_call49>:
CS550HTSYSCALL(ht_call49)
 a40:	b8 36 0a 00 00       	mov    $0xa36,%eax
 a45:	cd 42                	int    $0x42
 a47:	c3                   	ret    

00000a48 <str_ht_call50>:
 a48:	68 74 5f 63 61       	push   $0x61635f74
 a4d:	6c                   	insb   (%dx),%es:(%edi)
 a4e:	6c                   	insb   (%dx),%es:(%edi)
 a4f:	35                   	.byte 0x35
 a50:	30 00                	xor    %al,(%eax)

00000a52 <ht_call50>:
CS550HTSYSCALL(ht_call50)
 a52:	b8 48 0a 00 00       	mov    $0xa48,%eax
 a57:	cd 42                	int    $0x42
 a59:	c3                   	ret    

00000a5a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 a5a:	55                   	push   %ebp
 a5b:	89 e5                	mov    %esp,%ebp
 a5d:	83 ec 18             	sub    $0x18,%esp
 a60:	8b 45 0c             	mov    0xc(%ebp),%eax
 a63:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 a66:	83 ec 04             	sub    $0x4,%esp
 a69:	6a 01                	push   $0x1
 a6b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 a6e:	50                   	push   %eax
 a6f:	ff 75 08             	pushl  0x8(%ebp)
 a72:	e8 65 f8 ff ff       	call   2dc <write>
 a77:	83 c4 10             	add    $0x10,%esp
}
 a7a:	90                   	nop
 a7b:	c9                   	leave  
 a7c:	c3                   	ret    

00000a7d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 a7d:	55                   	push   %ebp
 a7e:	89 e5                	mov    %esp,%ebp
 a80:	53                   	push   %ebx
 a81:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 a84:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 a8b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 a8f:	74 17                	je     aa8 <printint+0x2b>
 a91:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 a95:	79 11                	jns    aa8 <printint+0x2b>
    neg = 1;
 a97:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 a9e:	8b 45 0c             	mov    0xc(%ebp),%eax
 aa1:	f7 d8                	neg    %eax
 aa3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 aa6:	eb 06                	jmp    aae <printint+0x31>
  } else {
    x = xx;
 aa8:	8b 45 0c             	mov    0xc(%ebp),%eax
 aab:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 aae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 ab5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 ab8:	8d 41 01             	lea    0x1(%ecx),%eax
 abb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 abe:	8b 5d 10             	mov    0x10(%ebp),%ebx
 ac1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ac4:	ba 00 00 00 00       	mov    $0x0,%edx
 ac9:	f7 f3                	div    %ebx
 acb:	89 d0                	mov    %edx,%eax
 acd:	0f b6 80 44 11 00 00 	movzbl 0x1144(%eax),%eax
 ad4:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 ad8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 adb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ade:	ba 00 00 00 00       	mov    $0x0,%edx
 ae3:	f7 f3                	div    %ebx
 ae5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 ae8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 aec:	75 c7                	jne    ab5 <printint+0x38>
  if(neg)
 aee:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 af2:	74 2d                	je     b21 <printint+0xa4>
    buf[i++] = '-';
 af4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af7:	8d 50 01             	lea    0x1(%eax),%edx
 afa:	89 55 f4             	mov    %edx,-0xc(%ebp)
 afd:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 b02:	eb 1d                	jmp    b21 <printint+0xa4>
    putc(fd, buf[i]);
 b04:	8d 55 dc             	lea    -0x24(%ebp),%edx
 b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b0a:	01 d0                	add    %edx,%eax
 b0c:	0f b6 00             	movzbl (%eax),%eax
 b0f:	0f be c0             	movsbl %al,%eax
 b12:	83 ec 08             	sub    $0x8,%esp
 b15:	50                   	push   %eax
 b16:	ff 75 08             	pushl  0x8(%ebp)
 b19:	e8 3c ff ff ff       	call   a5a <putc>
 b1e:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 b21:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 b25:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b29:	79 d9                	jns    b04 <printint+0x87>
    putc(fd, buf[i]);
}
 b2b:	90                   	nop
 b2c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b2f:	c9                   	leave  
 b30:	c3                   	ret    

00000b31 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 b31:	55                   	push   %ebp
 b32:	89 e5                	mov    %esp,%ebp
 b34:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 b37:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 b3e:	8d 45 0c             	lea    0xc(%ebp),%eax
 b41:	83 c0 04             	add    $0x4,%eax
 b44:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 b47:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 b4e:	e9 59 01 00 00       	jmp    cac <printf+0x17b>
    c = fmt[i] & 0xff;
 b53:	8b 55 0c             	mov    0xc(%ebp),%edx
 b56:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b59:	01 d0                	add    %edx,%eax
 b5b:	0f b6 00             	movzbl (%eax),%eax
 b5e:	0f be c0             	movsbl %al,%eax
 b61:	25 ff 00 00 00       	and    $0xff,%eax
 b66:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 b69:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b6d:	75 2c                	jne    b9b <printf+0x6a>
      if(c == '%'){
 b6f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 b73:	75 0c                	jne    b81 <printf+0x50>
        state = '%';
 b75:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 b7c:	e9 27 01 00 00       	jmp    ca8 <printf+0x177>
      } else {
        putc(fd, c);
 b81:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 b84:	0f be c0             	movsbl %al,%eax
 b87:	83 ec 08             	sub    $0x8,%esp
 b8a:	50                   	push   %eax
 b8b:	ff 75 08             	pushl  0x8(%ebp)
 b8e:	e8 c7 fe ff ff       	call   a5a <putc>
 b93:	83 c4 10             	add    $0x10,%esp
 b96:	e9 0d 01 00 00       	jmp    ca8 <printf+0x177>
      }
    } else if(state == '%'){
 b9b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 b9f:	0f 85 03 01 00 00    	jne    ca8 <printf+0x177>
      if(c == 'd'){
 ba5:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 ba9:	75 1e                	jne    bc9 <printf+0x98>
        printint(fd, *ap, 10, 1);
 bab:	8b 45 e8             	mov    -0x18(%ebp),%eax
 bae:	8b 00                	mov    (%eax),%eax
 bb0:	6a 01                	push   $0x1
 bb2:	6a 0a                	push   $0xa
 bb4:	50                   	push   %eax
 bb5:	ff 75 08             	pushl  0x8(%ebp)
 bb8:	e8 c0 fe ff ff       	call   a7d <printint>
 bbd:	83 c4 10             	add    $0x10,%esp
        ap++;
 bc0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 bc4:	e9 d8 00 00 00       	jmp    ca1 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 bc9:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 bcd:	74 06                	je     bd5 <printf+0xa4>
 bcf:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 bd3:	75 1e                	jne    bf3 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 bd5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 bd8:	8b 00                	mov    (%eax),%eax
 bda:	6a 00                	push   $0x0
 bdc:	6a 10                	push   $0x10
 bde:	50                   	push   %eax
 bdf:	ff 75 08             	pushl  0x8(%ebp)
 be2:	e8 96 fe ff ff       	call   a7d <printint>
 be7:	83 c4 10             	add    $0x10,%esp
        ap++;
 bea:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 bee:	e9 ae 00 00 00       	jmp    ca1 <printf+0x170>
      } else if(c == 's'){
 bf3:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 bf7:	75 43                	jne    c3c <printf+0x10b>
        s = (char*)*ap;
 bf9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 bfc:	8b 00                	mov    (%eax),%eax
 bfe:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 c01:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 c05:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c09:	75 25                	jne    c30 <printf+0xff>
          s = "(null)";
 c0b:	c7 45 f4 f0 0e 00 00 	movl   $0xef0,-0xc(%ebp)
        while(*s != 0){
 c12:	eb 1c                	jmp    c30 <printf+0xff>
          putc(fd, *s);
 c14:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c17:	0f b6 00             	movzbl (%eax),%eax
 c1a:	0f be c0             	movsbl %al,%eax
 c1d:	83 ec 08             	sub    $0x8,%esp
 c20:	50                   	push   %eax
 c21:	ff 75 08             	pushl  0x8(%ebp)
 c24:	e8 31 fe ff ff       	call   a5a <putc>
 c29:	83 c4 10             	add    $0x10,%esp
          s++;
 c2c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 c30:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c33:	0f b6 00             	movzbl (%eax),%eax
 c36:	84 c0                	test   %al,%al
 c38:	75 da                	jne    c14 <printf+0xe3>
 c3a:	eb 65                	jmp    ca1 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 c3c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 c40:	75 1d                	jne    c5f <printf+0x12e>
        putc(fd, *ap);
 c42:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c45:	8b 00                	mov    (%eax),%eax
 c47:	0f be c0             	movsbl %al,%eax
 c4a:	83 ec 08             	sub    $0x8,%esp
 c4d:	50                   	push   %eax
 c4e:	ff 75 08             	pushl  0x8(%ebp)
 c51:	e8 04 fe ff ff       	call   a5a <putc>
 c56:	83 c4 10             	add    $0x10,%esp
        ap++;
 c59:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 c5d:	eb 42                	jmp    ca1 <printf+0x170>
      } else if(c == '%'){
 c5f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 c63:	75 17                	jne    c7c <printf+0x14b>
        putc(fd, c);
 c65:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c68:	0f be c0             	movsbl %al,%eax
 c6b:	83 ec 08             	sub    $0x8,%esp
 c6e:	50                   	push   %eax
 c6f:	ff 75 08             	pushl  0x8(%ebp)
 c72:	e8 e3 fd ff ff       	call   a5a <putc>
 c77:	83 c4 10             	add    $0x10,%esp
 c7a:	eb 25                	jmp    ca1 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 c7c:	83 ec 08             	sub    $0x8,%esp
 c7f:	6a 25                	push   $0x25
 c81:	ff 75 08             	pushl  0x8(%ebp)
 c84:	e8 d1 fd ff ff       	call   a5a <putc>
 c89:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 c8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c8f:	0f be c0             	movsbl %al,%eax
 c92:	83 ec 08             	sub    $0x8,%esp
 c95:	50                   	push   %eax
 c96:	ff 75 08             	pushl  0x8(%ebp)
 c99:	e8 bc fd ff ff       	call   a5a <putc>
 c9e:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 ca1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 ca8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 cac:	8b 55 0c             	mov    0xc(%ebp),%edx
 caf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cb2:	01 d0                	add    %edx,%eax
 cb4:	0f b6 00             	movzbl (%eax),%eax
 cb7:	84 c0                	test   %al,%al
 cb9:	0f 85 94 fe ff ff    	jne    b53 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 cbf:	90                   	nop
 cc0:	c9                   	leave  
 cc1:	c3                   	ret    

00000cc2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 cc2:	55                   	push   %ebp
 cc3:	89 e5                	mov    %esp,%ebp
 cc5:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 cc8:	8b 45 08             	mov    0x8(%ebp),%eax
 ccb:	83 e8 08             	sub    $0x8,%eax
 cce:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cd1:	a1 60 11 00 00       	mov    0x1160,%eax
 cd6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 cd9:	eb 24                	jmp    cff <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cdb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cde:	8b 00                	mov    (%eax),%eax
 ce0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 ce3:	77 12                	ja     cf7 <free+0x35>
 ce5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ce8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 ceb:	77 24                	ja     d11 <free+0x4f>
 ced:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cf0:	8b 00                	mov    (%eax),%eax
 cf2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 cf5:	77 1a                	ja     d11 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cf7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cfa:	8b 00                	mov    (%eax),%eax
 cfc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 cff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d02:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 d05:	76 d4                	jbe    cdb <free+0x19>
 d07:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d0a:	8b 00                	mov    (%eax),%eax
 d0c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d0f:	76 ca                	jbe    cdb <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 d11:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d14:	8b 40 04             	mov    0x4(%eax),%eax
 d17:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 d1e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d21:	01 c2                	add    %eax,%edx
 d23:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d26:	8b 00                	mov    (%eax),%eax
 d28:	39 c2                	cmp    %eax,%edx
 d2a:	75 24                	jne    d50 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 d2c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d2f:	8b 50 04             	mov    0x4(%eax),%edx
 d32:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d35:	8b 00                	mov    (%eax),%eax
 d37:	8b 40 04             	mov    0x4(%eax),%eax
 d3a:	01 c2                	add    %eax,%edx
 d3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d3f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 d42:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d45:	8b 00                	mov    (%eax),%eax
 d47:	8b 10                	mov    (%eax),%edx
 d49:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d4c:	89 10                	mov    %edx,(%eax)
 d4e:	eb 0a                	jmp    d5a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 d50:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d53:	8b 10                	mov    (%eax),%edx
 d55:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d58:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 d5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d5d:	8b 40 04             	mov    0x4(%eax),%eax
 d60:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 d67:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d6a:	01 d0                	add    %edx,%eax
 d6c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d6f:	75 20                	jne    d91 <free+0xcf>
    p->s.size += bp->s.size;
 d71:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d74:	8b 50 04             	mov    0x4(%eax),%edx
 d77:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d7a:	8b 40 04             	mov    0x4(%eax),%eax
 d7d:	01 c2                	add    %eax,%edx
 d7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d82:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 d85:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d88:	8b 10                	mov    (%eax),%edx
 d8a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d8d:	89 10                	mov    %edx,(%eax)
 d8f:	eb 08                	jmp    d99 <free+0xd7>
  } else
    p->s.ptr = bp;
 d91:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d94:	8b 55 f8             	mov    -0x8(%ebp),%edx
 d97:	89 10                	mov    %edx,(%eax)
  freep = p;
 d99:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d9c:	a3 60 11 00 00       	mov    %eax,0x1160
}
 da1:	90                   	nop
 da2:	c9                   	leave  
 da3:	c3                   	ret    

00000da4 <morecore>:

static Header*
morecore(uint nu)
{
 da4:	55                   	push   %ebp
 da5:	89 e5                	mov    %esp,%ebp
 da7:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 daa:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 db1:	77 07                	ja     dba <morecore+0x16>
    nu = 4096;
 db3:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 dba:	8b 45 08             	mov    0x8(%ebp),%eax
 dbd:	c1 e0 03             	shl    $0x3,%eax
 dc0:	83 ec 0c             	sub    $0xc,%esp
 dc3:	50                   	push   %eax
 dc4:	e8 7b f5 ff ff       	call   344 <sbrk>
 dc9:	83 c4 10             	add    $0x10,%esp
 dcc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 dcf:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 dd3:	75 07                	jne    ddc <morecore+0x38>
    return 0;
 dd5:	b8 00 00 00 00       	mov    $0x0,%eax
 dda:	eb 26                	jmp    e02 <morecore+0x5e>
  hp = (Header*)p;
 ddc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ddf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 de2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 de5:	8b 55 08             	mov    0x8(%ebp),%edx
 de8:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 deb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 dee:	83 c0 08             	add    $0x8,%eax
 df1:	83 ec 0c             	sub    $0xc,%esp
 df4:	50                   	push   %eax
 df5:	e8 c8 fe ff ff       	call   cc2 <free>
 dfa:	83 c4 10             	add    $0x10,%esp
  return freep;
 dfd:	a1 60 11 00 00       	mov    0x1160,%eax
}
 e02:	c9                   	leave  
 e03:	c3                   	ret    

00000e04 <malloc>:

void*
malloc(uint nbytes)
{
 e04:	55                   	push   %ebp
 e05:	89 e5                	mov    %esp,%ebp
 e07:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 e0a:	8b 45 08             	mov    0x8(%ebp),%eax
 e0d:	83 c0 07             	add    $0x7,%eax
 e10:	c1 e8 03             	shr    $0x3,%eax
 e13:	83 c0 01             	add    $0x1,%eax
 e16:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 e19:	a1 60 11 00 00       	mov    0x1160,%eax
 e1e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 e21:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 e25:	75 23                	jne    e4a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 e27:	c7 45 f0 58 11 00 00 	movl   $0x1158,-0x10(%ebp)
 e2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e31:	a3 60 11 00 00       	mov    %eax,0x1160
 e36:	a1 60 11 00 00       	mov    0x1160,%eax
 e3b:	a3 58 11 00 00       	mov    %eax,0x1158
    base.s.size = 0;
 e40:	c7 05 5c 11 00 00 00 	movl   $0x0,0x115c
 e47:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e4d:	8b 00                	mov    (%eax),%eax
 e4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 e52:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e55:	8b 40 04             	mov    0x4(%eax),%eax
 e58:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 e5b:	72 4d                	jb     eaa <malloc+0xa6>
      if(p->s.size == nunits)
 e5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e60:	8b 40 04             	mov    0x4(%eax),%eax
 e63:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 e66:	75 0c                	jne    e74 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 e68:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e6b:	8b 10                	mov    (%eax),%edx
 e6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e70:	89 10                	mov    %edx,(%eax)
 e72:	eb 26                	jmp    e9a <malloc+0x96>
      else {
        p->s.size -= nunits;
 e74:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e77:	8b 40 04             	mov    0x4(%eax),%eax
 e7a:	2b 45 ec             	sub    -0x14(%ebp),%eax
 e7d:	89 c2                	mov    %eax,%edx
 e7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e82:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 e85:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e88:	8b 40 04             	mov    0x4(%eax),%eax
 e8b:	c1 e0 03             	shl    $0x3,%eax
 e8e:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 e91:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e94:	8b 55 ec             	mov    -0x14(%ebp),%edx
 e97:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 e9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e9d:	a3 60 11 00 00       	mov    %eax,0x1160
      return (void*)(p + 1);
 ea2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ea5:	83 c0 08             	add    $0x8,%eax
 ea8:	eb 3b                	jmp    ee5 <malloc+0xe1>
    }
    if(p == freep)
 eaa:	a1 60 11 00 00       	mov    0x1160,%eax
 eaf:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 eb2:	75 1e                	jne    ed2 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 eb4:	83 ec 0c             	sub    $0xc,%esp
 eb7:	ff 75 ec             	pushl  -0x14(%ebp)
 eba:	e8 e5 fe ff ff       	call   da4 <morecore>
 ebf:	83 c4 10             	add    $0x10,%esp
 ec2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ec5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ec9:	75 07                	jne    ed2 <malloc+0xce>
        return 0;
 ecb:	b8 00 00 00 00       	mov    $0x0,%eax
 ed0:	eb 13                	jmp    ee5 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ed2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ed5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ed8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 edb:	8b 00                	mov    (%eax),%eax
 edd:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 ee0:	e9 6d ff ff ff       	jmp    e52 <malloc+0x4e>
}
 ee5:	c9                   	leave  
 ee6:	c3                   	ret    
