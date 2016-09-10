
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 28             	sub    $0x28,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
       6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
       d:	8b 45 e8             	mov    -0x18(%ebp),%eax
      10:	89 45 ec             	mov    %eax,-0x14(%ebp)
      13:	8b 45 ec             	mov    -0x14(%ebp),%eax
      16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
      19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
      20:	eb 69                	jmp    8b <wc+0x8b>
    for(i=0; i<n; i++){
      22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      29:	eb 58                	jmp    83 <wc+0x83>
      c++;
      2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
      2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
      32:	05 20 13 00 00       	add    $0x1320,%eax
      37:	0f b6 00             	movzbl (%eax),%eax
      3a:	3c 0a                	cmp    $0xa,%al
      3c:	75 04                	jne    42 <wc+0x42>
        l++;
      3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
      42:	8b 45 f4             	mov    -0xc(%ebp),%eax
      45:	05 20 13 00 00       	add    $0x1320,%eax
      4a:	0f b6 00             	movzbl (%eax),%eax
      4d:	0f be c0             	movsbl %al,%eax
      50:	83 ec 08             	sub    $0x8,%esp
      53:	50                   	push   %eax
      54:	68 3f 10 00 00       	push   $0x103f
      59:	e8 35 02 00 00       	call   293 <strchr>
      5e:	83 c4 10             	add    $0x10,%esp
      61:	85 c0                	test   %eax,%eax
      63:	74 09                	je     6e <wc+0x6e>
        inword = 0;
      65:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      6c:	eb 11                	jmp    7f <wc+0x7f>
      else if(!inword){
      6e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
      72:	75 0b                	jne    7f <wc+0x7f>
        w++;
      74:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
      78:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      7f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      83:	8b 45 f4             	mov    -0xc(%ebp),%eax
      86:	3b 45 e0             	cmp    -0x20(%ebp),%eax
      89:	7c a0                	jl     2b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
      8b:	83 ec 04             	sub    $0x4,%esp
      8e:	68 00 02 00 00       	push   $0x200
      93:	68 20 13 00 00       	push   $0x1320
      98:	ff 75 08             	pushl  0x8(%ebp)
      9b:	e8 8c 03 00 00       	call   42c <read>
      a0:	83 c4 10             	add    $0x10,%esp
      a3:	89 45 e0             	mov    %eax,-0x20(%ebp)
      a6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
      aa:	0f 8f 72 ff ff ff    	jg     22 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
      b0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
      b4:	79 17                	jns    cd <wc+0xcd>
    printf(1, "wc: read error\n");
      b6:	83 ec 08             	sub    $0x8,%esp
      b9:	68 45 10 00 00       	push   $0x1045
      be:	6a 01                	push   $0x1
      c0:	e8 c4 0b 00 00       	call   c89 <printf>
      c5:	83 c4 10             	add    $0x10,%esp
    exit();
      c8:	e8 47 03 00 00       	call   414 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
      cd:	83 ec 08             	sub    $0x8,%esp
      d0:	ff 75 0c             	pushl  0xc(%ebp)
      d3:	ff 75 e8             	pushl  -0x18(%ebp)
      d6:	ff 75 ec             	pushl  -0x14(%ebp)
      d9:	ff 75 f0             	pushl  -0x10(%ebp)
      dc:	68 55 10 00 00       	push   $0x1055
      e1:	6a 01                	push   $0x1
      e3:	e8 a1 0b 00 00       	call   c89 <printf>
      e8:	83 c4 20             	add    $0x20,%esp
}
      eb:	90                   	nop
      ec:	c9                   	leave  
      ed:	c3                   	ret    

000000ee <main>:

int
main(int argc, char *argv[])
{
      ee:	8d 4c 24 04          	lea    0x4(%esp),%ecx
      f2:	83 e4 f0             	and    $0xfffffff0,%esp
      f5:	ff 71 fc             	pushl  -0x4(%ecx)
      f8:	55                   	push   %ebp
      f9:	89 e5                	mov    %esp,%ebp
      fb:	53                   	push   %ebx
      fc:	51                   	push   %ecx
      fd:	83 ec 10             	sub    $0x10,%esp
     100:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
     102:	83 3b 01             	cmpl   $0x1,(%ebx)
     105:	7f 17                	jg     11e <main+0x30>
    wc(0, "");
     107:	83 ec 08             	sub    $0x8,%esp
     10a:	68 62 10 00 00       	push   $0x1062
     10f:	6a 00                	push   $0x0
     111:	e8 ea fe ff ff       	call   0 <wc>
     116:	83 c4 10             	add    $0x10,%esp
    exit();
     119:	e8 f6 02 00 00       	call   414 <exit>
  }

  for(i = 1; i < argc; i++){
     11e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
     125:	e9 83 00 00 00       	jmp    1ad <main+0xbf>
    if((fd = open(argv[i], 0)) < 0){
     12a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     12d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     134:	8b 43 04             	mov    0x4(%ebx),%eax
     137:	01 d0                	add    %edx,%eax
     139:	8b 00                	mov    (%eax),%eax
     13b:	83 ec 08             	sub    $0x8,%esp
     13e:	6a 00                	push   $0x0
     140:	50                   	push   %eax
     141:	e8 0e 03 00 00       	call   454 <open>
     146:	83 c4 10             	add    $0x10,%esp
     149:	89 45 f0             	mov    %eax,-0x10(%ebp)
     14c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     150:	79 29                	jns    17b <main+0x8d>
      printf(1, "wc: cannot open %s\n", argv[i]);
     152:	8b 45 f4             	mov    -0xc(%ebp),%eax
     155:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     15c:	8b 43 04             	mov    0x4(%ebx),%eax
     15f:	01 d0                	add    %edx,%eax
     161:	8b 00                	mov    (%eax),%eax
     163:	83 ec 04             	sub    $0x4,%esp
     166:	50                   	push   %eax
     167:	68 63 10 00 00       	push   $0x1063
     16c:	6a 01                	push   $0x1
     16e:	e8 16 0b 00 00       	call   c89 <printf>
     173:	83 c4 10             	add    $0x10,%esp
      exit();
     176:	e8 99 02 00 00       	call   414 <exit>
    }
    wc(fd, argv[i]);
     17b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     17e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     185:	8b 43 04             	mov    0x4(%ebx),%eax
     188:	01 d0                	add    %edx,%eax
     18a:	8b 00                	mov    (%eax),%eax
     18c:	83 ec 08             	sub    $0x8,%esp
     18f:	50                   	push   %eax
     190:	ff 75 f0             	pushl  -0x10(%ebp)
     193:	e8 68 fe ff ff       	call   0 <wc>
     198:	83 c4 10             	add    $0x10,%esp
    close(fd);
     19b:	83 ec 0c             	sub    $0xc,%esp
     19e:	ff 75 f0             	pushl  -0x10(%ebp)
     1a1:	e8 96 02 00 00       	call   43c <close>
     1a6:	83 c4 10             	add    $0x10,%esp
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
     1a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     1ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1b0:	3b 03                	cmp    (%ebx),%eax
     1b2:	0f 8c 72 ff ff ff    	jl     12a <main+0x3c>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
     1b8:	e8 57 02 00 00       	call   414 <exit>

000001bd <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     1bd:	55                   	push   %ebp
     1be:	89 e5                	mov    %esp,%ebp
     1c0:	57                   	push   %edi
     1c1:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     1c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
     1c5:	8b 55 10             	mov    0x10(%ebp),%edx
     1c8:	8b 45 0c             	mov    0xc(%ebp),%eax
     1cb:	89 cb                	mov    %ecx,%ebx
     1cd:	89 df                	mov    %ebx,%edi
     1cf:	89 d1                	mov    %edx,%ecx
     1d1:	fc                   	cld    
     1d2:	f3 aa                	rep stos %al,%es:(%edi)
     1d4:	89 ca                	mov    %ecx,%edx
     1d6:	89 fb                	mov    %edi,%ebx
     1d8:	89 5d 08             	mov    %ebx,0x8(%ebp)
     1db:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     1de:	90                   	nop
     1df:	5b                   	pop    %ebx
     1e0:	5f                   	pop    %edi
     1e1:	5d                   	pop    %ebp
     1e2:	c3                   	ret    

000001e3 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     1e3:	55                   	push   %ebp
     1e4:	89 e5                	mov    %esp,%ebp
     1e6:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     1e9:	8b 45 08             	mov    0x8(%ebp),%eax
     1ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     1ef:	90                   	nop
     1f0:	8b 45 08             	mov    0x8(%ebp),%eax
     1f3:	8d 50 01             	lea    0x1(%eax),%edx
     1f6:	89 55 08             	mov    %edx,0x8(%ebp)
     1f9:	8b 55 0c             	mov    0xc(%ebp),%edx
     1fc:	8d 4a 01             	lea    0x1(%edx),%ecx
     1ff:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     202:	0f b6 12             	movzbl (%edx),%edx
     205:	88 10                	mov    %dl,(%eax)
     207:	0f b6 00             	movzbl (%eax),%eax
     20a:	84 c0                	test   %al,%al
     20c:	75 e2                	jne    1f0 <strcpy+0xd>
    ;
  return os;
     20e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     211:	c9                   	leave  
     212:	c3                   	ret    

00000213 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     213:	55                   	push   %ebp
     214:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     216:	eb 08                	jmp    220 <strcmp+0xd>
    p++, q++;
     218:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     21c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     220:	8b 45 08             	mov    0x8(%ebp),%eax
     223:	0f b6 00             	movzbl (%eax),%eax
     226:	84 c0                	test   %al,%al
     228:	74 10                	je     23a <strcmp+0x27>
     22a:	8b 45 08             	mov    0x8(%ebp),%eax
     22d:	0f b6 10             	movzbl (%eax),%edx
     230:	8b 45 0c             	mov    0xc(%ebp),%eax
     233:	0f b6 00             	movzbl (%eax),%eax
     236:	38 c2                	cmp    %al,%dl
     238:	74 de                	je     218 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     23a:	8b 45 08             	mov    0x8(%ebp),%eax
     23d:	0f b6 00             	movzbl (%eax),%eax
     240:	0f b6 d0             	movzbl %al,%edx
     243:	8b 45 0c             	mov    0xc(%ebp),%eax
     246:	0f b6 00             	movzbl (%eax),%eax
     249:	0f b6 c0             	movzbl %al,%eax
     24c:	29 c2                	sub    %eax,%edx
     24e:	89 d0                	mov    %edx,%eax
}
     250:	5d                   	pop    %ebp
     251:	c3                   	ret    

00000252 <strlen>:

uint
strlen(char *s)
{
     252:	55                   	push   %ebp
     253:	89 e5                	mov    %esp,%ebp
     255:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     258:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     25f:	eb 04                	jmp    265 <strlen+0x13>
     261:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     265:	8b 55 fc             	mov    -0x4(%ebp),%edx
     268:	8b 45 08             	mov    0x8(%ebp),%eax
     26b:	01 d0                	add    %edx,%eax
     26d:	0f b6 00             	movzbl (%eax),%eax
     270:	84 c0                	test   %al,%al
     272:	75 ed                	jne    261 <strlen+0xf>
    ;
  return n;
     274:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     277:	c9                   	leave  
     278:	c3                   	ret    

00000279 <memset>:

void*
memset(void *dst, int c, uint n)
{
     279:	55                   	push   %ebp
     27a:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     27c:	8b 45 10             	mov    0x10(%ebp),%eax
     27f:	50                   	push   %eax
     280:	ff 75 0c             	pushl  0xc(%ebp)
     283:	ff 75 08             	pushl  0x8(%ebp)
     286:	e8 32 ff ff ff       	call   1bd <stosb>
     28b:	83 c4 0c             	add    $0xc,%esp
  return dst;
     28e:	8b 45 08             	mov    0x8(%ebp),%eax
}
     291:	c9                   	leave  
     292:	c3                   	ret    

00000293 <strchr>:

char*
strchr(const char *s, char c)
{
     293:	55                   	push   %ebp
     294:	89 e5                	mov    %esp,%ebp
     296:	83 ec 04             	sub    $0x4,%esp
     299:	8b 45 0c             	mov    0xc(%ebp),%eax
     29c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     29f:	eb 14                	jmp    2b5 <strchr+0x22>
    if(*s == c)
     2a1:	8b 45 08             	mov    0x8(%ebp),%eax
     2a4:	0f b6 00             	movzbl (%eax),%eax
     2a7:	3a 45 fc             	cmp    -0x4(%ebp),%al
     2aa:	75 05                	jne    2b1 <strchr+0x1e>
      return (char*)s;
     2ac:	8b 45 08             	mov    0x8(%ebp),%eax
     2af:	eb 13                	jmp    2c4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     2b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     2b5:	8b 45 08             	mov    0x8(%ebp),%eax
     2b8:	0f b6 00             	movzbl (%eax),%eax
     2bb:	84 c0                	test   %al,%al
     2bd:	75 e2                	jne    2a1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     2bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
     2c4:	c9                   	leave  
     2c5:	c3                   	ret    

000002c6 <gets>:

char*
gets(char *buf, int max)
{
     2c6:	55                   	push   %ebp
     2c7:	89 e5                	mov    %esp,%ebp
     2c9:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     2d3:	eb 42                	jmp    317 <gets+0x51>
    cc = read(0, &c, 1);
     2d5:	83 ec 04             	sub    $0x4,%esp
     2d8:	6a 01                	push   $0x1
     2da:	8d 45 ef             	lea    -0x11(%ebp),%eax
     2dd:	50                   	push   %eax
     2de:	6a 00                	push   $0x0
     2e0:	e8 47 01 00 00       	call   42c <read>
     2e5:	83 c4 10             	add    $0x10,%esp
     2e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     2eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     2ef:	7e 33                	jle    324 <gets+0x5e>
      break;
    buf[i++] = c;
     2f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     2f4:	8d 50 01             	lea    0x1(%eax),%edx
     2f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
     2fa:	89 c2                	mov    %eax,%edx
     2fc:	8b 45 08             	mov    0x8(%ebp),%eax
     2ff:	01 c2                	add    %eax,%edx
     301:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     305:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     307:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     30b:	3c 0a                	cmp    $0xa,%al
     30d:	74 16                	je     325 <gets+0x5f>
     30f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     313:	3c 0d                	cmp    $0xd,%al
     315:	74 0e                	je     325 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     317:	8b 45 f4             	mov    -0xc(%ebp),%eax
     31a:	83 c0 01             	add    $0x1,%eax
     31d:	3b 45 0c             	cmp    0xc(%ebp),%eax
     320:	7c b3                	jl     2d5 <gets+0xf>
     322:	eb 01                	jmp    325 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     324:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     325:	8b 55 f4             	mov    -0xc(%ebp),%edx
     328:	8b 45 08             	mov    0x8(%ebp),%eax
     32b:	01 d0                	add    %edx,%eax
     32d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     330:	8b 45 08             	mov    0x8(%ebp),%eax
}
     333:	c9                   	leave  
     334:	c3                   	ret    

00000335 <stat>:

int
stat(char *n, struct stat *st)
{
     335:	55                   	push   %ebp
     336:	89 e5                	mov    %esp,%ebp
     338:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     33b:	83 ec 08             	sub    $0x8,%esp
     33e:	6a 00                	push   $0x0
     340:	ff 75 08             	pushl  0x8(%ebp)
     343:	e8 0c 01 00 00       	call   454 <open>
     348:	83 c4 10             	add    $0x10,%esp
     34b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     34e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     352:	79 07                	jns    35b <stat+0x26>
    return -1;
     354:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     359:	eb 25                	jmp    380 <stat+0x4b>
  r = fstat(fd, st);
     35b:	83 ec 08             	sub    $0x8,%esp
     35e:	ff 75 0c             	pushl  0xc(%ebp)
     361:	ff 75 f4             	pushl  -0xc(%ebp)
     364:	e8 03 01 00 00       	call   46c <fstat>
     369:	83 c4 10             	add    $0x10,%esp
     36c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     36f:	83 ec 0c             	sub    $0xc,%esp
     372:	ff 75 f4             	pushl  -0xc(%ebp)
     375:	e8 c2 00 00 00       	call   43c <close>
     37a:	83 c4 10             	add    $0x10,%esp
  return r;
     37d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     380:	c9                   	leave  
     381:	c3                   	ret    

00000382 <atoi>:

int
atoi(const char *s)
{
     382:	55                   	push   %ebp
     383:	89 e5                	mov    %esp,%ebp
     385:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     388:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     38f:	eb 25                	jmp    3b6 <atoi+0x34>
    n = n*10 + *s++ - '0';
     391:	8b 55 fc             	mov    -0x4(%ebp),%edx
     394:	89 d0                	mov    %edx,%eax
     396:	c1 e0 02             	shl    $0x2,%eax
     399:	01 d0                	add    %edx,%eax
     39b:	01 c0                	add    %eax,%eax
     39d:	89 c1                	mov    %eax,%ecx
     39f:	8b 45 08             	mov    0x8(%ebp),%eax
     3a2:	8d 50 01             	lea    0x1(%eax),%edx
     3a5:	89 55 08             	mov    %edx,0x8(%ebp)
     3a8:	0f b6 00             	movzbl (%eax),%eax
     3ab:	0f be c0             	movsbl %al,%eax
     3ae:	01 c8                	add    %ecx,%eax
     3b0:	83 e8 30             	sub    $0x30,%eax
     3b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     3b6:	8b 45 08             	mov    0x8(%ebp),%eax
     3b9:	0f b6 00             	movzbl (%eax),%eax
     3bc:	3c 2f                	cmp    $0x2f,%al
     3be:	7e 0a                	jle    3ca <atoi+0x48>
     3c0:	8b 45 08             	mov    0x8(%ebp),%eax
     3c3:	0f b6 00             	movzbl (%eax),%eax
     3c6:	3c 39                	cmp    $0x39,%al
     3c8:	7e c7                	jle    391 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     3ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     3cd:	c9                   	leave  
     3ce:	c3                   	ret    

000003cf <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     3cf:	55                   	push   %ebp
     3d0:	89 e5                	mov    %esp,%ebp
     3d2:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     3d5:	8b 45 08             	mov    0x8(%ebp),%eax
     3d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     3db:	8b 45 0c             	mov    0xc(%ebp),%eax
     3de:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     3e1:	eb 17                	jmp    3fa <memmove+0x2b>
    *dst++ = *src++;
     3e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
     3e6:	8d 50 01             	lea    0x1(%eax),%edx
     3e9:	89 55 fc             	mov    %edx,-0x4(%ebp)
     3ec:	8b 55 f8             	mov    -0x8(%ebp),%edx
     3ef:	8d 4a 01             	lea    0x1(%edx),%ecx
     3f2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     3f5:	0f b6 12             	movzbl (%edx),%edx
     3f8:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     3fa:	8b 45 10             	mov    0x10(%ebp),%eax
     3fd:	8d 50 ff             	lea    -0x1(%eax),%edx
     400:	89 55 10             	mov    %edx,0x10(%ebp)
     403:	85 c0                	test   %eax,%eax
     405:	7f dc                	jg     3e3 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     407:	8b 45 08             	mov    0x8(%ebp),%eax
}
     40a:	c9                   	leave  
     40b:	c3                   	ret    

0000040c <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
     40c:	b8 01 00 00 00       	mov    $0x1,%eax
     411:	cd 40                	int    $0x40
     413:	c3                   	ret    

00000414 <exit>:
SYSCALL(exit)
     414:	b8 02 00 00 00       	mov    $0x2,%eax
     419:	cd 40                	int    $0x40
     41b:	c3                   	ret    

0000041c <wait>:
SYSCALL(wait)
     41c:	b8 03 00 00 00       	mov    $0x3,%eax
     421:	cd 40                	int    $0x40
     423:	c3                   	ret    

00000424 <pipe>:
SYSCALL(pipe)
     424:	b8 04 00 00 00       	mov    $0x4,%eax
     429:	cd 40                	int    $0x40
     42b:	c3                   	ret    

0000042c <read>:
SYSCALL(read)
     42c:	b8 05 00 00 00       	mov    $0x5,%eax
     431:	cd 40                	int    $0x40
     433:	c3                   	ret    

00000434 <write>:
SYSCALL(write)
     434:	b8 10 00 00 00       	mov    $0x10,%eax
     439:	cd 40                	int    $0x40
     43b:	c3                   	ret    

0000043c <close>:
SYSCALL(close)
     43c:	b8 15 00 00 00       	mov    $0x15,%eax
     441:	cd 40                	int    $0x40
     443:	c3                   	ret    

00000444 <kill>:
SYSCALL(kill)
     444:	b8 06 00 00 00       	mov    $0x6,%eax
     449:	cd 40                	int    $0x40
     44b:	c3                   	ret    

0000044c <exec>:
SYSCALL(exec)
     44c:	b8 07 00 00 00       	mov    $0x7,%eax
     451:	cd 40                	int    $0x40
     453:	c3                   	ret    

00000454 <open>:
SYSCALL(open)
     454:	b8 0f 00 00 00       	mov    $0xf,%eax
     459:	cd 40                	int    $0x40
     45b:	c3                   	ret    

0000045c <mknod>:
SYSCALL(mknod)
     45c:	b8 11 00 00 00       	mov    $0x11,%eax
     461:	cd 40                	int    $0x40
     463:	c3                   	ret    

00000464 <unlink>:
SYSCALL(unlink)
     464:	b8 12 00 00 00       	mov    $0x12,%eax
     469:	cd 40                	int    $0x40
     46b:	c3                   	ret    

0000046c <fstat>:
SYSCALL(fstat)
     46c:	b8 08 00 00 00       	mov    $0x8,%eax
     471:	cd 40                	int    $0x40
     473:	c3                   	ret    

00000474 <link>:
SYSCALL(link)
     474:	b8 13 00 00 00       	mov    $0x13,%eax
     479:	cd 40                	int    $0x40
     47b:	c3                   	ret    

0000047c <mkdir>:
SYSCALL(mkdir)
     47c:	b8 14 00 00 00       	mov    $0x14,%eax
     481:	cd 40                	int    $0x40
     483:	c3                   	ret    

00000484 <chdir>:
SYSCALL(chdir)
     484:	b8 09 00 00 00       	mov    $0x9,%eax
     489:	cd 40                	int    $0x40
     48b:	c3                   	ret    

0000048c <dup>:
SYSCALL(dup)
     48c:	b8 0a 00 00 00       	mov    $0xa,%eax
     491:	cd 40                	int    $0x40
     493:	c3                   	ret    

00000494 <getpid>:
SYSCALL(getpid)
     494:	b8 0b 00 00 00       	mov    $0xb,%eax
     499:	cd 40                	int    $0x40
     49b:	c3                   	ret    

0000049c <sbrk>:
SYSCALL(sbrk)
     49c:	b8 0c 00 00 00       	mov    $0xc,%eax
     4a1:	cd 40                	int    $0x40
     4a3:	c3                   	ret    

000004a4 <sleep>:
SYSCALL(sleep)
     4a4:	b8 0d 00 00 00       	mov    $0xd,%eax
     4a9:	cd 40                	int    $0x40
     4ab:	c3                   	ret    

000004ac <uptime>:
SYSCALL(uptime)
     4ac:	b8 0e 00 00 00       	mov    $0xe,%eax
     4b1:	cd 40                	int    $0x40
     4b3:	c3                   	ret    

000004b4 <date>:

// Assignment starts here

SYSCALL(date)
     4b4:	b8 16 00 00 00       	mov    $0x16,%eax
     4b9:	cd 40                	int    $0x40
     4bb:	c3                   	ret    

000004bc <str_ls_call1>:
     4bc:	6c                   	insb   (%dx),%es:(%edi)
     4bd:	73 5f                	jae    51e <ls_call6+0x4>
     4bf:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     4c2:	6c                   	insb   (%dx),%es:(%edi)
     4c3:	31 00                	xor    %eax,(%eax)

000004c5 <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
     4c5:	b8 bc 04 00 00       	mov    $0x4bc,%eax
     4ca:	cd 41                	int    $0x41
     4cc:	c3                   	ret    

000004cd <str_ls_call2>:
     4cd:	6c                   	insb   (%dx),%es:(%edi)
     4ce:	73 5f                	jae    52f <ls_call7+0x4>
     4d0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     4d3:	6c                   	insb   (%dx),%es:(%edi)
     4d4:	32 00                	xor    (%eax),%al

000004d6 <ls_call2>:
CS550LSSYSCALL(ls_call2)
     4d6:	b8 cd 04 00 00       	mov    $0x4cd,%eax
     4db:	cd 41                	int    $0x41
     4dd:	c3                   	ret    

000004de <str_ls_call3>:
     4de:	6c                   	insb   (%dx),%es:(%edi)
     4df:	73 5f                	jae    540 <ls_call8+0x4>
     4e1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     4e4:	6c                   	insb   (%dx),%es:(%edi)
     4e5:	33 00                	xor    (%eax),%eax

000004e7 <ls_call3>:
CS550LSSYSCALL(ls_call3)
     4e7:	b8 de 04 00 00       	mov    $0x4de,%eax
     4ec:	cd 41                	int    $0x41
     4ee:	c3                   	ret    

000004ef <str_ls_call4>:
     4ef:	6c                   	insb   (%dx),%es:(%edi)
     4f0:	73 5f                	jae    551 <ls_call9+0x4>
     4f2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     4f5:	6c                   	insb   (%dx),%es:(%edi)
     4f6:	34 00                	xor    $0x0,%al

000004f8 <ls_call4>:
CS550LSSYSCALL(ls_call4)
     4f8:	b8 ef 04 00 00       	mov    $0x4ef,%eax
     4fd:	cd 41                	int    $0x41
     4ff:	c3                   	ret    

00000500 <str_ls_call5>:
     500:	6c                   	insb   (%dx),%es:(%edi)
     501:	73 5f                	jae    562 <ls_call10+0x3>
     503:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     506:	6c                   	insb   (%dx),%es:(%edi)
     507:	35                   	.byte 0x35
	...

00000509 <ls_call5>:
CS550LSSYSCALL(ls_call5)
     509:	b8 00 05 00 00       	mov    $0x500,%eax
     50e:	cd 41                	int    $0x41
     510:	c3                   	ret    

00000511 <str_ls_call6>:
     511:	6c                   	insb   (%dx),%es:(%edi)
     512:	73 5f                	jae    573 <ls_call11+0x2>
     514:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     517:	6c                   	insb   (%dx),%es:(%edi)
     518:	36                   	ss
	...

0000051a <ls_call6>:
CS550LSSYSCALL(ls_call6)
     51a:	b8 11 05 00 00       	mov    $0x511,%eax
     51f:	cd 41                	int    $0x41
     521:	c3                   	ret    

00000522 <str_ls_call7>:
     522:	6c                   	insb   (%dx),%es:(%edi)
     523:	73 5f                	jae    584 <ls_call12+0x1>
     525:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     528:	6c                   	insb   (%dx),%es:(%edi)
     529:	37                   	aaa    
	...

0000052b <ls_call7>:
CS550LSSYSCALL(ls_call7)
     52b:	b8 22 05 00 00       	mov    $0x522,%eax
     530:	cd 41                	int    $0x41
     532:	c3                   	ret    

00000533 <str_ls_call8>:
     533:	6c                   	insb   (%dx),%es:(%edi)
     534:	73 5f                	jae    595 <ls_call13>
     536:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     539:	6c                   	insb   (%dx),%es:(%edi)
     53a:	38 00                	cmp    %al,(%eax)

0000053c <ls_call8>:
CS550LSSYSCALL(ls_call8)
     53c:	b8 33 05 00 00       	mov    $0x533,%eax
     541:	cd 41                	int    $0x41
     543:	c3                   	ret    

00000544 <str_ls_call9>:
     544:	6c                   	insb   (%dx),%es:(%edi)
     545:	73 5f                	jae    5a6 <str_ls_call14+0x9>
     547:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     54a:	6c                   	insb   (%dx),%es:(%edi)
     54b:	39 00                	cmp    %eax,(%eax)

0000054d <ls_call9>:
CS550LSSYSCALL(ls_call9)
     54d:	b8 44 05 00 00       	mov    $0x544,%eax
     552:	cd 41                	int    $0x41
     554:	c3                   	ret    

00000555 <str_ls_call10>:
     555:	6c                   	insb   (%dx),%es:(%edi)
     556:	73 5f                	jae    5b7 <str_ls_call15+0x8>
     558:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     55b:	6c                   	insb   (%dx),%es:(%edi)
     55c:	31 30                	xor    %esi,(%eax)
	...

0000055f <ls_call10>:
CS550LSSYSCALL(ls_call10)
     55f:	b8 55 05 00 00       	mov    $0x555,%eax
     564:	cd 41                	int    $0x41
     566:	c3                   	ret    

00000567 <str_ls_call11>:
     567:	6c                   	insb   (%dx),%es:(%edi)
     568:	73 5f                	jae    5c9 <str_ls_call16+0x8>
     56a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     56d:	6c                   	insb   (%dx),%es:(%edi)
     56e:	31 31                	xor    %esi,(%ecx)
	...

00000571 <ls_call11>:
CS550LSSYSCALL(ls_call11)
     571:	b8 67 05 00 00       	mov    $0x567,%eax
     576:	cd 41                	int    $0x41
     578:	c3                   	ret    

00000579 <str_ls_call12>:
     579:	6c                   	insb   (%dx),%es:(%edi)
     57a:	73 5f                	jae    5db <str_ls_call17+0x8>
     57c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     57f:	6c                   	insb   (%dx),%es:(%edi)
     580:	31 32                	xor    %esi,(%edx)
	...

00000583 <ls_call12>:
CS550LSSYSCALL(ls_call12)
     583:	b8 79 05 00 00       	mov    $0x579,%eax
     588:	cd 41                	int    $0x41
     58a:	c3                   	ret    

0000058b <str_ls_call13>:
     58b:	6c                   	insb   (%dx),%es:(%edi)
     58c:	73 5f                	jae    5ed <str_ls_call18+0x8>
     58e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     591:	6c                   	insb   (%dx),%es:(%edi)
     592:	31 33                	xor    %esi,(%ebx)
	...

00000595 <ls_call13>:
CS550LSSYSCALL(ls_call13)
     595:	b8 8b 05 00 00       	mov    $0x58b,%eax
     59a:	cd 41                	int    $0x41
     59c:	c3                   	ret    

0000059d <str_ls_call14>:
     59d:	6c                   	insb   (%dx),%es:(%edi)
     59e:	73 5f                	jae    5ff <str_ls_call19+0x8>
     5a0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5a3:	6c                   	insb   (%dx),%es:(%edi)
     5a4:	31 34 00             	xor    %esi,(%eax,%eax,1)

000005a7 <ls_call14>:
CS550LSSYSCALL(ls_call14)
     5a7:	b8 9d 05 00 00       	mov    $0x59d,%eax
     5ac:	cd 41                	int    $0x41
     5ae:	c3                   	ret    

000005af <str_ls_call15>:
     5af:	6c                   	insb   (%dx),%es:(%edi)
     5b0:	73 5f                	jae    611 <str_ls_call20+0x8>
     5b2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5b5:	6c                   	insb   (%dx),%es:(%edi)
     5b6:	31                   	.byte 0x31
     5b7:	35                   	.byte 0x35
	...

000005b9 <ls_call15>:
CS550LSSYSCALL(ls_call15)
     5b9:	b8 af 05 00 00       	mov    $0x5af,%eax
     5be:	cd 41                	int    $0x41
     5c0:	c3                   	ret    

000005c1 <str_ls_call16>:
     5c1:	6c                   	insb   (%dx),%es:(%edi)
     5c2:	73 5f                	jae    623 <str_ls_call21+0x8>
     5c4:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5c7:	6c                   	insb   (%dx),%es:(%edi)
     5c8:	31 36                	xor    %esi,(%esi)
	...

000005cb <ls_call16>:
CS550LSSYSCALL(ls_call16)
     5cb:	b8 c1 05 00 00       	mov    $0x5c1,%eax
     5d0:	cd 41                	int    $0x41
     5d2:	c3                   	ret    

000005d3 <str_ls_call17>:
     5d3:	6c                   	insb   (%dx),%es:(%edi)
     5d4:	73 5f                	jae    635 <str_ls_call22+0x8>
     5d6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5d9:	6c                   	insb   (%dx),%es:(%edi)
     5da:	31 37                	xor    %esi,(%edi)
	...

000005dd <ls_call17>:
CS550LSSYSCALL(ls_call17)
     5dd:	b8 d3 05 00 00       	mov    $0x5d3,%eax
     5e2:	cd 41                	int    $0x41
     5e4:	c3                   	ret    

000005e5 <str_ls_call18>:
     5e5:	6c                   	insb   (%dx),%es:(%edi)
     5e6:	73 5f                	jae    647 <str_ls_call23+0x8>
     5e8:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5eb:	6c                   	insb   (%dx),%es:(%edi)
     5ec:	31 38                	xor    %edi,(%eax)
	...

000005ef <ls_call18>:
CS550LSSYSCALL(ls_call18)
     5ef:	b8 e5 05 00 00       	mov    $0x5e5,%eax
     5f4:	cd 41                	int    $0x41
     5f6:	c3                   	ret    

000005f7 <str_ls_call19>:
     5f7:	6c                   	insb   (%dx),%es:(%edi)
     5f8:	73 5f                	jae    659 <str_ls_call24+0x8>
     5fa:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     5fd:	6c                   	insb   (%dx),%es:(%edi)
     5fe:	31 39                	xor    %edi,(%ecx)
	...

00000601 <ls_call19>:
CS550LSSYSCALL(ls_call19)
     601:	b8 f7 05 00 00       	mov    $0x5f7,%eax
     606:	cd 41                	int    $0x41
     608:	c3                   	ret    

00000609 <str_ls_call20>:
     609:	6c                   	insb   (%dx),%es:(%edi)
     60a:	73 5f                	jae    66b <str_ls_call25+0x8>
     60c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     60f:	6c                   	insb   (%dx),%es:(%edi)
     610:	32 30                	xor    (%eax),%dh
	...

00000613 <ls_call20>:
CS550LSSYSCALL(ls_call20)
     613:	b8 09 06 00 00       	mov    $0x609,%eax
     618:	cd 41                	int    $0x41
     61a:	c3                   	ret    

0000061b <str_ls_call21>:
     61b:	6c                   	insb   (%dx),%es:(%edi)
     61c:	73 5f                	jae    67d <str_ls_call26+0x8>
     61e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     621:	6c                   	insb   (%dx),%es:(%edi)
     622:	32 31                	xor    (%ecx),%dh
	...

00000625 <ls_call21>:
CS550LSSYSCALL(ls_call21)
     625:	b8 1b 06 00 00       	mov    $0x61b,%eax
     62a:	cd 41                	int    $0x41
     62c:	c3                   	ret    

0000062d <str_ls_call22>:
     62d:	6c                   	insb   (%dx),%es:(%edi)
     62e:	73 5f                	jae    68f <str_ls_call27+0x8>
     630:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     633:	6c                   	insb   (%dx),%es:(%edi)
     634:	32 32                	xor    (%edx),%dh
	...

00000637 <ls_call22>:
CS550LSSYSCALL(ls_call22)
     637:	b8 2d 06 00 00       	mov    $0x62d,%eax
     63c:	cd 41                	int    $0x41
     63e:	c3                   	ret    

0000063f <str_ls_call23>:
     63f:	6c                   	insb   (%dx),%es:(%edi)
     640:	73 5f                	jae    6a1 <str_ls_call28+0x8>
     642:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     645:	6c                   	insb   (%dx),%es:(%edi)
     646:	32 33                	xor    (%ebx),%dh
	...

00000649 <ls_call23>:
CS550LSSYSCALL(ls_call23)
     649:	b8 3f 06 00 00       	mov    $0x63f,%eax
     64e:	cd 41                	int    $0x41
     650:	c3                   	ret    

00000651 <str_ls_call24>:
     651:	6c                   	insb   (%dx),%es:(%edi)
     652:	73 5f                	jae    6b3 <str_ls_call29+0x8>
     654:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     657:	6c                   	insb   (%dx),%es:(%edi)
     658:	32 34 00             	xor    (%eax,%eax,1),%dh

0000065b <ls_call24>:
CS550LSSYSCALL(ls_call24)
     65b:	b8 51 06 00 00       	mov    $0x651,%eax
     660:	cd 41                	int    $0x41
     662:	c3                   	ret    

00000663 <str_ls_call25>:
     663:	6c                   	insb   (%dx),%es:(%edi)
     664:	73 5f                	jae    6c5 <str_ls_call30+0x8>
     666:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     669:	6c                   	insb   (%dx),%es:(%edi)
     66a:	32                   	.byte 0x32
     66b:	35                   	.byte 0x35
	...

0000066d <ls_call25>:
CS550LSSYSCALL(ls_call25)
     66d:	b8 63 06 00 00       	mov    $0x663,%eax
     672:	cd 41                	int    $0x41
     674:	c3                   	ret    

00000675 <str_ls_call26>:
     675:	6c                   	insb   (%dx),%es:(%edi)
     676:	73 5f                	jae    6d7 <str_ls_call31+0x8>
     678:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     67b:	6c                   	insb   (%dx),%es:(%edi)
     67c:	32 36                	xor    (%esi),%dh
	...

0000067f <ls_call26>:
CS550LSSYSCALL(ls_call26)
     67f:	b8 75 06 00 00       	mov    $0x675,%eax
     684:	cd 41                	int    $0x41
     686:	c3                   	ret    

00000687 <str_ls_call27>:
     687:	6c                   	insb   (%dx),%es:(%edi)
     688:	73 5f                	jae    6e9 <str_ls_call32+0x8>
     68a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     68d:	6c                   	insb   (%dx),%es:(%edi)
     68e:	32 37                	xor    (%edi),%dh
	...

00000691 <ls_call27>:
CS550LSSYSCALL(ls_call27)
     691:	b8 87 06 00 00       	mov    $0x687,%eax
     696:	cd 41                	int    $0x41
     698:	c3                   	ret    

00000699 <str_ls_call28>:
     699:	6c                   	insb   (%dx),%es:(%edi)
     69a:	73 5f                	jae    6fb <str_ls_call33+0x8>
     69c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     69f:	6c                   	insb   (%dx),%es:(%edi)
     6a0:	32 38                	xor    (%eax),%bh
	...

000006a3 <ls_call28>:
CS550LSSYSCALL(ls_call28)
     6a3:	b8 99 06 00 00       	mov    $0x699,%eax
     6a8:	cd 41                	int    $0x41
     6aa:	c3                   	ret    

000006ab <str_ls_call29>:
     6ab:	6c                   	insb   (%dx),%es:(%edi)
     6ac:	73 5f                	jae    70d <str_ls_call34+0x8>
     6ae:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6b1:	6c                   	insb   (%dx),%es:(%edi)
     6b2:	32 39                	xor    (%ecx),%bh
	...

000006b5 <ls_call29>:
CS550LSSYSCALL(ls_call29)
     6b5:	b8 ab 06 00 00       	mov    $0x6ab,%eax
     6ba:	cd 41                	int    $0x41
     6bc:	c3                   	ret    

000006bd <str_ls_call30>:
     6bd:	6c                   	insb   (%dx),%es:(%edi)
     6be:	73 5f                	jae    71f <str_ls_call35+0x8>
     6c0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6c3:	6c                   	insb   (%dx),%es:(%edi)
     6c4:	33 30                	xor    (%eax),%esi
	...

000006c7 <ls_call30>:
CS550LSSYSCALL(ls_call30)
     6c7:	b8 bd 06 00 00       	mov    $0x6bd,%eax
     6cc:	cd 41                	int    $0x41
     6ce:	c3                   	ret    

000006cf <str_ls_call31>:
     6cf:	6c                   	insb   (%dx),%es:(%edi)
     6d0:	73 5f                	jae    731 <str_ls_call36+0x8>
     6d2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6d5:	6c                   	insb   (%dx),%es:(%edi)
     6d6:	33 31                	xor    (%ecx),%esi
	...

000006d9 <ls_call31>:
CS550LSSYSCALL(ls_call31)
     6d9:	b8 cf 06 00 00       	mov    $0x6cf,%eax
     6de:	cd 41                	int    $0x41
     6e0:	c3                   	ret    

000006e1 <str_ls_call32>:
     6e1:	6c                   	insb   (%dx),%es:(%edi)
     6e2:	73 5f                	jae    743 <str_ls_call37+0x8>
     6e4:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6e7:	6c                   	insb   (%dx),%es:(%edi)
     6e8:	33 32                	xor    (%edx),%esi
	...

000006eb <ls_call32>:
CS550LSSYSCALL(ls_call32)
     6eb:	b8 e1 06 00 00       	mov    $0x6e1,%eax
     6f0:	cd 41                	int    $0x41
     6f2:	c3                   	ret    

000006f3 <str_ls_call33>:
     6f3:	6c                   	insb   (%dx),%es:(%edi)
     6f4:	73 5f                	jae    755 <str_ls_call38+0x8>
     6f6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6f9:	6c                   	insb   (%dx),%es:(%edi)
     6fa:	33 33                	xor    (%ebx),%esi
	...

000006fd <ls_call33>:
CS550LSSYSCALL(ls_call33)
     6fd:	b8 f3 06 00 00       	mov    $0x6f3,%eax
     702:	cd 41                	int    $0x41
     704:	c3                   	ret    

00000705 <str_ls_call34>:
     705:	6c                   	insb   (%dx),%es:(%edi)
     706:	73 5f                	jae    767 <str_ls_call39+0x8>
     708:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     70b:	6c                   	insb   (%dx),%es:(%edi)
     70c:	33 34 00             	xor    (%eax,%eax,1),%esi

0000070f <ls_call34>:
CS550LSSYSCALL(ls_call34)
     70f:	b8 05 07 00 00       	mov    $0x705,%eax
     714:	cd 41                	int    $0x41
     716:	c3                   	ret    

00000717 <str_ls_call35>:
     717:	6c                   	insb   (%dx),%es:(%edi)
     718:	73 5f                	jae    779 <str_ls_call40+0x8>
     71a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     71d:	6c                   	insb   (%dx),%es:(%edi)
     71e:	33                   	.byte 0x33
     71f:	35                   	.byte 0x35
	...

00000721 <ls_call35>:
CS550LSSYSCALL(ls_call35)
     721:	b8 17 07 00 00       	mov    $0x717,%eax
     726:	cd 41                	int    $0x41
     728:	c3                   	ret    

00000729 <str_ls_call36>:
     729:	6c                   	insb   (%dx),%es:(%edi)
     72a:	73 5f                	jae    78b <str_ls_call41+0x8>
     72c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     72f:	6c                   	insb   (%dx),%es:(%edi)
     730:	33 36                	xor    (%esi),%esi
	...

00000733 <ls_call36>:
CS550LSSYSCALL(ls_call36)
     733:	b8 29 07 00 00       	mov    $0x729,%eax
     738:	cd 41                	int    $0x41
     73a:	c3                   	ret    

0000073b <str_ls_call37>:
     73b:	6c                   	insb   (%dx),%es:(%edi)
     73c:	73 5f                	jae    79d <str_ls_call42+0x8>
     73e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     741:	6c                   	insb   (%dx),%es:(%edi)
     742:	33 37                	xor    (%edi),%esi
	...

00000745 <ls_call37>:
CS550LSSYSCALL(ls_call37)
     745:	b8 3b 07 00 00       	mov    $0x73b,%eax
     74a:	cd 41                	int    $0x41
     74c:	c3                   	ret    

0000074d <str_ls_call38>:
     74d:	6c                   	insb   (%dx),%es:(%edi)
     74e:	73 5f                	jae    7af <str_ls_call43+0x8>
     750:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     753:	6c                   	insb   (%dx),%es:(%edi)
     754:	33 38                	xor    (%eax),%edi
	...

00000757 <ls_call38>:
CS550LSSYSCALL(ls_call38)
     757:	b8 4d 07 00 00       	mov    $0x74d,%eax
     75c:	cd 41                	int    $0x41
     75e:	c3                   	ret    

0000075f <str_ls_call39>:
     75f:	6c                   	insb   (%dx),%es:(%edi)
     760:	73 5f                	jae    7c1 <str_ls_call44+0x8>
     762:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     765:	6c                   	insb   (%dx),%es:(%edi)
     766:	33 39                	xor    (%ecx),%edi
	...

00000769 <ls_call39>:
CS550LSSYSCALL(ls_call39)
     769:	b8 5f 07 00 00       	mov    $0x75f,%eax
     76e:	cd 41                	int    $0x41
     770:	c3                   	ret    

00000771 <str_ls_call40>:
     771:	6c                   	insb   (%dx),%es:(%edi)
     772:	73 5f                	jae    7d3 <str_ls_call45+0x8>
     774:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     777:	6c                   	insb   (%dx),%es:(%edi)
     778:	34 30                	xor    $0x30,%al
	...

0000077b <ls_call40>:
CS550LSSYSCALL(ls_call40)
     77b:	b8 71 07 00 00       	mov    $0x771,%eax
     780:	cd 41                	int    $0x41
     782:	c3                   	ret    

00000783 <str_ls_call41>:
     783:	6c                   	insb   (%dx),%es:(%edi)
     784:	73 5f                	jae    7e5 <str_ls_call46+0x8>
     786:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     789:	6c                   	insb   (%dx),%es:(%edi)
     78a:	34 31                	xor    $0x31,%al
	...

0000078d <ls_call41>:
CS550LSSYSCALL(ls_call41)
     78d:	b8 83 07 00 00       	mov    $0x783,%eax
     792:	cd 41                	int    $0x41
     794:	c3                   	ret    

00000795 <str_ls_call42>:
     795:	6c                   	insb   (%dx),%es:(%edi)
     796:	73 5f                	jae    7f7 <str_ls_call47+0x8>
     798:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     79b:	6c                   	insb   (%dx),%es:(%edi)
     79c:	34 32                	xor    $0x32,%al
	...

0000079f <ls_call42>:
CS550LSSYSCALL(ls_call42)
     79f:	b8 95 07 00 00       	mov    $0x795,%eax
     7a4:	cd 41                	int    $0x41
     7a6:	c3                   	ret    

000007a7 <str_ls_call43>:
     7a7:	6c                   	insb   (%dx),%es:(%edi)
     7a8:	73 5f                	jae    809 <str_ls_call48+0x8>
     7aa:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7ad:	6c                   	insb   (%dx),%es:(%edi)
     7ae:	34 33                	xor    $0x33,%al
	...

000007b1 <ls_call43>:
CS550LSSYSCALL(ls_call43)
     7b1:	b8 a7 07 00 00       	mov    $0x7a7,%eax
     7b6:	cd 41                	int    $0x41
     7b8:	c3                   	ret    

000007b9 <str_ls_call44>:
     7b9:	6c                   	insb   (%dx),%es:(%edi)
     7ba:	73 5f                	jae    81b <str_ls_call49+0x8>
     7bc:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7bf:	6c                   	insb   (%dx),%es:(%edi)
     7c0:	34 34                	xor    $0x34,%al
	...

000007c3 <ls_call44>:
CS550LSSYSCALL(ls_call44)
     7c3:	b8 b9 07 00 00       	mov    $0x7b9,%eax
     7c8:	cd 41                	int    $0x41
     7ca:	c3                   	ret    

000007cb <str_ls_call45>:
     7cb:	6c                   	insb   (%dx),%es:(%edi)
     7cc:	73 5f                	jae    82d <str_ls_call50+0x8>
     7ce:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7d1:	6c                   	insb   (%dx),%es:(%edi)
     7d2:	34 35                	xor    $0x35,%al
	...

000007d5 <ls_call45>:
CS550LSSYSCALL(ls_call45)
     7d5:	b8 cb 07 00 00       	mov    $0x7cb,%eax
     7da:	cd 41                	int    $0x41
     7dc:	c3                   	ret    

000007dd <str_ls_call46>:
     7dd:	6c                   	insb   (%dx),%es:(%edi)
     7de:	73 5f                	jae    83f <str_ht_call1+0x8>
     7e0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7e3:	6c                   	insb   (%dx),%es:(%edi)
     7e4:	34 36                	xor    $0x36,%al
	...

000007e7 <ls_call46>:
CS550LSSYSCALL(ls_call46)
     7e7:	b8 dd 07 00 00       	mov    $0x7dd,%eax
     7ec:	cd 41                	int    $0x41
     7ee:	c3                   	ret    

000007ef <str_ls_call47>:
     7ef:	6c                   	insb   (%dx),%es:(%edi)
     7f0:	73 5f                	jae    851 <ht_call2>
     7f2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7f5:	6c                   	insb   (%dx),%es:(%edi)
     7f6:	34 37                	xor    $0x37,%al
	...

000007f9 <ls_call47>:
CS550LSSYSCALL(ls_call47)
     7f9:	b8 ef 07 00 00       	mov    $0x7ef,%eax
     7fe:	cd 41                	int    $0x41
     800:	c3                   	ret    

00000801 <str_ls_call48>:
     801:	6c                   	insb   (%dx),%es:(%edi)
     802:	73 5f                	jae    863 <ht_call3+0x1>
     804:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     807:	6c                   	insb   (%dx),%es:(%edi)
     808:	34 38                	xor    $0x38,%al
	...

0000080b <ls_call48>:
CS550LSSYSCALL(ls_call48)
     80b:	b8 01 08 00 00       	mov    $0x801,%eax
     810:	cd 41                	int    $0x41
     812:	c3                   	ret    

00000813 <str_ls_call49>:
     813:	6c                   	insb   (%dx),%es:(%edi)
     814:	73 5f                	jae    875 <ht_call4+0x2>
     816:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     819:	6c                   	insb   (%dx),%es:(%edi)
     81a:	34 39                	xor    $0x39,%al
	...

0000081d <ls_call49>:
CS550LSSYSCALL(ls_call49)
     81d:	b8 13 08 00 00       	mov    $0x813,%eax
     822:	cd 41                	int    $0x41
     824:	c3                   	ret    

00000825 <str_ls_call50>:
     825:	6c                   	insb   (%dx),%es:(%edi)
     826:	73 5f                	jae    887 <ht_call5+0x3>
     828:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     82b:	6c                   	insb   (%dx),%es:(%edi)
     82c:	35                   	.byte 0x35
     82d:	30 00                	xor    %al,(%eax)

0000082f <ls_call50>:
CS550LSSYSCALL(ls_call50)
     82f:	b8 25 08 00 00       	mov    $0x825,%eax
     834:	cd 41                	int    $0x41
     836:	c3                   	ret    

00000837 <str_ht_call1>:
     837:	68 74 5f 63 61       	push   $0x61635f74
     83c:	6c                   	insb   (%dx),%es:(%edi)
     83d:	6c                   	insb   (%dx),%es:(%edi)
     83e:	31 00                	xor    %eax,(%eax)

00000840 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
     840:	b8 37 08 00 00       	mov    $0x837,%eax
     845:	cd 42                	int    $0x42
     847:	c3                   	ret    

00000848 <str_ht_call2>:
     848:	68 74 5f 63 61       	push   $0x61635f74
     84d:	6c                   	insb   (%dx),%es:(%edi)
     84e:	6c                   	insb   (%dx),%es:(%edi)
     84f:	32 00                	xor    (%eax),%al

00000851 <ht_call2>:
CS550HTSYSCALL(ht_call2)
     851:	b8 48 08 00 00       	mov    $0x848,%eax
     856:	cd 42                	int    $0x42
     858:	c3                   	ret    

00000859 <str_ht_call3>:
     859:	68 74 5f 63 61       	push   $0x61635f74
     85e:	6c                   	insb   (%dx),%es:(%edi)
     85f:	6c                   	insb   (%dx),%es:(%edi)
     860:	33 00                	xor    (%eax),%eax

00000862 <ht_call3>:
CS550HTSYSCALL(ht_call3)
     862:	b8 59 08 00 00       	mov    $0x859,%eax
     867:	cd 42                	int    $0x42
     869:	c3                   	ret    

0000086a <str_ht_call4>:
     86a:	68 74 5f 63 61       	push   $0x61635f74
     86f:	6c                   	insb   (%dx),%es:(%edi)
     870:	6c                   	insb   (%dx),%es:(%edi)
     871:	34 00                	xor    $0x0,%al

00000873 <ht_call4>:
CS550HTSYSCALL(ht_call4)
     873:	b8 6a 08 00 00       	mov    $0x86a,%eax
     878:	cd 42                	int    $0x42
     87a:	c3                   	ret    

0000087b <str_ht_call5>:
     87b:	68 74 5f 63 61       	push   $0x61635f74
     880:	6c                   	insb   (%dx),%es:(%edi)
     881:	6c                   	insb   (%dx),%es:(%edi)
     882:	35                   	.byte 0x35
	...

00000884 <ht_call5>:
CS550HTSYSCALL(ht_call5)
     884:	b8 7b 08 00 00       	mov    $0x87b,%eax
     889:	cd 42                	int    $0x42
     88b:	c3                   	ret    

0000088c <str_ht_call6>:
     88c:	68 74 5f 63 61       	push   $0x61635f74
     891:	6c                   	insb   (%dx),%es:(%edi)
     892:	6c                   	insb   (%dx),%es:(%edi)
     893:	36                   	ss
	...

00000895 <ht_call6>:
CS550HTSYSCALL(ht_call6)
     895:	b8 8c 08 00 00       	mov    $0x88c,%eax
     89a:	cd 42                	int    $0x42
     89c:	c3                   	ret    

0000089d <str_ht_call7>:
     89d:	68 74 5f 63 61       	push   $0x61635f74
     8a2:	6c                   	insb   (%dx),%es:(%edi)
     8a3:	6c                   	insb   (%dx),%es:(%edi)
     8a4:	37                   	aaa    
	...

000008a6 <ht_call7>:
CS550HTSYSCALL(ht_call7)
     8a6:	b8 9d 08 00 00       	mov    $0x89d,%eax
     8ab:	cd 42                	int    $0x42
     8ad:	c3                   	ret    

000008ae <str_ht_call8>:
     8ae:	68 74 5f 63 61       	push   $0x61635f74
     8b3:	6c                   	insb   (%dx),%es:(%edi)
     8b4:	6c                   	insb   (%dx),%es:(%edi)
     8b5:	38 00                	cmp    %al,(%eax)

000008b7 <ht_call8>:
CS550HTSYSCALL(ht_call8)
     8b7:	b8 ae 08 00 00       	mov    $0x8ae,%eax
     8bc:	cd 42                	int    $0x42
     8be:	c3                   	ret    

000008bf <str_ht_call9>:
     8bf:	68 74 5f 63 61       	push   $0x61635f74
     8c4:	6c                   	insb   (%dx),%es:(%edi)
     8c5:	6c                   	insb   (%dx),%es:(%edi)
     8c6:	39 00                	cmp    %eax,(%eax)

000008c8 <ht_call9>:
CS550HTSYSCALL(ht_call9)
     8c8:	b8 bf 08 00 00       	mov    $0x8bf,%eax
     8cd:	cd 42                	int    $0x42
     8cf:	c3                   	ret    

000008d0 <str_ht_call10>:
     8d0:	68 74 5f 63 61       	push   $0x61635f74
     8d5:	6c                   	insb   (%dx),%es:(%edi)
     8d6:	6c                   	insb   (%dx),%es:(%edi)
     8d7:	31 30                	xor    %esi,(%eax)
	...

000008da <ht_call10>:
CS550HTSYSCALL(ht_call10)
     8da:	b8 d0 08 00 00       	mov    $0x8d0,%eax
     8df:	cd 42                	int    $0x42
     8e1:	c3                   	ret    

000008e2 <str_ht_call11>:
     8e2:	68 74 5f 63 61       	push   $0x61635f74
     8e7:	6c                   	insb   (%dx),%es:(%edi)
     8e8:	6c                   	insb   (%dx),%es:(%edi)
     8e9:	31 31                	xor    %esi,(%ecx)
	...

000008ec <ht_call11>:
CS550HTSYSCALL(ht_call11)
     8ec:	b8 e2 08 00 00       	mov    $0x8e2,%eax
     8f1:	cd 42                	int    $0x42
     8f3:	c3                   	ret    

000008f4 <str_ht_call12>:
     8f4:	68 74 5f 63 61       	push   $0x61635f74
     8f9:	6c                   	insb   (%dx),%es:(%edi)
     8fa:	6c                   	insb   (%dx),%es:(%edi)
     8fb:	31 32                	xor    %esi,(%edx)
	...

000008fe <ht_call12>:
CS550HTSYSCALL(ht_call12)
     8fe:	b8 f4 08 00 00       	mov    $0x8f4,%eax
     903:	cd 42                	int    $0x42
     905:	c3                   	ret    

00000906 <str_ht_call13>:
     906:	68 74 5f 63 61       	push   $0x61635f74
     90b:	6c                   	insb   (%dx),%es:(%edi)
     90c:	6c                   	insb   (%dx),%es:(%edi)
     90d:	31 33                	xor    %esi,(%ebx)
	...

00000910 <ht_call13>:
CS550HTSYSCALL(ht_call13)
     910:	b8 06 09 00 00       	mov    $0x906,%eax
     915:	cd 42                	int    $0x42
     917:	c3                   	ret    

00000918 <str_ht_call14>:
     918:	68 74 5f 63 61       	push   $0x61635f74
     91d:	6c                   	insb   (%dx),%es:(%edi)
     91e:	6c                   	insb   (%dx),%es:(%edi)
     91f:	31 34 00             	xor    %esi,(%eax,%eax,1)

00000922 <ht_call14>:
CS550HTSYSCALL(ht_call14)
     922:	b8 18 09 00 00       	mov    $0x918,%eax
     927:	cd 42                	int    $0x42
     929:	c3                   	ret    

0000092a <str_ht_call15>:
     92a:	68 74 5f 63 61       	push   $0x61635f74
     92f:	6c                   	insb   (%dx),%es:(%edi)
     930:	6c                   	insb   (%dx),%es:(%edi)
     931:	31                   	.byte 0x31
     932:	35                   	.byte 0x35
	...

00000934 <ht_call15>:
CS550HTSYSCALL(ht_call15)
     934:	b8 2a 09 00 00       	mov    $0x92a,%eax
     939:	cd 42                	int    $0x42
     93b:	c3                   	ret    

0000093c <str_ht_call16>:
     93c:	68 74 5f 63 61       	push   $0x61635f74
     941:	6c                   	insb   (%dx),%es:(%edi)
     942:	6c                   	insb   (%dx),%es:(%edi)
     943:	31 36                	xor    %esi,(%esi)
	...

00000946 <ht_call16>:
CS550HTSYSCALL(ht_call16)
     946:	b8 3c 09 00 00       	mov    $0x93c,%eax
     94b:	cd 42                	int    $0x42
     94d:	c3                   	ret    

0000094e <str_ht_call17>:
     94e:	68 74 5f 63 61       	push   $0x61635f74
     953:	6c                   	insb   (%dx),%es:(%edi)
     954:	6c                   	insb   (%dx),%es:(%edi)
     955:	31 37                	xor    %esi,(%edi)
	...

00000958 <ht_call17>:
CS550HTSYSCALL(ht_call17)
     958:	b8 4e 09 00 00       	mov    $0x94e,%eax
     95d:	cd 42                	int    $0x42
     95f:	c3                   	ret    

00000960 <str_ht_call18>:
     960:	68 74 5f 63 61       	push   $0x61635f74
     965:	6c                   	insb   (%dx),%es:(%edi)
     966:	6c                   	insb   (%dx),%es:(%edi)
     967:	31 38                	xor    %edi,(%eax)
	...

0000096a <ht_call18>:
CS550HTSYSCALL(ht_call18)
     96a:	b8 60 09 00 00       	mov    $0x960,%eax
     96f:	cd 42                	int    $0x42
     971:	c3                   	ret    

00000972 <str_ht_call19>:
     972:	68 74 5f 63 61       	push   $0x61635f74
     977:	6c                   	insb   (%dx),%es:(%edi)
     978:	6c                   	insb   (%dx),%es:(%edi)
     979:	31 39                	xor    %edi,(%ecx)
	...

0000097c <ht_call19>:
CS550HTSYSCALL(ht_call19)
     97c:	b8 72 09 00 00       	mov    $0x972,%eax
     981:	cd 42                	int    $0x42
     983:	c3                   	ret    

00000984 <str_ht_call20>:
     984:	68 74 5f 63 61       	push   $0x61635f74
     989:	6c                   	insb   (%dx),%es:(%edi)
     98a:	6c                   	insb   (%dx),%es:(%edi)
     98b:	32 30                	xor    (%eax),%dh
	...

0000098e <ht_call20>:
CS550HTSYSCALL(ht_call20)
     98e:	b8 84 09 00 00       	mov    $0x984,%eax
     993:	cd 42                	int    $0x42
     995:	c3                   	ret    

00000996 <str_ht_call21>:
     996:	68 74 5f 63 61       	push   $0x61635f74
     99b:	6c                   	insb   (%dx),%es:(%edi)
     99c:	6c                   	insb   (%dx),%es:(%edi)
     99d:	32 31                	xor    (%ecx),%dh
	...

000009a0 <ht_call21>:
CS550HTSYSCALL(ht_call21)
     9a0:	b8 96 09 00 00       	mov    $0x996,%eax
     9a5:	cd 42                	int    $0x42
     9a7:	c3                   	ret    

000009a8 <str_ht_call22>:
     9a8:	68 74 5f 63 61       	push   $0x61635f74
     9ad:	6c                   	insb   (%dx),%es:(%edi)
     9ae:	6c                   	insb   (%dx),%es:(%edi)
     9af:	32 32                	xor    (%edx),%dh
	...

000009b2 <ht_call22>:
CS550HTSYSCALL(ht_call22)
     9b2:	b8 a8 09 00 00       	mov    $0x9a8,%eax
     9b7:	cd 42                	int    $0x42
     9b9:	c3                   	ret    

000009ba <str_ht_call23>:
     9ba:	68 74 5f 63 61       	push   $0x61635f74
     9bf:	6c                   	insb   (%dx),%es:(%edi)
     9c0:	6c                   	insb   (%dx),%es:(%edi)
     9c1:	32 33                	xor    (%ebx),%dh
	...

000009c4 <ht_call23>:
CS550HTSYSCALL(ht_call23)
     9c4:	b8 ba 09 00 00       	mov    $0x9ba,%eax
     9c9:	cd 42                	int    $0x42
     9cb:	c3                   	ret    

000009cc <str_ht_call24>:
     9cc:	68 74 5f 63 61       	push   $0x61635f74
     9d1:	6c                   	insb   (%dx),%es:(%edi)
     9d2:	6c                   	insb   (%dx),%es:(%edi)
     9d3:	32 34 00             	xor    (%eax,%eax,1),%dh

000009d6 <ht_call24>:
CS550HTSYSCALL(ht_call24)
     9d6:	b8 cc 09 00 00       	mov    $0x9cc,%eax
     9db:	cd 42                	int    $0x42
     9dd:	c3                   	ret    

000009de <str_ht_call25>:
     9de:	68 74 5f 63 61       	push   $0x61635f74
     9e3:	6c                   	insb   (%dx),%es:(%edi)
     9e4:	6c                   	insb   (%dx),%es:(%edi)
     9e5:	32                   	.byte 0x32
     9e6:	35                   	.byte 0x35
	...

000009e8 <ht_call25>:
CS550HTSYSCALL(ht_call25)
     9e8:	b8 de 09 00 00       	mov    $0x9de,%eax
     9ed:	cd 42                	int    $0x42
     9ef:	c3                   	ret    

000009f0 <str_ht_call26>:
     9f0:	68 74 5f 63 61       	push   $0x61635f74
     9f5:	6c                   	insb   (%dx),%es:(%edi)
     9f6:	6c                   	insb   (%dx),%es:(%edi)
     9f7:	32 36                	xor    (%esi),%dh
	...

000009fa <ht_call26>:
CS550HTSYSCALL(ht_call26)
     9fa:	b8 f0 09 00 00       	mov    $0x9f0,%eax
     9ff:	cd 42                	int    $0x42
     a01:	c3                   	ret    

00000a02 <str_ht_call27>:
     a02:	68 74 5f 63 61       	push   $0x61635f74
     a07:	6c                   	insb   (%dx),%es:(%edi)
     a08:	6c                   	insb   (%dx),%es:(%edi)
     a09:	32 37                	xor    (%edi),%dh
	...

00000a0c <ht_call27>:
CS550HTSYSCALL(ht_call27)
     a0c:	b8 02 0a 00 00       	mov    $0xa02,%eax
     a11:	cd 42                	int    $0x42
     a13:	c3                   	ret    

00000a14 <str_ht_call28>:
     a14:	68 74 5f 63 61       	push   $0x61635f74
     a19:	6c                   	insb   (%dx),%es:(%edi)
     a1a:	6c                   	insb   (%dx),%es:(%edi)
     a1b:	32 38                	xor    (%eax),%bh
	...

00000a1e <ht_call28>:
CS550HTSYSCALL(ht_call28)
     a1e:	b8 14 0a 00 00       	mov    $0xa14,%eax
     a23:	cd 42                	int    $0x42
     a25:	c3                   	ret    

00000a26 <str_ht_call29>:
     a26:	68 74 5f 63 61       	push   $0x61635f74
     a2b:	6c                   	insb   (%dx),%es:(%edi)
     a2c:	6c                   	insb   (%dx),%es:(%edi)
     a2d:	32 39                	xor    (%ecx),%bh
	...

00000a30 <ht_call29>:
CS550HTSYSCALL(ht_call29)
     a30:	b8 26 0a 00 00       	mov    $0xa26,%eax
     a35:	cd 42                	int    $0x42
     a37:	c3                   	ret    

00000a38 <str_ht_call30>:
     a38:	68 74 5f 63 61       	push   $0x61635f74
     a3d:	6c                   	insb   (%dx),%es:(%edi)
     a3e:	6c                   	insb   (%dx),%es:(%edi)
     a3f:	33 30                	xor    (%eax),%esi
	...

00000a42 <ht_call30>:
CS550HTSYSCALL(ht_call30)
     a42:	b8 38 0a 00 00       	mov    $0xa38,%eax
     a47:	cd 42                	int    $0x42
     a49:	c3                   	ret    

00000a4a <str_ht_call31>:
     a4a:	68 74 5f 63 61       	push   $0x61635f74
     a4f:	6c                   	insb   (%dx),%es:(%edi)
     a50:	6c                   	insb   (%dx),%es:(%edi)
     a51:	33 31                	xor    (%ecx),%esi
	...

00000a54 <ht_call31>:
CS550HTSYSCALL(ht_call31)
     a54:	b8 4a 0a 00 00       	mov    $0xa4a,%eax
     a59:	cd 42                	int    $0x42
     a5b:	c3                   	ret    

00000a5c <str_ht_call32>:
     a5c:	68 74 5f 63 61       	push   $0x61635f74
     a61:	6c                   	insb   (%dx),%es:(%edi)
     a62:	6c                   	insb   (%dx),%es:(%edi)
     a63:	33 32                	xor    (%edx),%esi
	...

00000a66 <ht_call32>:
CS550HTSYSCALL(ht_call32)
     a66:	b8 5c 0a 00 00       	mov    $0xa5c,%eax
     a6b:	cd 42                	int    $0x42
     a6d:	c3                   	ret    

00000a6e <str_ht_call33>:
     a6e:	68 74 5f 63 61       	push   $0x61635f74
     a73:	6c                   	insb   (%dx),%es:(%edi)
     a74:	6c                   	insb   (%dx),%es:(%edi)
     a75:	33 33                	xor    (%ebx),%esi
	...

00000a78 <ht_call33>:
CS550HTSYSCALL(ht_call33)
     a78:	b8 6e 0a 00 00       	mov    $0xa6e,%eax
     a7d:	cd 42                	int    $0x42
     a7f:	c3                   	ret    

00000a80 <str_ht_call34>:
     a80:	68 74 5f 63 61       	push   $0x61635f74
     a85:	6c                   	insb   (%dx),%es:(%edi)
     a86:	6c                   	insb   (%dx),%es:(%edi)
     a87:	33 34 00             	xor    (%eax,%eax,1),%esi

00000a8a <ht_call34>:
CS550HTSYSCALL(ht_call34)
     a8a:	b8 80 0a 00 00       	mov    $0xa80,%eax
     a8f:	cd 42                	int    $0x42
     a91:	c3                   	ret    

00000a92 <str_ht_call35>:
     a92:	68 74 5f 63 61       	push   $0x61635f74
     a97:	6c                   	insb   (%dx),%es:(%edi)
     a98:	6c                   	insb   (%dx),%es:(%edi)
     a99:	33                   	.byte 0x33
     a9a:	35                   	.byte 0x35
	...

00000a9c <ht_call35>:
CS550HTSYSCALL(ht_call35)
     a9c:	b8 92 0a 00 00       	mov    $0xa92,%eax
     aa1:	cd 42                	int    $0x42
     aa3:	c3                   	ret    

00000aa4 <str_ht_call36>:
     aa4:	68 74 5f 63 61       	push   $0x61635f74
     aa9:	6c                   	insb   (%dx),%es:(%edi)
     aaa:	6c                   	insb   (%dx),%es:(%edi)
     aab:	33 36                	xor    (%esi),%esi
	...

00000aae <ht_call36>:
CS550HTSYSCALL(ht_call36)
     aae:	b8 a4 0a 00 00       	mov    $0xaa4,%eax
     ab3:	cd 42                	int    $0x42
     ab5:	c3                   	ret    

00000ab6 <str_ht_call37>:
     ab6:	68 74 5f 63 61       	push   $0x61635f74
     abb:	6c                   	insb   (%dx),%es:(%edi)
     abc:	6c                   	insb   (%dx),%es:(%edi)
     abd:	33 37                	xor    (%edi),%esi
	...

00000ac0 <ht_call37>:
CS550HTSYSCALL(ht_call37)
     ac0:	b8 b6 0a 00 00       	mov    $0xab6,%eax
     ac5:	cd 42                	int    $0x42
     ac7:	c3                   	ret    

00000ac8 <str_ht_call38>:
     ac8:	68 74 5f 63 61       	push   $0x61635f74
     acd:	6c                   	insb   (%dx),%es:(%edi)
     ace:	6c                   	insb   (%dx),%es:(%edi)
     acf:	33 38                	xor    (%eax),%edi
	...

00000ad2 <ht_call38>:
CS550HTSYSCALL(ht_call38)
     ad2:	b8 c8 0a 00 00       	mov    $0xac8,%eax
     ad7:	cd 42                	int    $0x42
     ad9:	c3                   	ret    

00000ada <str_ht_call39>:
     ada:	68 74 5f 63 61       	push   $0x61635f74
     adf:	6c                   	insb   (%dx),%es:(%edi)
     ae0:	6c                   	insb   (%dx),%es:(%edi)
     ae1:	33 39                	xor    (%ecx),%edi
	...

00000ae4 <ht_call39>:
CS550HTSYSCALL(ht_call39)
     ae4:	b8 da 0a 00 00       	mov    $0xada,%eax
     ae9:	cd 42                	int    $0x42
     aeb:	c3                   	ret    

00000aec <str_ht_call40>:
     aec:	68 74 5f 63 61       	push   $0x61635f74
     af1:	6c                   	insb   (%dx),%es:(%edi)
     af2:	6c                   	insb   (%dx),%es:(%edi)
     af3:	34 30                	xor    $0x30,%al
	...

00000af6 <ht_call40>:
CS550HTSYSCALL(ht_call40)
     af6:	b8 ec 0a 00 00       	mov    $0xaec,%eax
     afb:	cd 42                	int    $0x42
     afd:	c3                   	ret    

00000afe <str_ht_call41>:
     afe:	68 74 5f 63 61       	push   $0x61635f74
     b03:	6c                   	insb   (%dx),%es:(%edi)
     b04:	6c                   	insb   (%dx),%es:(%edi)
     b05:	34 31                	xor    $0x31,%al
	...

00000b08 <ht_call41>:
CS550HTSYSCALL(ht_call41)
     b08:	b8 fe 0a 00 00       	mov    $0xafe,%eax
     b0d:	cd 42                	int    $0x42
     b0f:	c3                   	ret    

00000b10 <str_ht_call42>:
     b10:	68 74 5f 63 61       	push   $0x61635f74
     b15:	6c                   	insb   (%dx),%es:(%edi)
     b16:	6c                   	insb   (%dx),%es:(%edi)
     b17:	34 32                	xor    $0x32,%al
	...

00000b1a <ht_call42>:
CS550HTSYSCALL(ht_call42)
     b1a:	b8 10 0b 00 00       	mov    $0xb10,%eax
     b1f:	cd 42                	int    $0x42
     b21:	c3                   	ret    

00000b22 <str_ht_call43>:
     b22:	68 74 5f 63 61       	push   $0x61635f74
     b27:	6c                   	insb   (%dx),%es:(%edi)
     b28:	6c                   	insb   (%dx),%es:(%edi)
     b29:	34 33                	xor    $0x33,%al
	...

00000b2c <ht_call43>:
CS550HTSYSCALL(ht_call43)
     b2c:	b8 22 0b 00 00       	mov    $0xb22,%eax
     b31:	cd 42                	int    $0x42
     b33:	c3                   	ret    

00000b34 <str_ht_call44>:
     b34:	68 74 5f 63 61       	push   $0x61635f74
     b39:	6c                   	insb   (%dx),%es:(%edi)
     b3a:	6c                   	insb   (%dx),%es:(%edi)
     b3b:	34 34                	xor    $0x34,%al
	...

00000b3e <ht_call44>:
CS550HTSYSCALL(ht_call44)
     b3e:	b8 34 0b 00 00       	mov    $0xb34,%eax
     b43:	cd 42                	int    $0x42
     b45:	c3                   	ret    

00000b46 <str_ht_call45>:
     b46:	68 74 5f 63 61       	push   $0x61635f74
     b4b:	6c                   	insb   (%dx),%es:(%edi)
     b4c:	6c                   	insb   (%dx),%es:(%edi)
     b4d:	34 35                	xor    $0x35,%al
	...

00000b50 <ht_call45>:
CS550HTSYSCALL(ht_call45)
     b50:	b8 46 0b 00 00       	mov    $0xb46,%eax
     b55:	cd 42                	int    $0x42
     b57:	c3                   	ret    

00000b58 <str_ht_call46>:
     b58:	68 74 5f 63 61       	push   $0x61635f74
     b5d:	6c                   	insb   (%dx),%es:(%edi)
     b5e:	6c                   	insb   (%dx),%es:(%edi)
     b5f:	34 36                	xor    $0x36,%al
	...

00000b62 <ht_call46>:
CS550HTSYSCALL(ht_call46)
     b62:	b8 58 0b 00 00       	mov    $0xb58,%eax
     b67:	cd 42                	int    $0x42
     b69:	c3                   	ret    

00000b6a <str_ht_call47>:
     b6a:	68 74 5f 63 61       	push   $0x61635f74
     b6f:	6c                   	insb   (%dx),%es:(%edi)
     b70:	6c                   	insb   (%dx),%es:(%edi)
     b71:	34 37                	xor    $0x37,%al
	...

00000b74 <ht_call47>:
CS550HTSYSCALL(ht_call47)
     b74:	b8 6a 0b 00 00       	mov    $0xb6a,%eax
     b79:	cd 42                	int    $0x42
     b7b:	c3                   	ret    

00000b7c <str_ht_call48>:
     b7c:	68 74 5f 63 61       	push   $0x61635f74
     b81:	6c                   	insb   (%dx),%es:(%edi)
     b82:	6c                   	insb   (%dx),%es:(%edi)
     b83:	34 38                	xor    $0x38,%al
	...

00000b86 <ht_call48>:
CS550HTSYSCALL(ht_call48)
     b86:	b8 7c 0b 00 00       	mov    $0xb7c,%eax
     b8b:	cd 42                	int    $0x42
     b8d:	c3                   	ret    

00000b8e <str_ht_call49>:
     b8e:	68 74 5f 63 61       	push   $0x61635f74
     b93:	6c                   	insb   (%dx),%es:(%edi)
     b94:	6c                   	insb   (%dx),%es:(%edi)
     b95:	34 39                	xor    $0x39,%al
	...

00000b98 <ht_call49>:
CS550HTSYSCALL(ht_call49)
     b98:	b8 8e 0b 00 00       	mov    $0xb8e,%eax
     b9d:	cd 42                	int    $0x42
     b9f:	c3                   	ret    

00000ba0 <str_ht_call50>:
     ba0:	68 74 5f 63 61       	push   $0x61635f74
     ba5:	6c                   	insb   (%dx),%es:(%edi)
     ba6:	6c                   	insb   (%dx),%es:(%edi)
     ba7:	35                   	.byte 0x35
     ba8:	30 00                	xor    %al,(%eax)

00000baa <ht_call50>:
CS550HTSYSCALL(ht_call50)
     baa:	b8 a0 0b 00 00       	mov    $0xba0,%eax
     baf:	cd 42                	int    $0x42
     bb1:	c3                   	ret    

00000bb2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     bb2:	55                   	push   %ebp
     bb3:	89 e5                	mov    %esp,%ebp
     bb5:	83 ec 18             	sub    $0x18,%esp
     bb8:	8b 45 0c             	mov    0xc(%ebp),%eax
     bbb:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     bbe:	83 ec 04             	sub    $0x4,%esp
     bc1:	6a 01                	push   $0x1
     bc3:	8d 45 f4             	lea    -0xc(%ebp),%eax
     bc6:	50                   	push   %eax
     bc7:	ff 75 08             	pushl  0x8(%ebp)
     bca:	e8 65 f8 ff ff       	call   434 <write>
     bcf:	83 c4 10             	add    $0x10,%esp
}
     bd2:	90                   	nop
     bd3:	c9                   	leave  
     bd4:	c3                   	ret    

00000bd5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     bd5:	55                   	push   %ebp
     bd6:	89 e5                	mov    %esp,%ebp
     bd8:	53                   	push   %ebx
     bd9:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     bdc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     be3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     be7:	74 17                	je     c00 <printint+0x2b>
     be9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     bed:	79 11                	jns    c00 <printint+0x2b>
    neg = 1;
     bef:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     bf6:	8b 45 0c             	mov    0xc(%ebp),%eax
     bf9:	f7 d8                	neg    %eax
     bfb:	89 45 ec             	mov    %eax,-0x14(%ebp)
     bfe:	eb 06                	jmp    c06 <printint+0x31>
  } else {
    x = xx;
     c00:	8b 45 0c             	mov    0xc(%ebp),%eax
     c03:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     c06:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     c0d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     c10:	8d 41 01             	lea    0x1(%ecx),%eax
     c13:	89 45 f4             	mov    %eax,-0xc(%ebp)
     c16:	8b 5d 10             	mov    0x10(%ebp),%ebx
     c19:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c1c:	ba 00 00 00 00       	mov    $0x0,%edx
     c21:	f7 f3                	div    %ebx
     c23:	89 d0                	mov    %edx,%eax
     c25:	0f b6 80 ec 12 00 00 	movzbl 0x12ec(%eax),%eax
     c2c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     c30:	8b 5d 10             	mov    0x10(%ebp),%ebx
     c33:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c36:	ba 00 00 00 00       	mov    $0x0,%edx
     c3b:	f7 f3                	div    %ebx
     c3d:	89 45 ec             	mov    %eax,-0x14(%ebp)
     c40:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     c44:	75 c7                	jne    c0d <printint+0x38>
  if(neg)
     c46:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     c4a:	74 2d                	je     c79 <printint+0xa4>
    buf[i++] = '-';
     c4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c4f:	8d 50 01             	lea    0x1(%eax),%edx
     c52:	89 55 f4             	mov    %edx,-0xc(%ebp)
     c55:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     c5a:	eb 1d                	jmp    c79 <printint+0xa4>
    putc(fd, buf[i]);
     c5c:	8d 55 dc             	lea    -0x24(%ebp),%edx
     c5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c62:	01 d0                	add    %edx,%eax
     c64:	0f b6 00             	movzbl (%eax),%eax
     c67:	0f be c0             	movsbl %al,%eax
     c6a:	83 ec 08             	sub    $0x8,%esp
     c6d:	50                   	push   %eax
     c6e:	ff 75 08             	pushl  0x8(%ebp)
     c71:	e8 3c ff ff ff       	call   bb2 <putc>
     c76:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     c79:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     c7d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     c81:	79 d9                	jns    c5c <printint+0x87>
    putc(fd, buf[i]);
}
     c83:	90                   	nop
     c84:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c87:	c9                   	leave  
     c88:	c3                   	ret    

00000c89 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     c89:	55                   	push   %ebp
     c8a:	89 e5                	mov    %esp,%ebp
     c8c:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     c8f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     c96:	8d 45 0c             	lea    0xc(%ebp),%eax
     c99:	83 c0 04             	add    $0x4,%eax
     c9c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     c9f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ca6:	e9 59 01 00 00       	jmp    e04 <printf+0x17b>
    c = fmt[i] & 0xff;
     cab:	8b 55 0c             	mov    0xc(%ebp),%edx
     cae:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cb1:	01 d0                	add    %edx,%eax
     cb3:	0f b6 00             	movzbl (%eax),%eax
     cb6:	0f be c0             	movsbl %al,%eax
     cb9:	25 ff 00 00 00       	and    $0xff,%eax
     cbe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     cc1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     cc5:	75 2c                	jne    cf3 <printf+0x6a>
      if(c == '%'){
     cc7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     ccb:	75 0c                	jne    cd9 <printf+0x50>
        state = '%';
     ccd:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     cd4:	e9 27 01 00 00       	jmp    e00 <printf+0x177>
      } else {
        putc(fd, c);
     cd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     cdc:	0f be c0             	movsbl %al,%eax
     cdf:	83 ec 08             	sub    $0x8,%esp
     ce2:	50                   	push   %eax
     ce3:	ff 75 08             	pushl  0x8(%ebp)
     ce6:	e8 c7 fe ff ff       	call   bb2 <putc>
     ceb:	83 c4 10             	add    $0x10,%esp
     cee:	e9 0d 01 00 00       	jmp    e00 <printf+0x177>
      }
    } else if(state == '%'){
     cf3:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     cf7:	0f 85 03 01 00 00    	jne    e00 <printf+0x177>
      if(c == 'd'){
     cfd:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     d01:	75 1e                	jne    d21 <printf+0x98>
        printint(fd, *ap, 10, 1);
     d03:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d06:	8b 00                	mov    (%eax),%eax
     d08:	6a 01                	push   $0x1
     d0a:	6a 0a                	push   $0xa
     d0c:	50                   	push   %eax
     d0d:	ff 75 08             	pushl  0x8(%ebp)
     d10:	e8 c0 fe ff ff       	call   bd5 <printint>
     d15:	83 c4 10             	add    $0x10,%esp
        ap++;
     d18:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     d1c:	e9 d8 00 00 00       	jmp    df9 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
     d21:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     d25:	74 06                	je     d2d <printf+0xa4>
     d27:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     d2b:	75 1e                	jne    d4b <printf+0xc2>
        printint(fd, *ap, 16, 0);
     d2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d30:	8b 00                	mov    (%eax),%eax
     d32:	6a 00                	push   $0x0
     d34:	6a 10                	push   $0x10
     d36:	50                   	push   %eax
     d37:	ff 75 08             	pushl  0x8(%ebp)
     d3a:	e8 96 fe ff ff       	call   bd5 <printint>
     d3f:	83 c4 10             	add    $0x10,%esp
        ap++;
     d42:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     d46:	e9 ae 00 00 00       	jmp    df9 <printf+0x170>
      } else if(c == 's'){
     d4b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     d4f:	75 43                	jne    d94 <printf+0x10b>
        s = (char*)*ap;
     d51:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d54:	8b 00                	mov    (%eax),%eax
     d56:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     d59:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     d5d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d61:	75 25                	jne    d88 <printf+0xff>
          s = "(null)";
     d63:	c7 45 f4 77 10 00 00 	movl   $0x1077,-0xc(%ebp)
        while(*s != 0){
     d6a:	eb 1c                	jmp    d88 <printf+0xff>
          putc(fd, *s);
     d6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d6f:	0f b6 00             	movzbl (%eax),%eax
     d72:	0f be c0             	movsbl %al,%eax
     d75:	83 ec 08             	sub    $0x8,%esp
     d78:	50                   	push   %eax
     d79:	ff 75 08             	pushl  0x8(%ebp)
     d7c:	e8 31 fe ff ff       	call   bb2 <putc>
     d81:	83 c4 10             	add    $0x10,%esp
          s++;
     d84:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     d88:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d8b:	0f b6 00             	movzbl (%eax),%eax
     d8e:	84 c0                	test   %al,%al
     d90:	75 da                	jne    d6c <printf+0xe3>
     d92:	eb 65                	jmp    df9 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     d94:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     d98:	75 1d                	jne    db7 <printf+0x12e>
        putc(fd, *ap);
     d9a:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d9d:	8b 00                	mov    (%eax),%eax
     d9f:	0f be c0             	movsbl %al,%eax
     da2:	83 ec 08             	sub    $0x8,%esp
     da5:	50                   	push   %eax
     da6:	ff 75 08             	pushl  0x8(%ebp)
     da9:	e8 04 fe ff ff       	call   bb2 <putc>
     dae:	83 c4 10             	add    $0x10,%esp
        ap++;
     db1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     db5:	eb 42                	jmp    df9 <printf+0x170>
      } else if(c == '%'){
     db7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     dbb:	75 17                	jne    dd4 <printf+0x14b>
        putc(fd, c);
     dbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     dc0:	0f be c0             	movsbl %al,%eax
     dc3:	83 ec 08             	sub    $0x8,%esp
     dc6:	50                   	push   %eax
     dc7:	ff 75 08             	pushl  0x8(%ebp)
     dca:	e8 e3 fd ff ff       	call   bb2 <putc>
     dcf:	83 c4 10             	add    $0x10,%esp
     dd2:	eb 25                	jmp    df9 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     dd4:	83 ec 08             	sub    $0x8,%esp
     dd7:	6a 25                	push   $0x25
     dd9:	ff 75 08             	pushl  0x8(%ebp)
     ddc:	e8 d1 fd ff ff       	call   bb2 <putc>
     de1:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     de4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     de7:	0f be c0             	movsbl %al,%eax
     dea:	83 ec 08             	sub    $0x8,%esp
     ded:	50                   	push   %eax
     dee:	ff 75 08             	pushl  0x8(%ebp)
     df1:	e8 bc fd ff ff       	call   bb2 <putc>
     df6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     df9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e00:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     e04:	8b 55 0c             	mov    0xc(%ebp),%edx
     e07:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e0a:	01 d0                	add    %edx,%eax
     e0c:	0f b6 00             	movzbl (%eax),%eax
     e0f:	84 c0                	test   %al,%al
     e11:	0f 85 94 fe ff ff    	jne    cab <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     e17:	90                   	nop
     e18:	c9                   	leave  
     e19:	c3                   	ret    

00000e1a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     e1a:	55                   	push   %ebp
     e1b:	89 e5                	mov    %esp,%ebp
     e1d:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     e20:	8b 45 08             	mov    0x8(%ebp),%eax
     e23:	83 e8 08             	sub    $0x8,%eax
     e26:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e29:	a1 08 13 00 00       	mov    0x1308,%eax
     e2e:	89 45 fc             	mov    %eax,-0x4(%ebp)
     e31:	eb 24                	jmp    e57 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e33:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e36:	8b 00                	mov    (%eax),%eax
     e38:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     e3b:	77 12                	ja     e4f <free+0x35>
     e3d:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e40:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     e43:	77 24                	ja     e69 <free+0x4f>
     e45:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e48:	8b 00                	mov    (%eax),%eax
     e4a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     e4d:	77 1a                	ja     e69 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e4f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e52:	8b 00                	mov    (%eax),%eax
     e54:	89 45 fc             	mov    %eax,-0x4(%ebp)
     e57:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e5a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     e5d:	76 d4                	jbe    e33 <free+0x19>
     e5f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e62:	8b 00                	mov    (%eax),%eax
     e64:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     e67:	76 ca                	jbe    e33 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     e69:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e6c:	8b 40 04             	mov    0x4(%eax),%eax
     e6f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     e76:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e79:	01 c2                	add    %eax,%edx
     e7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e7e:	8b 00                	mov    (%eax),%eax
     e80:	39 c2                	cmp    %eax,%edx
     e82:	75 24                	jne    ea8 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     e84:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e87:	8b 50 04             	mov    0x4(%eax),%edx
     e8a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e8d:	8b 00                	mov    (%eax),%eax
     e8f:	8b 40 04             	mov    0x4(%eax),%eax
     e92:	01 c2                	add    %eax,%edx
     e94:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e97:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     e9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e9d:	8b 00                	mov    (%eax),%eax
     e9f:	8b 10                	mov    (%eax),%edx
     ea1:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ea4:	89 10                	mov    %edx,(%eax)
     ea6:	eb 0a                	jmp    eb2 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     ea8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     eab:	8b 10                	mov    (%eax),%edx
     ead:	8b 45 f8             	mov    -0x8(%ebp),%eax
     eb0:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     eb2:	8b 45 fc             	mov    -0x4(%ebp),%eax
     eb5:	8b 40 04             	mov    0x4(%eax),%eax
     eb8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     ebf:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ec2:	01 d0                	add    %edx,%eax
     ec4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     ec7:	75 20                	jne    ee9 <free+0xcf>
    p->s.size += bp->s.size;
     ec9:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ecc:	8b 50 04             	mov    0x4(%eax),%edx
     ecf:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ed2:	8b 40 04             	mov    0x4(%eax),%eax
     ed5:	01 c2                	add    %eax,%edx
     ed7:	8b 45 fc             	mov    -0x4(%ebp),%eax
     eda:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     edd:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ee0:	8b 10                	mov    (%eax),%edx
     ee2:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ee5:	89 10                	mov    %edx,(%eax)
     ee7:	eb 08                	jmp    ef1 <free+0xd7>
  } else
    p->s.ptr = bp;
     ee9:	8b 45 fc             	mov    -0x4(%ebp),%eax
     eec:	8b 55 f8             	mov    -0x8(%ebp),%edx
     eef:	89 10                	mov    %edx,(%eax)
  freep = p;
     ef1:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ef4:	a3 08 13 00 00       	mov    %eax,0x1308
}
     ef9:	90                   	nop
     efa:	c9                   	leave  
     efb:	c3                   	ret    

00000efc <morecore>:

static Header*
morecore(uint nu)
{
     efc:	55                   	push   %ebp
     efd:	89 e5                	mov    %esp,%ebp
     eff:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     f02:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     f09:	77 07                	ja     f12 <morecore+0x16>
    nu = 4096;
     f0b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     f12:	8b 45 08             	mov    0x8(%ebp),%eax
     f15:	c1 e0 03             	shl    $0x3,%eax
     f18:	83 ec 0c             	sub    $0xc,%esp
     f1b:	50                   	push   %eax
     f1c:	e8 7b f5 ff ff       	call   49c <sbrk>
     f21:	83 c4 10             	add    $0x10,%esp
     f24:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     f27:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     f2b:	75 07                	jne    f34 <morecore+0x38>
    return 0;
     f2d:	b8 00 00 00 00       	mov    $0x0,%eax
     f32:	eb 26                	jmp    f5a <morecore+0x5e>
  hp = (Header*)p;
     f34:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f37:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     f3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f3d:	8b 55 08             	mov    0x8(%ebp),%edx
     f40:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     f43:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f46:	83 c0 08             	add    $0x8,%eax
     f49:	83 ec 0c             	sub    $0xc,%esp
     f4c:	50                   	push   %eax
     f4d:	e8 c8 fe ff ff       	call   e1a <free>
     f52:	83 c4 10             	add    $0x10,%esp
  return freep;
     f55:	a1 08 13 00 00       	mov    0x1308,%eax
}
     f5a:	c9                   	leave  
     f5b:	c3                   	ret    

00000f5c <malloc>:

void*
malloc(uint nbytes)
{
     f5c:	55                   	push   %ebp
     f5d:	89 e5                	mov    %esp,%ebp
     f5f:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f62:	8b 45 08             	mov    0x8(%ebp),%eax
     f65:	83 c0 07             	add    $0x7,%eax
     f68:	c1 e8 03             	shr    $0x3,%eax
     f6b:	83 c0 01             	add    $0x1,%eax
     f6e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     f71:	a1 08 13 00 00       	mov    0x1308,%eax
     f76:	89 45 f0             	mov    %eax,-0x10(%ebp)
     f79:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     f7d:	75 23                	jne    fa2 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     f7f:	c7 45 f0 00 13 00 00 	movl   $0x1300,-0x10(%ebp)
     f86:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f89:	a3 08 13 00 00       	mov    %eax,0x1308
     f8e:	a1 08 13 00 00       	mov    0x1308,%eax
     f93:	a3 00 13 00 00       	mov    %eax,0x1300
    base.s.size = 0;
     f98:	c7 05 04 13 00 00 00 	movl   $0x0,0x1304
     f9f:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fa2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fa5:	8b 00                	mov    (%eax),%eax
     fa7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     faa:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fad:	8b 40 04             	mov    0x4(%eax),%eax
     fb0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     fb3:	72 4d                	jb     1002 <malloc+0xa6>
      if(p->s.size == nunits)
     fb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb8:	8b 40 04             	mov    0x4(%eax),%eax
     fbb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     fbe:	75 0c                	jne    fcc <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     fc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fc3:	8b 10                	mov    (%eax),%edx
     fc5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fc8:	89 10                	mov    %edx,(%eax)
     fca:	eb 26                	jmp    ff2 <malloc+0x96>
      else {
        p->s.size -= nunits;
     fcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fcf:	8b 40 04             	mov    0x4(%eax),%eax
     fd2:	2b 45 ec             	sub    -0x14(%ebp),%eax
     fd5:	89 c2                	mov    %eax,%edx
     fd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fda:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     fdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fe0:	8b 40 04             	mov    0x4(%eax),%eax
     fe3:	c1 e0 03             	shl    $0x3,%eax
     fe6:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     fe9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fec:	8b 55 ec             	mov    -0x14(%ebp),%edx
     fef:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     ff2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ff5:	a3 08 13 00 00       	mov    %eax,0x1308
      return (void*)(p + 1);
     ffa:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ffd:	83 c0 08             	add    $0x8,%eax
    1000:	eb 3b                	jmp    103d <malloc+0xe1>
    }
    if(p == freep)
    1002:	a1 08 13 00 00       	mov    0x1308,%eax
    1007:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    100a:	75 1e                	jne    102a <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    100c:	83 ec 0c             	sub    $0xc,%esp
    100f:	ff 75 ec             	pushl  -0x14(%ebp)
    1012:	e8 e5 fe ff ff       	call   efc <morecore>
    1017:	83 c4 10             	add    $0x10,%esp
    101a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    101d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1021:	75 07                	jne    102a <malloc+0xce>
        return 0;
    1023:	b8 00 00 00 00       	mov    $0x0,%eax
    1028:	eb 13                	jmp    103d <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    102a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    102d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1030:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1033:	8b 00                	mov    (%eax),%eax
    1035:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1038:	e9 6d ff ff ff       	jmp    faa <malloc+0x4e>
}
    103d:	c9                   	leave  
    103e:	c3                   	ret    
