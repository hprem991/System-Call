
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
   6:	eb 15                	jmp    1d <cat+0x1d>
    write(1, buf, n);
   8:	83 ec 04             	sub    $0x4,%esp
   b:	ff 75 f4             	pushl  -0xc(%ebp)
   e:	68 60 12 00 00       	push   $0x1260
  13:	6a 01                	push   $0x1
  15:	e8 6c 03 00 00       	call   386 <write>
  1a:	83 c4 10             	add    $0x10,%esp
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
  1d:	83 ec 04             	sub    $0x4,%esp
  20:	68 00 02 00 00       	push   $0x200
  25:	68 60 12 00 00       	push   $0x1260
  2a:	ff 75 08             	pushl  0x8(%ebp)
  2d:	e8 4c 03 00 00       	call   37e <read>
  32:	83 c4 10             	add    $0x10,%esp
  35:	89 45 f4             	mov    %eax,-0xc(%ebp)
  38:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3c:	7f ca                	jg     8 <cat+0x8>
    write(1, buf, n);
  if(n < 0){
  3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  42:	79 17                	jns    5b <cat+0x5b>
    printf(1, "cat: read error\n");
  44:	83 ec 08             	sub    $0x8,%esp
  47:	68 91 0f 00 00       	push   $0xf91
  4c:	6a 01                	push   $0x1
  4e:	e8 88 0b 00 00       	call   bdb <printf>
  53:	83 c4 10             	add    $0x10,%esp
    exit();
  56:	e8 0b 03 00 00       	call   366 <exit>
  }
}
  5b:	90                   	nop
  5c:	c9                   	leave  
  5d:	c3                   	ret    

0000005e <main>:

int
main(int argc, char *argv[])
{
  5e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  62:	83 e4 f0             	and    $0xfffffff0,%esp
  65:	ff 71 fc             	pushl  -0x4(%ecx)
  68:	55                   	push   %ebp
  69:	89 e5                	mov    %esp,%ebp
  6b:	53                   	push   %ebx
  6c:	51                   	push   %ecx
  6d:	83 ec 10             	sub    $0x10,%esp
  70:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
  72:	83 3b 01             	cmpl   $0x1,(%ebx)
  75:	7f 12                	jg     89 <main+0x2b>
    cat(0);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	6a 00                	push   $0x0
  7c:	e8 7f ff ff ff       	call   0 <cat>
  81:	83 c4 10             	add    $0x10,%esp
    exit();
  84:	e8 dd 02 00 00       	call   366 <exit>
  }

  for(i = 1; i < argc; i++){
  89:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  90:	eb 71                	jmp    103 <main+0xa5>
    if((fd = open(argv[i], 0)) < 0){
  92:	8b 45 f4             	mov    -0xc(%ebp),%eax
  95:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  9c:	8b 43 04             	mov    0x4(%ebx),%eax
  9f:	01 d0                	add    %edx,%eax
  a1:	8b 00                	mov    (%eax),%eax
  a3:	83 ec 08             	sub    $0x8,%esp
  a6:	6a 00                	push   $0x0
  a8:	50                   	push   %eax
  a9:	e8 f8 02 00 00       	call   3a6 <open>
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  b8:	79 29                	jns    e3 <main+0x85>
      printf(1, "cat: cannot open %s\n", argv[i]);
  ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  bd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c4:	8b 43 04             	mov    0x4(%ebx),%eax
  c7:	01 d0                	add    %edx,%eax
  c9:	8b 00                	mov    (%eax),%eax
  cb:	83 ec 04             	sub    $0x4,%esp
  ce:	50                   	push   %eax
  cf:	68 a2 0f 00 00       	push   $0xfa2
  d4:	6a 01                	push   $0x1
  d6:	e8 00 0b 00 00       	call   bdb <printf>
  db:	83 c4 10             	add    $0x10,%esp
      exit();
  de:	e8 83 02 00 00       	call   366 <exit>
    }
    cat(fd);
  e3:	83 ec 0c             	sub    $0xc,%esp
  e6:	ff 75 f0             	pushl  -0x10(%ebp)
  e9:	e8 12 ff ff ff       	call   0 <cat>
  ee:	83 c4 10             	add    $0x10,%esp
    close(fd);
  f1:	83 ec 0c             	sub    $0xc,%esp
  f4:	ff 75 f0             	pushl  -0x10(%ebp)
  f7:	e8 92 02 00 00       	call   38e <close>
  fc:	83 c4 10             	add    $0x10,%esp
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 103:	8b 45 f4             	mov    -0xc(%ebp),%eax
 106:	3b 03                	cmp    (%ebx),%eax
 108:	7c 88                	jl     92 <main+0x34>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
 10a:	e8 57 02 00 00       	call   366 <exit>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	90                   	nop
 131:	5b                   	pop    %ebx
 132:	5f                   	pop    %edi
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 141:	90                   	nop
 142:	8b 45 08             	mov    0x8(%ebp),%eax
 145:	8d 50 01             	lea    0x1(%eax),%edx
 148:	89 55 08             	mov    %edx,0x8(%ebp)
 14b:	8b 55 0c             	mov    0xc(%ebp),%edx
 14e:	8d 4a 01             	lea    0x1(%edx),%ecx
 151:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 154:	0f b6 12             	movzbl (%edx),%edx
 157:	88 10                	mov    %dl,(%eax)
 159:	0f b6 00             	movzbl (%eax),%eax
 15c:	84 c0                	test   %al,%al
 15e:	75 e2                	jne    142 <strcpy+0xd>
    ;
  return os;
 160:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 163:	c9                   	leave  
 164:	c3                   	ret    

00000165 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 165:	55                   	push   %ebp
 166:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 168:	eb 08                	jmp    172 <strcmp+0xd>
    p++, q++;
 16a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 172:	8b 45 08             	mov    0x8(%ebp),%eax
 175:	0f b6 00             	movzbl (%eax),%eax
 178:	84 c0                	test   %al,%al
 17a:	74 10                	je     18c <strcmp+0x27>
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 10             	movzbl (%eax),%edx
 182:	8b 45 0c             	mov    0xc(%ebp),%eax
 185:	0f b6 00             	movzbl (%eax),%eax
 188:	38 c2                	cmp    %al,%dl
 18a:	74 de                	je     16a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 18c:	8b 45 08             	mov    0x8(%ebp),%eax
 18f:	0f b6 00             	movzbl (%eax),%eax
 192:	0f b6 d0             	movzbl %al,%edx
 195:	8b 45 0c             	mov    0xc(%ebp),%eax
 198:	0f b6 00             	movzbl (%eax),%eax
 19b:	0f b6 c0             	movzbl %al,%eax
 19e:	29 c2                	sub    %eax,%edx
 1a0:	89 d0                	mov    %edx,%eax
}
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    

000001a4 <strlen>:

