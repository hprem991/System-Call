
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  14:	c7 45 e6 73 74 72 65 	movl   $0x65727473,-0x1a(%ebp)
  1b:	c7 45 ea 73 73 66 73 	movl   $0x73667373,-0x16(%ebp)
  22:	66 c7 45 ee 30 00    	movw   $0x30,-0x12(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 d4 0f 00 00       	push   $0xfd4
  30:	6a 01                	push   $0x1
  32:	e8 e7 0b 00 00       	call   c1e <printf>
  37:	83 c4 10             	add    $0x10,%esp
  memset(data, 'a', sizeof(data));
  3a:	83 ec 04             	sub    $0x4,%esp
  3d:	68 00 02 00 00       	push   $0x200
  42:	6a 61                	push   $0x61
  44:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  4a:	50                   	push   %eax
  4b:	e8 be 01 00 00       	call   20e <memset>
  50:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
  53:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  5a:	eb 0d                	jmp    69 <main+0x69>
    if(fork() > 0)
  5c:	e8 40 03 00 00       	call   3a1 <fork>
  61:	85 c0                	test   %eax,%eax
  63:	7f 0c                	jg     71 <main+0x71>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  65:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  69:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  6d:	7e ed                	jle    5c <main+0x5c>
  6f:	eb 01                	jmp    72 <main+0x72>
    if(fork() > 0)
      break;
  71:	90                   	nop

  printf(1, "write %d\n", i);
  72:	83 ec 04             	sub    $0x4,%esp
  75:	ff 75 f4             	pushl  -0xc(%ebp)
  78:	68 e7 0f 00 00       	push   $0xfe7
  7d:	6a 01                	push   $0x1
  7f:	e8 9a 0b 00 00       	call   c1e <printf>
  84:	83 c4 10             	add    $0x10,%esp

  path[8] += i;
  87:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
  8b:	89 c2                	mov    %eax,%edx
  8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  90:	01 d0                	add    %edx,%eax
  92:	88 45 ee             	mov    %al,-0x12(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  95:	83 ec 08             	sub    $0x8,%esp
  98:	68 02 02 00 00       	push   $0x202
  9d:	8d 45 e6             	lea    -0x1a(%ebp),%eax
  a0:	50                   	push   %eax
  a1:	e8 43 03 00 00       	call   3e9 <open>
  a6:	83 c4 10             	add    $0x10,%esp
  a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 20; i++)
  ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  b3:	eb 1e                	jmp    d3 <main+0xd3>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b5:	83 ec 04             	sub    $0x4,%esp
  b8:	68 00 02 00 00       	push   $0x200
  bd:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  c3:	50                   	push   %eax
  c4:	ff 75 f0             	pushl  -0x10(%ebp)
  c7:	e8 fd 02 00 00       	call   3c9 <write>
  cc:	83 c4 10             	add    $0x10,%esp

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
  cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  d3:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
  d7:	7e dc                	jle    b5 <main+0xb5>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  d9:	83 ec 0c             	sub    $0xc,%esp
  dc:	ff 75 f0             	pushl  -0x10(%ebp)
  df:	e8 ed 02 00 00       	call   3d1 <close>
  e4:	83 c4 10             	add    $0x10,%esp

  printf(1, "read\n");
  e7:	83 ec 08             	sub    $0x8,%esp
  ea:	68 f1 0f 00 00       	push   $0xff1
  ef:	6a 01                	push   $0x1
  f1:	e8 28 0b 00 00       	call   c1e <printf>
  f6:	83 c4 10             	add    $0x10,%esp

  fd = open(path, O_RDONLY);
  f9:	83 ec 08             	sub    $0x8,%esp
  fc:	6a 00                	push   $0x0
  fe:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 101:	50                   	push   %eax
 102:	e8 e2 02 00 00       	call   3e9 <open>
 107:	83 c4 10             	add    $0x10,%esp
 10a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for (i = 0; i < 20; i++)
 10d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 114:	eb 1e                	jmp    134 <main+0x134>
    read(fd, data, sizeof(data));
 116:	83 ec 04             	sub    $0x4,%esp
 119:	68 00 02 00 00       	push   $0x200
 11e:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
 124:	50                   	push   %eax
 125:	ff 75 f0             	pushl  -0x10(%ebp)
 128:	e8 94 02 00 00       	call   3c1 <read>
 12d:	83 c4 10             	add    $0x10,%esp
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 130:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 134:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
 138:	7e dc                	jle    116 <main+0x116>
    read(fd, data, sizeof(data));
  close(fd);
 13a:	83 ec 0c             	sub    $0xc,%esp
 13d:	ff 75 f0             	pushl  -0x10(%ebp)
 140:	e8 8c 02 00 00       	call   3d1 <close>
 145:	83 c4 10             	add    $0x10,%esp

  wait();
 148:	e8 64 02 00 00       	call   3b1 <wait>
  
  exit();
 14d:	e8 57 02 00 00       	call   3a9 <exit>

00000152 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	57                   	push   %edi
 156:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 157:	8b 4d 08             	mov    0x8(%ebp),%ecx
 15a:	8b 55 10             	mov    0x10(%ebp),%edx
 15d:	8b 45 0c             	mov    0xc(%ebp),%eax
 160:	89 cb                	mov    %ecx,%ebx
 162:	89 df                	mov    %ebx,%edi
 164:	89 d1                	mov    %edx,%ecx
 166:	fc                   	cld    
 167:	f3 aa                	rep stos %al,%es:(%edi)
 169:	89 ca                	mov    %ecx,%edx
 16b:	89 fb                	mov    %edi,%ebx
 16d:	89 5d 08             	mov    %ebx,0x8(%ebp)
 170:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 173:	90                   	nop
 174:	5b                   	pop    %ebx
 175:	5f                   	pop    %edi
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    

00000178 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 17e:	8b 45 08             	mov    0x8(%ebp),%eax
 181:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 184:	90                   	nop
 185:	8b 45 08             	mov    0x8(%ebp),%eax
 188:	8d 50 01             	lea    0x1(%eax),%edx
 18b:	89 55 08             	mov    %edx,0x8(%ebp)
 18e:	8b 55 0c             	mov    0xc(%ebp),%edx
 191:	8d 4a 01             	lea    0x1(%edx),%ecx
 194:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 197:	0f b6 12             	movzbl (%edx),%edx
 19a:	88 10                	mov    %dl,(%eax)
 19c:	0f b6 00             	movzbl (%eax),%eax
 19f:	84 c0                	test   %al,%al
 1a1:	75 e2                	jne    185 <strcpy+0xd>
    ;
  return os;
 1a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1a6:	c9                   	leave  
 1a7:	c3                   	ret    

000001a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1ab:	eb 08                	jmp    1b5 <strcmp+0xd>
    p++, q++;
 1ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1b1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b5:	8b 45 08             	mov    0x8(%ebp),%eax
 1b8:	0f b6 00             	movzbl (%eax),%eax
 1bb:	84 c0                	test   %al,%al
 1bd:	74 10                	je     1cf <strcmp+0x27>
 1bf:	8b 45 08             	mov    0x8(%ebp),%eax
 1c2:	0f b6 10             	movzbl (%eax),%edx
 1c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c8:	0f b6 00             	movzbl (%eax),%eax
 1cb:	38 c2                	cmp    %al,%dl
 1cd:	74 de                	je     1ad <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1cf:	8b 45 08             	mov    0x8(%ebp),%eax
 1d2:	0f b6 00             	movzbl (%eax),%eax
 1d5:	0f b6 d0             	movzbl %al,%edx
 1d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1db:	0f b6 00             	movzbl (%eax),%eax
 1de:	0f b6 c0             	movzbl %al,%eax
 1e1:	29 c2                	sub    %eax,%edx
 1e3:	89 d0                	mov    %edx,%eax
}
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    

000001e7 <strlen>:

uint
strlen(char *s)
{
 1e7:	55                   	push   %ebp
 1e8:	89 e5                	mov    %esp,%ebp
 1ea:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1f4:	eb 04                	jmp    1fa <strlen+0x13>
 1f6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1fa:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	01 d0                	add    %edx,%eax
 202:	0f b6 00             	movzbl (%eax),%eax
 205:	84 c0                	test   %al,%al
 207:	75 ed                	jne    1f6 <strlen+0xf>
    ;
  return n;
 209:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 20c:	c9                   	leave  
 20d:	c3                   	ret    

0000020e <memset>:

void*
memset(void *dst, int c, uint n)
{
 20e:	55                   	push   %ebp
 20f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 211:	8b 45 10             	mov    0x10(%ebp),%eax
 214:	50                   	push   %eax
 215:	ff 75 0c             	pushl  0xc(%ebp)
 218:	ff 75 08             	pushl  0x8(%ebp)
 21b:	e8 32 ff ff ff       	call   152 <stosb>
 220:	83 c4 0c             	add    $0xc,%esp
  return dst;
 223:	8b 45 08             	mov    0x8(%ebp),%eax
}
 226:	c9                   	leave  
 227:	c3                   	ret    

00000228 <strchr>:

char*
strchr(const char *s, char c)
{
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	83 ec 04             	sub    $0x4,%esp
 22e:	8b 45 0c             	mov    0xc(%ebp),%eax
 231:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 234:	eb 14                	jmp    24a <strchr+0x22>
    if(*s == c)
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	0f b6 00             	movzbl (%eax),%eax
 23c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 23f:	75 05                	jne    246 <strchr+0x1e>
      return (char*)s;
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	eb 13                	jmp    259 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 246:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 24a:	8b 45 08             	mov    0x8(%ebp),%eax
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	84 c0                	test   %al,%al
 252:	75 e2                	jne    236 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 254:	b8 00 00 00 00       	mov    $0x0,%eax
}
 259:	c9                   	leave  
 25a:	c3                   	ret    

0000025b <gets>:

char*
gets(char *buf, int max)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 261:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 268:	eb 42                	jmp    2ac <gets+0x51>
    cc = read(0, &c, 1);
 26a:	83 ec 04             	sub    $0x4,%esp
 26d:	6a 01                	push   $0x1
 26f:	8d 45 ef             	lea    -0x11(%ebp),%eax
 272:	50                   	push   %eax
 273:	6a 00                	push   $0x0
 275:	e8 47 01 00 00       	call   3c1 <read>
 27a:	83 c4 10             	add    $0x10,%esp
 27d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 280:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 284:	7e 33                	jle    2b9 <gets+0x5e>
      break;
    buf[i++] = c;
 286:	8b 45 f4             	mov    -0xc(%ebp),%eax
 289:	8d 50 01             	lea    0x1(%eax),%edx
 28c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28f:	89 c2                	mov    %eax,%edx
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	01 c2                	add    %eax,%edx
 296:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 29c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a0:	3c 0a                	cmp    $0xa,%al
 2a2:	74 16                	je     2ba <gets+0x5f>
 2a4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a8:	3c 0d                	cmp    $0xd,%al
 2aa:	74 0e                	je     2ba <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b5:	7c b3                	jl     26a <gets+0xf>
 2b7:	eb 01                	jmp    2ba <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 2b9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
 2c0:	01 d0                	add    %edx,%eax
 2c2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c8:	c9                   	leave  
 2c9:	c3                   	ret    

000002ca <stat>:

int
stat(char *n, struct stat *st)
{
 2ca:	55                   	push   %ebp
 2cb:	89 e5                	mov    %esp,%ebp
 2cd:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d0:	83 ec 08             	sub    $0x8,%esp
 2d3:	6a 00                	push   $0x0
 2d5:	ff 75 08             	pushl  0x8(%ebp)
 2d8:	e8 0c 01 00 00       	call   3e9 <open>
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e7:	79 07                	jns    2f0 <stat+0x26>
    return -1;
 2e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ee:	eb 25                	jmp    315 <stat+0x4b>
  r = fstat(fd, st);
 2f0:	83 ec 08             	sub    $0x8,%esp
 2f3:	ff 75 0c             	pushl  0xc(%ebp)
 2f6:	ff 75 f4             	pushl  -0xc(%ebp)
 2f9:	e8 03 01 00 00       	call   401 <fstat>
 2fe:	83 c4 10             	add    $0x10,%esp
 301:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 304:	83 ec 0c             	sub    $0xc,%esp
 307:	ff 75 f4             	pushl  -0xc(%ebp)
 30a:	e8 c2 00 00 00       	call   3d1 <close>
 30f:	83 c4 10             	add    $0x10,%esp
  return r;
 312:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 315:	c9                   	leave  
 316:	c3                   	ret    

00000317 <atoi>:

int
atoi(const char *s)
{
 317:	55                   	push   %ebp
 318:	89 e5                	mov    %esp,%ebp
 31a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 31d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 324:	eb 25                	jmp    34b <atoi+0x34>
    n = n*10 + *s++ - '0';
 326:	8b 55 fc             	mov    -0x4(%ebp),%edx
 329:	89 d0                	mov    %edx,%eax
 32b:	c1 e0 02             	shl    $0x2,%eax
 32e:	01 d0                	add    %edx,%eax
 330:	01 c0                	add    %eax,%eax
 332:	89 c1                	mov    %eax,%ecx
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	8d 50 01             	lea    0x1(%eax),%edx
 33a:	89 55 08             	mov    %edx,0x8(%ebp)
 33d:	0f b6 00             	movzbl (%eax),%eax
 340:	0f be c0             	movsbl %al,%eax
 343:	01 c8                	add    %ecx,%eax
 345:	83 e8 30             	sub    $0x30,%eax
 348:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	0f b6 00             	movzbl (%eax),%eax
 351:	3c 2f                	cmp    $0x2f,%al
 353:	7e 0a                	jle    35f <atoi+0x48>
 355:	8b 45 08             	mov    0x8(%ebp),%eax
 358:	0f b6 00             	movzbl (%eax),%eax
 35b:	3c 39                	cmp    $0x39,%al
 35d:	7e c7                	jle    326 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 35f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 362:	c9                   	leave  
 363:	c3                   	ret    

00000364 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
 36d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 370:	8b 45 0c             	mov    0xc(%ebp),%eax
 373:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 376:	eb 17                	jmp    38f <memmove+0x2b>
    *dst++ = *src++;
 378:	8b 45 fc             	mov    -0x4(%ebp),%eax
 37b:	8d 50 01             	lea    0x1(%eax),%edx
 37e:	89 55 fc             	mov    %edx,-0x4(%ebp)
 381:	8b 55 f8             	mov    -0x8(%ebp),%edx
 384:	8d 4a 01             	lea    0x1(%edx),%ecx
 387:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 38a:	0f b6 12             	movzbl (%edx),%edx
 38d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 38f:	8b 45 10             	mov    0x10(%ebp),%eax
 392:	8d 50 ff             	lea    -0x1(%eax),%edx
 395:	89 55 10             	mov    %edx,0x10(%ebp)
 398:	85 c0                	test   %eax,%eax
 39a:	7f dc                	jg     378 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 39c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 39f:	c9                   	leave  
 3a0:	c3                   	ret    

000003a1 <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
 3a1:	b8 01 00 00 00       	mov    $0x1,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <exit>:
SYSCALL(exit)
 3a9:	b8 02 00 00 00       	mov    $0x2,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <wait>:
SYSCALL(wait)
 3b1:	b8 03 00 00 00       	mov    $0x3,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <pipe>:
SYSCALL(pipe)
 3b9:	b8 04 00 00 00       	mov    $0x4,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <read>:
SYSCALL(read)
 3c1:	b8 05 00 00 00       	mov    $0x5,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <write>:
SYSCALL(write)
 3c9:	b8 10 00 00 00       	mov    $0x10,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <close>:
SYSCALL(close)
 3d1:	b8 15 00 00 00       	mov    $0x15,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <kill>:
SYSCALL(kill)
 3d9:	b8 06 00 00 00       	mov    $0x6,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <exec>:
SYSCALL(exec)
 3e1:	b8 07 00 00 00       	mov    $0x7,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <open>:
SYSCALL(open)
 3e9:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <mknod>:
SYSCALL(mknod)
 3f1:	b8 11 00 00 00       	mov    $0x11,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <unlink>:
SYSCALL(unlink)
 3f9:	b8 12 00 00 00       	mov    $0x12,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <fstat>:
SYSCALL(fstat)
 401:	b8 08 00 00 00       	mov    $0x8,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <link>:
SYSCALL(link)
 409:	b8 13 00 00 00       	mov    $0x13,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <mkdir>:
SYSCALL(mkdir)
 411:	b8 14 00 00 00       	mov    $0x14,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <chdir>:
SYSCALL(chdir)
 419:	b8 09 00 00 00       	mov    $0x9,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <dup>:
SYSCALL(dup)
 421:	b8 0a 00 00 00       	mov    $0xa,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <getpid>:
SYSCALL(getpid)
 429:	b8 0b 00 00 00       	mov    $0xb,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <sbrk>:
SYSCALL(sbrk)
 431:	b8 0c 00 00 00       	mov    $0xc,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <sleep>:
SYSCALL(sleep)
 439:	b8 0d 00 00 00       	mov    $0xd,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <uptime>:
SYSCALL(uptime)
 441:	b8 0e 00 00 00       	mov    $0xe,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <date>:

// Assignment starts here

SYSCALL(date)
 449:	b8 16 00 00 00       	mov    $0x16,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <str_ls_call1>:
 451:	6c                   	insb   (%dx),%es:(%edi)
 452:	73 5f                	jae    4b3 <ls_call6+0x4>
 454:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 457:	6c                   	insb   (%dx),%es:(%edi)
 458:	31 00                	xor    %eax,(%eax)

0000045a <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
 45a:	b8 51 04 00 00       	mov    $0x451,%eax
 45f:	cd 41                	int    $0x41
 461:	c3                   	ret    

00000462 <str_ls_call2>:
 462:	6c                   	insb   (%dx),%es:(%edi)
 463:	73 5f                	jae    4c4 <ls_call7+0x4>
 465:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 468:	6c                   	insb   (%dx),%es:(%edi)
 469:	32 00                	xor    (%eax),%al

0000046b <ls_call2>:
CS550LSSYSCALL(ls_call2)
 46b:	b8 62 04 00 00       	mov    $0x462,%eax
 470:	cd 41                	int    $0x41
 472:	c3                   	ret    

00000473 <str_ls_call3>:
 473:	6c                   	insb   (%dx),%es:(%edi)
 474:	73 5f                	jae    4d5 <ls_call8+0x4>
 476:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 479:	6c                   	insb   (%dx),%es:(%edi)
 47a:	33 00                	xor    (%eax),%eax

0000047c <ls_call3>:
CS550LSSYSCALL(ls_call3)
 47c:	b8 73 04 00 00       	mov    $0x473,%eax
 481:	cd 41                	int    $0x41
 483:	c3                   	ret    

00000484 <str_ls_call4>:
 484:	6c                   	insb   (%dx),%es:(%edi)
 485:	73 5f                	jae    4e6 <ls_call9+0x4>
 487:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 48a:	6c                   	insb   (%dx),%es:(%edi)
 48b:	34 00                	xor    $0x0,%al

0000048d <ls_call4>:
CS550LSSYSCALL(ls_call4)
 48d:	b8 84 04 00 00       	mov    $0x484,%eax
 492:	cd 41                	int    $0x41
 494:	c3                   	ret    

00000495 <str_ls_call5>:
 495:	6c                   	insb   (%dx),%es:(%edi)
 496:	73 5f                	jae    4f7 <ls_call10+0x3>
 498:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 49b:	6c                   	insb   (%dx),%es:(%edi)
 49c:	35                   	.byte 0x35
	...

0000049e <ls_call5>:
CS550LSSYSCALL(ls_call5)
 49e:	b8 95 04 00 00       	mov    $0x495,%eax
 4a3:	cd 41                	int    $0x41
 4a5:	c3                   	ret    

000004a6 <str_ls_call6>:
 4a6:	6c                   	insb   (%dx),%es:(%edi)
 4a7:	73 5f                	jae    508 <ls_call11+0x2>
 4a9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4ac:	6c                   	insb   (%dx),%es:(%edi)
 4ad:	36                   	ss
	...

000004af <ls_call6>:
CS550LSSYSCALL(ls_call6)
 4af:	b8 a6 04 00 00       	mov    $0x4a6,%eax
 4b4:	cd 41                	int    $0x41
 4b6:	c3                   	ret    

000004b7 <str_ls_call7>:
 4b7:	6c                   	insb   (%dx),%es:(%edi)
 4b8:	73 5f                	jae    519 <ls_call12+0x1>
 4ba:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4bd:	6c                   	insb   (%dx),%es:(%edi)
 4be:	37                   	aaa    
	...

000004c0 <ls_call7>:
CS550LSSYSCALL(ls_call7)
 4c0:	b8 b7 04 00 00       	mov    $0x4b7,%eax
 4c5:	cd 41                	int    $0x41
 4c7:	c3                   	ret    

000004c8 <str_ls_call8>:
 4c8:	6c                   	insb   (%dx),%es:(%edi)
 4c9:	73 5f                	jae    52a <ls_call13>
 4cb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4ce:	6c                   	insb   (%dx),%es:(%edi)
 4cf:	38 00                	cmp    %al,(%eax)

000004d1 <ls_call8>:
CS550LSSYSCALL(ls_call8)
 4d1:	b8 c8 04 00 00       	mov    $0x4c8,%eax
 4d6:	cd 41                	int    $0x41
 4d8:	c3                   	ret    

000004d9 <str_ls_call9>:
 4d9:	6c                   	insb   (%dx),%es:(%edi)
 4da:	73 5f                	jae    53b <str_ls_call14+0x9>
 4dc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4df:	6c                   	insb   (%dx),%es:(%edi)
 4e0:	39 00                	cmp    %eax,(%eax)

000004e2 <ls_call9>:
CS550LSSYSCALL(ls_call9)
 4e2:	b8 d9 04 00 00       	mov    $0x4d9,%eax
 4e7:	cd 41                	int    $0x41
 4e9:	c3                   	ret    

000004ea <str_ls_call10>:
 4ea:	6c                   	insb   (%dx),%es:(%edi)
 4eb:	73 5f                	jae    54c <str_ls_call15+0x8>
 4ed:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 4f0:	6c                   	insb   (%dx),%es:(%edi)
 4f1:	31 30                	xor    %esi,(%eax)
	...

000004f4 <ls_call10>:
CS550LSSYSCALL(ls_call10)
 4f4:	b8 ea 04 00 00       	mov    $0x4ea,%eax
 4f9:	cd 41                	int    $0x41
 4fb:	c3                   	ret    

000004fc <str_ls_call11>:
 4fc:	6c                   	insb   (%dx),%es:(%edi)
 4fd:	73 5f                	jae    55e <str_ls_call16+0x8>
 4ff:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 502:	6c                   	insb   (%dx),%es:(%edi)
 503:	31 31                	xor    %esi,(%ecx)
	...

00000506 <ls_call11>:
CS550LSSYSCALL(ls_call11)
 506:	b8 fc 04 00 00       	mov    $0x4fc,%eax
 50b:	cd 41                	int    $0x41
 50d:	c3                   	ret    

0000050e <str_ls_call12>:
 50e:	6c                   	insb   (%dx),%es:(%edi)
 50f:	73 5f                	jae    570 <str_ls_call17+0x8>
 511:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 514:	6c                   	insb   (%dx),%es:(%edi)
 515:	31 32                	xor    %esi,(%edx)
	...

00000518 <ls_call12>:
CS550LSSYSCALL(ls_call12)
 518:	b8 0e 05 00 00       	mov    $0x50e,%eax
 51d:	cd 41                	int    $0x41
 51f:	c3                   	ret    

00000520 <str_ls_call13>:
 520:	6c                   	insb   (%dx),%es:(%edi)
 521:	73 5f                	jae    582 <str_ls_call18+0x8>
 523:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 526:	6c                   	insb   (%dx),%es:(%edi)
 527:	31 33                	xor    %esi,(%ebx)
	...

0000052a <ls_call13>:
CS550LSSYSCALL(ls_call13)
 52a:	b8 20 05 00 00       	mov    $0x520,%eax
 52f:	cd 41                	int    $0x41
 531:	c3                   	ret    

00000532 <str_ls_call14>:
 532:	6c                   	insb   (%dx),%es:(%edi)
 533:	73 5f                	jae    594 <str_ls_call19+0x8>
 535:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 538:	6c                   	insb   (%dx),%es:(%edi)
 539:	31 34 00             	xor    %esi,(%eax,%eax,1)

0000053c <ls_call14>:
CS550LSSYSCALL(ls_call14)
 53c:	b8 32 05 00 00       	mov    $0x532,%eax
 541:	cd 41                	int    $0x41
 543:	c3                   	ret    

00000544 <str_ls_call15>:
 544:	6c                   	insb   (%dx),%es:(%edi)
 545:	73 5f                	jae    5a6 <str_ls_call20+0x8>
 547:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 54a:	6c                   	insb   (%dx),%es:(%edi)
 54b:	31                   	.byte 0x31
 54c:	35                   	.byte 0x35
	...

0000054e <ls_call15>:
CS550LSSYSCALL(ls_call15)
 54e:	b8 44 05 00 00       	mov    $0x544,%eax
 553:	cd 41                	int    $0x41
 555:	c3                   	ret    

00000556 <str_ls_call16>:
 556:	6c                   	insb   (%dx),%es:(%edi)
 557:	73 5f                	jae    5b8 <str_ls_call21+0x8>
 559:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 55c:	6c                   	insb   (%dx),%es:(%edi)
 55d:	31 36                	xor    %esi,(%esi)
	...

00000560 <ls_call16>:
CS550LSSYSCALL(ls_call16)
 560:	b8 56 05 00 00       	mov    $0x556,%eax
 565:	cd 41                	int    $0x41
 567:	c3                   	ret    

00000568 <str_ls_call17>:
 568:	6c                   	insb   (%dx),%es:(%edi)
 569:	73 5f                	jae    5ca <str_ls_call22+0x8>
 56b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 56e:	6c                   	insb   (%dx),%es:(%edi)
 56f:	31 37                	xor    %esi,(%edi)
	...

00000572 <ls_call17>:
CS550LSSYSCALL(ls_call17)
 572:	b8 68 05 00 00       	mov    $0x568,%eax
 577:	cd 41                	int    $0x41
 579:	c3                   	ret    

0000057a <str_ls_call18>:
 57a:	6c                   	insb   (%dx),%es:(%edi)
 57b:	73 5f                	jae    5dc <str_ls_call23+0x8>
 57d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 580:	6c                   	insb   (%dx),%es:(%edi)
 581:	31 38                	xor    %edi,(%eax)
	...

00000584 <ls_call18>:
CS550LSSYSCALL(ls_call18)
 584:	b8 7a 05 00 00       	mov    $0x57a,%eax
 589:	cd 41                	int    $0x41
 58b:	c3                   	ret    

0000058c <str_ls_call19>:
 58c:	6c                   	insb   (%dx),%es:(%edi)
 58d:	73 5f                	jae    5ee <str_ls_call24+0x8>
 58f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 592:	6c                   	insb   (%dx),%es:(%edi)
 593:	31 39                	xor    %edi,(%ecx)
	...

00000596 <ls_call19>:
CS550LSSYSCALL(ls_call19)
 596:	b8 8c 05 00 00       	mov    $0x58c,%eax
 59b:	cd 41                	int    $0x41
 59d:	c3                   	ret    

0000059e <str_ls_call20>:
 59e:	6c                   	insb   (%dx),%es:(%edi)
 59f:	73 5f                	jae    600 <str_ls_call25+0x8>
 5a1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5a4:	6c                   	insb   (%dx),%es:(%edi)
 5a5:	32 30                	xor    (%eax),%dh
	...

000005a8 <ls_call20>:
CS550LSSYSCALL(ls_call20)
 5a8:	b8 9e 05 00 00       	mov    $0x59e,%eax
 5ad:	cd 41                	int    $0x41
 5af:	c3                   	ret    

000005b0 <str_ls_call21>:
 5b0:	6c                   	insb   (%dx),%es:(%edi)
 5b1:	73 5f                	jae    612 <str_ls_call26+0x8>
 5b3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5b6:	6c                   	insb   (%dx),%es:(%edi)
 5b7:	32 31                	xor    (%ecx),%dh
	...

000005ba <ls_call21>:
CS550LSSYSCALL(ls_call21)
 5ba:	b8 b0 05 00 00       	mov    $0x5b0,%eax
 5bf:	cd 41                	int    $0x41
 5c1:	c3                   	ret    

000005c2 <str_ls_call22>:
 5c2:	6c                   	insb   (%dx),%es:(%edi)
 5c3:	73 5f                	jae    624 <str_ls_call27+0x8>
 5c5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5c8:	6c                   	insb   (%dx),%es:(%edi)
 5c9:	32 32                	xor    (%edx),%dh
	...

000005cc <ls_call22>:
CS550LSSYSCALL(ls_call22)
 5cc:	b8 c2 05 00 00       	mov    $0x5c2,%eax
 5d1:	cd 41                	int    $0x41
 5d3:	c3                   	ret    

000005d4 <str_ls_call23>:
 5d4:	6c                   	insb   (%dx),%es:(%edi)
 5d5:	73 5f                	jae    636 <str_ls_call28+0x8>
 5d7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5da:	6c                   	insb   (%dx),%es:(%edi)
 5db:	32 33                	xor    (%ebx),%dh
	...

000005de <ls_call23>:
CS550LSSYSCALL(ls_call23)
 5de:	b8 d4 05 00 00       	mov    $0x5d4,%eax
 5e3:	cd 41                	int    $0x41
 5e5:	c3                   	ret    

000005e6 <str_ls_call24>:
 5e6:	6c                   	insb   (%dx),%es:(%edi)
 5e7:	73 5f                	jae    648 <str_ls_call29+0x8>
 5e9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5ec:	6c                   	insb   (%dx),%es:(%edi)
 5ed:	32 34 00             	xor    (%eax,%eax,1),%dh

000005f0 <ls_call24>:
CS550LSSYSCALL(ls_call24)
 5f0:	b8 e6 05 00 00       	mov    $0x5e6,%eax
 5f5:	cd 41                	int    $0x41
 5f7:	c3                   	ret    

000005f8 <str_ls_call25>:
 5f8:	6c                   	insb   (%dx),%es:(%edi)
 5f9:	73 5f                	jae    65a <str_ls_call30+0x8>
 5fb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 5fe:	6c                   	insb   (%dx),%es:(%edi)
 5ff:	32                   	.byte 0x32
 600:	35                   	.byte 0x35
	...

00000602 <ls_call25>:
CS550LSSYSCALL(ls_call25)
 602:	b8 f8 05 00 00       	mov    $0x5f8,%eax
 607:	cd 41                	int    $0x41
 609:	c3                   	ret    

0000060a <str_ls_call26>:
 60a:	6c                   	insb   (%dx),%es:(%edi)
 60b:	73 5f                	jae    66c <str_ls_call31+0x8>
 60d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 610:	6c                   	insb   (%dx),%es:(%edi)
 611:	32 36                	xor    (%esi),%dh
	...

00000614 <ls_call26>:
CS550LSSYSCALL(ls_call26)
 614:	b8 0a 06 00 00       	mov    $0x60a,%eax
 619:	cd 41                	int    $0x41
 61b:	c3                   	ret    

0000061c <str_ls_call27>:
 61c:	6c                   	insb   (%dx),%es:(%edi)
 61d:	73 5f                	jae    67e <str_ls_call32+0x8>
 61f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 622:	6c                   	insb   (%dx),%es:(%edi)
 623:	32 37                	xor    (%edi),%dh
	...

00000626 <ls_call27>:
CS550LSSYSCALL(ls_call27)
 626:	b8 1c 06 00 00       	mov    $0x61c,%eax
 62b:	cd 41                	int    $0x41
 62d:	c3                   	ret    

0000062e <str_ls_call28>:
 62e:	6c                   	insb   (%dx),%es:(%edi)
 62f:	73 5f                	jae    690 <str_ls_call33+0x8>
 631:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 634:	6c                   	insb   (%dx),%es:(%edi)
 635:	32 38                	xor    (%eax),%bh
	...

00000638 <ls_call28>:
CS550LSSYSCALL(ls_call28)
 638:	b8 2e 06 00 00       	mov    $0x62e,%eax
 63d:	cd 41                	int    $0x41
 63f:	c3                   	ret    

00000640 <str_ls_call29>:
 640:	6c                   	insb   (%dx),%es:(%edi)
 641:	73 5f                	jae    6a2 <str_ls_call34+0x8>
 643:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 646:	6c                   	insb   (%dx),%es:(%edi)
 647:	32 39                	xor    (%ecx),%bh
	...

0000064a <ls_call29>:
CS550LSSYSCALL(ls_call29)
 64a:	b8 40 06 00 00       	mov    $0x640,%eax
 64f:	cd 41                	int    $0x41
 651:	c3                   	ret    

00000652 <str_ls_call30>:
 652:	6c                   	insb   (%dx),%es:(%edi)
 653:	73 5f                	jae    6b4 <str_ls_call35+0x8>
 655:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 658:	6c                   	insb   (%dx),%es:(%edi)
 659:	33 30                	xor    (%eax),%esi
	...

0000065c <ls_call30>:
CS550LSSYSCALL(ls_call30)
 65c:	b8 52 06 00 00       	mov    $0x652,%eax
 661:	cd 41                	int    $0x41
 663:	c3                   	ret    

00000664 <str_ls_call31>:
 664:	6c                   	insb   (%dx),%es:(%edi)
 665:	73 5f                	jae    6c6 <str_ls_call36+0x8>
 667:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 66a:	6c                   	insb   (%dx),%es:(%edi)
 66b:	33 31                	xor    (%ecx),%esi
	...

0000066e <ls_call31>:
CS550LSSYSCALL(ls_call31)
 66e:	b8 64 06 00 00       	mov    $0x664,%eax
 673:	cd 41                	int    $0x41
 675:	c3                   	ret    

00000676 <str_ls_call32>:
 676:	6c                   	insb   (%dx),%es:(%edi)
 677:	73 5f                	jae    6d8 <str_ls_call37+0x8>
 679:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 67c:	6c                   	insb   (%dx),%es:(%edi)
 67d:	33 32                	xor    (%edx),%esi
	...

00000680 <ls_call32>:
CS550LSSYSCALL(ls_call32)
 680:	b8 76 06 00 00       	mov    $0x676,%eax
 685:	cd 41                	int    $0x41
 687:	c3                   	ret    

00000688 <str_ls_call33>:
 688:	6c                   	insb   (%dx),%es:(%edi)
 689:	73 5f                	jae    6ea <str_ls_call38+0x8>
 68b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 68e:	6c                   	insb   (%dx),%es:(%edi)
 68f:	33 33                	xor    (%ebx),%esi
	...

00000692 <ls_call33>:
CS550LSSYSCALL(ls_call33)
 692:	b8 88 06 00 00       	mov    $0x688,%eax
 697:	cd 41                	int    $0x41
 699:	c3                   	ret    

0000069a <str_ls_call34>:
 69a:	6c                   	insb   (%dx),%es:(%edi)
 69b:	73 5f                	jae    6fc <str_ls_call39+0x8>
 69d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6a0:	6c                   	insb   (%dx),%es:(%edi)
 6a1:	33 34 00             	xor    (%eax,%eax,1),%esi

000006a4 <ls_call34>:
CS550LSSYSCALL(ls_call34)
 6a4:	b8 9a 06 00 00       	mov    $0x69a,%eax
 6a9:	cd 41                	int    $0x41
 6ab:	c3                   	ret    

000006ac <str_ls_call35>:
 6ac:	6c                   	insb   (%dx),%es:(%edi)
 6ad:	73 5f                	jae    70e <str_ls_call40+0x8>
 6af:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6b2:	6c                   	insb   (%dx),%es:(%edi)
 6b3:	33                   	.byte 0x33
 6b4:	35                   	.byte 0x35
	...

000006b6 <ls_call35>:
CS550LSSYSCALL(ls_call35)
 6b6:	b8 ac 06 00 00       	mov    $0x6ac,%eax
 6bb:	cd 41                	int    $0x41
 6bd:	c3                   	ret    

000006be <str_ls_call36>:
 6be:	6c                   	insb   (%dx),%es:(%edi)
 6bf:	73 5f                	jae    720 <str_ls_call41+0x8>
 6c1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6c4:	6c                   	insb   (%dx),%es:(%edi)
 6c5:	33 36                	xor    (%esi),%esi
	...

000006c8 <ls_call36>:
CS550LSSYSCALL(ls_call36)
 6c8:	b8 be 06 00 00       	mov    $0x6be,%eax
 6cd:	cd 41                	int    $0x41
 6cf:	c3                   	ret    

000006d0 <str_ls_call37>:
 6d0:	6c                   	insb   (%dx),%es:(%edi)
 6d1:	73 5f                	jae    732 <str_ls_call42+0x8>
 6d3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6d6:	6c                   	insb   (%dx),%es:(%edi)
 6d7:	33 37                	xor    (%edi),%esi
	...

000006da <ls_call37>:
CS550LSSYSCALL(ls_call37)
 6da:	b8 d0 06 00 00       	mov    $0x6d0,%eax
 6df:	cd 41                	int    $0x41
 6e1:	c3                   	ret    

000006e2 <str_ls_call38>:
 6e2:	6c                   	insb   (%dx),%es:(%edi)
 6e3:	73 5f                	jae    744 <str_ls_call43+0x8>
 6e5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6e8:	6c                   	insb   (%dx),%es:(%edi)
 6e9:	33 38                	xor    (%eax),%edi
	...

000006ec <ls_call38>:
CS550LSSYSCALL(ls_call38)
 6ec:	b8 e2 06 00 00       	mov    $0x6e2,%eax
 6f1:	cd 41                	int    $0x41
 6f3:	c3                   	ret    

000006f4 <str_ls_call39>:
 6f4:	6c                   	insb   (%dx),%es:(%edi)
 6f5:	73 5f                	jae    756 <str_ls_call44+0x8>
 6f7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 6fa:	6c                   	insb   (%dx),%es:(%edi)
 6fb:	33 39                	xor    (%ecx),%edi
	...

000006fe <ls_call39>:
CS550LSSYSCALL(ls_call39)
 6fe:	b8 f4 06 00 00       	mov    $0x6f4,%eax
 703:	cd 41                	int    $0x41
 705:	c3                   	ret    

00000706 <str_ls_call40>:
 706:	6c                   	insb   (%dx),%es:(%edi)
 707:	73 5f                	jae    768 <str_ls_call45+0x8>
 709:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 70c:	6c                   	insb   (%dx),%es:(%edi)
 70d:	34 30                	xor    $0x30,%al
	...

00000710 <ls_call40>:
CS550LSSYSCALL(ls_call40)
 710:	b8 06 07 00 00       	mov    $0x706,%eax
 715:	cd 41                	int    $0x41
 717:	c3                   	ret    

00000718 <str_ls_call41>:
 718:	6c                   	insb   (%dx),%es:(%edi)
 719:	73 5f                	jae    77a <str_ls_call46+0x8>
 71b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 71e:	6c                   	insb   (%dx),%es:(%edi)
 71f:	34 31                	xor    $0x31,%al
	...

00000722 <ls_call41>:
CS550LSSYSCALL(ls_call41)
 722:	b8 18 07 00 00       	mov    $0x718,%eax
 727:	cd 41                	int    $0x41
 729:	c3                   	ret    

0000072a <str_ls_call42>:
 72a:	6c                   	insb   (%dx),%es:(%edi)
 72b:	73 5f                	jae    78c <str_ls_call47+0x8>
 72d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 730:	6c                   	insb   (%dx),%es:(%edi)
 731:	34 32                	xor    $0x32,%al
	...

00000734 <ls_call42>:
CS550LSSYSCALL(ls_call42)
 734:	b8 2a 07 00 00       	mov    $0x72a,%eax
 739:	cd 41                	int    $0x41
 73b:	c3                   	ret    

0000073c <str_ls_call43>:
 73c:	6c                   	insb   (%dx),%es:(%edi)
 73d:	73 5f                	jae    79e <str_ls_call48+0x8>
 73f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 742:	6c                   	insb   (%dx),%es:(%edi)
 743:	34 33                	xor    $0x33,%al
	...

00000746 <ls_call43>:
CS550LSSYSCALL(ls_call43)
 746:	b8 3c 07 00 00       	mov    $0x73c,%eax
 74b:	cd 41                	int    $0x41
 74d:	c3                   	ret    

0000074e <str_ls_call44>:
 74e:	6c                   	insb   (%dx),%es:(%edi)
 74f:	73 5f                	jae    7b0 <str_ls_call49+0x8>
 751:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 754:	6c                   	insb   (%dx),%es:(%edi)
 755:	34 34                	xor    $0x34,%al
	...

00000758 <ls_call44>:
CS550LSSYSCALL(ls_call44)
 758:	b8 4e 07 00 00       	mov    $0x74e,%eax
 75d:	cd 41                	int    $0x41
 75f:	c3                   	ret    

00000760 <str_ls_call45>:
 760:	6c                   	insb   (%dx),%es:(%edi)
 761:	73 5f                	jae    7c2 <str_ls_call50+0x8>
 763:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 766:	6c                   	insb   (%dx),%es:(%edi)
 767:	34 35                	xor    $0x35,%al
	...

0000076a <ls_call45>:
CS550LSSYSCALL(ls_call45)
 76a:	b8 60 07 00 00       	mov    $0x760,%eax
 76f:	cd 41                	int    $0x41
 771:	c3                   	ret    

00000772 <str_ls_call46>:
 772:	6c                   	insb   (%dx),%es:(%edi)
 773:	73 5f                	jae    7d4 <str_ht_call1+0x8>
 775:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 778:	6c                   	insb   (%dx),%es:(%edi)
 779:	34 36                	xor    $0x36,%al
	...

0000077c <ls_call46>:
CS550LSSYSCALL(ls_call46)
 77c:	b8 72 07 00 00       	mov    $0x772,%eax
 781:	cd 41                	int    $0x41
 783:	c3                   	ret    

00000784 <str_ls_call47>:
 784:	6c                   	insb   (%dx),%es:(%edi)
 785:	73 5f                	jae    7e6 <ht_call2>
 787:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 78a:	6c                   	insb   (%dx),%es:(%edi)
 78b:	34 37                	xor    $0x37,%al
	...

0000078e <ls_call47>:
CS550LSSYSCALL(ls_call47)
 78e:	b8 84 07 00 00       	mov    $0x784,%eax
 793:	cd 41                	int    $0x41
 795:	c3                   	ret    

00000796 <str_ls_call48>:
 796:	6c                   	insb   (%dx),%es:(%edi)
 797:	73 5f                	jae    7f8 <ht_call3+0x1>
 799:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 79c:	6c                   	insb   (%dx),%es:(%edi)
 79d:	34 38                	xor    $0x38,%al
	...

000007a0 <ls_call48>:
CS550LSSYSCALL(ls_call48)
 7a0:	b8 96 07 00 00       	mov    $0x796,%eax
 7a5:	cd 41                	int    $0x41
 7a7:	c3                   	ret    

000007a8 <str_ls_call49>:
 7a8:	6c                   	insb   (%dx),%es:(%edi)
 7a9:	73 5f                	jae    80a <ht_call4+0x2>
 7ab:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 7ae:	6c                   	insb   (%dx),%es:(%edi)
 7af:	34 39                	xor    $0x39,%al
	...

000007b2 <ls_call49>:
CS550LSSYSCALL(ls_call49)
 7b2:	b8 a8 07 00 00       	mov    $0x7a8,%eax
 7b7:	cd 41                	int    $0x41
 7b9:	c3                   	ret    

000007ba <str_ls_call50>:
 7ba:	6c                   	insb   (%dx),%es:(%edi)
 7bb:	73 5f                	jae    81c <ht_call5+0x3>
 7bd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
 7c0:	6c                   	insb   (%dx),%es:(%edi)
 7c1:	35                   	.byte 0x35
 7c2:	30 00                	xor    %al,(%eax)

000007c4 <ls_call50>:
CS550LSSYSCALL(ls_call50)
 7c4:	b8 ba 07 00 00       	mov    $0x7ba,%eax
 7c9:	cd 41                	int    $0x41
 7cb:	c3                   	ret    

000007cc <str_ht_call1>:
 7cc:	68 74 5f 63 61       	push   $0x61635f74
 7d1:	6c                   	insb   (%dx),%es:(%edi)
 7d2:	6c                   	insb   (%dx),%es:(%edi)
 7d3:	31 00                	xor    %eax,(%eax)

000007d5 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
 7d5:	b8 cc 07 00 00       	mov    $0x7cc,%eax
 7da:	cd 42                	int    $0x42
 7dc:	c3                   	ret    

000007dd <str_ht_call2>:
 7dd:	68 74 5f 63 61       	push   $0x61635f74
 7e2:	6c                   	insb   (%dx),%es:(%edi)
 7e3:	6c                   	insb   (%dx),%es:(%edi)
 7e4:	32 00                	xor    (%eax),%al

000007e6 <ht_call2>:
CS550HTSYSCALL(ht_call2)
 7e6:	b8 dd 07 00 00       	mov    $0x7dd,%eax
 7eb:	cd 42                	int    $0x42
 7ed:	c3                   	ret    

000007ee <str_ht_call3>:
 7ee:	68 74 5f 63 61       	push   $0x61635f74
 7f3:	6c                   	insb   (%dx),%es:(%edi)
 7f4:	6c                   	insb   (%dx),%es:(%edi)
 7f5:	33 00                	xor    (%eax),%eax

000007f7 <ht_call3>:
CS550HTSYSCALL(ht_call3)
 7f7:	b8 ee 07 00 00       	mov    $0x7ee,%eax
 7fc:	cd 42                	int    $0x42
 7fe:	c3                   	ret    

000007ff <str_ht_call4>:
 7ff:	68 74 5f 63 61       	push   $0x61635f74
 804:	6c                   	insb   (%dx),%es:(%edi)
 805:	6c                   	insb   (%dx),%es:(%edi)
 806:	34 00                	xor    $0x0,%al

00000808 <ht_call4>:
CS550HTSYSCALL(ht_call4)
 808:	b8 ff 07 00 00       	mov    $0x7ff,%eax
 80d:	cd 42                	int    $0x42
 80f:	c3                   	ret    

00000810 <str_ht_call5>:
 810:	68 74 5f 63 61       	push   $0x61635f74
 815:	6c                   	insb   (%dx),%es:(%edi)
 816:	6c                   	insb   (%dx),%es:(%edi)
 817:	35                   	.byte 0x35
	...

00000819 <ht_call5>:
CS550HTSYSCALL(ht_call5)
 819:	b8 10 08 00 00       	mov    $0x810,%eax
 81e:	cd 42                	int    $0x42
 820:	c3                   	ret    

00000821 <str_ht_call6>:
 821:	68 74 5f 63 61       	push   $0x61635f74
 826:	6c                   	insb   (%dx),%es:(%edi)
 827:	6c                   	insb   (%dx),%es:(%edi)
 828:	36                   	ss
	...

0000082a <ht_call6>:
CS550HTSYSCALL(ht_call6)
 82a:	b8 21 08 00 00       	mov    $0x821,%eax
 82f:	cd 42                	int    $0x42
 831:	c3                   	ret    

00000832 <str_ht_call7>:
 832:	68 74 5f 63 61       	push   $0x61635f74
 837:	6c                   	insb   (%dx),%es:(%edi)
 838:	6c                   	insb   (%dx),%es:(%edi)
 839:	37                   	aaa    
	...

0000083b <ht_call7>:
CS550HTSYSCALL(ht_call7)
 83b:	b8 32 08 00 00       	mov    $0x832,%eax
 840:	cd 42                	int    $0x42
 842:	c3                   	ret    

00000843 <str_ht_call8>:
 843:	68 74 5f 63 61       	push   $0x61635f74
 848:	6c                   	insb   (%dx),%es:(%edi)
 849:	6c                   	insb   (%dx),%es:(%edi)
 84a:	38 00                	cmp    %al,(%eax)

0000084c <ht_call8>:
CS550HTSYSCALL(ht_call8)
 84c:	b8 43 08 00 00       	mov    $0x843,%eax
 851:	cd 42                	int    $0x42
 853:	c3                   	ret    

00000854 <str_ht_call9>:
 854:	68 74 5f 63 61       	push   $0x61635f74
 859:	6c                   	insb   (%dx),%es:(%edi)
 85a:	6c                   	insb   (%dx),%es:(%edi)
 85b:	39 00                	cmp    %eax,(%eax)

0000085d <ht_call9>:
CS550HTSYSCALL(ht_call9)
 85d:	b8 54 08 00 00       	mov    $0x854,%eax
 862:	cd 42                	int    $0x42
 864:	c3                   	ret    

00000865 <str_ht_call10>:
 865:	68 74 5f 63 61       	push   $0x61635f74
 86a:	6c                   	insb   (%dx),%es:(%edi)
 86b:	6c                   	insb   (%dx),%es:(%edi)
 86c:	31 30                	xor    %esi,(%eax)
	...

0000086f <ht_call10>:
CS550HTSYSCALL(ht_call10)
 86f:	b8 65 08 00 00       	mov    $0x865,%eax
 874:	cd 42                	int    $0x42
 876:	c3                   	ret    

00000877 <str_ht_call11>:
 877:	68 74 5f 63 61       	push   $0x61635f74
 87c:	6c                   	insb   (%dx),%es:(%edi)
 87d:	6c                   	insb   (%dx),%es:(%edi)
 87e:	31 31                	xor    %esi,(%ecx)
	...

00000881 <ht_call11>:
CS550HTSYSCALL(ht_call11)
 881:	b8 77 08 00 00       	mov    $0x877,%eax
 886:	cd 42                	int    $0x42
 888:	c3                   	ret    

00000889 <str_ht_call12>:
 889:	68 74 5f 63 61       	push   $0x61635f74
 88e:	6c                   	insb   (%dx),%es:(%edi)
 88f:	6c                   	insb   (%dx),%es:(%edi)
 890:	31 32                	xor    %esi,(%edx)
	...

00000893 <ht_call12>:
CS550HTSYSCALL(ht_call12)
 893:	b8 89 08 00 00       	mov    $0x889,%eax
 898:	cd 42                	int    $0x42
 89a:	c3                   	ret    

0000089b <str_ht_call13>:
 89b:	68 74 5f 63 61       	push   $0x61635f74
 8a0:	6c                   	insb   (%dx),%es:(%edi)
 8a1:	6c                   	insb   (%dx),%es:(%edi)
 8a2:	31 33                	xor    %esi,(%ebx)
	...

000008a5 <ht_call13>:
CS550HTSYSCALL(ht_call13)
 8a5:	b8 9b 08 00 00       	mov    $0x89b,%eax
 8aa:	cd 42                	int    $0x42
 8ac:	c3                   	ret    

000008ad <str_ht_call14>:
 8ad:	68 74 5f 63 61       	push   $0x61635f74
 8b2:	6c                   	insb   (%dx),%es:(%edi)
 8b3:	6c                   	insb   (%dx),%es:(%edi)
 8b4:	31 34 00             	xor    %esi,(%eax,%eax,1)

000008b7 <ht_call14>:
CS550HTSYSCALL(ht_call14)
 8b7:	b8 ad 08 00 00       	mov    $0x8ad,%eax
 8bc:	cd 42                	int    $0x42
 8be:	c3                   	ret    

000008bf <str_ht_call15>:
 8bf:	68 74 5f 63 61       	push   $0x61635f74
 8c4:	6c                   	insb   (%dx),%es:(%edi)
 8c5:	6c                   	insb   (%dx),%es:(%edi)
 8c6:	31                   	.byte 0x31
 8c7:	35                   	.byte 0x35
	...

000008c9 <ht_call15>:
CS550HTSYSCALL(ht_call15)
 8c9:	b8 bf 08 00 00       	mov    $0x8bf,%eax
 8ce:	cd 42                	int    $0x42
 8d0:	c3                   	ret    

000008d1 <str_ht_call16>:
 8d1:	68 74 5f 63 61       	push   $0x61635f74
 8d6:	6c                   	insb   (%dx),%es:(%edi)
 8d7:	6c                   	insb   (%dx),%es:(%edi)
 8d8:	31 36                	xor    %esi,(%esi)
	...

000008db <ht_call16>:
CS550HTSYSCALL(ht_call16)
 8db:	b8 d1 08 00 00       	mov    $0x8d1,%eax
 8e0:	cd 42                	int    $0x42
 8e2:	c3                   	ret    

000008e3 <str_ht_call17>:
 8e3:	68 74 5f 63 61       	push   $0x61635f74
 8e8:	6c                   	insb   (%dx),%es:(%edi)
 8e9:	6c                   	insb   (%dx),%es:(%edi)
 8ea:	31 37                	xor    %esi,(%edi)
	...

000008ed <ht_call17>:
CS550HTSYSCALL(ht_call17)
 8ed:	b8 e3 08 00 00       	mov    $0x8e3,%eax
 8f2:	cd 42                	int    $0x42
 8f4:	c3                   	ret    

000008f5 <str_ht_call18>:
 8f5:	68 74 5f 63 61       	push   $0x61635f74
 8fa:	6c                   	insb   (%dx),%es:(%edi)
 8fb:	6c                   	insb   (%dx),%es:(%edi)
 8fc:	31 38                	xor    %edi,(%eax)
	...

000008ff <ht_call18>:
CS550HTSYSCALL(ht_call18)
 8ff:	b8 f5 08 00 00       	mov    $0x8f5,%eax
 904:	cd 42                	int    $0x42
 906:	c3                   	ret    

00000907 <str_ht_call19>:
 907:	68 74 5f 63 61       	push   $0x61635f74
 90c:	6c                   	insb   (%dx),%es:(%edi)
 90d:	6c                   	insb   (%dx),%es:(%edi)
 90e:	31 39                	xor    %edi,(%ecx)
	...

00000911 <ht_call19>:
CS550HTSYSCALL(ht_call19)
 911:	b8 07 09 00 00       	mov    $0x907,%eax
 916:	cd 42                	int    $0x42
 918:	c3                   	ret    

00000919 <str_ht_call20>:
 919:	68 74 5f 63 61       	push   $0x61635f74
 91e:	6c                   	insb   (%dx),%es:(%edi)
 91f:	6c                   	insb   (%dx),%es:(%edi)
 920:	32 30                	xor    (%eax),%dh
	...

00000923 <ht_call20>:
CS550HTSYSCALL(ht_call20)
 923:	b8 19 09 00 00       	mov    $0x919,%eax
 928:	cd 42                	int    $0x42
 92a:	c3                   	ret    

0000092b <str_ht_call21>:
 92b:	68 74 5f 63 61       	push   $0x61635f74
 930:	6c                   	insb   (%dx),%es:(%edi)
 931:	6c                   	insb   (%dx),%es:(%edi)
 932:	32 31                	xor    (%ecx),%dh
	...

00000935 <ht_call21>:
CS550HTSYSCALL(ht_call21)
 935:	b8 2b 09 00 00       	mov    $0x92b,%eax
 93a:	cd 42                	int    $0x42
 93c:	c3                   	ret    

0000093d <str_ht_call22>:
 93d:	68 74 5f 63 61       	push   $0x61635f74
 942:	6c                   	insb   (%dx),%es:(%edi)
 943:	6c                   	insb   (%dx),%es:(%edi)
 944:	32 32                	xor    (%edx),%dh
	...

00000947 <ht_call22>:
CS550HTSYSCALL(ht_call22)
 947:	b8 3d 09 00 00       	mov    $0x93d,%eax
 94c:	cd 42                	int    $0x42
 94e:	c3                   	ret    

0000094f <str_ht_call23>:
 94f:	68 74 5f 63 61       	push   $0x61635f74
 954:	6c                   	insb   (%dx),%es:(%edi)
 955:	6c                   	insb   (%dx),%es:(%edi)
 956:	32 33                	xor    (%ebx),%dh
	...

00000959 <ht_call23>:
CS550HTSYSCALL(ht_call23)
 959:	b8 4f 09 00 00       	mov    $0x94f,%eax
 95e:	cd 42                	int    $0x42
 960:	c3                   	ret    

00000961 <str_ht_call24>:
 961:	68 74 5f 63 61       	push   $0x61635f74
 966:	6c                   	insb   (%dx),%es:(%edi)
 967:	6c                   	insb   (%dx),%es:(%edi)
 968:	32 34 00             	xor    (%eax,%eax,1),%dh

0000096b <ht_call24>:
CS550HTSYSCALL(ht_call24)
 96b:	b8 61 09 00 00       	mov    $0x961,%eax
 970:	cd 42                	int    $0x42
 972:	c3                   	ret    

00000973 <str_ht_call25>:
 973:	68 74 5f 63 61       	push   $0x61635f74
 978:	6c                   	insb   (%dx),%es:(%edi)
 979:	6c                   	insb   (%dx),%es:(%edi)
 97a:	32                   	.byte 0x32
 97b:	35                   	.byte 0x35
	...

0000097d <ht_call25>:
CS550HTSYSCALL(ht_call25)
 97d:	b8 73 09 00 00       	mov    $0x973,%eax
 982:	cd 42                	int    $0x42
 984:	c3                   	ret    

00000985 <str_ht_call26>:
 985:	68 74 5f 63 61       	push   $0x61635f74
 98a:	6c                   	insb   (%dx),%es:(%edi)
 98b:	6c                   	insb   (%dx),%es:(%edi)
 98c:	32 36                	xor    (%esi),%dh
	...

0000098f <ht_call26>:
CS550HTSYSCALL(ht_call26)
 98f:	b8 85 09 00 00       	mov    $0x985,%eax
 994:	cd 42                	int    $0x42
 996:	c3                   	ret    

00000997 <str_ht_call27>:
 997:	68 74 5f 63 61       	push   $0x61635f74
 99c:	6c                   	insb   (%dx),%es:(%edi)
 99d:	6c                   	insb   (%dx),%es:(%edi)
 99e:	32 37                	xor    (%edi),%dh
	...

000009a1 <ht_call27>:
CS550HTSYSCALL(ht_call27)
 9a1:	b8 97 09 00 00       	mov    $0x997,%eax
 9a6:	cd 42                	int    $0x42
 9a8:	c3                   	ret    

000009a9 <str_ht_call28>:
 9a9:	68 74 5f 63 61       	push   $0x61635f74
 9ae:	6c                   	insb   (%dx),%es:(%edi)
 9af:	6c                   	insb   (%dx),%es:(%edi)
 9b0:	32 38                	xor    (%eax),%bh
	...

000009b3 <ht_call28>:
CS550HTSYSCALL(ht_call28)
 9b3:	b8 a9 09 00 00       	mov    $0x9a9,%eax
 9b8:	cd 42                	int    $0x42
 9ba:	c3                   	ret    

000009bb <str_ht_call29>:
 9bb:	68 74 5f 63 61       	push   $0x61635f74
 9c0:	6c                   	insb   (%dx),%es:(%edi)
 9c1:	6c                   	insb   (%dx),%es:(%edi)
 9c2:	32 39                	xor    (%ecx),%bh
	...

000009c5 <ht_call29>:
CS550HTSYSCALL(ht_call29)
 9c5:	b8 bb 09 00 00       	mov    $0x9bb,%eax
 9ca:	cd 42                	int    $0x42
 9cc:	c3                   	ret    

000009cd <str_ht_call30>:
 9cd:	68 74 5f 63 61       	push   $0x61635f74
 9d2:	6c                   	insb   (%dx),%es:(%edi)
 9d3:	6c                   	insb   (%dx),%es:(%edi)
 9d4:	33 30                	xor    (%eax),%esi
	...

000009d7 <ht_call30>:
CS550HTSYSCALL(ht_call30)
 9d7:	b8 cd 09 00 00       	mov    $0x9cd,%eax
 9dc:	cd 42                	int    $0x42
 9de:	c3                   	ret    

000009df <str_ht_call31>:
 9df:	68 74 5f 63 61       	push   $0x61635f74
 9e4:	6c                   	insb   (%dx),%es:(%edi)
 9e5:	6c                   	insb   (%dx),%es:(%edi)
 9e6:	33 31                	xor    (%ecx),%esi
	...

000009e9 <ht_call31>:
CS550HTSYSCALL(ht_call31)
 9e9:	b8 df 09 00 00       	mov    $0x9df,%eax
 9ee:	cd 42                	int    $0x42
 9f0:	c3                   	ret    

000009f1 <str_ht_call32>:
 9f1:	68 74 5f 63 61       	push   $0x61635f74
 9f6:	6c                   	insb   (%dx),%es:(%edi)
 9f7:	6c                   	insb   (%dx),%es:(%edi)
 9f8:	33 32                	xor    (%edx),%esi
	...

000009fb <ht_call32>:
CS550HTSYSCALL(ht_call32)
 9fb:	b8 f1 09 00 00       	mov    $0x9f1,%eax
 a00:	cd 42                	int    $0x42
 a02:	c3                   	ret    

00000a03 <str_ht_call33>:
 a03:	68 74 5f 63 61       	push   $0x61635f74
 a08:	6c                   	insb   (%dx),%es:(%edi)
 a09:	6c                   	insb   (%dx),%es:(%edi)
 a0a:	33 33                	xor    (%ebx),%esi
	...

00000a0d <ht_call33>:
CS550HTSYSCALL(ht_call33)
 a0d:	b8 03 0a 00 00       	mov    $0xa03,%eax
 a12:	cd 42                	int    $0x42
 a14:	c3                   	ret    

00000a15 <str_ht_call34>:
 a15:	68 74 5f 63 61       	push   $0x61635f74
 a1a:	6c                   	insb   (%dx),%es:(%edi)
 a1b:	6c                   	insb   (%dx),%es:(%edi)
 a1c:	33 34 00             	xor    (%eax,%eax,1),%esi

00000a1f <ht_call34>:
CS550HTSYSCALL(ht_call34)
 a1f:	b8 15 0a 00 00       	mov    $0xa15,%eax
 a24:	cd 42                	int    $0x42
 a26:	c3                   	ret    

00000a27 <str_ht_call35>:
 a27:	68 74 5f 63 61       	push   $0x61635f74
 a2c:	6c                   	insb   (%dx),%es:(%edi)
 a2d:	6c                   	insb   (%dx),%es:(%edi)
 a2e:	33                   	.byte 0x33
 a2f:	35                   	.byte 0x35
	...

00000a31 <ht_call35>:
CS550HTSYSCALL(ht_call35)
 a31:	b8 27 0a 00 00       	mov    $0xa27,%eax
 a36:	cd 42                	int    $0x42
 a38:	c3                   	ret    

00000a39 <str_ht_call36>:
 a39:	68 74 5f 63 61       	push   $0x61635f74
 a3e:	6c                   	insb   (%dx),%es:(%edi)
 a3f:	6c                   	insb   (%dx),%es:(%edi)
 a40:	33 36                	xor    (%esi),%esi
	...

00000a43 <ht_call36>:
CS550HTSYSCALL(ht_call36)
 a43:	b8 39 0a 00 00       	mov    $0xa39,%eax
 a48:	cd 42                	int    $0x42
 a4a:	c3                   	ret    

00000a4b <str_ht_call37>:
 a4b:	68 74 5f 63 61       	push   $0x61635f74
 a50:	6c                   	insb   (%dx),%es:(%edi)
 a51:	6c                   	insb   (%dx),%es:(%edi)
 a52:	33 37                	xor    (%edi),%esi
	...

00000a55 <ht_call37>:
CS550HTSYSCALL(ht_call37)
 a55:	b8 4b 0a 00 00       	mov    $0xa4b,%eax
 a5a:	cd 42                	int    $0x42
 a5c:	c3                   	ret    

00000a5d <str_ht_call38>:
 a5d:	68 74 5f 63 61       	push   $0x61635f74
 a62:	6c                   	insb   (%dx),%es:(%edi)
 a63:	6c                   	insb   (%dx),%es:(%edi)
 a64:	33 38                	xor    (%eax),%edi
	...

00000a67 <ht_call38>:
CS550HTSYSCALL(ht_call38)
 a67:	b8 5d 0a 00 00       	mov    $0xa5d,%eax
 a6c:	cd 42                	int    $0x42
 a6e:	c3                   	ret    

00000a6f <str_ht_call39>:
 a6f:	68 74 5f 63 61       	push   $0x61635f74
 a74:	6c                   	insb   (%dx),%es:(%edi)
 a75:	6c                   	insb   (%dx),%es:(%edi)
 a76:	33 39                	xor    (%ecx),%edi
	...

00000a79 <ht_call39>:
CS550HTSYSCALL(ht_call39)
 a79:	b8 6f 0a 00 00       	mov    $0xa6f,%eax
 a7e:	cd 42                	int    $0x42
 a80:	c3                   	ret    

00000a81 <str_ht_call40>:
 a81:	68 74 5f 63 61       	push   $0x61635f74
 a86:	6c                   	insb   (%dx),%es:(%edi)
 a87:	6c                   	insb   (%dx),%es:(%edi)
 a88:	34 30                	xor    $0x30,%al
	...

00000a8b <ht_call40>:
CS550HTSYSCALL(ht_call40)
 a8b:	b8 81 0a 00 00       	mov    $0xa81,%eax
 a90:	cd 42                	int    $0x42
 a92:	c3                   	ret    

00000a93 <str_ht_call41>:
 a93:	68 74 5f 63 61       	push   $0x61635f74
 a98:	6c                   	insb   (%dx),%es:(%edi)
 a99:	6c                   	insb   (%dx),%es:(%edi)
 a9a:	34 31                	xor    $0x31,%al
	...

00000a9d <ht_call41>:
CS550HTSYSCALL(ht_call41)
 a9d:	b8 93 0a 00 00       	mov    $0xa93,%eax
 aa2:	cd 42                	int    $0x42
 aa4:	c3                   	ret    

00000aa5 <str_ht_call42>:
 aa5:	68 74 5f 63 61       	push   $0x61635f74
 aaa:	6c                   	insb   (%dx),%es:(%edi)
 aab:	6c                   	insb   (%dx),%es:(%edi)
 aac:	34 32                	xor    $0x32,%al
	...

00000aaf <ht_call42>:
CS550HTSYSCALL(ht_call42)
 aaf:	b8 a5 0a 00 00       	mov    $0xaa5,%eax
 ab4:	cd 42                	int    $0x42
 ab6:	c3                   	ret    

00000ab7 <str_ht_call43>:
 ab7:	68 74 5f 63 61       	push   $0x61635f74
 abc:	6c                   	insb   (%dx),%es:(%edi)
 abd:	6c                   	insb   (%dx),%es:(%edi)
 abe:	34 33                	xor    $0x33,%al
	...

00000ac1 <ht_call43>:
CS550HTSYSCALL(ht_call43)
 ac1:	b8 b7 0a 00 00       	mov    $0xab7,%eax
 ac6:	cd 42                	int    $0x42
 ac8:	c3                   	ret    

00000ac9 <str_ht_call44>:
 ac9:	68 74 5f 63 61       	push   $0x61635f74
 ace:	6c                   	insb   (%dx),%es:(%edi)
 acf:	6c                   	insb   (%dx),%es:(%edi)
 ad0:	34 34                	xor    $0x34,%al
	...

00000ad3 <ht_call44>:
CS550HTSYSCALL(ht_call44)
 ad3:	b8 c9 0a 00 00       	mov    $0xac9,%eax
 ad8:	cd 42                	int    $0x42
 ada:	c3                   	ret    

00000adb <str_ht_call45>:
 adb:	68 74 5f 63 61       	push   $0x61635f74
 ae0:	6c                   	insb   (%dx),%es:(%edi)
 ae1:	6c                   	insb   (%dx),%es:(%edi)
 ae2:	34 35                	xor    $0x35,%al
	...

00000ae5 <ht_call45>:
CS550HTSYSCALL(ht_call45)
 ae5:	b8 db 0a 00 00       	mov    $0xadb,%eax
 aea:	cd 42                	int    $0x42
 aec:	c3                   	ret    

00000aed <str_ht_call46>:
 aed:	68 74 5f 63 61       	push   $0x61635f74
 af2:	6c                   	insb   (%dx),%es:(%edi)
 af3:	6c                   	insb   (%dx),%es:(%edi)
 af4:	34 36                	xor    $0x36,%al
	...

00000af7 <ht_call46>:
CS550HTSYSCALL(ht_call46)
 af7:	b8 ed 0a 00 00       	mov    $0xaed,%eax
 afc:	cd 42                	int    $0x42
 afe:	c3                   	ret    

00000aff <str_ht_call47>:
 aff:	68 74 5f 63 61       	push   $0x61635f74
 b04:	6c                   	insb   (%dx),%es:(%edi)
 b05:	6c                   	insb   (%dx),%es:(%edi)
 b06:	34 37                	xor    $0x37,%al
	...

00000b09 <ht_call47>:
CS550HTSYSCALL(ht_call47)
 b09:	b8 ff 0a 00 00       	mov    $0xaff,%eax
 b0e:	cd 42                	int    $0x42
 b10:	c3                   	ret    

00000b11 <str_ht_call48>:
 b11:	68 74 5f 63 61       	push   $0x61635f74
 b16:	6c                   	insb   (%dx),%es:(%edi)
 b17:	6c                   	insb   (%dx),%es:(%edi)
 b18:	34 38                	xor    $0x38,%al
	...

00000b1b <ht_call48>:
CS550HTSYSCALL(ht_call48)
 b1b:	b8 11 0b 00 00       	mov    $0xb11,%eax
 b20:	cd 42                	int    $0x42
 b22:	c3                   	ret    

00000b23 <str_ht_call49>:
 b23:	68 74 5f 63 61       	push   $0x61635f74
 b28:	6c                   	insb   (%dx),%es:(%edi)
 b29:	6c                   	insb   (%dx),%es:(%edi)
 b2a:	34 39                	xor    $0x39,%al
	...

00000b2d <ht_call49>:
CS550HTSYSCALL(ht_call49)
 b2d:	b8 23 0b 00 00       	mov    $0xb23,%eax
 b32:	cd 42                	int    $0x42
 b34:	c3                   	ret    

00000b35 <str_ht_call50>:
 b35:	68 74 5f 63 61       	push   $0x61635f74
 b3a:	6c                   	insb   (%dx),%es:(%edi)
 b3b:	6c                   	insb   (%dx),%es:(%edi)
 b3c:	35                   	.byte 0x35
 b3d:	30 00                	xor    %al,(%eax)

00000b3f <ht_call50>:
CS550HTSYSCALL(ht_call50)
 b3f:	b8 35 0b 00 00       	mov    $0xb35,%eax
 b44:	cd 42                	int    $0x42
 b46:	c3                   	ret    

00000b47 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 b47:	55                   	push   %ebp
 b48:	89 e5                	mov    %esp,%ebp
 b4a:	83 ec 18             	sub    $0x18,%esp
 b4d:	8b 45 0c             	mov    0xc(%ebp),%eax
 b50:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 b53:	83 ec 04             	sub    $0x4,%esp
 b56:	6a 01                	push   $0x1
 b58:	8d 45 f4             	lea    -0xc(%ebp),%eax
 b5b:	50                   	push   %eax
 b5c:	ff 75 08             	pushl  0x8(%ebp)
 b5f:	e8 65 f8 ff ff       	call   3c9 <write>
 b64:	83 c4 10             	add    $0x10,%esp
}
 b67:	90                   	nop
 b68:	c9                   	leave  
 b69:	c3                   	ret    

00000b6a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 b6a:	55                   	push   %ebp
 b6b:	89 e5                	mov    %esp,%ebp
 b6d:	53                   	push   %ebx
 b6e:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 b71:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 b78:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 b7c:	74 17                	je     b95 <printint+0x2b>
 b7e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 b82:	79 11                	jns    b95 <printint+0x2b>
    neg = 1;
 b84:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 b8b:	8b 45 0c             	mov    0xc(%ebp),%eax
 b8e:	f7 d8                	neg    %eax
 b90:	89 45 ec             	mov    %eax,-0x14(%ebp)
 b93:	eb 06                	jmp    b9b <printint+0x31>
  } else {
    x = xx;
 b95:	8b 45 0c             	mov    0xc(%ebp),%eax
 b98:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 b9b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 ba2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 ba5:	8d 41 01             	lea    0x1(%ecx),%eax
 ba8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 bab:	8b 5d 10             	mov    0x10(%ebp),%ebx
 bae:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bb1:	ba 00 00 00 00       	mov    $0x0,%edx
 bb6:	f7 f3                	div    %ebx
 bb8:	89 d0                	mov    %edx,%eax
 bba:	0f b6 80 48 12 00 00 	movzbl 0x1248(%eax),%eax
 bc1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 bc5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 bc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bcb:	ba 00 00 00 00       	mov    $0x0,%edx
 bd0:	f7 f3                	div    %ebx
 bd2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 bd5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bd9:	75 c7                	jne    ba2 <printint+0x38>
  if(neg)
 bdb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 bdf:	74 2d                	je     c0e <printint+0xa4>
    buf[i++] = '-';
 be1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 be4:	8d 50 01             	lea    0x1(%eax),%edx
 be7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 bea:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 bef:	eb 1d                	jmp    c0e <printint+0xa4>
    putc(fd, buf[i]);
 bf1:	8d 55 dc             	lea    -0x24(%ebp),%edx
 bf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf7:	01 d0                	add    %edx,%eax
 bf9:	0f b6 00             	movzbl (%eax),%eax
 bfc:	0f be c0             	movsbl %al,%eax
 bff:	83 ec 08             	sub    $0x8,%esp
 c02:	50                   	push   %eax
 c03:	ff 75 08             	pushl  0x8(%ebp)
 c06:	e8 3c ff ff ff       	call   b47 <putc>
 c0b:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 c0e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 c12:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c16:	79 d9                	jns    bf1 <printint+0x87>
    putc(fd, buf[i]);
}
 c18:	90                   	nop
 c19:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 c1c:	c9                   	leave  
 c1d:	c3                   	ret    

00000c1e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 c1e:	55                   	push   %ebp
 c1f:	89 e5                	mov    %esp,%ebp
 c21:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 c24:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 c2b:	8d 45 0c             	lea    0xc(%ebp),%eax
 c2e:	83 c0 04             	add    $0x4,%eax
 c31:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 c34:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 c3b:	e9 59 01 00 00       	jmp    d99 <printf+0x17b>
    c = fmt[i] & 0xff;
 c40:	8b 55 0c             	mov    0xc(%ebp),%edx
 c43:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c46:	01 d0                	add    %edx,%eax
 c48:	0f b6 00             	movzbl (%eax),%eax
 c4b:	0f be c0             	movsbl %al,%eax
 c4e:	25 ff 00 00 00       	and    $0xff,%eax
 c53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 c56:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c5a:	75 2c                	jne    c88 <printf+0x6a>
      if(c == '%'){
 c5c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 c60:	75 0c                	jne    c6e <printf+0x50>
        state = '%';
 c62:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 c69:	e9 27 01 00 00       	jmp    d95 <printf+0x177>
      } else {
        putc(fd, c);
 c6e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c71:	0f be c0             	movsbl %al,%eax
 c74:	83 ec 08             	sub    $0x8,%esp
 c77:	50                   	push   %eax
 c78:	ff 75 08             	pushl  0x8(%ebp)
 c7b:	e8 c7 fe ff ff       	call   b47 <putc>
 c80:	83 c4 10             	add    $0x10,%esp
 c83:	e9 0d 01 00 00       	jmp    d95 <printf+0x177>
      }
    } else if(state == '%'){
 c88:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 c8c:	0f 85 03 01 00 00    	jne    d95 <printf+0x177>
      if(c == 'd'){
 c92:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 c96:	75 1e                	jne    cb6 <printf+0x98>
        printint(fd, *ap, 10, 1);
 c98:	8b 45 e8             	mov    -0x18(%ebp),%eax
 c9b:	8b 00                	mov    (%eax),%eax
 c9d:	6a 01                	push   $0x1
 c9f:	6a 0a                	push   $0xa
 ca1:	50                   	push   %eax
 ca2:	ff 75 08             	pushl  0x8(%ebp)
 ca5:	e8 c0 fe ff ff       	call   b6a <printint>
 caa:	83 c4 10             	add    $0x10,%esp
        ap++;
 cad:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 cb1:	e9 d8 00 00 00       	jmp    d8e <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 cb6:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 cba:	74 06                	je     cc2 <printf+0xa4>
 cbc:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 cc0:	75 1e                	jne    ce0 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 cc2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 cc5:	8b 00                	mov    (%eax),%eax
 cc7:	6a 00                	push   $0x0
 cc9:	6a 10                	push   $0x10
 ccb:	50                   	push   %eax
 ccc:	ff 75 08             	pushl  0x8(%ebp)
 ccf:	e8 96 fe ff ff       	call   b6a <printint>
 cd4:	83 c4 10             	add    $0x10,%esp
        ap++;
 cd7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 cdb:	e9 ae 00 00 00       	jmp    d8e <printf+0x170>
      } else if(c == 's'){
 ce0:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 ce4:	75 43                	jne    d29 <printf+0x10b>
        s = (char*)*ap;
 ce6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 ce9:	8b 00                	mov    (%eax),%eax
 ceb:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 cee:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 cf2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 cf6:	75 25                	jne    d1d <printf+0xff>
          s = "(null)";
 cf8:	c7 45 f4 f7 0f 00 00 	movl   $0xff7,-0xc(%ebp)
        while(*s != 0){
 cff:	eb 1c                	jmp    d1d <printf+0xff>
          putc(fd, *s);
 d01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d04:	0f b6 00             	movzbl (%eax),%eax
 d07:	0f be c0             	movsbl %al,%eax
 d0a:	83 ec 08             	sub    $0x8,%esp
 d0d:	50                   	push   %eax
 d0e:	ff 75 08             	pushl  0x8(%ebp)
 d11:	e8 31 fe ff ff       	call   b47 <putc>
 d16:	83 c4 10             	add    $0x10,%esp
          s++;
 d19:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 d1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d20:	0f b6 00             	movzbl (%eax),%eax
 d23:	84 c0                	test   %al,%al
 d25:	75 da                	jne    d01 <printf+0xe3>
 d27:	eb 65                	jmp    d8e <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 d29:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 d2d:	75 1d                	jne    d4c <printf+0x12e>
        putc(fd, *ap);
 d2f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 d32:	8b 00                	mov    (%eax),%eax
 d34:	0f be c0             	movsbl %al,%eax
 d37:	83 ec 08             	sub    $0x8,%esp
 d3a:	50                   	push   %eax
 d3b:	ff 75 08             	pushl  0x8(%ebp)
 d3e:	e8 04 fe ff ff       	call   b47 <putc>
 d43:	83 c4 10             	add    $0x10,%esp
        ap++;
 d46:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 d4a:	eb 42                	jmp    d8e <printf+0x170>
      } else if(c == '%'){
 d4c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 d50:	75 17                	jne    d69 <printf+0x14b>
        putc(fd, c);
 d52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 d55:	0f be c0             	movsbl %al,%eax
 d58:	83 ec 08             	sub    $0x8,%esp
 d5b:	50                   	push   %eax
 d5c:	ff 75 08             	pushl  0x8(%ebp)
 d5f:	e8 e3 fd ff ff       	call   b47 <putc>
 d64:	83 c4 10             	add    $0x10,%esp
 d67:	eb 25                	jmp    d8e <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 d69:	83 ec 08             	sub    $0x8,%esp
 d6c:	6a 25                	push   $0x25
 d6e:	ff 75 08             	pushl  0x8(%ebp)
 d71:	e8 d1 fd ff ff       	call   b47 <putc>
 d76:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 d79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 d7c:	0f be c0             	movsbl %al,%eax
 d7f:	83 ec 08             	sub    $0x8,%esp
 d82:	50                   	push   %eax
 d83:	ff 75 08             	pushl  0x8(%ebp)
 d86:	e8 bc fd ff ff       	call   b47 <putc>
 d8b:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 d8e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 d95:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 d99:	8b 55 0c             	mov    0xc(%ebp),%edx
 d9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d9f:	01 d0                	add    %edx,%eax
 da1:	0f b6 00             	movzbl (%eax),%eax
 da4:	84 c0                	test   %al,%al
 da6:	0f 85 94 fe ff ff    	jne    c40 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 dac:	90                   	nop
 dad:	c9                   	leave  
 dae:	c3                   	ret    

00000daf <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 daf:	55                   	push   %ebp
 db0:	89 e5                	mov    %esp,%ebp
 db2:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 db5:	8b 45 08             	mov    0x8(%ebp),%eax
 db8:	83 e8 08             	sub    $0x8,%eax
 dbb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 dbe:	a1 64 12 00 00       	mov    0x1264,%eax
 dc3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 dc6:	eb 24                	jmp    dec <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 dc8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 dcb:	8b 00                	mov    (%eax),%eax
 dcd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 dd0:	77 12                	ja     de4 <free+0x35>
 dd2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 dd5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 dd8:	77 24                	ja     dfe <free+0x4f>
 dda:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ddd:	8b 00                	mov    (%eax),%eax
 ddf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 de2:	77 1a                	ja     dfe <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 de4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 de7:	8b 00                	mov    (%eax),%eax
 de9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 dec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 def:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 df2:	76 d4                	jbe    dc8 <free+0x19>
 df4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 df7:	8b 00                	mov    (%eax),%eax
 df9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 dfc:	76 ca                	jbe    dc8 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 dfe:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e01:	8b 40 04             	mov    0x4(%eax),%eax
 e04:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 e0b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e0e:	01 c2                	add    %eax,%edx
 e10:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e13:	8b 00                	mov    (%eax),%eax
 e15:	39 c2                	cmp    %eax,%edx
 e17:	75 24                	jne    e3d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 e19:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e1c:	8b 50 04             	mov    0x4(%eax),%edx
 e1f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e22:	8b 00                	mov    (%eax),%eax
 e24:	8b 40 04             	mov    0x4(%eax),%eax
 e27:	01 c2                	add    %eax,%edx
 e29:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e2c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 e2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e32:	8b 00                	mov    (%eax),%eax
 e34:	8b 10                	mov    (%eax),%edx
 e36:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e39:	89 10                	mov    %edx,(%eax)
 e3b:	eb 0a                	jmp    e47 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 e3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e40:	8b 10                	mov    (%eax),%edx
 e42:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e45:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 e47:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e4a:	8b 40 04             	mov    0x4(%eax),%eax
 e4d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 e54:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e57:	01 d0                	add    %edx,%eax
 e59:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 e5c:	75 20                	jne    e7e <free+0xcf>
    p->s.size += bp->s.size;
 e5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e61:	8b 50 04             	mov    0x4(%eax),%edx
 e64:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e67:	8b 40 04             	mov    0x4(%eax),%eax
 e6a:	01 c2                	add    %eax,%edx
 e6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e6f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 e72:	8b 45 f8             	mov    -0x8(%ebp),%eax
 e75:	8b 10                	mov    (%eax),%edx
 e77:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e7a:	89 10                	mov    %edx,(%eax)
 e7c:	eb 08                	jmp    e86 <free+0xd7>
  } else
    p->s.ptr = bp;
 e7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e81:	8b 55 f8             	mov    -0x8(%ebp),%edx
 e84:	89 10                	mov    %edx,(%eax)
  freep = p;
 e86:	8b 45 fc             	mov    -0x4(%ebp),%eax
 e89:	a3 64 12 00 00       	mov    %eax,0x1264
}
 e8e:	90                   	nop
 e8f:	c9                   	leave  
 e90:	c3                   	ret    

00000e91 <morecore>:

static Header*
morecore(uint nu)
{
 e91:	55                   	push   %ebp
 e92:	89 e5                	mov    %esp,%ebp
 e94:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 e97:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 e9e:	77 07                	ja     ea7 <morecore+0x16>
    nu = 4096;
 ea0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 ea7:	8b 45 08             	mov    0x8(%ebp),%eax
 eaa:	c1 e0 03             	shl    $0x3,%eax
 ead:	83 ec 0c             	sub    $0xc,%esp
 eb0:	50                   	push   %eax
 eb1:	e8 7b f5 ff ff       	call   431 <sbrk>
 eb6:	83 c4 10             	add    $0x10,%esp
 eb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 ebc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 ec0:	75 07                	jne    ec9 <morecore+0x38>
    return 0;
 ec2:	b8 00 00 00 00       	mov    $0x0,%eax
 ec7:	eb 26                	jmp    eef <morecore+0x5e>
  hp = (Header*)p;
 ec9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ecc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 ecf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ed2:	8b 55 08             	mov    0x8(%ebp),%edx
 ed5:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 ed8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 edb:	83 c0 08             	add    $0x8,%eax
 ede:	83 ec 0c             	sub    $0xc,%esp
 ee1:	50                   	push   %eax
 ee2:	e8 c8 fe ff ff       	call   daf <free>
 ee7:	83 c4 10             	add    $0x10,%esp
  return freep;
 eea:	a1 64 12 00 00       	mov    0x1264,%eax
}
 eef:	c9                   	leave  
 ef0:	c3                   	ret    

00000ef1 <malloc>:

void*
malloc(uint nbytes)
{
 ef1:	55                   	push   %ebp
 ef2:	89 e5                	mov    %esp,%ebp
 ef4:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ef7:	8b 45 08             	mov    0x8(%ebp),%eax
 efa:	83 c0 07             	add    $0x7,%eax
 efd:	c1 e8 03             	shr    $0x3,%eax
 f00:	83 c0 01             	add    $0x1,%eax
 f03:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 f06:	a1 64 12 00 00       	mov    0x1264,%eax
 f0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 f0e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 f12:	75 23                	jne    f37 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 f14:	c7 45 f0 5c 12 00 00 	movl   $0x125c,-0x10(%ebp)
 f1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 f1e:	a3 64 12 00 00       	mov    %eax,0x1264
 f23:	a1 64 12 00 00       	mov    0x1264,%eax
 f28:	a3 5c 12 00 00       	mov    %eax,0x125c
    base.s.size = 0;
 f2d:	c7 05 60 12 00 00 00 	movl   $0x0,0x1260
 f34:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 f37:	8b 45 f0             	mov    -0x10(%ebp),%eax
 f3a:	8b 00                	mov    (%eax),%eax
 f3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 f3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f42:	8b 40 04             	mov    0x4(%eax),%eax
 f45:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 f48:	72 4d                	jb     f97 <malloc+0xa6>
      if(p->s.size == nunits)
 f4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f4d:	8b 40 04             	mov    0x4(%eax),%eax
 f50:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 f53:	75 0c                	jne    f61 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 f55:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f58:	8b 10                	mov    (%eax),%edx
 f5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 f5d:	89 10                	mov    %edx,(%eax)
 f5f:	eb 26                	jmp    f87 <malloc+0x96>
      else {
        p->s.size -= nunits;
 f61:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f64:	8b 40 04             	mov    0x4(%eax),%eax
 f67:	2b 45 ec             	sub    -0x14(%ebp),%eax
 f6a:	89 c2                	mov    %eax,%edx
 f6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f6f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 f72:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f75:	8b 40 04             	mov    0x4(%eax),%eax
 f78:	c1 e0 03             	shl    $0x3,%eax
 f7b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 f7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f81:	8b 55 ec             	mov    -0x14(%ebp),%edx
 f84:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 f87:	8b 45 f0             	mov    -0x10(%ebp),%eax
 f8a:	a3 64 12 00 00       	mov    %eax,0x1264
      return (void*)(p + 1);
 f8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f92:	83 c0 08             	add    $0x8,%eax
 f95:	eb 3b                	jmp    fd2 <malloc+0xe1>
    }
    if(p == freep)
 f97:	a1 64 12 00 00       	mov    0x1264,%eax
 f9c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 f9f:	75 1e                	jne    fbf <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 fa1:	83 ec 0c             	sub    $0xc,%esp
 fa4:	ff 75 ec             	pushl  -0x14(%ebp)
 fa7:	e8 e5 fe ff ff       	call   e91 <morecore>
 fac:	83 c4 10             	add    $0x10,%esp
 faf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 fb2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 fb6:	75 07                	jne    fbf <malloc+0xce>
        return 0;
 fb8:	b8 00 00 00 00       	mov    $0x0,%eax
 fbd:	eb 13                	jmp    fd2 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 fbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 fc2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 fc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 fc8:	8b 00                	mov    (%eax),%eax
 fca:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 fcd:	e9 6d ff ff ff       	jmp    f3f <malloc+0x4e>
}
 fd2:	c9                   	leave  
 fd3:	c3                   	ret    