uint
strlen(char *s)
{
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b1:	eb 04                	jmp    1b7 <strlen+0x13>
 1b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ba:	8b 45 08             	mov    0x8(%ebp),%eax
 1bd:	01 d0                	add    %edx,%eax
 1bf:	0f b6 00             	movzbl (%eax),%eax
 1c2:	84 c0                	test   %al,%al
 1c4:	75 ed                	jne    1b3 <strlen+0xf>
    ;
  return n;
 1c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c9:	c9                   	leave  
 1ca:	c3                   	ret    

000001cb <memset>:

void*
memset(void *dst, int c, uint n)
{
 1cb:	55                   	push   %ebp
 1cc:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1ce:	8b 45 10             	mov    0x10(%ebp),%eax
 1d1:	50                   	push   %eax
 1d2:	ff 75 0c             	pushl  0xc(%ebp)
 1d5:	ff 75 08             	pushl  0x8(%ebp)
 1d8:	e8 32 ff ff ff       	call   10f <stosb>
 1dd:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1e3:	c9                   	leave  
 1e4:	c3                   	ret    

000001e5 <strchr>:

char*
strchr(const char *s, char c)
{
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
 1e8:	83 ec 04             	sub    $0x4,%esp
 1eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ee:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1f1:	eb 14                	jmp    207 <strchr+0x22>
    if(*s == c)
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 00             	movzbl (%eax),%eax
 1f9:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1fc:	75 05                	jne    203 <strchr+0x1e>
      return (char*)s;
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
 201:	eb 13                	jmp    216 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 203:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	0f b6 00             	movzbl (%eax),%eax
 20d:	84 c0                	test   %al,%al
 20f:	75 e2                	jne    1f3 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 211:	b8 00 00 00 00       	mov    $0x0,%eax
}
 216:	c9                   	leave  
 217:	c3                   	ret    

00000218 <gets>:

char*
gets(char *buf, int max)
{
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 225:	eb 42                	jmp    269 <gets+0x51>
    cc = read(0, &c, 1);
 227:	83 ec 04             	sub    $0x4,%esp
 22a:	6a 01                	push   $0x1
 22c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 22f:	50                   	push   %eax
 230:	6a 00                	push   $0x0
 232:	e8 47 01 00 00       	call   37e <read>
 237:	83 c4 10             	add    $0x10,%esp
 23a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 23d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 241:	7e 33                	jle    276 <gets+0x5e>
      break;
    buf[i++] = c;
 243:	8b 45 f4             	mov    -0xc(%ebp),%eax
 246:	8d 50 01             	lea    0x1(%eax),%edx
 249:	89 55 f4             	mov    %edx,-0xc(%ebp)
 24c:	89 c2                	mov    %eax,%edx
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	01 c2                	add    %eax,%edx
 253:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 257:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 259:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 25d:	3c 0a                	cmp    $0xa,%al
 25f:	74 16                	je     277 <gets+0x5f>
 261:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 265:	3c 0d                	cmp    $0xd,%al
 267:	74 0e                	je     277 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26c:	83 c0 01             	add    $0x1,%eax
 26f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 272:	7c b3                	jl     227 <gets+0xf>
 274:	eb 01                	jmp    277 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 276:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 277:	8b 55 f4             	mov    -0xc(%ebp),%edx
 27a:	8b 45 08             	mov    0x8(%ebp),%eax
 27d:	01 d0                	add    %edx,%eax
 27f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 282:	8b 45 08             	mov    0x8(%ebp),%eax
}
 285:	c9                   	leave  
 286:	c3                   	ret    

00000287 <stat>:

int
stat(char *n, struct stat *st)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 28d:	83 ec 08             	sub    $0x8,%esp
 290:	6a 00                	push   $0x0
 292:	ff 75 08             	pushl  0x8(%ebp)
 295:	e8 0c 01 00 00       	call   3a6 <open>
 29a:	83 c4 10             	add    $0x10,%esp
 29d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2a4:	79 07                	jns    2ad <stat+0x26>
    return -1;
 2a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ab:	eb 25                	jmp    2d2 <stat+0x4b>
  r = fstat(fd, st);
 2ad:	83 ec 08             	sub    $0x8,%esp
 2b0:	ff 75 0c             	pushl  0xc(%ebp)
 2b3:	ff 75 f4             	pushl  -0xc(%ebp)
 2b6:	e8 03 01 00 00       	call   3be <fstat>
 2bb:	83 c4 10             	add    $0x10,%esp
 2be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2c1:	83 ec 0c             	sub    $0xc,%esp
 2c4:	ff 75 f4             	pushl  -0xc(%ebp)
 2c7:	e8 c2 00 00 00       	call   38e <close>
 2cc:	83 c4 10             	add    $0x10,%esp
  return r;
 2cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2d2:	c9                   	leave  
 2d3:	c3                   	ret    

000002d4 <atoi>:

int
atoi(const char *s)
{
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2e1:	eb 25                	jmp    308 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2e3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2e6:	89 d0                	mov    %edx,%eax
 2e8:	c1 e0 02             	shl    $0x2,%eax
 2eb:	01 d0                	add    %edx,%eax
 2ed:	01 c0                	add    %eax,%eax
 2ef:	89 c1                	mov    %eax,%ecx
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	89 55 08             	mov    %edx,0x8(%ebp)
 2fa:	0f b6 00             	movzbl (%eax),%eax
 2fd:	0f be c0             	movsbl %al,%eax
 300:	01 c8                	add    %ecx,%eax
 302:	83 e8 30             	sub    $0x30,%eax
 305:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	0f b6 00             	movzbl (%eax),%eax
 30e:	3c 2f                	cmp    $0x2f,%al
 310:	7e 0a                	jle    31c <atoi+0x48>
 312:	8b 45 08             	mov    0x8(%ebp),%eax
 315:	0f b6 00             	movzbl (%eax),%eax
 318:	3c 39                	cmp    $0x39,%al
 31a:	7e c7                	jle    2e3 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 31c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 31f:	c9                   	leave  
 320:	c3                   	ret    

00000321 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 32d:	8b 45 0c             	mov    0xc(%ebp),%eax
 330:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 333:	eb 17                	jmp    34c <memmove+0x2b>
    *dst++ = *src++;
 335:	8b 45 fc             	mov    -0x4(%ebp),%eax
 338:	8d 50 01             	lea    0x1(%eax),%edx
 33b:	89 55 fc             	mov    %edx,-0x4(%ebp)
 33e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 341:	8d 4a 01             	lea    0x1(%edx),%ecx
 344:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 347:	0f b6 12             	movzbl (%edx),%edx
 34a:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 34c:	8b 45 10             	mov    0x10(%ebp),%eax
 34f:	8d 50 ff             	lea    -0x1(%eax),%edx
 352:	89 55 10             	mov    %edx,0x10(%ebp)
 355:	85 c0                	test   %eax,%eax
 357:	7f dc                	jg     335 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 359:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35c:	c9                   	leave  
 35d:	c3                   	ret    

0000035e <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
 35e:	b8 01 00 00 00       	mov    $0x1,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret    

00000366 <exit>:
SYSCALL(exit)
 366:	b8 02 00 00 00       	mov    $0x2,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <wait>:
SYSCALL(wait)
 36e:	b8 03 00 00 00       	mov    $0x3,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <pipe>:
SYSCALL(pipe)
 376:	b8 04 00 00 00       	mov    $0x4,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <read>:
SYSCALL(read)
 37e:	b8 05 00 00 00       	mov    $0x5,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <write>:
SYSCALL(write)
 386:	b8 10 00 00 00       	mov    $0x10,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <close>:
SYSCALL(close)
 38e:	b8 15 00 00 00       	mov    $0x15,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <kill>:
SYSCALL(kill)
 396:	b8 06 00 00 00       	mov    $0x6,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <exec>:
SYSCALL(exec)
 39e:	b8 07 00 00 00       	mov    $0x7,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <open>:
SYSCALL(open)
 3a6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <mknod>:
SYSCALL(mknod)
 3ae:	b8 11 00 00 00       	mov    $0x11,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <unlink>:
SYSCALL(unlink)
 3b6:	b8 12 00 00 00       	mov    $0x12,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <fstat>:
SYSCALL(fstat)
 3be:	b8 08 00 00 00       	mov    $0x8,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <link>:
SYSCALL(link)
 3c6:	b8 13 00 00 00       	mov    $0x13,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <mkdir>:
SYSCALL(mkdir)
 3ce:	b8 14 00 00 00       	mov    $0x14,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <chdir>:
SYSCALL(chdir)
 3d6:	b8 09 00 00 00       	mov    $0x9,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <dup>:
SYSCALL(dup)
 3de:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <getpid>:
SYSCALL(getpid)
 3e6:	b8 0b 00 00 00       	mov    $0xb,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <sbrk>:
SYSCALL(sbrk)
 3ee:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <sleep>:
SYSCALL(sleep)
 3f6:	b8 0d 00 00 00       	mov    $0xd,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <uptime>:
SYSCALL(uptime)
 3fe:	b8 0e 00 00 00       	mov    $0xe,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <date>:

// Assignment starts here

SYSCALL(date)
 406:	b8 16 00 00 00       	mov    $0x16,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <str_ls_call1>:
 40e:	6c                   	insb   (%dx),%es:(%edi)
 40f:	73 5f                	jae    470 <ls_call6+0x4>
 411:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 414:	6c                   	insb   (%dx),%es:(%edi)
 415:	31 00                	xor    %eax,(%eax)

00000417 <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
 417:	b8 0e 04 00 00       	mov    $0x40e,%eax
 41c:	cd 41                	int    $0x41
 41e:	c3                   	ret    

0000041f <str_ls_call2>:
 41f:	6c                   	insb   (%dx),%es:(%edi)
 420:	73 5f                	jae    481 <ls_call7+0x4>
 422:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 425:	6c                   	insb   (%dx),%es:(%edi)
 426:	32 00                	xor    (%eax),%al

00000428 <ls_call2>:
CS550LSSYSCALL(ls_call2)
 428:	b8 1f 04 00 00       	mov    $0x41f,%eax
 42d:	cd 41                	int    $0x41
 42f:	c3                   	ret    

00000430 <str_ls_call3>:
 430:	6c                   	insb   (%dx),%es:(%edi)
 431:	73 5f                	jae    492 <ls_call8+0x4>
 433:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 436:	6c                   	insb   (%dx),%es:(%edi)
 437:	33 00                	xor    (%eax),%eax

00000439 <ls_call3>:
CS550LSSYSCALL(ls_call3)
 439:	b8 30 04 00 00       	mov    $0x430,%eax
 43e:	cd 41                	int    $0x41
 440:	c3                   	ret    

00000441 <str_ls_call4>:
 441:	6c                   	insb   (%dx),%es:(%edi)
 442:	73 5f                	jae    4a3 <ls_call9+0x4>
 444:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 447:	6c                   	insb   (%dx),%es:(%edi)
 448:	34 00                	xor    $0x0,%al

0000044a <ls_call4>:
CS550LSSYSCALL(ls_call4)
 44a:	b8 41 04 00 00       	mov    $0x441,%eax
 44f:	cd 41                	int    $0x41
 451:	c3                   	ret    

00000452 <str_ls_call5>:
 452:	6c                   	insb   (%dx),%es:(%edi)
 453:	73 5f                	jae    4b4 <ls_call10+0x3>
 455:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 458:	6c                   	insb   (%dx),%es:(%edi)
 459:	35                   	.byte 0x35
	...

0000045b <ls_call5>:
CS550LSSYSCALL(ls_call5)
 45b:	b8 52 04 00 00       	mov    $0x452,%eax
 460:	cd 41                	int    $0x41
 462:	c3                   	ret    

00000463 <str_ls_call6>:
 463:	6c                   	insb   (%dx),%es:(%edi)
 464:	73 5f                	jae    4c5 <ls_call11+0x2>
 466:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 469:	6c                   	insb   (%dx),%es:(%edi)
 46a:	36                   	ss
	...

0000046c <ls_call6>:
CS550LSSYSCALL(ls_call6)
 46c:	b8 63 04 00 00       	mov    $0x463,%eax
 471:	cd 41                	int    $0x41
 473:	c3                   	ret    

00000474 <str_ls_call7>:
 474:	6c                   	insb   (%dx),%es:(%edi)
 475:	73 5f                	jae    4d6 <ls_call12+0x1>
 477:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 47a:	6c                   	insb   (%dx),%es:(%edi)
 47b:	37                   	aaa    
	...

0000047d <ls_call7>:
CS550LSSYSCALL(ls_call7)
 47d:	b8 74 04 00 00       	mov    $0x474,%eax
 482:	cd 41                	int    $0x41
 484:	c3                   	ret    

00000485 <str_ls_call8>:
 485:	6c                   	insb   (%dx),%es:(%edi)
 486:	73 5f                	jae    4e7 <ls_call13>
 488:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 48b:	6c                   	insb   (%dx),%es:(%edi)
 48c:	38 00                	cmp    %al,(%eax)

0000048e <ls_call8>:
CS550LSSYSCALL(ls_call8)
 48e:	b8 85 04 00 00       	mov    $0x485,%eax
 493:	cd 41                	int    $0x41
 495:	c3                   	ret    

00000496 <str_ls_call9>:
 496:	6c                   	insb   (%dx),%es:(%edi)
 497:	73 5f                	jae    4f8 <str_ls_call14+0x9>
 499:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 49c:	6c                   	insb   (%dx),%es:(%edi)
 49d:	39 00                	cmp    %eax,(%eax)

0000049f <ls_call9>:
CS550LSSYSCALL(ls_call9)
 49f:	b8 96 04 00 00       	mov    $0x496,%eax
 4a4:	cd 41                	int    $0x41
 4a6:	c3                   	ret    

000004a7 <str_ls_call10>:
 4a7:	6c                   	insb   (%dx),%es:(%edi)
 4a8:	73 5f                	jae    509 <str_ls_call15+0x8>
 4aa:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4ad:	6c                   	insb   (%dx),%es:(%edi)
 4ae:	31 30                	xor    %esi,(%eax)
	...

000004b1 <ls_call10>:
CS550LSSYSCALL(ls_call10)
 4b1:	b8 a7 04 00 00       	mov    $0x4a7,%eax
 4b6:	cd 41                	int    $0x41
 4b8:	c3                   	ret    

000004b9 <str_ls_call11>:
 4b9:	6c                   	insb   (%dx),%es:(%edi)
 4ba:	73 5f                	jae    51b <str_ls_call16+0x8>
 4bc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4bf:	6c                   	insb   (%dx),%es:(%edi)
 4c0:	31 31                	xor    %esi,(%ecx)
	...

000004c3 <ls_call11>:
CS550LSSYSCALL(ls_call11)
 4c3:	b8 b9 04 00 00       	mov    $0x4b9,%eax
 4c8:	cd 41                	int    $0x41
 4ca:	c3                   	ret    

000004cb <str_ls_call12>:
 4cb:	6c                   	insb   (%dx),%es:(%edi)
 4cc:	73 5f                	jae    52d <str_ls_call17+0x8>
 4ce:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4d1:	6c                   	insb   (%dx),%es:(%edi)
 4d2:	31 32                	xor    %esi,(%edx)
	...

000004d5 <ls_call12>:
CS550LSSYSCALL(ls_call12)
 4d5:	b8 cb 04 00 00       	mov    $0x4cb,%eax
 4da:	cd 41                	int    $0x41
 4dc:	c3                   	ret    

000004dd <str_ls_call13>:
 4dd:	6c                   	insb   (%dx),%es:(%edi)
 4de:	73 5f                	jae    53f <str_ls_call18+0x8>
 4e0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4e3:	6c                   	insb   (%dx),%es:(%edi)
 4e4:	31 33                	xor    %esi,(%ebx)
	...

000004e7 <ls_call13>:
CS550LSSYSCALL(ls_call13)
 4e7:	b8 dd 04 00 00       	mov    $0x4dd,%eax
 4ec:	cd 41                	int    $0x41
 4ee:	c3                   	ret    

000004ef <str_ls_call14>:
 4ef:	6c                   	insb   (%dx),%es:(%edi)
 4f0:	73 5f                	jae    551 <str_ls_call19+0x8>
 4f2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4f5:	6c                   	insb   (%dx),%es:(%edi)
 4f6:	31 34 00             	xor    %esi,(%eax,%eax,1)

000004f9 <ls_call14>:
CS550LSSYSCALL(ls_call14)
 4f9:	b8 ef 04 00 00       	mov    $0x4ef,%eax
 4fe:	cd 41                	int    $0x41
 500:	c3                   	ret    

00000501 <str_ls_call15>:
 501:	6c                   	insb   (%dx),%es:(%edi)
 502:	73 5f                	jae    563 <str_ls_call20+0x8>
 504:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 507:	6c                   	insb   (%dx),%es:(%edi)
 508:	31                   	.byte 0x31
 509:	35                   	.byte 0x35
	...

0000050b <ls_call15>:
CS550LSSYSCALL(ls_call15)
 50b:	b8 01 05 00 00       	mov    $0x501,%eax
 510:	cd 41                	int    $0x41
 512:	c3                   	ret    

00000513 <str_ls_call16>:
 513:	6c                   	insb   (%dx),%es:(%edi)
 514:	73 5f                	jae    575 <str_ls_call21+0x8>
 516:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 519:	6c                   	insb   (%dx),%es:(%edi)
 51a:	31 36                	xor    %esi,(%esi)
	...

0000051d <ls_call16>:
CS550LSSYSCALL(ls_call16)
 51d:	b8 13 05 00 00       	mov    $0x513,%eax
 522:	cd 41                	int    $0x41
 524:	c3                   	ret    

00000525 <str_ls_call17>:
 525:	6c                   	insb   (%dx),%es:(%edi)
 526:	73 5f                	jae    587 <str_ls_call22+0x8>
 528:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 52b:	6c                   	insb   (%dx),%es:(%edi)
 52c:	31 37                	xor    %esi,(%edi)
	...

0000052f <ls_call17>:
CS550LSSYSCALL(ls_call17)
 52f:	b8 25 05 00 00       	mov    $0x525,%eax
 534:	cd 41                	int    $0x41
 536:	c3                   	ret    

00000537 <str_ls_call18>:
 537:	6c                   	insb   (%dx),%es:(%edi)
 538:	73 5f                	jae    599 <str_ls_call23+0x8>
 53a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 53d:	6c                   	insb   (%dx),%es:(%edi)
 53e:	31 38                	xor    %edi,(%eax)
	...

00000541 <ls_call18>:
CS550LSSYSCALL(ls_call18)
 541:	b8 37 05 00 00       	mov    $0x537,%eax
 546:	cd 41                	int    $0x41
 548:	c3                   	ret    

00000549 <str_ls_call19>:
 549:	6c                   	insb   (%dx),%es:(%edi)
 54a:	73 5f                	jae    5ab <str_ls_call24+0x8>
 54c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 54f:	6c                   	insb   (%dx),%es:(%edi)
 550:	31 39                	xor    %edi,(%ecx)
	...

00000553 <ls_call19>:
CS550LSSYSCALL(ls_call19)
 553:	b8 49 05 00 00       	mov    $0x549,%eax
 558:	cd 41                	int    $0x41
 55a:	c3                   	ret    

0000055b <str_ls_call20>:
 55b:	6c                   	insb   (%dx),%es:(%edi)
 55c:	73 5f                	jae    5bd <str_ls_call25+0x8>
 55e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 561:	6c                   	insb   (%dx),%es:(%edi)
 562:	32 30                	xor    (%eax),%dh
	...

00000565 <ls_call20>:
CS550LSSYSCALL(ls_call20)
 565:	b8 5b 05 00 00       	mov    $0x55b,%eax
 56a:	cd 41                	int    $0x41
 56c:	c3                   	ret    

0000056d <str_ls_call21>:
 56d:	6c                   	insb   (%dx),%es:(%edi)
 56e:	73 5f                	jae    5cf <str_ls_call26+0x8>
 570:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 573:	6c                   	insb   (%dx),%es:(%edi)
 574:	32 31                	xor    (%ecx),%dh
	...

00000577 <ls_call21>:
CS550LSSYSCALL(ls_call21)
 577:	b8 6d 05 00 00       	mov    $0x56d,%eax
 57c:	cd 41                	int    $0x41
 57e:	c3                   	ret    

0000057f <str_ls_call22>:
 57f:	6c                   	insb   (%dx),%es:(%edi)
 580:	73 5f                	jae    5e1 <str_ls_call27+0x8>
 582:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 585:	6c                   	insb   (%dx),%es:(%edi)
 586:	32 32                	xor    (%edx),%dh
	...

00000589 <ls_call22>:
CS550LSSYSCALL(ls_call22)
 589:	b8 7f 05 00 00       	mov    $0x57f,%eax
 58e:	cd 41                	int    $0x41
 590:	c3                   	ret    

00000591 <str_ls_call23>:
 591:	6c                   	insb   (%dx),%es:(%edi)
 592:	73 5f                	jae    5f3 <str_ls_call28+0x8>
 594:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 597:	6c                   	insb   (%dx),%es:(%edi)
 598:	32 33                	xor    (%ebx),%dh
	...

0000059b <ls_call23>:
CS550LSSYSCALL(ls_call23)
 59b:	b8 91 05 00 00       	mov    $0x591,%eax
 5a0:	cd 41                	int    $0x41
 5a2:	c3                   	ret    

000005a3 <str_ls_call24>:
 5a3:	6c                   	insb   (%dx),%es:(%edi)
 5a4:	73 5f                	jae    605 <str_ls_call29+0x8>
 5a6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5a9:	6c                   	insb   (%dx),%es:(%edi)
 5aa:	32 34 00             	xor    (%eax,%eax,1),%dh

000005ad <ls_call24>:
CS550LSSYSCALL(ls_call24)
 5ad:	b8 a3 05 00 00       	mov    $0x5a3,%eax
 5b2:	cd 41                	int    $0x41
 5b4:	c3                   	ret    

000005b5 <str_ls_call25>:
 5b5:	6c                   	insb   (%dx),%es:(%edi)
 5b6:	73 5f                	jae    617 <str_ls_call30+0x8>
 5b8:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5bb:	6c                   	insb   (%dx),%es:(%edi)
 5bc:	32                   	.byte 0x32
 5bd:	35                   	.byte 0x35
	...

000005bf <ls_call25>:
CS550LSSYSCALL(ls_call25)
 5bf:	b8 b5 05 00 00       	mov    $0x5b5,%eax
 5c4:	cd 41                	int    $0x41
 5c6:	c3                   	ret    

000005c7 <str_ls_call26>:
 5c7:	6c                   	insb   (%dx),%es:(%edi)
 5c8:	73 5f                	jae    629 <str_ls_call31+0x8>
 5ca:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5cd:	6c                   	insb   (%dx),%es:(%edi)
 5ce:	32 36                	xor    (%esi),%dh
	...

000005d1 <ls_call26>:
CS550LSSYSCALL(ls_call26)
 5d1:	b8 c7 05 00 00       	mov    $0x5c7,%eax
 5d6:	cd 41                	int    $0x41
 5d8:	c3                   	ret    

000005d9 <str_ls_call27>:
 5d9:	6c                   	insb   (%dx),%es:(%edi)
 5da:	73 5f                	jae    63b <str_ls_call32+0x8>
 5dc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5df:	6c                   	insb   (%dx),%es:(%edi)
 5e0:	32 37                	xor    (%edi),%dh
	...

000005e3 <ls_call27>:
CS550LSSYSCALL(ls_call27)
 5e3:	b8 d9 05 00 00       	mov    $0x5d9,%eax
 5e8:	cd 41                	int    $0x41
 5ea:	c3                   	ret    

000005eb <str_ls_call28>:
 5eb:	6c                   	insb   (%dx),%es:(%edi)
 5ec:	73 5f                	jae    64d <str_ls_call33+0x8>
 5ee:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5f1:	6c                   	insb   (%dx),%es:(%edi)
 5f2:	32 38                	xor    (%eax),%bh
	...

000005f5 <ls_call28>:
CS550LSSYSCALL(ls_call28)
 5f5:	b8 eb 05 00 00       	mov    $0x5eb,%eax
 5fa:	cd 41                	int    $0x41
 5fc:	c3                   	ret    

000005fd <str_ls_call29>:
 5fd:	6c                   	insb   (%dx),%es:(%edi)
 5fe:	73 5f                	jae    65f <str_ls_call34+0x8>
 600:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 603:	6c                   	insb   (%dx),%es:(%edi)
 604:	32 39                	xor    (%ecx),%bh
	...

00000607 <ls_call29>:
CS550LSSYSCALL(ls_call29)
 607:	b8 fd 05 00 00       	mov    $0x5fd,%eax
 60c:	cd 41                	int    $0x41
 60e:	c3                   	ret    

0000060f <str_ls_call30>:
 60f:	6c                   	insb   (%dx),%es:(%edi)
 610:	73 5f                	jae    671 <str_ls_call35+0x8>
 612:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 615:	6c                   	insb   (%dx),%es:(%edi)
 616:	33 30                	xor    (%eax),%esi
	...

00000619 <ls_call30>:
CS550LSSYSCALL(ls_call30)
 619:	b8 0f 06 00 00       	mov    $0x60f,%eax
 61e:	cd 41                	int    $0x41
 620:	c3                   	ret    

00000621 <str_ls_call31>:
 621:	6c                   	insb   (%dx),%es:(%edi)
 622:	73 5f                	jae    683 <str_ls_call36+0x8>
 624:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 627:	6c                   	insb   (%dx),%es:(%edi)
 628:	33 31                	xor    (%ecx),%esi
	...

0000062b <ls_call31>:
CS550LSSYSCALL(ls_call31)
 62b:	b8 21 06 00 00       	mov    $0x621,%eax
 630:	cd 41                	int    $0x41
 632:	c3                   	ret    

00000633 <str_ls_call32>:
 633:	6c                   	insb   (%dx),%es:(%edi)
 634:	73 5f                	jae    695 <str_ls_call37+0x8>
 636:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 639:	6c                   	insb   (%dx),%es:(%edi)
 63a:	33 32                	xor    (%edx),%esi
	...

0000063d <ls_call32>:
CS550LSSYSCALL(ls_call32)
 63d:	b8 33 06 00 00       	mov    $0x633,%eax
 642:	cd 41                	int    $0x41
 644:	c3                   	ret    

00000645 <str_ls_call33>:
 645:	6c                   	insb   (%dx),%es:(%edi)
 646:	73 5f                	jae    6a7 <str_ls_call38+0x8>
 648:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 64b:	6c                   	insb   (%dx),%es:(%edi)
 64c:	33 33                	xor    (%ebx),%esi
	...

0000064f <ls_call33>:
CS550LSSYSCALL(ls_call33)
 64f:	b8 45 06 00 00       	mov    $0x645,%eax
 654:	cd 41                	int    $0x41
 656:	c3                   	ret    

00000657 <str_ls_call34>:
 657:	6c                   	insb   (%dx),%es:(%edi)
 658:	73 5f                	jae    6b9 <str_ls_call39+0x8>
 65a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 65d:	6c                   	insb   (%dx),%es:(%edi)
 65e:	33 34 00             	xor    (%eax,%eax,1),%esi

00000661 <ls_call34>:
CS550LSSYSCALL(ls_call34)
 661:	b8 57 06 00 00       	mov    $0x657,%eax
 666:	cd 41                	int    $0x41
 668:	c3                   	ret    

00000669 <str_ls_call35>:
 669:	6c                   	insb   (%dx),%es:(%edi)
 66a:	73 5f                	jae    6cb <str_ls_call40+0x8>
 66c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 66f:	6c                   	insb   (%dx),%es:(%edi)
 670:	33                   	.byte 0x33
 671:	35                   	.byte 0x35
	...

00000673 <ls_call35>:
CS550LSSYSCALL(ls_call35)
 673:	b8 69 06 00 00       	mov    $0x669,%eax
 678:	cd 41                	int    $0x41
 67a:	c3                   	ret    

0000067b <str_ls_call36>:
 67b:	6c                   	insb   (%dx),%es:(%edi)
 67c:	73 5f                	jae    6dd <str_ls_call41+0x8>
 67e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 681:	6c                   	insb   (%dx),%es:(%edi)
 682:	33 36                	xor    (%esi),%esi
	...

00000685 <ls_call36>:
CS550LSSYSCALL(ls_call36)
 685:	b8 7b 06 00 00       	mov    $0x67b,%eax
 68a:	cd 41                	int    $0x41
 68c:	c3                   	ret    

0000068d <str_ls_call37>:
 68d:	6c                   	insb   (%dx),%es:(%edi)
 68e:	73 5f                	jae    6ef <str_ls_call42+0x8>
 690:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 693:	6c                   	insb   (%dx),%es:(%edi)
 694:	33 37                	xor    (%edi),%esi
	...

00000697 <ls_call37>:
CS550LSSYSCALL(ls_call37)
 697:	b8 8d 06 00 00       	mov    $0x68d,%eax
 69c:	cd 41                	int    $0x41
 69e:	c3                   	ret    

0000069f <str_ls_call38>:
 69f:	6c                   	insb   (%dx),%es:(%edi)
 6a0:	73 5f                	jae    701 <str_ls_call43+0x8>
 6a2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6a5:	6c                   	insb   (%dx),%es:(%edi)
 6a6:	33 38                	xor    (%eax),%edi
	...

000006a9 <ls_call38>:
CS550LSSYSCALL(ls_call38)
 6a9:	b8 9f 06 00 00       	mov    $0x69f,%eax
 6ae:	cd 41                	int    $0x41
 6b0:	c3                   	ret    

000006b1 <str_ls_call39>:
 6b1:	6c                   	insb   (%dx),%es:(%edi)
 6b2:	73 5f                	jae    713 <str_ls_call44+0x8>
 6b4:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6b7:	6c                   	insb   (%dx),%es:(%edi)
 6b8:	33 39                	xor    (%ecx),%edi
	...

000006bb <ls_call39>:
CS550LSSYSCALL(ls_call39)
 6bb:	b8 b1 06 00 00       	mov    $0x6b1,%eax
 6c0:	cd 41                	int    $0x41
 6c2:	c3                   	ret    

000006c3 <str_ls_call40>:
 6c3:	6c                   	insb   (%dx),%es:(%edi)
 6c4:	73 5f                	jae    725 <str_ls_call45+0x8>
 6c6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6c9:	6c                   	insb   (%dx),%es:(%edi)
 6ca:	34 30                	xor    $0x30,%al
	...

000006cd <ls_call40>:
CS550LSSYSCALL(ls_call40)
 6cd:	b8 c3 06 00 00       	mov    $0x6c3,%eax
 6d2:	cd 41                	int    $0x41
 6d4:	c3                   	ret    

000006d5 <str_ls_call41>:
 6d5:	6c                   	insb   (%dx),%es:(%edi)
 6d6:	73 5f                	jae    737 <str_ls_call46+0x8>
 6d8:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6db:	6c                   	insb   (%dx),%es:(%edi)
 6dc:	34 31                	xor    $0x31,%al
	...

000006df <ls_call41>:
CS550LSSYSCALL(ls_call41)
 6df:	b8 d5 06 00 00       	mov    $0x6d5,%eax
 6e4:	cd 41                	int    $0x41
 6e6:	c3                   	ret    

000006e7 <str_ls_call42>:
 6e7:	6c                   	insb   (%dx),%es:(%edi)
 6e8:	73 5f                	jae    749 <str_ls_call47+0x8>
 6ea:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6ed:	6c                   	insb   (%dx),%es:(%edi)
 6ee:	34 32                	xor    $0x32,%al
	...

000006f1 <ls_call42>:
CS550LSSYSCALL(ls_call42)
 6f1:	b8 e7 06 00 00       	mov    $0x6e7,%eax
 6f6:	cd 41                	int    $0x41
 6f8:	c3                   	ret    

000006f9 <str_ls_call43>:
 6f9:	6c                   	insb   (%dx),%es:(%edi)
 6fa:	73 5f                	jae    75b <str_ls_call48+0x8>
 6fc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6ff:	6c                   	insb   (%dx),%es:(%edi)
 700:	34 33                	xor    $0x33,%al
	...

00000703 <ls_call43>:
CS550LSSYSCALL(ls_call43)
 703:	b8 f9 06 00 00       	mov    $0x6f9,%eax
 708:	cd 41                	int    $0x41
 70a:	c3                   	ret    

0000070b <str_ls_call44>:
 70b:	6c                   	insb   (%dx),%es:(%edi)
 70c:	73 5f                	jae    76d <str_ls_call49+0x8>
 70e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 711:	6c                   	insb   (%dx),%es:(%edi)
 712:	34 34                	xor    $0x34,%al
	...

00000715 <ls_call44>:
CS550LSSYSCALL(ls_call44)
 715:	b8 0b 07 00 00       	mov    $0x70b,%eax
 71a:	cd 41                	int    $0x41
 71c:	c3                   	ret    

0000071d <str_ls_call45>:
 71d:	6c                   	insb   (%dx),%es:(%edi)
 71e:	73 5f                	jae    77f <str_ls_call50+0x8>
 720:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 723:	6c                   	insb   (%dx),%es:(%edi)
 724:	34 35                	xor    $0x35,%al
	...

00000727 <ls_call45>:
CS550LSSYSCALL(ls_call45)
 727:	b8 1d 07 00 00       	mov    $0x71d,%eax
 72c:	cd 41                	int    $0x41
 72e:	c3                   	ret    

0000072f <str_ls_call46>:
 72f:	6c                   	insb   (%dx),%es:(%edi)
 730:	73 5f                	jae    791 <str_ht_call1+0x8>
 732:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 735:	6c                   	insb   (%dx),%es:(%edi)
 736:	34 36                	xor    $0x36,%al
	...

00000739 <ls_call46>:
CS550LSSYSCALL(ls_call46)
 739:	b8 2f 07 00 00       	mov    $0x72f,%eax
 73e:	cd 41                	int    $0x41
 740:	c3                   	ret    

00000741 <str_ls_call47>:
 741:	6c                   	insb   (%dx),%es:(%edi)
 742:	73 5f                	jae    7a3 <ht_call2>
 744:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 747:	6c                   	insb   (%dx),%es:(%edi)
 748:	34 37                	xor    $0x37,%al
	...

0000074b <ls_call47>:
CS550LSSYSCALL(ls_call47)
 74b:	b8 41 07 00 00       	mov    $0x741,%eax
 750:	cd 41                	int    $0x41
 752:	c3                   	ret    

00000753 <str_ls_call48>:
 753:	6c                   	insb   (%dx),%es:(%edi)
 754:	73 5f                	jae    7b5 <ht_call3+0x1>
 756:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 759:	6c                   	insb   (%dx),%es:(%edi)
 75a:	34 38                	xor    $0x38,%al
	...

0000075d <ls_call48>:
CS550LSSYSCALL(ls_call48)
 75d:	b8 53 07 00 00       	mov    $0x753,%eax
 762:	cd 41                	int    $0x41
 764:	c3                   	ret    

00000765 <str_ls_call49>:
 765:	6c                   	insb   (%dx),%es:(%edi)
 766:	73 5f                	jae    7c7 <ht_call4+0x2>
 768:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 76b:	6c                   	insb   (%dx),%es:(%edi)
 76c:	34 39                	xor    $0x39,%al
	...

0000076f <ls_call49>:
CS550LSSYSCALL(ls_call49)
 76f:	b8 65 07 00 00       	mov    $0x765,%eax
 774:	cd 41                	int    $0x41
 776:	c3                   	ret    

00000777 <str_ls_call50>:
 777:	6c                   	insb   (%dx),%es:(%edi)
 778:	73 5f                	jae    7d9 <ht_call5+0x3>
 77a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 77d:	6c                   	insb   (%dx),%es:(%edi)
 77e:	35                   	.byte 0x35
 77f:	30 00                	xor    %al,(%eax)

00000781 <ls_call50>:
CS550LSSYSCALL(ls_call50)
 781:	b8 77 07 00 00       	mov    $0x777,%eax
 786:	cd 41                	int    $0x41
 788:	c3                   	ret    

00000789 <str_ht_call1>:
 789:	68 74 5f 63 61       	push   $0x61635f74
 78e:	6c                   	insb   (%dx),%es:(%edi)
 78f:	6c                   	insb   (%dx),%es:(%edi)
 790:	31 00                	xor    %eax,(%eax)

00000792 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
 792:	b8 89 07 00 00       	mov    $0x789,%eax
 797:	cd 42                	int    $0x42
 799:	c3                   	ret    

0000079a <str_ht_call2>:
 79a:	68 74 5f 63 61       	push   $0x61635f74
 79f:	6c                   	insb   (%dx),%es:(%edi)
 7a0:	6c                   	insb   (%dx),%es:(%edi)
 7a1:	32 00                	xor    (%eax),%al

000007a3 <ht_call2>:
CS550HTSYSCALL(ht_call2)
 7a3:	b8 9a 07 00 00       	mov    $0x79a,%eax
 7a8:	cd 42                	int    $0x42
 7aa:	c3                   	ret    

000007ab <str_ht_call3>:
 7ab:	68 74 5f 63 61       	push   $0x61635f74
 7b0:	6c                   	insb   (%dx),%es:(%edi)
 7b1:	6c                   	insb   (%dx),%es:(%edi)
 7b2:	33 00                	xor    (%eax),%eax

000007b4 <ht_call3>:
CS550HTSYSCALL(ht_call3)
 7b4:	b8 ab 07 00 00       	mov    $0x7ab,%eax
 7b9:	cd 42                	int    $0x42
 7bb:	c3                   	ret    

000007bc <str_ht_call4>:
 7bc:	68 74 5f 63 61       	push   $0x61635f74
 7c1:	6c                   	insb   (%dx),%es:(%edi)
 7c2:	6c                   	insb   (%dx),%es:(%edi)
 7c3:	34 00                	xor    $0x0,%al

000007c5 <ht_call4>:
CS550HTSYSCALL(ht_call4)
 7c5:	b8 bc 07 00 00       	mov    $0x7bc,%eax
 7ca:	cd 42                	int    $0x42
 7cc:	c3                   	ret    

000007cd <str_ht_call5>:
 7cd:	68 74 5f 63 61       	push   $0x61635f74
 7d2:	6c                   	insb   (%dx),%es:(%edi)
 7d3:	6c                   	insb   (%dx),%es:(%edi)
 7d4:	35                   	.byte 0x35
	...

000007d6 <ht_call5>:
CS550HTSYSCALL(ht_call5)
 7d6:	b8 cd 07 00 00       	mov    $0x7cd,%eax
 7db:	cd 42                	int    $0x42
 7dd:	c3                   	ret    

000007de <str_ht_call6>:
 7de:	68 74 5f 63 61       	push   $0x61635f74
 7e3:	6c                   	insb   (%dx),%es:(%edi)
 7e4:	6c                   	insb   (%dx),%es:(%edi)
 7e5:	36                   	ss
	...

000007e7 <ht_call6>:
CS550HTSYSCALL(ht_call6)
 7e7:	b8 de 07 00 00       	mov    $0x7de,%eax
 7ec:	cd 42                	int    $0x42
 7ee:	c3                   	ret    

000007ef <str_ht_call7>:
 7ef:	68 74 5f 63 61       	push   $0x61635f74
 7f4:	6c                   	insb   (%dx),%es:(%edi)
 7f5:	6c                   	insb   (%dx),%es:(%edi)
 7f6:	37                   	aaa    
	...

000007f8 <ht_call7>:
CS550HTSYSCALL(ht_call7)
 7f8:	b8 ef 07 00 00       	mov    $0x7ef,%eax
 7fd:	cd 42                	int    $0x42
 7ff:	c3                   	ret    

00000800 <str_ht_call8>:
 800:	68 74 5f 63 61       	push   $0x61635f74
 805:	6c                   	insb   (%dx),%es:(%edi)
 806:	6c                   	insb   (%dx),%es:(%edi)
 807:	38 00                	cmp    %al,(%eax)

00000809 <ht_call8>:
CS550HTSYSCALL(ht_call8)
 809:	b8 00 08 00 00       	mov    $0x800,%eax
 80e:	cd 42                	int    $0x42
 810:	c3                   	ret    

00000811 <str_ht_call9>:
 811:	68 74 5f 63 61       	push   $0x61635f74
 816:	6c                   	insb   (%dx),%es:(%edi)
 817:	6c                   	insb   (%dx),%es:(%edi)
 818:	39 00                	cmp    %eax,(%eax)

0000081a <ht_call9>:
CS550HTSYSCALL(ht_call9)
 81a:	b8 11 08 00 00       	mov    $0x811,%eax
 81f:	cd 42                	int    $0x42
 821:	c3                   	ret    

00000822 <str_ht_call10>:
 822:	68 74 5f 63 61       	push   $0x61635f74
 827:	6c                   	insb   (%dx),%es:(%edi)
 828:	6c                   	insb   (%dx),%es:(%edi)
 829:	31 30                	xor    %esi,(%eax)
	...

0000082c <ht_call10>:
CS550HTSYSCALL(ht_call10)
 82c:	b8 22 08 00 00       	mov    $0x822,%eax
 831:	cd 42                	int    $0x42
 833:	c3                   	ret    

00000834 <str_ht_call11>:
 834:	68 74 5f 63 61       	push   $0x61635f74
 839:	6c                   	insb   (%dx),%es:(%edi)
 83a:	6c                   	insb   (%dx),%es:(%edi)
 83b:	31 31                	xor    %esi,(%ecx)
	...

0000083e <ht_call11>:
CS550HTSYSCALL(ht_call11)
 83e:	b8 34 08 00 00       	mov    $0x834,%eax
 843:	cd 42                	int    $0x42
 845:	c3                   	ret    

00000846 <str_ht_call12>:
 846:	68 74 5f 63 61       	push   $0x61635f74
 84b:	6c                   	insb   (%dx),%es:(%edi)
 84c:	6c                   	insb   (%dx),%es:(%edi)
 84d:	31 32                	xor    %esi,(%edx)
	...

00000850 <ht_call12>:
CS550HTSYSCALL(ht_call12)
 850:	b8 46 08 00 00       	mov    $0x846,%eax
 855:	cd 42                	int    $0x42
 857:	c3                   	ret    

00000858 <str_ht_call13>:
 858:	68 74 5f 63 61       	push   $0x61635f74
 85d:	6c                   	insb   (%dx),%es:(%edi)
 85e:	6c                   	insb   (%dx),%es:(%edi)
 85f:	31 33                	xor    %esi,(%ebx)
	...

00000862 <ht_call13>:
CS550HTSYSCALL(ht_call13)
 862:	b8 58 08 00 00       	mov    $0x858,%eax
 867:	cd 42                	int    $0x42
 869:	c3                   	ret    

0000086a <str_ht_call14>:
 86a:	68 74 5f 63 61       	push   $0x61635f74
 86f:	6c                   	insb   (%dx),%es:(%edi)
 870:	6c                   	insb   (%dx),%es:(%edi)
 871:	31 34 00             	xor    %esi,(%eax,%eax,1)

00000874 <ht_call14>:
CS550HTSYSCALL(ht_call14)
 874:	b8 6a 08 00 00       	mov    $0x86a,%eax
 879:	cd 42                	int    $0x42
 87b:	c3                   	ret    

0000087c <str_ht_call15>:
 87c:	68 74 5f 63 61       	push   $0x61635f74
 881:	6c                   	insb   (%dx),%es:(%edi)
 882:	6c                   	insb   (%dx),%es:(%edi)
 883:	31                   	.byte 0x31
 884:	35                   	.byte 0x35
	...

00000886 <ht_call15>:
CS550HTSYSCALL(ht_call15)
 886:	b8 7c 08 00 00       	mov    $0x87c,%eax
 88b:	cd 42                	int    $0x42
 88d:	c3                   	ret    

0000088e <str_ht_call16>:
 88e:	68 74 5f 63 61       	push   $0x61635f74
 893:	6c                   	insb   (%dx),%es:(%edi)
 894:	6c                   	insb   (%dx),%es:(%edi)
 895:	31 36                	xor    %esi,(%esi)
	...

00000898 <ht_call16>:
CS550HTSYSCALL(ht_call16)
 898:	b8 8e 08 00 00       	mov    $0x88e,%eax
 89d:	cd 42                	int    $0x42
 89f:	c3                   	ret    

000008a0 <str_ht_call17>:
 8a0:	68 74 5f 63 61       	push   $0x61635f74
 8a5:	6c                   	insb   (%dx),%es:(%edi)
 8a6:	6c                   	insb   (%dx),%es:(%edi)
 8a7:	31 37                	xor    %esi,(%edi)
	...

000008aa <ht_call17>:
CS550HTSYSCALL(ht_call17)
 8aa:	b8 a0 08 00 00       	mov    $0x8a0,%eax
 8af:	cd 42                	int    $0x42
 8b1:	c3                   	ret    

000008b2 <str_ht_call18>:
 8b2:	68 74 5f 63 61       	push   $0x61635f74
 8b7:	6c                   	insb   (%dx),%es:(%edi)
 8b8:	6c                   	insb   (%dx),%es:(%edi)
 8b9:	31 38                	xor    %edi,(%eax)
	...

000008bc <ht_call18>:
CS550HTSYSCALL(ht_call18)
 8bc:	b8 b2 08 00 00       	mov    $0x8b2,%eax
 8c1:	cd 42                	int    $0x42
 8c3:	c3                   	ret    

000008c4 <str_ht_call19>:
 8c4:	68 74 5f 63 61       	push   $0x61635f74
 8c9:	6c                   	insb   (%dx),%es:(%edi)
 8ca:	6c                   	insb   (%dx),%es:(%edi)
 8cb:	31 39                	xor    %edi,(%ecx)
	...

000008ce <ht_call19>:
CS550HTSYSCALL(ht_call19)
 8ce:	b8 c4 08 00 00       	mov    $0x8c4,%eax
 8d3:	cd 42                	int    $0x42
 8d5:	c3                   	ret    

000008d6 <str_ht_call20>:
 8d6:	68 74 5f 63 61       	push   $0x61635f74
 8db:	6c                   	insb   (%dx),%es:(%edi)
 8dc:	6c                   	insb   (%dx),%es:(%edi)
 8dd:	32 30                	xor    (%eax),%dh
	...

000008e0 <ht_call20>:
CS550HTSYSCALL(ht_call20)
 8e0:	b8 d6 08 00 00       	mov    $0x8d6,%eax
 8e5:	cd 42                	int    $0x42
 8e7:	c3                   	ret    

000008e8 <str_ht_call21>:
 8e8:	68 74 5f 63 61       	push   $0x61635f74
 8ed:	6c                   	insb   (%dx),%es:(%edi)
 8ee:	6c                   	insb   (%dx),%es:(%edi)
 8ef:	32 31                	xor    (%ecx),%dh
	...

000008f2 <ht_call21>:
CS550HTSYSCALL(ht_call21)
 8f2:	b8 e8 08 00 00       	mov    $0x8e8,%eax
 8f7:	cd 42                	int    $0x42
 8f9:	c3                   	ret    

000008fa <str_ht_call22>:
 8fa:	68 74 5f 63 61       	push   $0x61635f74
 8ff:	6c                   	insb   (%dx),%es:(%edi)
 900:	6c                   	insb   (%dx),%es:(%edi)
 901:	32 32                	xor    (%edx),%dh
	...

00000904 <ht_call22>:
CS550HTSYSCALL(ht_call22)
 904:	b8 fa 08 00 00       	mov    $0x8fa,%eax
 909:	cd 42                	int    $0x42
 90b:	c3                   	ret    

0000090c <str_ht_call23>:
 90c:	68 74 5f 63 61       	push   $0x61635f74
 911:	6c                   	insb   (%dx),%es:(%edi)
 912:	6c                   	insb   (%dx),%es:(%edi)
 913:	32 33                	xor    (%ebx),%dh
	...

00000916 <ht_call23>:
CS550HTSYSCALL(ht_call23)
 916:	b8 0c 09 00 00       	mov    $0x90c,%eax
 91b:	cd 42                	int    $0x42
 91d:	c3                   	ret    

0000091e <str_ht_call24>:
 91e:	68 74 5f 63 61       	push   $0x61635f74
 923:	6c                   	insb   (%dx),%es:(%edi)
 924:	6c                   	insb   (%dx),%es:(%edi)
 925:	32 34 00             	xor    (%eax,%eax,1),%dh

00000928 <ht_call24>:
CS550HTSYSCALL(ht_call24)
 928:	b8 1e 09 00 00       	mov    $0x91e,%eax
 92d:	cd 42                	int    $0x42
 92f:	c3                   	ret    

00000930 <str_ht_call25>:
 930:	68 74 5f 63 61       	push   $0x61635f74
 935:	6c                   	insb   (%dx),%es:(%edi)
 936:	6c                   	insb   (%dx),%es:(%edi)
 937:	32                   	.byte 0x32
 938:	35                   	.byte 0x35
	...

0000093a <ht_call25>:
CS550HTSYSCALL(ht_call25)
 93a:	b8 30 09 00 00       	mov    $0x930,%eax
 93f:	cd 42                	int    $0x42
 941:	c3                   	ret    

00000942 <str_ht_call26>:
 942:	68 74 5f 63 61       	push   $0x61635f74
 947:	6c                   	insb   (%dx),%es:(%edi)
 948:	6c                   	insb   (%dx),%es:(%edi)
 949:	32 36                	xor    (%esi),%dh
	...

0000094c <ht_call26>:
CS550HTSYSCALL(ht_call26)
 94c:	b8 42 09 00 00       	mov    $0x942,%eax
 951:	cd 42                	int    $0x42
 953:	c3                   	ret    

00000954 <str_ht_call27>:
 954:	68 74 5f 63 61       	push   $0x61635f74
 959:	6c                   	insb   (%dx),%es:(%edi)
 95a:	6c                   	insb   (%dx),%es:(%edi)
 95b:	32 37                	xor    (%edi),%dh
	...

0000095e <ht_call27>:
CS550HTSYSCALL(ht_call27)
 95e:	b8 54 09 00 00       	mov    $0x954,%eax
 963:	cd 42                	int    $0x42
 965:	c3                   	ret    

00000966 <str_ht_call28>:
 966:	68 74 5f 63 61       	push   $0x61635f74
 96b:	6c                   	insb   (%dx),%es:(%edi)
 96c:	6c                   	insb   (%dx),%es:(%edi)
 96d:	32 38                	xor    (%eax),%bh
	...

00000970 <ht_call28>:
CS550HTSYSCALL(ht_call28)
 970:	b8 66 09 00 00       	mov    $0x966,%eax
 975:	cd 42                	int    $0x42
 977:	c3                   	ret    

00000978 <str_ht_call29>:
 978:	68 74 5f 63 61       	push   $0x61635f74
 97d:	6c                   	insb   (%dx),%es:(%edi)
 97e:	6c                   	insb   (%dx),%es:(%edi)
 97f:	32 39                	xor    (%ecx),%bh
	...

00000982 <ht_call29>:
CS550HTSYSCALL(ht_call29)
 982:	b8 78 09 00 00       	mov    $0x978,%eax
 987:	cd 42                	int    $0x42
 989:	c3                   	ret    

0000098a <str_ht_call30>:
 98a:	68 74 5f 63 61       	push   $0x61635f74
 98f:	6c                   	insb   (%dx),%es:(%edi)
 990:	6c                   	insb   (%dx),%es:(%edi)
 991:	33 30                	xor    (%eax),%esi
	...

00000994 <ht_call30>:
CS550HTSYSCALL(ht_call30)
 994:	b8 8a 09 00 00       	mov    $0x98a,%eax
 999:	cd 42                	int    $0x42
 99b:	c3                   	ret    

0000099c <str_ht_call31>:
 99c:	68 74 5f 63 61       	push   $0x61635f74
 9a1:	6c                   	insb   (%dx),%es:(%edi)
 9a2:	6c                   	insb   (%dx),%es:(%edi)
 9a3:	33 31                	xor    (%ecx),%esi
	...

000009a6 <ht_call31>:
CS550HTSYSCALL(ht_call31)
 9a6:	b8 9c 09 00 00       	mov    $0x99c,%eax
 9ab:	cd 42                	int    $0x42
 9ad:	c3                   	ret    

000009ae <str_ht_call32>:
 9ae:	68 74 5f 63 61       	push   $0x61635f74
 9b3:	6c                   	insb   (%dx),%es:(%edi)
 9b4:	6c                   	insb   (%dx),%es:(%edi)
 9b5:	33 32                	xor    (%edx),%esi
	...

000009b8 <ht_call32>:
CS550HTSYSCALL(ht_call32)
 9b8:	b8 ae 09 00 00       	mov    $0x9ae,%eax
 9bd:	cd 42                	int    $0x42
 9bf:	c3                   	ret    

000009c0 <str_ht_call33>:
 9c0:	68 74 5f 63 61       	push   $0x61635f74
 9c5:	6c                   	insb   (%dx),%es:(%edi)
 9c6:	6c                   	insb   (%dx),%es:(%edi)
 9c7:	33 33                	xor    (%ebx),%esi
	...

000009ca <ht_call33>:
CS550HTSYSCALL(ht_call33)
 9ca:	b8 c0 09 00 00       	mov    $0x9c0,%eax
 9cf:	cd 42                	int    $0x42
 9d1:	c3                   	ret    

000009d2 <str_ht_call34>:
 9d2:	68 74 5f 63 61       	push   $0x61635f74
 9d7:	6c                   	insb   (%dx),%es:(%edi)
 9d8:	6c                   	insb   (%dx),%es:(%edi)
 9d9:	33 34 00             	xor    (%eax,%eax,1),%esi

000009dc <ht_call34>:
CS550HTSYSCALL(ht_call34)
 9dc:	b8 d2 09 00 00       	mov    $0x9d2,%eax
 9e1:	cd 42                	int    $0x42
 9e3:	c3                   	ret    

000009e4 <str_ht_call35>:
 9e4:	68 74 5f 63 61       	push   $0x61635f74
 9e9:	6c                   	insb   (%dx),%es:(%edi)
 9ea:	6c                   	insb   (%dx),%es:(%edi)
 9eb:	33                   	.byte 0x33
 9ec:	35                   	.byte 0x35
	...

000009ee <ht_call35>:
CS550HTSYSCALL(ht_call35)
 9ee:	b8 e4 09 00 00       	mov    $0x9e4,%eax
 9f3:	cd 42                	int    $0x42
 9f5:	c3                   	ret    

000009f6 <str_ht_call36>:
 9f6:	68 74 5f 63 61       	push   $0x61635f74
 9fb:	6c                   	insb   (%dx),%es:(%edi)
 9fc:	6c                   	insb   (%dx),%es:(%edi)
 9fd:	33 36                	xor    (%esi),%esi
	...

00000a00 <ht_call36>:
CS550HTSYSCALL(ht_call36)
 a00:	b8 f6 09 00 00       	mov    $0x9f6,%eax
 a05:	cd 42                	int    $0x42
 a07:	c3                   	ret    

00000a08 <str_ht_call37>:
 a08:	68 74 5f 63 61       	push   $0x61635f74
 a0d:	6c                   	insb   (%dx),%es:(%edi)
 a0e:	6c                   	insb   (%dx),%es:(%edi)
 a0f:	33 37                	xor    (%edi),%esi
	...

00000a12 <ht_call37>:
CS550HTSYSCALL(ht_call37)
 a12:	b8 08 0a 00 00       	mov    $0xa08,%eax
 a17:	cd 42                	int    $0x42
 a19:	c3                   	ret    

00000a1a <str_ht_call38>:
 a1a:	68 74 5f 63 61       	push   $0x61635f74
 a1f:	6c                   	insb   (%dx),%es:(%edi)
 a20:	6c                   	insb   (%dx),%es:(%edi)
 a21:	33 38                	xor    (%eax),%edi
	...

00000a24 <ht_call38>:
CS550HTSYSCALL(ht_call38)
 a24:	b8 1a 0a 00 00       	mov    $0xa1a,%eax
 a29:	cd 42                	int    $0x42
 a2b:	c3                   	ret    

00000a2c <str_ht_call39>:
 a2c:	68 74 5f 63 61       	push   $0x61635f74
 a31:	6c                   	insb   (%dx),%es:(%edi)
 a32:	6c                   	insb   (%dx),%es:(%edi)
 a33:	33 39                	xor    (%ecx),%edi
	...

00000a36 <ht_call39>:
CS550HTSYSCALL(ht_call39)
 a36:	b8 2c 0a 00 00       	mov    $0xa2c,%eax
 a3b:	cd 42                	int    $0x42
 a3d:	c3                   	ret    

00000a3e <str_ht_call40>:
 a3e:	68 74 5f 63 61       	push   $0x61635f74
 a43:	6c                   	insb   (%dx),%es:(%edi)
 a44:	6c                   	insb   (%dx),%es:(%edi)
 a45:	34 30                	xor    $0x30,%al
	...

00000a48 <ht_call40>:
CS550HTSYSCALL(ht_call40)
 a48:	b8 3e 0a 00 00       	mov    $0xa3e,%eax
 a4d:	cd 42                	int    $0x42
 a4f:	c3                   	ret    

00000a50 <str_ht_call41>:
 a50:	68 74 5f 63 61       	push   $0x61635f74
 a55:	6c                   	insb   (%dx),%es:(%edi)
 a56:	6c                   	insb   (%dx),%es:(%edi)
 a57:	34 31                	xor    $0x31,%al
	...

00000a5a <ht_call41>:
CS550HTSYSCALL(ht_call41)
 a5a:	b8 50 0a 00 00       	mov    $0xa50,%eax
 a5f:	cd 42                	int    $0x42
 a61:	c3                   	ret    

00000a62 <str_ht_call42>:
 a62:	68 74 5f 63 61       	push   $0x61635f74
 a67:	6c                   	insb   (%dx),%es:(%edi)
 a68:	6c                   	insb   (%dx),%es:(%edi)
 a69:	34 32                	xor    $0x32,%al
	...

00000a6c <ht_call42>:
CS550HTSYSCALL(ht_call42)
 a6c:	b8 62 0a 00 00       	mov    $0xa62,%eax
 a71:	cd 42                	int    $0x42
 a73:	c3                   	ret    

00000a74 <str_ht_call43>:
 a74:	68 74 5f 63 61       	push   $0x61635f74
 a79:	6c                   	insb   (%dx),%es:(%edi)
 a7a:	6c                   	insb   (%dx),%es:(%edi)
 a7b:	34 33                	xor    $0x33,%al
	...

00000a7e <ht_call43>:
CS550HTSYSCALL(ht_call43)
 a7e:	b8 74 0a 00 00       	mov    $0xa74,%eax
 a83:	cd 42                	int    $0x42
 a85:	c3                   	ret    

00000a86 <str_ht_call44>:
 a86:	68 74 5f 63 61       	push   $0x61635f74
 a8b:	6c                   	insb   (%dx),%es:(%edi)
 a8c:	6c                   	insb   (%dx),%es:(%edi)
 a8d:	34 34                	xor    $0x34,%al
	...

00000a90 <ht_call44>:
CS550HTSYSCALL(ht_call44)
 a90:	b8 86 0a 00 00       	mov    $0xa86,%eax
 a95:	cd 42                	int    $0x42
 a97:	c3                   	ret    

00000a98 <str_ht_call45>:
 a98:	68 74 5f 63 61       	push   $0x61635f74
 a9d:	6c                   	insb   (%dx),%es:(%edi)
 a9e:	6c                   	insb   (%dx),%es:(%edi)
 a9f:	34 35                	xor    $0x35,%al
	...

00000aa2 <ht_call45>:
CS550HTSYSCALL(ht_call45)
 aa2:	b8 98 0a 00 00       	mov    $0xa98,%eax
 aa7:	cd 42                	int    $0x42
 aa9:	c3                   	ret    

00000aaa <str_ht_call46>:
 aaa:	68 74 5f 63 61       	push   $0x61635f74
 aaf:	6c                   	insb   (%dx),%es:(%edi)
 ab0:	6c                   	insb   (%dx),%es:(%edi)
 ab1:	34 36                	xor    $0x36,%al
	...

00000ab4 <ht_call46>:
CS550HTSYSCALL(ht_call46)
 ab4:	b8 aa 0a 00 00       	mov    $0xaaa,%eax
 ab9:	cd 42                	int    $0x42
 abb:	c3                   	ret    

00000abc <str_ht_call47>:
 abc:	68 74 5f 63 61       	push   $0x61635f74
 ac1:	6c                   	insb   (%dx),%es:(%edi)
 ac2:	6c                   	insb   (%dx),%es:(%edi)
 ac3:	34 37                	xor    $0x37,%al
	...

00000ac6 <ht_call47>:
CS550HTSYSCALL(ht_call47)
 ac6:	b8 bc 0a 00 00       	mov    $0xabc,%eax
 acb:	cd 42                	int    $0x42
 acd:	c3                   	ret    

00000ace <str_ht_call48>:
 ace:	68 74 5f 63 61       	push   $0x61635f74
 ad3:	6c                   	insb   (%dx),%es:(%edi)
 ad4:	6c                   	insb   (%dx),%es:(%edi)
 ad5:	34 38                	xor    $0x38,%al
	...

00000ad8 <ht_call48>:
CS550HTSYSCALL(ht_call48)
 ad8:	b8 ce 0a 00 00       	mov    $0xace,%eax
 add:	cd 42                	int    $0x42
 adf:	c3                   	ret    

00000ae0 <str_ht_call49>:
 ae0:	68 74 5f 63 61       	push   $0x61635f74
 ae5:	6c                   	insb   (%dx),%es:(%edi)
 ae6:	6c                   	insb   (%dx),%es:(%edi)
 ae7:	34 39                	xor    $0x39,%al
	...

00000aea <ht_call49>:
CS550HTSYSCALL(ht_call49)
 aea:	b8 e0 0a 00 00       	mov    $0xae0,%eax
 aef:	cd 42                	int    $0x42
 af1:	c3                   	ret    

00000af2 <str_ht_call50>:
 af2:	68 74 5f 63 61       	push   $0x61635f74
 af7:	6c                   	insb   (%dx),%es:(%edi)
 af8:	6c                   	insb   (%dx),%es:(%edi)
 af9:	35                   	.byte 0x35
 afa:	30 00                	xor    %al,(%eax)

00000afc <ht_call50>:
CS550HTSYSCALL(ht_call50)
 afc:	b8 f2 0a 00 00       	mov    $0xaf2,%eax
 b01:	cd 42                	int    $0x42
 b03:	c3                   	ret    

00000b04 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 b04:	55                   	push   %ebp
 b05:	89 e5                	mov    %esp,%ebp
 b07:	83 ec 18             	sub    $0x18,%esp
 b0a:	8b 45 0c             	mov    0xc(%ebp),%eax
 b0d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 b10:	83 ec 04             	sub    $0x4,%esp
 b13:	6a 01                	push   $0x1
 b15:	8d 45 f4             	lea    -0xc(%ebp),%eax
 b18:	50                   	push   %eax
 b19:	ff 75 08             	pushl  0x8(%ebp)
 b1c:	e8 65 f8 ff ff       	call   386 <write>
 b21:	83 c4 10             	add    $0x10,%esp
}
 b24:	90                   	nop
 b25:	c9                   	leave  
 b26:	c3                   	ret    

00000b27 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 b27:	55                   	push   %ebp
 b28:	89 e5                	mov    %esp,%ebp
 b2a:	53                   	push   %ebx
 b2b:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 b2e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 b35:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 b39:	74 17                	je     b52 <printint+0x2b>
 b3b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 b3f:	79 11                	jns    b52 <printint+0x2b>
    neg = 1;
 b41:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 b48:	8b 45 0c             	mov    0xc(%ebp),%eax
 b4b:	f7 d8                	neg    %eax
 b4d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 b50:	eb 06                	jmp    b58 <printint+0x31>
  } else {
    x = xx;
 b52:	8b 45 0c             	mov    0xc(%ebp),%eax
 b55:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 b58:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 b5f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 b62:	8d 41 01             	lea    0x1(%ecx),%eax
 b65:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b68:	8b 5d 10             	mov    0x10(%ebp),%ebx
 b6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b6e:	ba 00 00 00 00       	mov    $0x0,%edx
 b73:	f7 f3                	div    %ebx
 b75:	89 d0                	mov    %edx,%eax
 b77:	0f b6 80 2c 12 00 00 	movzbl 0x122c(%eax),%eax
 b7e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 b82:	8b 5d 10             	mov    0x10(%ebp),%ebx
 b85:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b88:	ba 00 00 00 00       	mov    $0x0,%edx
 b8d:	f7 f3                	div    %ebx
 b8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 b92:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b96:	75 c7                	jne    b5f <printint+0x38>
  if(neg)
 b98:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b9c:	74 2d                	je     bcb <printint+0xa4>
    buf[i++] = '-';
 b9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba1:	8d 50 01             	lea    0x1(%eax),%edx
 ba4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 ba7:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 bac:	eb 1d                	jmp    bcb <printint+0xa4>
    putc(fd, buf[i]);
 bae:	8d 55 dc             	lea    -0x24(%ebp),%edx
 bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb4:	01 d0                	add    %edx,%eax
 bb6:	0f b6 00             	movzbl (%eax),%eax
 bb9:	0f be c0             	movsbl %al,%eax
 bbc:	83 ec 08             	sub    $0x8,%esp
 bbf:	50                   	push   %eax
 bc0:	ff 75 08             	pushl  0x8(%ebp)
 bc3:	e8 3c ff ff ff       	call   b04 <putc>
 bc8:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 bcb:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 bcf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 bd3:	79 d9                	jns    bae <printint+0x87>
    putc(fd, buf[i]);
}
 bd5:	90                   	nop
 bd6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 bd9:	c9                   	leave  
 bda:	c3                   	ret    

00000bdb <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 bdb:	55                   	push   %ebp
 bdc:	89 e5                	mov    %esp,%ebp
 bde:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 be1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 be8:	8d 45 0c             	lea    0xc(%ebp),%eax
 beb:	83 c0 04             	add    $0x4,%eax
 bee:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 bf1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 bf8:	e9 59 01 00 00       	jmp    d56 <printf+0x17b>
    c = fmt[i] & 0xff;
 bfd:	8b 55 0c             	mov    0xc(%ebp),%edx
 c00:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c03:	01 d0                	add    %edx,%eax
 c05:	0f b6 00             	movzbl (%eax),%eax
 c08:	0f be c0             	movsbl %al,%eax
 c0b:	25 ff 00 00 00       	and    $0xff,%eax
 c10:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 c13:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c17:	75 2c                	jne    c45 <printf+0x6a>
      if(c == '%'){
 c19:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 c1d:	75 0c                	jne    c2b <printf+0x50>
        state = '%';
 c1f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 c26:	e9 27 01 00 00       	jmp    d52 <printf+0x177>
      } else {
        putc(fd, c);
 c2b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c2e:	0f be c0             	movsbl %al,%eax
 c31:	83 ec 08             	sub    $0x8,%esp
 c34:	50                   	push   %eax
 c35:	ff 75 08             	pushl  0x8(%ebp)
 c38:	e8 c7 fe ff ff       	call   b04 <putc>
 c3d:	83 c4 10             	add    $0x10,%esp
 c40:	e9 0d 01 00 00       	jmp    d52 <printf+0x177>
      }
    } else if(state == '%'){
 c45:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 c49:	0f 85 03 01 00 00    	jne    d52 <printf+0x177>
      if(c == 'd'){
 c4f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 c53:	75 1e                	jne    c73 <printf+0x98>
        printint(fd, *ap, 10, 1);
 c55:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c58:	8b 00                	mov    (%eax),%eax
 c5a:	6a 01                	push   $0x1
 c5c:	6a 0a                	push   $0xa
 c5e:	50                   	push   %eax
 c5f:	ff 75 08             	pushl  0x8(%ebp)
 c62:	e8 c0 fe ff ff       	call   b27 <printint>
 c67:	83 c4 10             	add    $0x10,%esp
        ap++;
 c6a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 c6e:	e9 d8 00 00 00       	jmp    d4b <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 c73:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 c77:	74 06                	je     c7f <printf+0xa4>
 c79:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 c7d:	75 1e                	jne    c9d <printf+0xc2>
        printint(fd, *ap, 16, 0);
 c7f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c82:	8b 00                	mov    (%eax),%eax
 c84:	6a 00                	push   $0x0
 c86:	6a 10                	push   $0x10
 c88:	50                   	push   %eax
 c89:	ff 75 08             	pushl  0x8(%ebp)
 c8c:	e8 96 fe ff ff       	call   b27 <printint>
 c91:	83 c4 10             	add    $0x10,%esp
        ap++;
 c94:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 c98:	e9 ae 00 00 00       	jmp    d4b <printf+0x170>
      } else if(c == 's'){
 c9d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 ca1:	75 43                	jne    ce6 <printf+0x10b>
        s = (char*)*ap;
 ca3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 ca6:	8b 00                	mov    (%eax),%eax
 ca8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 cab:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 caf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 cb3:	75 25                	jne    cda <printf+0xff>
          s = "(null)";
 cb5:	c7 45 f4 b7 0f 00 00 	movl   $0xfb7,-0xc(%ebp)
        while(*s != 0){
 cbc:	eb 1c                	jmp    cda <printf+0xff>
          putc(fd, *s);
 cbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cc1:	0f b6 00             	movzbl (%eax),%eax
 cc4:	0f be c0             	movsbl %al,%eax
 cc7:	83 ec 08             	sub    $0x8,%esp
 cca:	50                   	push   %eax
 ccb:	ff 75 08             	pushl  0x8(%ebp)
 cce:	e8 31 fe ff ff       	call   b04 <putc>
 cd3:	83 c4 10             	add    $0x10,%esp
          s++;
 cd6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 cda:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cdd:	0f b6 00             	movzbl (%eax),%eax
 ce0:	84 c0                	test   %al,%al
 ce2:	75 da                	jne    cbe <printf+0xe3>
 ce4:	eb 65                	jmp    d4b <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 ce6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 cea:	75 1d                	jne    d09 <printf+0x12e>
        putc(fd, *ap);
 cec:	8b 45 e8             	mov    -0x18(%ebp),%eax
 cef:	8b 00                	mov    (%eax),%eax
 cf1:	0f be c0             	movsbl %al,%eax
 cf4:	83 ec 08             	sub    $0x8,%esp
 cf7:	50                   	push   %eax
 cf8:	ff 75 08             	pushl  0x8(%ebp)
 cfb:	e8 04 fe ff ff       	call   b04 <putc>
 d00:	83 c4 10             	add    $0x10,%esp
        ap++;
 d03:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 d07:	eb 42                	jmp    d4b <printf+0x170>
      } else if(c == '%'){
 d09:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 d0d:	75 17                	jne    d26 <printf+0x14b>
        putc(fd, c);
 d0f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 d12:	0f be c0             	movsbl %al,%eax
 d15:	83 ec 08             	sub    $0x8,%esp
 d18:	50                   	push   %eax
 d19:	ff 75 08             	pushl  0x8(%ebp)
 d1c:	e8 e3 fd ff ff       	call   b04 <putc>
 d21:	83 c4 10             	add    $0x10,%esp
 d24:	eb 25                	jmp    d4b <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 d26:	83 ec 08             	sub    $0x8,%esp
 d29:	6a 25                	push   $0x25
 d2b:	ff 75 08             	pushl  0x8(%ebp)
 d2e:	e8 d1 fd ff ff       	call   b04 <putc>
 d33:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 d36:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 d39:	0f be c0             	movsbl %al,%eax
 d3c:	83 ec 08             	sub    $0x8,%esp
 d3f:	50                   	push   %eax
 d40:	ff 75 08             	pushl  0x8(%ebp)
 d43:	e8 bc fd ff ff       	call   b04 <putc>
 d48:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 d4b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 d52:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 d56:	8b 55 0c             	mov    0xc(%ebp),%edx
 d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d5c:	01 d0                	add    %edx,%eax
 d5e:	0f b6 00             	movzbl (%eax),%eax
 d61:	84 c0                	test   %al,%al
 d63:	0f 85 94 fe ff ff    	jne    bfd <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 d69:	90                   	nop
 d6a:	c9                   	leave  
 d6b:	c3                   	ret    

00000d6c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 d6c:	55                   	push   %ebp
 d6d:	89 e5                	mov    %esp,%ebp
 d6f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 d72:	8b 45 08             	mov    0x8(%ebp),%eax
 d75:	83 e8 08             	sub    $0x8,%eax
 d78:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 d7b:	a1 48 12 00 00       	mov    0x1248,%eax
 d80:	89 45 fc             	mov    %eax,-0x4(%ebp)
 d83:	eb 24                	jmp    da9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 d85:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d88:	8b 00                	mov    (%eax),%eax
 d8a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 d8d:	77 12                	ja     da1 <free+0x35>
 d8f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 d92:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 d95:	77 24                	ja     dbb <free+0x4f>
 d97:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d9a:	8b 00                	mov    (%eax),%eax
 d9c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 d9f:	77 1a                	ja     dbb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 da1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 da4:	8b 00                	mov    (%eax),%eax
 da6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 da9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 dac:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 daf:	76 d4                	jbe    d85 <free+0x19>
 db1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 db4:	8b 00                	mov    (%eax),%eax
 db6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 db9:	76 ca                	jbe    d85 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 dbb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 dbe:	8b 40 04             	mov    0x4(%eax),%eax
 dc1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 dc8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 dcb:	01 c2                	add    %eax,%edx
 dcd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 dd0:	8b 00                	mov    (%eax),%eax
 dd2:	39 c2                	cmp    %eax,%edx
 dd4:	75 24                	jne    dfa <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 dd6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 dd9:	8b 50 04             	mov    0x4(%eax),%edx
 ddc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ddf:	8b 00                	mov    (%eax),%eax
 de1:	8b 40 04             	mov    0x4(%eax),%eax
 de4:	01 c2                	add    %eax,%edx
 de6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 de9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 dec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 def:	8b 00                	mov    (%eax),%eax
 df1:	8b 10                	mov    (%eax),%edx
 df3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 df6:	89 10                	mov    %edx,(%eax)
 df8:	eb 0a                	jmp    e04 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 dfa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 dfd:	8b 10                	mov    (%eax),%edx
 dff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e02:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 e04:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e07:	8b 40 04             	mov    0x4(%eax),%eax
 e0a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 e11:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e14:	01 d0                	add    %edx,%eax
 e16:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 e19:	75 20                	jne    e3b <free+0xcf>
    p->s.size += bp->s.size;
 e1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e1e:	8b 50 04             	mov    0x4(%eax),%edx
 e21:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e24:	8b 40 04             	mov    0x4(%eax),%eax
 e27:	01 c2                	add    %eax,%edx
 e29:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e2c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 e2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e32:	8b 10                	mov    (%eax),%edx
 e34:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e37:	89 10                	mov    %edx,(%eax)
 e39:	eb 08                	jmp    e43 <free+0xd7>
  } else
    p->s.ptr = bp;
 e3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e3e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 e41:	89 10                	mov    %edx,(%eax)
  freep = p;
 e43:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e46:	a3 48 12 00 00       	mov    %eax,0x1248
}
 e4b:	90                   	nop
 e4c:	c9                   	leave  
 e4d:	c3                   	ret    

00000e4e <morecore>:

static Header*
morecore(uint nu)
{
 e4e:	55                   	push   %ebp
 e4f:	89 e5                	mov    %esp,%ebp
 e51:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 e54:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 e5b:	77 07                	ja     e64 <morecore+0x16>
    nu = 4096;
 e5d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 e64:	8b 45 08             	mov    0x8(%ebp),%eax
 e67:	c1 e0 03             	shl    $0x3,%eax
 e6a:	83 ec 0c             	sub    $0xc,%esp
 e6d:	50                   	push   %eax
 e6e:	e8 7b f5 ff ff       	call   3ee <sbrk>
 e73:	83 c4 10             	add    $0x10,%esp
 e76:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 e79:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 e7d:	75 07                	jne    e86 <morecore+0x38>
    return 0;
 e7f:	b8 00 00 00 00       	mov    $0x0,%eax
 e84:	eb 26                	jmp    eac <morecore+0x5e>
  hp = (Header*)p;
 e86:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e89:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 e8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e8f:	8b 55 08             	mov    0x8(%ebp),%edx
 e92:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 e95:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e98:	83 c0 08             	add    $0x8,%eax
 e9b:	83 ec 0c             	sub    $0xc,%esp
 e9e:	50                   	push   %eax
 e9f:	e8 c8 fe ff ff       	call   d6c <free>
 ea4:	83 c4 10             	add    $0x10,%esp
  return freep;
 ea7:	a1 48 12 00 00       	mov    0x1248,%eax
}
 eac:	c9                   	leave  
 ead:	c3                   	ret    

00000eae <malloc>:

void*
malloc(uint nbytes)
{
 eae:	55                   	push   %ebp
 eaf:	89 e5                	mov    %esp,%ebp
 eb1:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 eb4:	8b 45 08             	mov    0x8(%ebp),%eax
 eb7:	83 c0 07             	add    $0x7,%eax
 eba:	c1 e8 03             	shr    $0x3,%eax
 ebd:	83 c0 01             	add    $0x1,%eax
 ec0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 ec3:	a1 48 12 00 00       	mov    0x1248,%eax
 ec8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ecb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 ecf:	75 23                	jne    ef4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 ed1:	c7 45 f0 40 12 00 00 	movl   $0x1240,-0x10(%ebp)
 ed8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 edb:	a3 48 12 00 00       	mov    %eax,0x1248
 ee0:	a1 48 12 00 00       	mov    0x1248,%eax
 ee5:	a3 40 12 00 00       	mov    %eax,0x1240
    base.s.size = 0;
 eea:	c7 05 44 12 00 00 00 	movl   $0x0,0x1244
 ef1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ef4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ef7:	8b 00                	mov    (%eax),%eax
 ef9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 efc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 eff:	8b 40 04             	mov    0x4(%eax),%eax
 f02:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 f05:	72 4d                	jb     f54 <malloc+0xa6>
      if(p->s.size == nunits)
 f07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f0a:	8b 40 04             	mov    0x4(%eax),%eax
 f0d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 f10:	75 0c                	jne    f1e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 f12:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f15:	8b 10                	mov    (%eax),%edx
 f17:	8b 45 f0             	mov    -0x10(%ebp),%eax
 f1a:	89 10                	mov    %edx,(%eax)
 f1c:	eb 26                	jmp    f44 <malloc+0x96>
      else {
        p->s.size -= nunits;
 f1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f21:	8b 40 04             	mov    0x4(%eax),%eax
 f24:	2b 45 ec             	sub    -0x14(%ebp),%eax
 f27:	89 c2                	mov    %eax,%edx
 f29:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f2c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 f2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f32:	8b 40 04             	mov    0x4(%eax),%eax
 f35:	c1 e0 03             	shl    $0x3,%eax
 f38:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 f3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f3e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 f41:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 f44:	8b 45 f0             	mov    -0x10(%ebp),%eax
 f47:	a3 48 12 00 00       	mov    %eax,0x1248
      return (void*)(p + 1);
 f4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f4f:	83 c0 08             	add    $0x8,%eax
 f52:	eb 3b                	jmp    f8f <malloc+0xe1>
    }
    if(p == freep)
 f54:	a1 48 12 00 00       	mov    0x1248,%eax
 f59:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 f5c:	75 1e                	jne    f7c <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 f5e:	83 ec 0c             	sub    $0xc,%esp
 f61:	ff 75 ec             	pushl  -0x14(%ebp)
 f64:	e8 e5 fe ff ff       	call   e4e <morecore>
 f69:	83 c4 10             	add    $0x10,%esp
 f6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 f6f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 f73:	75 07                	jne    f7c <malloc+0xce>
        return 0;
 f75:	b8 00 00 00 00       	mov    $0x0,%eax
 f7a:	eb 13                	jmp    f8f <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 f82:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f85:	8b 00                	mov    (%eax),%eax
 f87:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 f8a:	e9 6d ff ff ff       	jmp    efc <malloc+0x4e>
}
 f8f:	c9                   	leave  
 f90:	c3                   	ret    
