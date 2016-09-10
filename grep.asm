
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 18             	sub    $0x18,%esp
  int n, m;
  char *p, *q;
  
  m = 0;
       6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
       d:	e9 b6 00 00 00       	jmp    c8 <grep+0xc8>
    m += n;
      12:	8b 45 ec             	mov    -0x14(%ebp),%eax
      15:	01 45 f4             	add    %eax,-0xc(%ebp)
    buf[m] = '\0';
      18:	8b 45 f4             	mov    -0xc(%ebp),%eax
      1b:	05 00 15 00 00       	add    $0x1500,%eax
      20:	c6 00 00             	movb   $0x0,(%eax)
    p = buf;
      23:	c7 45 f0 00 15 00 00 	movl   $0x1500,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
      2a:	eb 4a                	jmp    76 <grep+0x76>
      *q = 0;
      2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
      2f:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
      32:	83 ec 08             	sub    $0x8,%esp
      35:	ff 75 f0             	pushl  -0x10(%ebp)
      38:	ff 75 08             	pushl  0x8(%ebp)
      3b:	e8 9a 01 00 00       	call   1da <match>
      40:	83 c4 10             	add    $0x10,%esp
      43:	85 c0                	test   %eax,%eax
      45:	74 26                	je     6d <grep+0x6d>
        *q = '\n';
      47:	8b 45 e8             	mov    -0x18(%ebp),%eax
      4a:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
      4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
      50:	83 c0 01             	add    $0x1,%eax
      53:	89 c2                	mov    %eax,%edx
      55:	8b 45 f0             	mov    -0x10(%ebp),%eax
      58:	29 c2                	sub    %eax,%edx
      5a:	89 d0                	mov    %edx,%eax
      5c:	83 ec 04             	sub    $0x4,%esp
      5f:	50                   	push   %eax
      60:	ff 75 f0             	pushl  -0x10(%ebp)
      63:	6a 01                	push   $0x1
      65:	e8 43 05 00 00       	call   5ad <write>
      6a:	83 c4 10             	add    $0x10,%esp
      }
      p = q+1;
      6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
      70:	83 c0 01             	add    $0x1,%eax
      73:	89 45 f0             	mov    %eax,-0x10(%ebp)
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    m += n;
    buf[m] = '\0';
    p = buf;
    while((q = strchr(p, '\n')) != 0){
      76:	83 ec 08             	sub    $0x8,%esp
      79:	6a 0a                	push   $0xa
      7b:	ff 75 f0             	pushl  -0x10(%ebp)
      7e:	e8 89 03 00 00       	call   40c <strchr>
      83:	83 c4 10             	add    $0x10,%esp
      86:	89 45 e8             	mov    %eax,-0x18(%ebp)
      89:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
      8d:	75 9d                	jne    2c <grep+0x2c>
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
      8f:	81 7d f0 00 15 00 00 	cmpl   $0x1500,-0x10(%ebp)
      96:	75 07                	jne    9f <grep+0x9f>
      m = 0;
      98:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
      9f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      a3:	7e 23                	jle    c8 <grep+0xc8>
      m -= p - buf;
      a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
      a8:	ba 00 15 00 00       	mov    $0x1500,%edx
      ad:	29 d0                	sub    %edx,%eax
      af:	29 45 f4             	sub    %eax,-0xc(%ebp)
      memmove(buf, p, m);
      b2:	83 ec 04             	sub    $0x4,%esp
      b5:	ff 75 f4             	pushl  -0xc(%ebp)
      b8:	ff 75 f0             	pushl  -0x10(%ebp)
      bb:	68 00 15 00 00       	push   $0x1500
      c0:	e8 83 04 00 00       	call   548 <memmove>
      c5:	83 c4 10             	add    $0x10,%esp
{
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
      c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
      cb:	ba ff 03 00 00       	mov    $0x3ff,%edx
      d0:	29 c2                	sub    %eax,%edx
      d2:	89 d0                	mov    %edx,%eax
      d4:	89 c2                	mov    %eax,%edx
      d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
      d9:	05 00 15 00 00       	add    $0x1500,%eax
      de:	83 ec 04             	sub    $0x4,%esp
      e1:	52                   	push   %edx
      e2:	50                   	push   %eax
      e3:	ff 75 0c             	pushl  0xc(%ebp)
      e6:	e8 ba 04 00 00       	call   5a5 <read>
      eb:	83 c4 10             	add    $0x10,%esp
      ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
      f1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
      f5:	0f 8f 17 ff ff ff    	jg     12 <grep+0x12>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
      fb:	90                   	nop
      fc:	c9                   	leave  
      fd:	c3                   	ret    

000000fe <main>:

int
main(int argc, char *argv[])
{
      fe:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     102:	83 e4 f0             	and    $0xfffffff0,%esp
     105:	ff 71 fc             	pushl  -0x4(%ecx)
     108:	55                   	push   %ebp
     109:	89 e5                	mov    %esp,%ebp
     10b:	53                   	push   %ebx
     10c:	51                   	push   %ecx
     10d:	83 ec 10             	sub    $0x10,%esp
     110:	89 cb                	mov    %ecx,%ebx
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
     112:	83 3b 01             	cmpl   $0x1,(%ebx)
     115:	7f 17                	jg     12e <main+0x30>
    printf(2, "usage: grep pattern [file ...]\n");
     117:	83 ec 08             	sub    $0x8,%esp
     11a:	68 b8 11 00 00       	push   $0x11b8
     11f:	6a 02                	push   $0x2
     121:	e8 dc 0c 00 00       	call   e02 <printf>
     126:	83 c4 10             	add    $0x10,%esp
    exit();
     129:	e8 5f 04 00 00       	call   58d <exit>
  }
  pattern = argv[1];
     12e:	8b 43 04             	mov    0x4(%ebx),%eax
     131:	8b 40 04             	mov    0x4(%eax),%eax
     134:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  if(argc <= 2){
     137:	83 3b 02             	cmpl   $0x2,(%ebx)
     13a:	7f 15                	jg     151 <main+0x53>
    grep(pattern, 0);
     13c:	83 ec 08             	sub    $0x8,%esp
     13f:	6a 00                	push   $0x0
     141:	ff 75 f0             	pushl  -0x10(%ebp)
     144:	e8 b7 fe ff ff       	call   0 <grep>
     149:	83 c4 10             	add    $0x10,%esp
    exit();
     14c:	e8 3c 04 00 00       	call   58d <exit>
  }

  for(i = 2; i < argc; i++){
     151:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
     158:	eb 74                	jmp    1ce <main+0xd0>
    if((fd = open(argv[i], 0)) < 0){
     15a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     15d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     164:	8b 43 04             	mov    0x4(%ebx),%eax
     167:	01 d0                	add    %edx,%eax
     169:	8b 00                	mov    (%eax),%eax
     16b:	83 ec 08             	sub    $0x8,%esp
     16e:	6a 00                	push   $0x0
     170:	50                   	push   %eax
     171:	e8 57 04 00 00       	call   5cd <open>
     176:	83 c4 10             	add    $0x10,%esp
     179:	89 45 ec             	mov    %eax,-0x14(%ebp)
     17c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     180:	79 29                	jns    1ab <main+0xad>
      printf(1, "grep: cannot open %s\n", argv[i]);
     182:	8b 45 f4             	mov    -0xc(%ebp),%eax
     185:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     18c:	8b 43 04             	mov    0x4(%ebx),%eax
     18f:	01 d0                	add    %edx,%eax
     191:	8b 00                	mov    (%eax),%eax
     193:	83 ec 04             	sub    $0x4,%esp
     196:	50                   	push   %eax
     197:	68 d8 11 00 00       	push   $0x11d8
     19c:	6a 01                	push   $0x1
     19e:	e8 5f 0c 00 00       	call   e02 <printf>
     1a3:	83 c4 10             	add    $0x10,%esp
      exit();
     1a6:	e8 e2 03 00 00       	call   58d <exit>
    }
    grep(pattern, fd);
     1ab:	83 ec 08             	sub    $0x8,%esp
     1ae:	ff 75 ec             	pushl  -0x14(%ebp)
     1b1:	ff 75 f0             	pushl  -0x10(%ebp)
     1b4:	e8 47 fe ff ff       	call   0 <grep>
     1b9:	83 c4 10             	add    $0x10,%esp
    close(fd);
     1bc:	83 ec 0c             	sub    $0xc,%esp
     1bf:	ff 75 ec             	pushl  -0x14(%ebp)
     1c2:	e8 ee 03 00 00       	call   5b5 <close>
     1c7:	83 c4 10             	add    $0x10,%esp
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
     1ca:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     1ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1d1:	3b 03                	cmp    (%ebx),%eax
     1d3:	7c 85                	jl     15a <main+0x5c>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
     1d5:	e8 b3 03 00 00       	call   58d <exit>

000001da <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
     1da:	55                   	push   %ebp
     1db:	89 e5                	mov    %esp,%ebp
     1dd:	83 ec 08             	sub    $0x8,%esp
  if(re[0] == '^')
     1e0:	8b 45 08             	mov    0x8(%ebp),%eax
     1e3:	0f b6 00             	movzbl (%eax),%eax
     1e6:	3c 5e                	cmp    $0x5e,%al
     1e8:	75 17                	jne    201 <match+0x27>
    return matchhere(re+1, text);
     1ea:	8b 45 08             	mov    0x8(%ebp),%eax
     1ed:	83 c0 01             	add    $0x1,%eax
     1f0:	83 ec 08             	sub    $0x8,%esp
     1f3:	ff 75 0c             	pushl  0xc(%ebp)
     1f6:	50                   	push   %eax
     1f7:	e8 38 00 00 00       	call   234 <matchhere>
     1fc:	83 c4 10             	add    $0x10,%esp
     1ff:	eb 31                	jmp    232 <match+0x58>
  do{  // must look at empty string
    if(matchhere(re, text))
     201:	83 ec 08             	sub    $0x8,%esp
     204:	ff 75 0c             	pushl  0xc(%ebp)
     207:	ff 75 08             	pushl  0x8(%ebp)
     20a:	e8 25 00 00 00       	call   234 <matchhere>
     20f:	83 c4 10             	add    $0x10,%esp
     212:	85 c0                	test   %eax,%eax
     214:	74 07                	je     21d <match+0x43>
      return 1;
     216:	b8 01 00 00 00       	mov    $0x1,%eax
     21b:	eb 15                	jmp    232 <match+0x58>
  }while(*text++ != '\0');
     21d:	8b 45 0c             	mov    0xc(%ebp),%eax
     220:	8d 50 01             	lea    0x1(%eax),%edx
     223:	89 55 0c             	mov    %edx,0xc(%ebp)
     226:	0f b6 00             	movzbl (%eax),%eax
     229:	84 c0                	test   %al,%al
     22b:	75 d4                	jne    201 <match+0x27>
  return 0;
     22d:	b8 00 00 00 00       	mov    $0x0,%eax
}
     232:	c9                   	leave  
     233:	c3                   	ret    

00000234 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
     234:	55                   	push   %ebp
     235:	89 e5                	mov    %esp,%ebp
     237:	83 ec 08             	sub    $0x8,%esp
  if(re[0] == '\0')
     23a:	8b 45 08             	mov    0x8(%ebp),%eax
     23d:	0f b6 00             	movzbl (%eax),%eax
     240:	84 c0                	test   %al,%al
     242:	75 0a                	jne    24e <matchhere+0x1a>
    return 1;
     244:	b8 01 00 00 00       	mov    $0x1,%eax
     249:	e9 99 00 00 00       	jmp    2e7 <matchhere+0xb3>
  if(re[1] == '*')
     24e:	8b 45 08             	mov    0x8(%ebp),%eax
     251:	83 c0 01             	add    $0x1,%eax
     254:	0f b6 00             	movzbl (%eax),%eax
     257:	3c 2a                	cmp    $0x2a,%al
     259:	75 21                	jne    27c <matchhere+0x48>
    return matchstar(re[0], re+2, text);
     25b:	8b 45 08             	mov    0x8(%ebp),%eax
     25e:	8d 50 02             	lea    0x2(%eax),%edx
     261:	8b 45 08             	mov    0x8(%ebp),%eax
     264:	0f b6 00             	movzbl (%eax),%eax
     267:	0f be c0             	movsbl %al,%eax
     26a:	83 ec 04             	sub    $0x4,%esp
     26d:	ff 75 0c             	pushl  0xc(%ebp)
     270:	52                   	push   %edx
     271:	50                   	push   %eax
     272:	e8 72 00 00 00       	call   2e9 <matchstar>
     277:	83 c4 10             	add    $0x10,%esp
     27a:	eb 6b                	jmp    2e7 <matchhere+0xb3>
  if(re[0] == '$' && re[1] == '\0')
     27c:	8b 45 08             	mov    0x8(%ebp),%eax
     27f:	0f b6 00             	movzbl (%eax),%eax
     282:	3c 24                	cmp    $0x24,%al
     284:	75 1d                	jne    2a3 <matchhere+0x6f>
     286:	8b 45 08             	mov    0x8(%ebp),%eax
     289:	83 c0 01             	add    $0x1,%eax
     28c:	0f b6 00             	movzbl (%eax),%eax
     28f:	84 c0                	test   %al,%al
     291:	75 10                	jne    2a3 <matchhere+0x6f>
    return *text == '\0';
     293:	8b 45 0c             	mov    0xc(%ebp),%eax
     296:	0f b6 00             	movzbl (%eax),%eax
     299:	84 c0                	test   %al,%al
     29b:	0f 94 c0             	sete   %al
     29e:	0f b6 c0             	movzbl %al,%eax
     2a1:	eb 44                	jmp    2e7 <matchhere+0xb3>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
     2a3:	8b 45 0c             	mov    0xc(%ebp),%eax
     2a6:	0f b6 00             	movzbl (%eax),%eax
     2a9:	84 c0                	test   %al,%al
     2ab:	74 35                	je     2e2 <matchhere+0xae>
     2ad:	8b 45 08             	mov    0x8(%ebp),%eax
     2b0:	0f b6 00             	movzbl (%eax),%eax
     2b3:	3c 2e                	cmp    $0x2e,%al
     2b5:	74 10                	je     2c7 <matchhere+0x93>
     2b7:	8b 45 08             	mov    0x8(%ebp),%eax
     2ba:	0f b6 10             	movzbl (%eax),%edx
     2bd:	8b 45 0c             	mov    0xc(%ebp),%eax
     2c0:	0f b6 00             	movzbl (%eax),%eax
     2c3:	38 c2                	cmp    %al,%dl
     2c5:	75 1b                	jne    2e2 <matchhere+0xae>
    return matchhere(re+1, text+1);
     2c7:	8b 45 0c             	mov    0xc(%ebp),%eax
     2ca:	8d 50 01             	lea    0x1(%eax),%edx
     2cd:	8b 45 08             	mov    0x8(%ebp),%eax
     2d0:	83 c0 01             	add    $0x1,%eax
     2d3:	83 ec 08             	sub    $0x8,%esp
     2d6:	52                   	push   %edx
     2d7:	50                   	push   %eax
     2d8:	e8 57 ff ff ff       	call   234 <matchhere>
     2dd:	83 c4 10             	add    $0x10,%esp
     2e0:	eb 05                	jmp    2e7 <matchhere+0xb3>
  return 0;
     2e2:	b8 00 00 00 00       	mov    $0x0,%eax
}
     2e7:	c9                   	leave  
     2e8:	c3                   	ret    

000002e9 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
     2e9:	55                   	push   %ebp
     2ea:	89 e5                	mov    %esp,%ebp
     2ec:	83 ec 08             	sub    $0x8,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
     2ef:	83 ec 08             	sub    $0x8,%esp
     2f2:	ff 75 10             	pushl  0x10(%ebp)
     2f5:	ff 75 0c             	pushl  0xc(%ebp)
     2f8:	e8 37 ff ff ff       	call   234 <matchhere>
     2fd:	83 c4 10             	add    $0x10,%esp
     300:	85 c0                	test   %eax,%eax
     302:	74 07                	je     30b <matchstar+0x22>
      return 1;
     304:	b8 01 00 00 00       	mov    $0x1,%eax
     309:	eb 29                	jmp    334 <matchstar+0x4b>
  }while(*text!='\0' && (*text++==c || c=='.'));
     30b:	8b 45 10             	mov    0x10(%ebp),%eax
     30e:	0f b6 00             	movzbl (%eax),%eax
     311:	84 c0                	test   %al,%al
     313:	74 1a                	je     32f <matchstar+0x46>
     315:	8b 45 10             	mov    0x10(%ebp),%eax
     318:	8d 50 01             	lea    0x1(%eax),%edx
     31b:	89 55 10             	mov    %edx,0x10(%ebp)
     31e:	0f b6 00             	movzbl (%eax),%eax
     321:	0f be c0             	movsbl %al,%eax
     324:	3b 45 08             	cmp    0x8(%ebp),%eax
     327:	74 c6                	je     2ef <matchstar+0x6>
     329:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
     32d:	74 c0                	je     2ef <matchstar+0x6>
  return 0;
     32f:	b8 00 00 00 00       	mov    $0x0,%eax
}
     334:	c9                   	leave  
     335:	c3                   	ret    

00000336 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     336:	55                   	push   %ebp
     337:	89 e5                	mov    %esp,%ebp
     339:	57                   	push   %edi
     33a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     33b:	8b 4d 08             	mov    0x8(%ebp),%ecx
     33e:	8b 55 10             	mov    0x10(%ebp),%edx
     341:	8b 45 0c             	mov    0xc(%ebp),%eax
     344:	89 cb                	mov    %ecx,%ebx
     346:	89 df                	mov    %ebx,%edi
     348:	89 d1                	mov    %edx,%ecx
     34a:	fc                   	cld    
     34b:	f3 aa                	rep stos %al,%es:(%edi)
     34d:	89 ca                	mov    %ecx,%edx
     34f:	89 fb                	mov    %edi,%ebx
     351:	89 5d 08             	mov    %ebx,0x8(%ebp)
     354:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     357:	90                   	nop
     358:	5b                   	pop    %ebx
     359:	5f                   	pop    %edi
     35a:	5d                   	pop    %ebp
     35b:	c3                   	ret    

0000035c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     35c:	55                   	push   %ebp
     35d:	89 e5                	mov    %esp,%ebp
     35f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     362:	8b 45 08             	mov    0x8(%ebp),%eax
     365:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     368:	90                   	nop
     369:	8b 45 08             	mov    0x8(%ebp),%eax
     36c:	8d 50 01             	lea    0x1(%eax),%edx
     36f:	89 55 08             	mov    %edx,0x8(%ebp)
     372:	8b 55 0c             	mov    0xc(%ebp),%edx
     375:	8d 4a 01             	lea    0x1(%edx),%ecx
     378:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     37b:	0f b6 12             	movzbl (%edx),%edx
     37e:	88 10                	mov    %dl,(%eax)
     380:	0f b6 00             	movzbl (%eax),%eax
     383:	84 c0                	test   %al,%al
     385:	75 e2                	jne    369 <strcpy+0xd>
    ;
  return os;
     387:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     38a:	c9                   	leave  
     38b:	c3                   	ret    

0000038c <strcmp>:

int
strcmp(const char *p, const char *q)
{
     38c:	55                   	push   %ebp
     38d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     38f:	eb 08                	jmp    399 <strcmp+0xd>
    p++, q++;
     391:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     395:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     399:	8b 45 08             	mov    0x8(%ebp),%eax
     39c:	0f b6 00             	movzbl (%eax),%eax
     39f:	84 c0                	test   %al,%al
     3a1:	74 10                	je     3b3 <strcmp+0x27>
     3a3:	8b 45 08             	mov    0x8(%ebp),%eax
     3a6:	0f b6 10             	movzbl (%eax),%edx
     3a9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ac:	0f b6 00             	movzbl (%eax),%eax
     3af:	38 c2                	cmp    %al,%dl
     3b1:	74 de                	je     391 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     3b3:	8b 45 08             	mov    0x8(%ebp),%eax
     3b6:	0f b6 00             	movzbl (%eax),%eax
     3b9:	0f b6 d0             	movzbl %al,%edx
     3bc:	8b 45 0c             	mov    0xc(%ebp),%eax
     3bf:	0f b6 00             	movzbl (%eax),%eax
     3c2:	0f b6 c0             	movzbl %al,%eax
     3c5:	29 c2                	sub    %eax,%edx
     3c7:	89 d0                	mov    %edx,%eax
}
     3c9:	5d                   	pop    %ebp
     3ca:	c3                   	ret    

000003cb <strlen>:

uint
strlen(char *s)
{
     3cb:	55                   	push   %ebp
     3cc:	89 e5                	mov    %esp,%ebp
     3ce:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     3d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     3d8:	eb 04                	jmp    3de <strlen+0x13>
     3da:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     3de:	8b 55 fc             	mov    -0x4(%ebp),%edx
     3e1:	8b 45 08             	mov    0x8(%ebp),%eax
     3e4:	01 d0                	add    %edx,%eax
     3e6:	0f b6 00             	movzbl (%eax),%eax
     3e9:	84 c0                	test   %al,%al
     3eb:	75 ed                	jne    3da <strlen+0xf>
    ;
  return n;
     3ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     3f0:	c9                   	leave  
     3f1:	c3                   	ret    

000003f2 <memset>:

void*
memset(void *dst, int c, uint n)
{
     3f2:	55                   	push   %ebp
     3f3:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     3f5:	8b 45 10             	mov    0x10(%ebp),%eax
     3f8:	50                   	push   %eax
     3f9:	ff 75 0c             	pushl  0xc(%ebp)
     3fc:	ff 75 08             	pushl  0x8(%ebp)
     3ff:	e8 32 ff ff ff       	call   336 <stosb>
     404:	83 c4 0c             	add    $0xc,%esp
  return dst;
     407:	8b 45 08             	mov    0x8(%ebp),%eax
}
     40a:	c9                   	leave  
     40b:	c3                   	ret    

0000040c <strchr>:

char*
strchr(const char *s, char c)
{
     40c:	55                   	push   %ebp
     40d:	89 e5                	mov    %esp,%ebp
     40f:	83 ec 04             	sub    $0x4,%esp
     412:	8b 45 0c             	mov    0xc(%ebp),%eax
     415:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     418:	eb 14                	jmp    42e <strchr+0x22>
    if(*s == c)
     41a:	8b 45 08             	mov    0x8(%ebp),%eax
     41d:	0f b6 00             	movzbl (%eax),%eax
     420:	3a 45 fc             	cmp    -0x4(%ebp),%al
     423:	75 05                	jne    42a <strchr+0x1e>
      return (char*)s;
     425:	8b 45 08             	mov    0x8(%ebp),%eax
     428:	eb 13                	jmp    43d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     42a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     42e:	8b 45 08             	mov    0x8(%ebp),%eax
     431:	0f b6 00             	movzbl (%eax),%eax
     434:	84 c0                	test   %al,%al
     436:	75 e2                	jne    41a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     438:	b8 00 00 00 00       	mov    $0x0,%eax
}
     43d:	c9                   	leave  
     43e:	c3                   	ret    

0000043f <gets>:

char*
gets(char *buf, int max)
{
     43f:	55                   	push   %ebp
     440:	89 e5                	mov    %esp,%ebp
     442:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     445:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     44c:	eb 42                	jmp    490 <gets+0x51>
    cc = read(0, &c, 1);
     44e:	83 ec 04             	sub    $0x4,%esp
     451:	6a 01                	push   $0x1
     453:	8d 45 ef             	lea    -0x11(%ebp),%eax
     456:	50                   	push   %eax
     457:	6a 00                	push   $0x0
     459:	e8 47 01 00 00       	call   5a5 <read>
     45e:	83 c4 10             	add    $0x10,%esp
     461:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     464:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     468:	7e 33                	jle    49d <gets+0x5e>
      break;
    buf[i++] = c;
     46a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     46d:	8d 50 01             	lea    0x1(%eax),%edx
     470:	89 55 f4             	mov    %edx,-0xc(%ebp)
     473:	89 c2                	mov    %eax,%edx
     475:	8b 45 08             	mov    0x8(%ebp),%eax
     478:	01 c2                	add    %eax,%edx
     47a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     47e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     480:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     484:	3c 0a                	cmp    $0xa,%al
     486:	74 16                	je     49e <gets+0x5f>
     488:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     48c:	3c 0d                	cmp    $0xd,%al
     48e:	74 0e                	je     49e <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     490:	8b 45 f4             	mov    -0xc(%ebp),%eax
     493:	83 c0 01             	add    $0x1,%eax
     496:	3b 45 0c             	cmp    0xc(%ebp),%eax
     499:	7c b3                	jl     44e <gets+0xf>
     49b:	eb 01                	jmp    49e <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     49d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     49e:	8b 55 f4             	mov    -0xc(%ebp),%edx
     4a1:	8b 45 08             	mov    0x8(%ebp),%eax
     4a4:	01 d0                	add    %edx,%eax
     4a6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     4a9:	8b 45 08             	mov    0x8(%ebp),%eax
}
     4ac:	c9                   	leave  
     4ad:	c3                   	ret    

000004ae <stat>:

int
stat(char *n, struct stat *st)
{
     4ae:	55                   	push   %ebp
     4af:	89 e5                	mov    %esp,%ebp
     4b1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     4b4:	83 ec 08             	sub    $0x8,%esp
     4b7:	6a 00                	push   $0x0
     4b9:	ff 75 08             	pushl  0x8(%ebp)
     4bc:	e8 0c 01 00 00       	call   5cd <open>
     4c1:	83 c4 10             	add    $0x10,%esp
     4c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     4c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     4cb:	79 07                	jns    4d4 <stat+0x26>
    return -1;
     4cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     4d2:	eb 25                	jmp    4f9 <stat+0x4b>
  r = fstat(fd, st);
     4d4:	83 ec 08             	sub    $0x8,%esp
     4d7:	ff 75 0c             	pushl  0xc(%ebp)
     4da:	ff 75 f4             	pushl  -0xc(%ebp)
     4dd:	e8 03 01 00 00       	call   5e5 <fstat>
     4e2:	83 c4 10             	add    $0x10,%esp
     4e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     4e8:	83 ec 0c             	sub    $0xc,%esp
     4eb:	ff 75 f4             	pushl  -0xc(%ebp)
     4ee:	e8 c2 00 00 00       	call   5b5 <close>
     4f3:	83 c4 10             	add    $0x10,%esp
  return r;
     4f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     4f9:	c9                   	leave  
     4fa:	c3                   	ret    

000004fb <atoi>:

int
atoi(const char *s)
{
     4fb:	55                   	push   %ebp
     4fc:	89 e5                	mov    %esp,%ebp
     4fe:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     501:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     508:	eb 25                	jmp    52f <atoi+0x34>
    n = n*10 + *s++ - '0';
     50a:	8b 55 fc             	mov    -0x4(%ebp),%edx
     50d:	89 d0                	mov    %edx,%eax
     50f:	c1 e0 02             	shl    $0x2,%eax
     512:	01 d0                	add    %edx,%eax
     514:	01 c0                	add    %eax,%eax
     516:	89 c1                	mov    %eax,%ecx
     518:	8b 45 08             	mov    0x8(%ebp),%eax
     51b:	8d 50 01             	lea    0x1(%eax),%edx
     51e:	89 55 08             	mov    %edx,0x8(%ebp)
     521:	0f b6 00             	movzbl (%eax),%eax
     524:	0f be c0             	movsbl %al,%eax
     527:	01 c8                	add    %ecx,%eax
     529:	83 e8 30             	sub    $0x30,%eax
     52c:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     52f:	8b 45 08             	mov    0x8(%ebp),%eax
     532:	0f b6 00             	movzbl (%eax),%eax
     535:	3c 2f                	cmp    $0x2f,%al
     537:	7e 0a                	jle    543 <atoi+0x48>
     539:	8b 45 08             	mov    0x8(%ebp),%eax
     53c:	0f b6 00             	movzbl (%eax),%eax
     53f:	3c 39                	cmp    $0x39,%al
     541:	7e c7                	jle    50a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     543:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     546:	c9                   	leave  
     547:	c3                   	ret    

00000548 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     548:	55                   	push   %ebp
     549:	89 e5                	mov    %esp,%ebp
     54b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     54e:	8b 45 08             	mov    0x8(%ebp),%eax
     551:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     554:	8b 45 0c             	mov    0xc(%ebp),%eax
     557:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     55a:	eb 17                	jmp    573 <memmove+0x2b>
    *dst++ = *src++;
     55c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     55f:	8d 50 01             	lea    0x1(%eax),%edx
     562:	89 55 fc             	mov    %edx,-0x4(%ebp)
     565:	8b 55 f8             	mov    -0x8(%ebp),%edx
     568:	8d 4a 01             	lea    0x1(%edx),%ecx
     56b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     56e:	0f b6 12             	movzbl (%edx),%edx
     571:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     573:	8b 45 10             	mov    0x10(%ebp),%eax
     576:	8d 50 ff             	lea    -0x1(%eax),%edx
     579:	89 55 10             	mov    %edx,0x10(%ebp)
     57c:	85 c0                	test   %eax,%eax
     57e:	7f dc                	jg     55c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     580:	8b 45 08             	mov    0x8(%ebp),%eax
}
     583:	c9                   	leave  
     584:	c3                   	ret    

00000585 <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
     585:	b8 01 00 00 00       	mov    $0x1,%eax
     58a:	cd 40                	int    $0x40
     58c:	c3                   	ret    

0000058d <exit>:
SYSCALL(exit)
     58d:	b8 02 00 00 00       	mov    $0x2,%eax
     592:	cd 40                	int    $0x40
     594:	c3                   	ret    

00000595 <wait>:
SYSCALL(wait)
     595:	b8 03 00 00 00       	mov    $0x3,%eax
     59a:	cd 40                	int    $0x40
     59c:	c3                   	ret    

0000059d <pipe>:
SYSCALL(pipe)
     59d:	b8 04 00 00 00       	mov    $0x4,%eax
     5a2:	cd 40                	int    $0x40
     5a4:	c3                   	ret    

000005a5 <read>:
SYSCALL(read)
     5a5:	b8 05 00 00 00       	mov    $0x5,%eax
     5aa:	cd 40                	int    $0x40
     5ac:	c3                   	ret    

000005ad <write>:
SYSCALL(write)
     5ad:	b8 10 00 00 00       	mov    $0x10,%eax
     5b2:	cd 40                	int    $0x40
     5b4:	c3                   	ret    

000005b5 <close>:
SYSCALL(close)
     5b5:	b8 15 00 00 00       	mov    $0x15,%eax
     5ba:	cd 40                	int    $0x40
     5bc:	c3                   	ret    

000005bd <kill>:
SYSCALL(kill)
     5bd:	b8 06 00 00 00       	mov    $0x6,%eax
     5c2:	cd 40                	int    $0x40
     5c4:	c3                   	ret    

000005c5 <exec>:
SYSCALL(exec)
     5c5:	b8 07 00 00 00       	mov    $0x7,%eax
     5ca:	cd 40                	int    $0x40
     5cc:	c3                   	ret    

000005cd <open>:
SYSCALL(open)
     5cd:	b8 0f 00 00 00       	mov    $0xf,%eax
     5d2:	cd 40                	int    $0x40
     5d4:	c3                   	ret    

000005d5 <mknod>:
SYSCALL(mknod)
     5d5:	b8 11 00 00 00       	mov    $0x11,%eax
     5da:	cd 40                	int    $0x40
     5dc:	c3                   	ret    

000005dd <unlink>:
SYSCALL(unlink)
     5dd:	b8 12 00 00 00       	mov    $0x12,%eax
     5e2:	cd 40                	int    $0x40
     5e4:	c3                   	ret    

000005e5 <fstat>:
SYSCALL(fstat)
     5e5:	b8 08 00 00 00       	mov    $0x8,%eax
     5ea:	cd 40                	int    $0x40
     5ec:	c3                   	ret    

000005ed <link>:
SYSCALL(link)
     5ed:	b8 13 00 00 00       	mov    $0x13,%eax
     5f2:	cd 40                	int    $0x40
     5f4:	c3                   	ret    

000005f5 <mkdir>:
SYSCALL(mkdir)
     5f5:	b8 14 00 00 00       	mov    $0x14,%eax
     5fa:	cd 40                	int    $0x40
     5fc:	c3                   	ret    

000005fd <chdir>:
SYSCALL(chdir)
     5fd:	b8 09 00 00 00       	mov    $0x9,%eax
     602:	cd 40                	int    $0x40
     604:	c3                   	ret    

00000605 <dup>:
SYSCALL(dup)
     605:	b8 0a 00 00 00       	mov    $0xa,%eax
     60a:	cd 40                	int    $0x40
     60c:	c3                   	ret    

0000060d <getpid>:
SYSCALL(getpid)
     60d:	b8 0b 00 00 00       	mov    $0xb,%eax
     612:	cd 40                	int    $0x40
     614:	c3                   	ret    

00000615 <sbrk>:
SYSCALL(sbrk)
     615:	b8 0c 00 00 00       	mov    $0xc,%eax
     61a:	cd 40                	int    $0x40
     61c:	c3                   	ret    

0000061d <sleep>:
SYSCALL(sleep)
     61d:	b8 0d 00 00 00       	mov    $0xd,%eax
     622:	cd 40                	int    $0x40
     624:	c3                   	ret    

00000625 <uptime>:
SYSCALL(uptime)
     625:	b8 0e 00 00 00       	mov    $0xe,%eax
     62a:	cd 40                	int    $0x40
     62c:	c3                   	ret    

0000062d <date>:

// Assignment starts here

SYSCALL(date)
     62d:	b8 16 00 00 00       	mov    $0x16,%eax
     632:	cd 40                	int    $0x40
     634:	c3                   	ret    

00000635 <str_ls_call1>:
     635:	6c                   	insb   (%dx),%es:(%edi)
     636:	73 5f                	jae    697 <ls_call6+0x4>
     638:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     63b:	6c                   	insb   (%dx),%es:(%edi)
     63c:	31 00                	xor    %eax,(%eax)

0000063e <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
     63e:	b8 35 06 00 00       	mov    $0x635,%eax
     643:	cd 41                	int    $0x41
     645:	c3                   	ret    

00000646 <str_ls_call2>:
     646:	6c                   	insb   (%dx),%es:(%edi)
     647:	73 5f                	jae    6a8 <ls_call7+0x4>
     649:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     64c:	6c                   	insb   (%dx),%es:(%edi)
     64d:	32 00                	xor    (%eax),%al

0000064f <ls_call2>:
CS550LSSYSCALL(ls_call2)
     64f:	b8 46 06 00 00       	mov    $0x646,%eax
     654:	cd 41                	int    $0x41
     656:	c3                   	ret    

00000657 <str_ls_call3>:
     657:	6c                   	insb   (%dx),%es:(%edi)
     658:	73 5f                	jae    6b9 <ls_call8+0x4>
     65a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     65d:	6c                   	insb   (%dx),%es:(%edi)
     65e:	33 00                	xor    (%eax),%eax

00000660 <ls_call3>:
CS550LSSYSCALL(ls_call3)
     660:	b8 57 06 00 00       	mov    $0x657,%eax
     665:	cd 41                	int    $0x41
     667:	c3                   	ret    

00000668 <str_ls_call4>:
     668:	6c                   	insb   (%dx),%es:(%edi)
     669:	73 5f                	jae    6ca <ls_call9+0x4>
     66b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     66e:	6c                   	insb   (%dx),%es:(%edi)
     66f:	34 00                	xor    $0x0,%al

00000671 <ls_call4>:
CS550LSSYSCALL(ls_call4)
     671:	b8 68 06 00 00       	mov    $0x668,%eax
     676:	cd 41                	int    $0x41
     678:	c3                   	ret    

00000679 <str_ls_call5>:
     679:	6c                   	insb   (%dx),%es:(%edi)
     67a:	73 5f                	jae    6db <ls_call10+0x3>
     67c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     67f:	6c                   	insb   (%dx),%es:(%edi)
     680:	35                   	.byte 0x35
	...

00000682 <ls_call5>:
CS550LSSYSCALL(ls_call5)
     682:	b8 79 06 00 00       	mov    $0x679,%eax
     687:	cd 41                	int    $0x41
     689:	c3                   	ret    

0000068a <str_ls_call6>:
     68a:	6c                   	insb   (%dx),%es:(%edi)
     68b:	73 5f                	jae    6ec <ls_call11+0x2>
     68d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     690:	6c                   	insb   (%dx),%es:(%edi)
     691:	36                   	ss
	...

00000693 <ls_call6>:
CS550LSSYSCALL(ls_call6)
     693:	b8 8a 06 00 00       	mov    $0x68a,%eax
     698:	cd 41                	int    $0x41
     69a:	c3                   	ret    

0000069b <str_ls_call7>:
     69b:	6c                   	insb   (%dx),%es:(%edi)
     69c:	73 5f                	jae    6fd <ls_call12+0x1>
     69e:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6a1:	6c                   	insb   (%dx),%es:(%edi)
     6a2:	37                   	aaa    
	...

000006a4 <ls_call7>:
CS550LSSYSCALL(ls_call7)
     6a4:	b8 9b 06 00 00       	mov    $0x69b,%eax
     6a9:	cd 41                	int    $0x41
     6ab:	c3                   	ret    

000006ac <str_ls_call8>:
     6ac:	6c                   	insb   (%dx),%es:(%edi)
     6ad:	73 5f                	jae    70e <ls_call13>
     6af:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6b2:	6c                   	insb   (%dx),%es:(%edi)
     6b3:	38 00                	cmp    %al,(%eax)

000006b5 <ls_call8>:
CS550LSSYSCALL(ls_call8)
     6b5:	b8 ac 06 00 00       	mov    $0x6ac,%eax
     6ba:	cd 41                	int    $0x41
     6bc:	c3                   	ret    

000006bd <str_ls_call9>:
     6bd:	6c                   	insb   (%dx),%es:(%edi)
     6be:	73 5f                	jae    71f <str_ls_call14+0x9>
     6c0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6c3:	6c                   	insb   (%dx),%es:(%edi)
     6c4:	39 00                	cmp    %eax,(%eax)

000006c6 <ls_call9>:
CS550LSSYSCALL(ls_call9)
     6c6:	b8 bd 06 00 00       	mov    $0x6bd,%eax
     6cb:	cd 41                	int    $0x41
     6cd:	c3                   	ret    

000006ce <str_ls_call10>:
     6ce:	6c                   	insb   (%dx),%es:(%edi)
     6cf:	73 5f                	jae    730 <str_ls_call15+0x8>
     6d1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6d4:	6c                   	insb   (%dx),%es:(%edi)
     6d5:	31 30                	xor    %esi,(%eax)
	...

000006d8 <ls_call10>:
CS550LSSYSCALL(ls_call10)
     6d8:	b8 ce 06 00 00       	mov    $0x6ce,%eax
     6dd:	cd 41                	int    $0x41
     6df:	c3                   	ret    

000006e0 <str_ls_call11>:
     6e0:	6c                   	insb   (%dx),%es:(%edi)
     6e1:	73 5f                	jae    742 <str_ls_call16+0x8>
     6e3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6e6:	6c                   	insb   (%dx),%es:(%edi)
     6e7:	31 31                	xor    %esi,(%ecx)
	...

000006ea <ls_call11>:
CS550LSSYSCALL(ls_call11)
     6ea:	b8 e0 06 00 00       	mov    $0x6e0,%eax
     6ef:	cd 41                	int    $0x41
     6f1:	c3                   	ret    

000006f2 <str_ls_call12>:
     6f2:	6c                   	insb   (%dx),%es:(%edi)
     6f3:	73 5f                	jae    754 <str_ls_call17+0x8>
     6f5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6f8:	6c                   	insb   (%dx),%es:(%edi)
     6f9:	31 32                	xor    %esi,(%edx)
	...

000006fc <ls_call12>:
CS550LSSYSCALL(ls_call12)
     6fc:	b8 f2 06 00 00       	mov    $0x6f2,%eax
     701:	cd 41                	int    $0x41
     703:	c3                   	ret    

00000704 <str_ls_call13>:
     704:	6c                   	insb   (%dx),%es:(%edi)
     705:	73 5f                	jae    766 <str_ls_call18+0x8>
     707:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     70a:	6c                   	insb   (%dx),%es:(%edi)
     70b:	31 33                	xor    %esi,(%ebx)
	...

0000070e <ls_call13>:
CS550LSSYSCALL(ls_call13)
     70e:	b8 04 07 00 00       	mov    $0x704,%eax
     713:	cd 41                	int    $0x41
     715:	c3                   	ret    

00000716 <str_ls_call14>:
     716:	6c                   	insb   (%dx),%es:(%edi)
     717:	73 5f                	jae    778 <str_ls_call19+0x8>
     719:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     71c:	6c                   	insb   (%dx),%es:(%edi)
     71d:	31 34 00             	xor    %esi,(%eax,%eax,1)

00000720 <ls_call14>:
CS550LSSYSCALL(ls_call14)
     720:	b8 16 07 00 00       	mov    $0x716,%eax
     725:	cd 41                	int    $0x41
     727:	c3                   	ret    

00000728 <str_ls_call15>:
     728:	6c                   	insb   (%dx),%es:(%edi)
     729:	73 5f                	jae    78a <str_ls_call20+0x8>
     72b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     72e:	6c                   	insb   (%dx),%es:(%edi)
     72f:	31                   	.byte 0x31
     730:	35                   	.byte 0x35
	...

00000732 <ls_call15>:
CS550LSSYSCALL(ls_call15)
     732:	b8 28 07 00 00       	mov    $0x728,%eax
     737:	cd 41                	int    $0x41
     739:	c3                   	ret    

0000073a <str_ls_call16>:
     73a:	6c                   	insb   (%dx),%es:(%edi)
     73b:	73 5f                	jae    79c <str_ls_call21+0x8>
     73d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     740:	6c                   	insb   (%dx),%es:(%edi)
     741:	31 36                	xor    %esi,(%esi)
	...

00000744 <ls_call16>:
CS550LSSYSCALL(ls_call16)
     744:	b8 3a 07 00 00       	mov    $0x73a,%eax
     749:	cd 41                	int    $0x41
     74b:	c3                   	ret    

0000074c <str_ls_call17>:
     74c:	6c                   	insb   (%dx),%es:(%edi)
     74d:	73 5f                	jae    7ae <str_ls_call22+0x8>
     74f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     752:	6c                   	insb   (%dx),%es:(%edi)
     753:	31 37                	xor    %esi,(%edi)
	...

00000756 <ls_call17>:
CS550LSSYSCALL(ls_call17)
     756:	b8 4c 07 00 00       	mov    $0x74c,%eax
     75b:	cd 41                	int    $0x41
     75d:	c3                   	ret    

0000075e <str_ls_call18>:
     75e:	6c                   	insb   (%dx),%es:(%edi)
     75f:	73 5f                	jae    7c0 <str_ls_call23+0x8>
     761:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     764:	6c                   	insb   (%dx),%es:(%edi)
     765:	31 38                	xor    %edi,(%eax)
	...

00000768 <ls_call18>:
CS550LSSYSCALL(ls_call18)
     768:	b8 5e 07 00 00       	mov    $0x75e,%eax
     76d:	cd 41                	int    $0x41
     76f:	c3                   	ret    

00000770 <str_ls_call19>:
     770:	6c                   	insb   (%dx),%es:(%edi)
     771:	73 5f                	jae    7d2 <str_ls_call24+0x8>
     773:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     776:	6c                   	insb   (%dx),%es:(%edi)
     777:	31 39                	xor    %edi,(%ecx)
	...

0000077a <ls_call19>:
CS550LSSYSCALL(ls_call19)
     77a:	b8 70 07 00 00       	mov    $0x770,%eax
     77f:	cd 41                	int    $0x41
     781:	c3                   	ret    

00000782 <str_ls_call20>:
     782:	6c                   	insb   (%dx),%es:(%edi)
     783:	73 5f                	jae    7e4 <str_ls_call25+0x8>
     785:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     788:	6c                   	insb   (%dx),%es:(%edi)
     789:	32 30                	xor    (%eax),%dh
	...

0000078c <ls_call20>:
CS550LSSYSCALL(ls_call20)
     78c:	b8 82 07 00 00       	mov    $0x782,%eax
     791:	cd 41                	int    $0x41
     793:	c3                   	ret    

00000794 <str_ls_call21>:
     794:	6c                   	insb   (%dx),%es:(%edi)
     795:	73 5f                	jae    7f6 <str_ls_call26+0x8>
     797:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     79a:	6c                   	insb   (%dx),%es:(%edi)
     79b:	32 31                	xor    (%ecx),%dh
	...

0000079e <ls_call21>:
CS550LSSYSCALL(ls_call21)
     79e:	b8 94 07 00 00       	mov    $0x794,%eax
     7a3:	cd 41                	int    $0x41
     7a5:	c3                   	ret    

000007a6 <str_ls_call22>:
     7a6:	6c                   	insb   (%dx),%es:(%edi)
     7a7:	73 5f                	jae    808 <str_ls_call27+0x8>
     7a9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7ac:	6c                   	insb   (%dx),%es:(%edi)
     7ad:	32 32                	xor    (%edx),%dh
	...

000007b0 <ls_call22>:
CS550LSSYSCALL(ls_call22)
     7b0:	b8 a6 07 00 00       	mov    $0x7a6,%eax
     7b5:	cd 41                	int    $0x41
     7b7:	c3                   	ret    

000007b8 <str_ls_call23>:
     7b8:	6c                   	insb   (%dx),%es:(%edi)
     7b9:	73 5f                	jae    81a <str_ls_call28+0x8>
     7bb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7be:	6c                   	insb   (%dx),%es:(%edi)
     7bf:	32 33                	xor    (%ebx),%dh
	...

000007c2 <ls_call23>:
CS550LSSYSCALL(ls_call23)
     7c2:	b8 b8 07 00 00       	mov    $0x7b8,%eax
     7c7:	cd 41                	int    $0x41
     7c9:	c3                   	ret    

000007ca <str_ls_call24>:
     7ca:	6c                   	insb   (%dx),%es:(%edi)
     7cb:	73 5f                	jae    82c <str_ls_call29+0x8>
     7cd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7d0:	6c                   	insb   (%dx),%es:(%edi)
     7d1:	32 34 00             	xor    (%eax,%eax,1),%dh

000007d4 <ls_call24>:
CS550LSSYSCALL(ls_call24)
     7d4:	b8 ca 07 00 00       	mov    $0x7ca,%eax
     7d9:	cd 41                	int    $0x41
     7db:	c3                   	ret    

000007dc <str_ls_call25>:
     7dc:	6c                   	insb   (%dx),%es:(%edi)
     7dd:	73 5f                	jae    83e <str_ls_call30+0x8>
     7df:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7e2:	6c                   	insb   (%dx),%es:(%edi)
     7e3:	32                   	.byte 0x32
     7e4:	35                   	.byte 0x35
	...

000007e6 <ls_call25>:
CS550LSSYSCALL(ls_call25)
     7e6:	b8 dc 07 00 00       	mov    $0x7dc,%eax
     7eb:	cd 41                	int    $0x41
     7ed:	c3                   	ret    

000007ee <str_ls_call26>:
     7ee:	6c                   	insb   (%dx),%es:(%edi)
     7ef:	73 5f                	jae    850 <str_ls_call31+0x8>
     7f1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7f4:	6c                   	insb   (%dx),%es:(%edi)
     7f5:	32 36                	xor    (%esi),%dh
	...

000007f8 <ls_call26>:
CS550LSSYSCALL(ls_call26)
     7f8:	b8 ee 07 00 00       	mov    $0x7ee,%eax
     7fd:	cd 41                	int    $0x41
     7ff:	c3                   	ret    

00000800 <str_ls_call27>:
     800:	6c                   	insb   (%dx),%es:(%edi)
     801:	73 5f                	jae    862 <str_ls_call32+0x8>
     803:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     806:	6c                   	insb   (%dx),%es:(%edi)
     807:	32 37                	xor    (%edi),%dh
	...

0000080a <ls_call27>:
CS550LSSYSCALL(ls_call27)
     80a:	b8 00 08 00 00       	mov    $0x800,%eax
     80f:	cd 41                	int    $0x41
     811:	c3                   	ret    

00000812 <str_ls_call28>:
     812:	6c                   	insb   (%dx),%es:(%edi)
     813:	73 5f                	jae    874 <str_ls_call33+0x8>
     815:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     818:	6c                   	insb   (%dx),%es:(%edi)
     819:	32 38                	xor    (%eax),%bh
	...

0000081c <ls_call28>:
CS550LSSYSCALL(ls_call28)
     81c:	b8 12 08 00 00       	mov    $0x812,%eax
     821:	cd 41                	int    $0x41
     823:	c3                   	ret    

00000824 <str_ls_call29>:
     824:	6c                   	insb   (%dx),%es:(%edi)
     825:	73 5f                	jae    886 <str_ls_call34+0x8>
     827:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     82a:	6c                   	insb   (%dx),%es:(%edi)
     82b:	32 39                	xor    (%ecx),%bh
	...

0000082e <ls_call29>:
CS550LSSYSCALL(ls_call29)
     82e:	b8 24 08 00 00       	mov    $0x824,%eax
     833:	cd 41                	int    $0x41
     835:	c3                   	ret    

00000836 <str_ls_call30>:
     836:	6c                   	insb   (%dx),%es:(%edi)
     837:	73 5f                	jae    898 <str_ls_call35+0x8>
     839:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     83c:	6c                   	insb   (%dx),%es:(%edi)
     83d:	33 30                	xor    (%eax),%esi
	...

00000840 <ls_call30>:
CS550LSSYSCALL(ls_call30)
     840:	b8 36 08 00 00       	mov    $0x836,%eax
     845:	cd 41                	int    $0x41
     847:	c3                   	ret    

00000848 <str_ls_call31>:
     848:	6c                   	insb   (%dx),%es:(%edi)
     849:	73 5f                	jae    8aa <str_ls_call36+0x8>
     84b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     84e:	6c                   	insb   (%dx),%es:(%edi)
     84f:	33 31                	xor    (%ecx),%esi
	...

00000852 <ls_call31>:
CS550LSSYSCALL(ls_call31)
     852:	b8 48 08 00 00       	mov    $0x848,%eax
     857:	cd 41                	int    $0x41
     859:	c3                   	ret    

0000085a <str_ls_call32>:
     85a:	6c                   	insb   (%dx),%es:(%edi)
     85b:	73 5f                	jae    8bc <str_ls_call37+0x8>
     85d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     860:	6c                   	insb   (%dx),%es:(%edi)
     861:	33 32                	xor    (%edx),%esi
	...

00000864 <ls_call32>:
CS550LSSYSCALL(ls_call32)
     864:	b8 5a 08 00 00       	mov    $0x85a,%eax
     869:	cd 41                	int    $0x41
     86b:	c3                   	ret    

0000086c <str_ls_call33>:
     86c:	6c                   	insb   (%dx),%es:(%edi)
     86d:	73 5f                	jae    8ce <str_ls_call38+0x8>
     86f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     872:	6c                   	insb   (%dx),%es:(%edi)
     873:	33 33                	xor    (%ebx),%esi
	...

00000876 <ls_call33>:
CS550LSSYSCALL(ls_call33)
     876:	b8 6c 08 00 00       	mov    $0x86c,%eax
     87b:	cd 41                	int    $0x41
     87d:	c3                   	ret    

0000087e <str_ls_call34>:
     87e:	6c                   	insb   (%dx),%es:(%edi)
     87f:	73 5f                	jae    8e0 <str_ls_call39+0x8>
     881:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     884:	6c                   	insb   (%dx),%es:(%edi)
     885:	33 34 00             	xor    (%eax,%eax,1),%esi

00000888 <ls_call34>:
CS550LSSYSCALL(ls_call34)
     888:	b8 7e 08 00 00       	mov    $0x87e,%eax
     88d:	cd 41                	int    $0x41
     88f:	c3                   	ret    

00000890 <str_ls_call35>:
     890:	6c                   	insb   (%dx),%es:(%edi)
     891:	73 5f                	jae    8f2 <str_ls_call40+0x8>
     893:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     896:	6c                   	insb   (%dx),%es:(%edi)
     897:	33                   	.byte 0x33
     898:	35                   	.byte 0x35
	...

0000089a <ls_call35>:
CS550LSSYSCALL(ls_call35)
     89a:	b8 90 08 00 00       	mov    $0x890,%eax
     89f:	cd 41                	int    $0x41
     8a1:	c3                   	ret    

000008a2 <str_ls_call36>:
     8a2:	6c                   	insb   (%dx),%es:(%edi)
     8a3:	73 5f                	jae    904 <str_ls_call41+0x8>
     8a5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8a8:	6c                   	insb   (%dx),%es:(%edi)
     8a9:	33 36                	xor    (%esi),%esi
	...

000008ac <ls_call36>:
CS550LSSYSCALL(ls_call36)
     8ac:	b8 a2 08 00 00       	mov    $0x8a2,%eax
     8b1:	cd 41                	int    $0x41
     8b3:	c3                   	ret    

000008b4 <str_ls_call37>:
     8b4:	6c                   	insb   (%dx),%es:(%edi)
     8b5:	73 5f                	jae    916 <str_ls_call42+0x8>
     8b7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8ba:	6c                   	insb   (%dx),%es:(%edi)
     8bb:	33 37                	xor    (%edi),%esi
	...

000008be <ls_call37>:
CS550LSSYSCALL(ls_call37)
     8be:	b8 b4 08 00 00       	mov    $0x8b4,%eax
     8c3:	cd 41                	int    $0x41
     8c5:	c3                   	ret    

000008c6 <str_ls_call38>:
     8c6:	6c                   	insb   (%dx),%es:(%edi)
     8c7:	73 5f                	jae    928 <str_ls_call43+0x8>
     8c9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8cc:	6c                   	insb   (%dx),%es:(%edi)
     8cd:	33 38                	xor    (%eax),%edi
	...

000008d0 <ls_call38>:
CS550LSSYSCALL(ls_call38)
     8d0:	b8 c6 08 00 00       	mov    $0x8c6,%eax
     8d5:	cd 41                	int    $0x41
     8d7:	c3                   	ret    

000008d8 <str_ls_call39>:
     8d8:	6c                   	insb   (%dx),%es:(%edi)
     8d9:	73 5f                	jae    93a <str_ls_call44+0x8>
     8db:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8de:	6c                   	insb   (%dx),%es:(%edi)
     8df:	33 39                	xor    (%ecx),%edi
	...

000008e2 <ls_call39>:
CS550LSSYSCALL(ls_call39)
     8e2:	b8 d8 08 00 00       	mov    $0x8d8,%eax
     8e7:	cd 41                	int    $0x41
     8e9:	c3                   	ret    

000008ea <str_ls_call40>:
     8ea:	6c                   	insb   (%dx),%es:(%edi)
     8eb:	73 5f                	jae    94c <str_ls_call45+0x8>
     8ed:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8f0:	6c                   	insb   (%dx),%es:(%edi)
     8f1:	34 30                	xor    $0x30,%al
	...

000008f4 <ls_call40>:
CS550LSSYSCALL(ls_call40)
     8f4:	b8 ea 08 00 00       	mov    $0x8ea,%eax
     8f9:	cd 41                	int    $0x41
     8fb:	c3                   	ret    

000008fc <str_ls_call41>:
     8fc:	6c                   	insb   (%dx),%es:(%edi)
     8fd:	73 5f                	jae    95e <str_ls_call46+0x8>
     8ff:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     902:	6c                   	insb   (%dx),%es:(%edi)
     903:	34 31                	xor    $0x31,%al
	...

00000906 <ls_call41>:
CS550LSSYSCALL(ls_call41)
     906:	b8 fc 08 00 00       	mov    $0x8fc,%eax
     90b:	cd 41                	int    $0x41
     90d:	c3                   	ret    

0000090e <str_ls_call42>:
     90e:	6c                   	insb   (%dx),%es:(%edi)
     90f:	73 5f                	jae    970 <str_ls_call47+0x8>
     911:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     914:	6c                   	insb   (%dx),%es:(%edi)
     915:	34 32                	xor    $0x32,%al
	...

00000918 <ls_call42>:
CS550LSSYSCALL(ls_call42)
     918:	b8 0e 09 00 00       	mov    $0x90e,%eax
     91d:	cd 41                	int    $0x41
     91f:	c3                   	ret    

00000920 <str_ls_call43>:
     920:	6c                   	insb   (%dx),%es:(%edi)
     921:	73 5f                	jae    982 <str_ls_call48+0x8>
     923:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     926:	6c                   	insb   (%dx),%es:(%edi)
     927:	34 33                	xor    $0x33,%al
	...

0000092a <ls_call43>:
CS550LSSYSCALL(ls_call43)
     92a:	b8 20 09 00 00       	mov    $0x920,%eax
     92f:	cd 41                	int    $0x41
     931:	c3                   	ret    

00000932 <str_ls_call44>:
     932:	6c                   	insb   (%dx),%es:(%edi)
     933:	73 5f                	jae    994 <str_ls_call49+0x8>
     935:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     938:	6c                   	insb   (%dx),%es:(%edi)
     939:	34 34                	xor    $0x34,%al
	...

0000093c <ls_call44>:
CS550LSSYSCALL(ls_call44)
     93c:	b8 32 09 00 00       	mov    $0x932,%eax
     941:	cd 41                	int    $0x41
     943:	c3                   	ret    

00000944 <str_ls_call45>:
     944:	6c                   	insb   (%dx),%es:(%edi)
     945:	73 5f                	jae    9a6 <str_ls_call50+0x8>
     947:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     94a:	6c                   	insb   (%dx),%es:(%edi)
     94b:	34 35                	xor    $0x35,%al
	...

0000094e <ls_call45>:
CS550LSSYSCALL(ls_call45)
     94e:	b8 44 09 00 00       	mov    $0x944,%eax
     953:	cd 41                	int    $0x41
     955:	c3                   	ret    

00000956 <str_ls_call46>:
     956:	6c                   	insb   (%dx),%es:(%edi)
     957:	73 5f                	jae    9b8 <str_ht_call1+0x8>
     959:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     95c:	6c                   	insb   (%dx),%es:(%edi)
     95d:	34 36                	xor    $0x36,%al
	...

00000960 <ls_call46>:
CS550LSSYSCALL(ls_call46)
     960:	b8 56 09 00 00       	mov    $0x956,%eax
     965:	cd 41                	int    $0x41
     967:	c3                   	ret    

00000968 <str_ls_call47>:
     968:	6c                   	insb   (%dx),%es:(%edi)
     969:	73 5f                	jae    9ca <ht_call2>
     96b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     96e:	6c                   	insb   (%dx),%es:(%edi)
     96f:	34 37                	xor    $0x37,%al
	...

00000972 <ls_call47>:
CS550LSSYSCALL(ls_call47)
     972:	b8 68 09 00 00       	mov    $0x968,%eax
     977:	cd 41                	int    $0x41
     979:	c3                   	ret    

0000097a <str_ls_call48>:
     97a:	6c                   	insb   (%dx),%es:(%edi)
     97b:	73 5f                	jae    9dc <ht_call3+0x1>
     97d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     980:	6c                   	insb   (%dx),%es:(%edi)
     981:	34 38                	xor    $0x38,%al
	...

00000984 <ls_call48>:
CS550LSSYSCALL(ls_call48)
     984:	b8 7a 09 00 00       	mov    $0x97a,%eax
     989:	cd 41                	int    $0x41
     98b:	c3                   	ret    

0000098c <str_ls_call49>:
     98c:	6c                   	insb   (%dx),%es:(%edi)
     98d:	73 5f                	jae    9ee <ht_call4+0x2>
     98f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     992:	6c                   	insb   (%dx),%es:(%edi)
     993:	34 39                	xor    $0x39,%al
	...

00000996 <ls_call49>:
CS550LSSYSCALL(ls_call49)
     996:	b8 8c 09 00 00       	mov    $0x98c,%eax
     99b:	cd 41                	int    $0x41
     99d:	c3                   	ret    

0000099e <str_ls_call50>:
     99e:	6c                   	insb   (%dx),%es:(%edi)
     99f:	73 5f                	jae    a00 <ht_call5+0x3>
     9a1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     9a4:	6c                   	insb   (%dx),%es:(%edi)
     9a5:	35                   	.byte 0x35
     9a6:	30 00                	xor    %al,(%eax)

000009a8 <ls_call50>:
CS550LSSYSCALL(ls_call50)
     9a8:	b8 9e 09 00 00       	mov    $0x99e,%eax
     9ad:	cd 41                	int    $0x41
     9af:	c3                   	ret    

000009b0 <str_ht_call1>:
     9b0:	68 74 5f 63 61       	push   $0x61635f74
     9b5:	6c                   	insb   (%dx),%es:(%edi)
     9b6:	6c                   	insb   (%dx),%es:(%edi)
     9b7:	31 00                	xor    %eax,(%eax)

000009b9 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
     9b9:	b8 b0 09 00 00       	mov    $0x9b0,%eax
     9be:	cd 42                	int    $0x42
     9c0:	c3                   	ret    

000009c1 <str_ht_call2>:
     9c1:	68 74 5f 63 61       	push   $0x61635f74
     9c6:	6c                   	insb   (%dx),%es:(%edi)
     9c7:	6c                   	insb   (%dx),%es:(%edi)
     9c8:	32 00                	xor    (%eax),%al

000009ca <ht_call2>:
CS550HTSYSCALL(ht_call2)
     9ca:	b8 c1 09 00 00       	mov    $0x9c1,%eax
     9cf:	cd 42                	int    $0x42
     9d1:	c3                   	ret    

000009d2 <str_ht_call3>:
     9d2:	68 74 5f 63 61       	push   $0x61635f74
     9d7:	6c                   	insb   (%dx),%es:(%edi)
     9d8:	6c                   	insb   (%dx),%es:(%edi)
     9d9:	33 00                	xor    (%eax),%eax

000009db <ht_call3>:
CS550HTSYSCALL(ht_call3)
     9db:	b8 d2 09 00 00       	mov    $0x9d2,%eax
     9e0:	cd 42                	int    $0x42
     9e2:	c3                   	ret    

000009e3 <str_ht_call4>:
     9e3:	68 74 5f 63 61       	push   $0x61635f74
     9e8:	6c                   	insb   (%dx),%es:(%edi)
     9e9:	6c                   	insb   (%dx),%es:(%edi)
     9ea:	34 00                	xor    $0x0,%al

000009ec <ht_call4>:
CS550HTSYSCALL(ht_call4)
     9ec:	b8 e3 09 00 00       	mov    $0x9e3,%eax
     9f1:	cd 42                	int    $0x42
     9f3:	c3                   	ret    

000009f4 <str_ht_call5>:
     9f4:	68 74 5f 63 61       	push   $0x61635f74
     9f9:	6c                   	insb   (%dx),%es:(%edi)
     9fa:	6c                   	insb   (%dx),%es:(%edi)
     9fb:	35                   	.byte 0x35
	...

000009fd <ht_call5>:
CS550HTSYSCALL(ht_call5)
     9fd:	b8 f4 09 00 00       	mov    $0x9f4,%eax
     a02:	cd 42                	int    $0x42
     a04:	c3                   	ret    

00000a05 <str_ht_call6>:
     a05:	68 74 5f 63 61       	push   $0x61635f74
     a0a:	6c                   	insb   (%dx),%es:(%edi)
     a0b:	6c                   	insb   (%dx),%es:(%edi)
     a0c:	36                   	ss
	...

00000a0e <ht_call6>:
CS550HTSYSCALL(ht_call6)
     a0e:	b8 05 0a 00 00       	mov    $0xa05,%eax
     a13:	cd 42                	int    $0x42
     a15:	c3                   	ret    

00000a16 <str_ht_call7>:
     a16:	68 74 5f 63 61       	push   $0x61635f74
     a1b:	6c                   	insb   (%dx),%es:(%edi)
     a1c:	6c                   	insb   (%dx),%es:(%edi)
     a1d:	37                   	aaa    
	...

00000a1f <ht_call7>:
CS550HTSYSCALL(ht_call7)
     a1f:	b8 16 0a 00 00       	mov    $0xa16,%eax
     a24:	cd 42                	int    $0x42
     a26:	c3                   	ret    

00000a27 <str_ht_call8>:
     a27:	68 74 5f 63 61       	push   $0x61635f74
     a2c:	6c                   	insb   (%dx),%es:(%edi)
     a2d:	6c                   	insb   (%dx),%es:(%edi)
     a2e:	38 00                	cmp    %al,(%eax)

00000a30 <ht_call8>:
CS550HTSYSCALL(ht_call8)
     a30:	b8 27 0a 00 00       	mov    $0xa27,%eax
     a35:	cd 42                	int    $0x42
     a37:	c3                   	ret    

00000a38 <str_ht_call9>:
     a38:	68 74 5f 63 61       	push   $0x61635f74
     a3d:	6c                   	insb   (%dx),%es:(%edi)
     a3e:	6c                   	insb   (%dx),%es:(%edi)
     a3f:	39 00                	cmp    %eax,(%eax)

00000a41 <ht_call9>:
CS550HTSYSCALL(ht_call9)
     a41:	b8 38 0a 00 00       	mov    $0xa38,%eax
     a46:	cd 42                	int    $0x42
     a48:	c3                   	ret    

00000a49 <str_ht_call10>:
     a49:	68 74 5f 63 61       	push   $0x61635f74
     a4e:	6c                   	insb   (%dx),%es:(%edi)
     a4f:	6c                   	insb   (%dx),%es:(%edi)
     a50:	31 30                	xor    %esi,(%eax)
	...

00000a53 <ht_call10>:
CS550HTSYSCALL(ht_call10)
     a53:	b8 49 0a 00 00       	mov    $0xa49,%eax
     a58:	cd 42                	int    $0x42
     a5a:	c3                   	ret    

00000a5b <str_ht_call11>:
     a5b:	68 74 5f 63 61       	push   $0x61635f74
     a60:	6c                   	insb   (%dx),%es:(%edi)
     a61:	6c                   	insb   (%dx),%es:(%edi)
     a62:	31 31                	xor    %esi,(%ecx)
	...

00000a65 <ht_call11>:
CS550HTSYSCALL(ht_call11)
     a65:	b8 5b 0a 00 00       	mov    $0xa5b,%eax
     a6a:	cd 42                	int    $0x42
     a6c:	c3                   	ret    

00000a6d <str_ht_call12>:
     a6d:	68 74 5f 63 61       	push   $0x61635f74
     a72:	6c                   	insb   (%dx),%es:(%edi)
     a73:	6c                   	insb   (%dx),%es:(%edi)
     a74:	31 32                	xor    %esi,(%edx)
	...

00000a77 <ht_call12>:
CS550HTSYSCALL(ht_call12)
     a77:	b8 6d 0a 00 00       	mov    $0xa6d,%eax
     a7c:	cd 42                	int    $0x42
     a7e:	c3                   	ret    

00000a7f <str_ht_call13>:
     a7f:	68 74 5f 63 61       	push   $0x61635f74
     a84:	6c                   	insb   (%dx),%es:(%edi)
     a85:	6c                   	insb   (%dx),%es:(%edi)
     a86:	31 33                	xor    %esi,(%ebx)
	...

00000a89 <ht_call13>:
CS550HTSYSCALL(ht_call13)
     a89:	b8 7f 0a 00 00       	mov    $0xa7f,%eax
     a8e:	cd 42                	int    $0x42
     a90:	c3                   	ret    

00000a91 <str_ht_call14>:
     a91:	68 74 5f 63 61       	push   $0x61635f74
     a96:	6c                   	insb   (%dx),%es:(%edi)
     a97:	6c                   	insb   (%dx),%es:(%edi)
     a98:	31 34 00             	xor    %esi,(%eax,%eax,1)

00000a9b <ht_call14>:
CS550HTSYSCALL(ht_call14)
     a9b:	b8 91 0a 00 00       	mov    $0xa91,%eax
     aa0:	cd 42                	int    $0x42
     aa2:	c3                   	ret    

00000aa3 <str_ht_call15>:
     aa3:	68 74 5f 63 61       	push   $0x61635f74
     aa8:	6c                   	insb   (%dx),%es:(%edi)
     aa9:	6c                   	insb   (%dx),%es:(%edi)
     aaa:	31                   	.byte 0x31
     aab:	35                   	.byte 0x35
	...

00000aad <ht_call15>:
CS550HTSYSCALL(ht_call15)
     aad:	b8 a3 0a 00 00       	mov    $0xaa3,%eax
     ab2:	cd 42                	int    $0x42
     ab4:	c3                   	ret    

00000ab5 <str_ht_call16>:
     ab5:	68 74 5f 63 61       	push   $0x61635f74
     aba:	6c                   	insb   (%dx),%es:(%edi)
     abb:	6c                   	insb   (%dx),%es:(%edi)
     abc:	31 36                	xor    %esi,(%esi)
	...

00000abf <ht_call16>:
CS550HTSYSCALL(ht_call16)
     abf:	b8 b5 0a 00 00       	mov    $0xab5,%eax
     ac4:	cd 42                	int    $0x42
     ac6:	c3                   	ret    

00000ac7 <str_ht_call17>:
     ac7:	68 74 5f 63 61       	push   $0x61635f74
     acc:	6c                   	insb   (%dx),%es:(%edi)
     acd:	6c                   	insb   (%dx),%es:(%edi)
     ace:	31 37                	xor    %esi,(%edi)
	...

00000ad1 <ht_call17>:
CS550HTSYSCALL(ht_call17)
     ad1:	b8 c7 0a 00 00       	mov    $0xac7,%eax
     ad6:	cd 42                	int    $0x42
     ad8:	c3                   	ret    

00000ad9 <str_ht_call18>:
     ad9:	68 74 5f 63 61       	push   $0x61635f74
     ade:	6c                   	insb   (%dx),%es:(%edi)
     adf:	6c                   	insb   (%dx),%es:(%edi)
     ae0:	31 38                	xor    %edi,(%eax)
	...

00000ae3 <ht_call18>:
CS550HTSYSCALL(ht_call18)
     ae3:	b8 d9 0a 00 00       	mov    $0xad9,%eax
     ae8:	cd 42                	int    $0x42
     aea:	c3                   	ret    

00000aeb <str_ht_call19>:
     aeb:	68 74 5f 63 61       	push   $0x61635f74
     af0:	6c                   	insb   (%dx),%es:(%edi)
     af1:	6c                   	insb   (%dx),%es:(%edi)
     af2:	31 39                	xor    %edi,(%ecx)
	...

00000af5 <ht_call19>:
CS550HTSYSCALL(ht_call19)
     af5:	b8 eb 0a 00 00       	mov    $0xaeb,%eax
     afa:	cd 42                	int    $0x42
     afc:	c3                   	ret    

00000afd <str_ht_call20>:
     afd:	68 74 5f 63 61       	push   $0x61635f74
     b02:	6c                   	insb   (%dx),%es:(%edi)
     b03:	6c                   	insb   (%dx),%es:(%edi)
     b04:	32 30                	xor    (%eax),%dh
	...

00000b07 <ht_call20>:
CS550HTSYSCALL(ht_call20)
     b07:	b8 fd 0a 00 00       	mov    $0xafd,%eax
     b0c:	cd 42                	int    $0x42
     b0e:	c3                   	ret    

00000b0f <str_ht_call21>:
     b0f:	68 74 5f 63 61       	push   $0x61635f74
     b14:	6c                   	insb   (%dx),%es:(%edi)
     b15:	6c                   	insb   (%dx),%es:(%edi)
     b16:	32 31                	xor    (%ecx),%dh
	...

00000b19 <ht_call21>:
CS550HTSYSCALL(ht_call21)
     b19:	b8 0f 0b 00 00       	mov    $0xb0f,%eax
     b1e:	cd 42                	int    $0x42
     b20:	c3                   	ret    

00000b21 <str_ht_call22>:
     b21:	68 74 5f 63 61       	push   $0x61635f74
     b26:	6c                   	insb   (%dx),%es:(%edi)
     b27:	6c                   	insb   (%dx),%es:(%edi)
     b28:	32 32                	xor    (%edx),%dh
	...

00000b2b <ht_call22>:
CS550HTSYSCALL(ht_call22)
     b2b:	b8 21 0b 00 00       	mov    $0xb21,%eax
     b30:	cd 42                	int    $0x42
     b32:	c3                   	ret    

00000b33 <str_ht_call23>:
     b33:	68 74 5f 63 61       	push   $0x61635f74
     b38:	6c                   	insb   (%dx),%es:(%edi)
     b39:	6c                   	insb   (%dx),%es:(%edi)
     b3a:	32 33                	xor    (%ebx),%dh
	...

00000b3d <ht_call23>:
CS550HTSYSCALL(ht_call23)
     b3d:	b8 33 0b 00 00       	mov    $0xb33,%eax
     b42:	cd 42                	int    $0x42
     b44:	c3                   	ret    

00000b45 <str_ht_call24>:
     b45:	68 74 5f 63 61       	push   $0x61635f74
     b4a:	6c                   	insb   (%dx),%es:(%edi)
     b4b:	6c                   	insb   (%dx),%es:(%edi)
     b4c:	32 34 00             	xor    (%eax,%eax,1),%dh

00000b4f <ht_call24>:
CS550HTSYSCALL(ht_call24)
     b4f:	b8 45 0b 00 00       	mov    $0xb45,%eax
     b54:	cd 42                	int    $0x42
     b56:	c3                   	ret    

00000b57 <str_ht_call25>:
     b57:	68 74 5f 63 61       	push   $0x61635f74
     b5c:	6c                   	insb   (%dx),%es:(%edi)
     b5d:	6c                   	insb   (%dx),%es:(%edi)
     b5e:	32                   	.byte 0x32
     b5f:	35                   	.byte 0x35
	...

00000b61 <ht_call25>:
CS550HTSYSCALL(ht_call25)
     b61:	b8 57 0b 00 00       	mov    $0xb57,%eax
     b66:	cd 42                	int    $0x42
     b68:	c3                   	ret    

00000b69 <str_ht_call26>:
     b69:	68 74 5f 63 61       	push   $0x61635f74
     b6e:	6c                   	insb   (%dx),%es:(%edi)
     b6f:	6c                   	insb   (%dx),%es:(%edi)
     b70:	32 36                	xor    (%esi),%dh
	...

00000b73 <ht_call26>:
CS550HTSYSCALL(ht_call26)
     b73:	b8 69 0b 00 00       	mov    $0xb69,%eax
     b78:	cd 42                	int    $0x42
     b7a:	c3                   	ret    

00000b7b <str_ht_call27>:
     b7b:	68 74 5f 63 61       	push   $0x61635f74
     b80:	6c                   	insb   (%dx),%es:(%edi)
     b81:	6c                   	insb   (%dx),%es:(%edi)
     b82:	32 37                	xor    (%edi),%dh
	...

00000b85 <ht_call27>:
CS550HTSYSCALL(ht_call27)
     b85:	b8 7b 0b 00 00       	mov    $0xb7b,%eax
     b8a:	cd 42                	int    $0x42
     b8c:	c3                   	ret    

00000b8d <str_ht_call28>:
     b8d:	68 74 5f 63 61       	push   $0x61635f74
     b92:	6c                   	insb   (%dx),%es:(%edi)
     b93:	6c                   	insb   (%dx),%es:(%edi)
     b94:	32 38                	xor    (%eax),%bh
	...

00000b97 <ht_call28>:
CS550HTSYSCALL(ht_call28)
     b97:	b8 8d 0b 00 00       	mov    $0xb8d,%eax
     b9c:	cd 42                	int    $0x42
     b9e:	c3                   	ret    

00000b9f <str_ht_call29>:
     b9f:	68 74 5f 63 61       	push   $0x61635f74
     ba4:	6c                   	insb   (%dx),%es:(%edi)
     ba5:	6c                   	insb   (%dx),%es:(%edi)
     ba6:	32 39                	xor    (%ecx),%bh
	...

00000ba9 <ht_call29>:
CS550HTSYSCALL(ht_call29)
     ba9:	b8 9f 0b 00 00       	mov    $0xb9f,%eax
     bae:	cd 42                	int    $0x42
     bb0:	c3                   	ret    

00000bb1 <str_ht_call30>:
     bb1:	68 74 5f 63 61       	push   $0x61635f74
     bb6:	6c                   	insb   (%dx),%es:(%edi)
     bb7:	6c                   	insb   (%dx),%es:(%edi)
     bb8:	33 30                	xor    (%eax),%esi
	...

00000bbb <ht_call30>:
CS550HTSYSCALL(ht_call30)
     bbb:	b8 b1 0b 00 00       	mov    $0xbb1,%eax
     bc0:	cd 42                	int    $0x42
     bc2:	c3                   	ret    

00000bc3 <str_ht_call31>:
     bc3:	68 74 5f 63 61       	push   $0x61635f74
     bc8:	6c                   	insb   (%dx),%es:(%edi)
     bc9:	6c                   	insb   (%dx),%es:(%edi)
     bca:	33 31                	xor    (%ecx),%esi
	...

00000bcd <ht_call31>:
CS550HTSYSCALL(ht_call31)
     bcd:	b8 c3 0b 00 00       	mov    $0xbc3,%eax
     bd2:	cd 42                	int    $0x42
     bd4:	c3                   	ret    

00000bd5 <str_ht_call32>:
     bd5:	68 74 5f 63 61       	push   $0x61635f74
     bda:	6c                   	insb   (%dx),%es:(%edi)
     bdb:	6c                   	insb   (%dx),%es:(%edi)
     bdc:	33 32                	xor    (%edx),%esi
	...

00000bdf <ht_call32>:
CS550HTSYSCALL(ht_call32)
     bdf:	b8 d5 0b 00 00       	mov    $0xbd5,%eax
     be4:	cd 42                	int    $0x42
     be6:	c3                   	ret    

00000be7 <str_ht_call33>:
     be7:	68 74 5f 63 61       	push   $0x61635f74
     bec:	6c                   	insb   (%dx),%es:(%edi)
     bed:	6c                   	insb   (%dx),%es:(%edi)
     bee:	33 33                	xor    (%ebx),%esi
	...

00000bf1 <ht_call33>:
CS550HTSYSCALL(ht_call33)
     bf1:	b8 e7 0b 00 00       	mov    $0xbe7,%eax
     bf6:	cd 42                	int    $0x42
     bf8:	c3                   	ret    

00000bf9 <str_ht_call34>:
     bf9:	68 74 5f 63 61       	push   $0x61635f74
     bfe:	6c                   	insb   (%dx),%es:(%edi)
     bff:	6c                   	insb   (%dx),%es:(%edi)
     c00:	33 34 00             	xor    (%eax,%eax,1),%esi

00000c03 <ht_call34>:
CS550HTSYSCALL(ht_call34)
     c03:	b8 f9 0b 00 00       	mov    $0xbf9,%eax
     c08:	cd 42                	int    $0x42
     c0a:	c3                   	ret    

00000c0b <str_ht_call35>:
     c0b:	68 74 5f 63 61       	push   $0x61635f74
     c10:	6c                   	insb   (%dx),%es:(%edi)
     c11:	6c                   	insb   (%dx),%es:(%edi)
     c12:	33                   	.byte 0x33
     c13:	35                   	.byte 0x35
	...

00000c15 <ht_call35>:
CS550HTSYSCALL(ht_call35)
     c15:	b8 0b 0c 00 00       	mov    $0xc0b,%eax
     c1a:	cd 42                	int    $0x42
     c1c:	c3                   	ret    

00000c1d <str_ht_call36>:
     c1d:	68 74 5f 63 61       	push   $0x61635f74
     c22:	6c                   	insb   (%dx),%es:(%edi)
     c23:	6c                   	insb   (%dx),%es:(%edi)
     c24:	33 36                	xor    (%esi),%esi
	...

00000c27 <ht_call36>:
CS550HTSYSCALL(ht_call36)
     c27:	b8 1d 0c 00 00       	mov    $0xc1d,%eax
     c2c:	cd 42                	int    $0x42
     c2e:	c3                   	ret    

00000c2f <str_ht_call37>:
     c2f:	68 74 5f 63 61       	push   $0x61635f74
     c34:	6c                   	insb   (%dx),%es:(%edi)
     c35:	6c                   	insb   (%dx),%es:(%edi)
     c36:	33 37                	xor    (%edi),%esi
	...

00000c39 <ht_call37>:
CS550HTSYSCALL(ht_call37)
     c39:	b8 2f 0c 00 00       	mov    $0xc2f,%eax
     c3e:	cd 42                	int    $0x42
     c40:	c3                   	ret    

00000c41 <str_ht_call38>:
     c41:	68 74 5f 63 61       	push   $0x61635f74
     c46:	6c                   	insb   (%dx),%es:(%edi)
     c47:	6c                   	insb   (%dx),%es:(%edi)
     c48:	33 38                	xor    (%eax),%edi
	...

00000c4b <ht_call38>:
CS550HTSYSCALL(ht_call38)
     c4b:	b8 41 0c 00 00       	mov    $0xc41,%eax
     c50:	cd 42                	int    $0x42
     c52:	c3                   	ret    

00000c53 <str_ht_call39>:
     c53:	68 74 5f 63 61       	push   $0x61635f74
     c58:	6c                   	insb   (%dx),%es:(%edi)
     c59:	6c                   	insb   (%dx),%es:(%edi)
     c5a:	33 39                	xor    (%ecx),%edi
	...

00000c5d <ht_call39>:
CS550HTSYSCALL(ht_call39)
     c5d:	b8 53 0c 00 00       	mov    $0xc53,%eax
     c62:	cd 42                	int    $0x42
     c64:	c3                   	ret    

00000c65 <str_ht_call40>:
     c65:	68 74 5f 63 61       	push   $0x61635f74
     c6a:	6c                   	insb   (%dx),%es:(%edi)
     c6b:	6c                   	insb   (%dx),%es:(%edi)
     c6c:	34 30                	xor    $0x30,%al
	...

00000c6f <ht_call40>:
CS550HTSYSCALL(ht_call40)
     c6f:	b8 65 0c 00 00       	mov    $0xc65,%eax
     c74:	cd 42                	int    $0x42
     c76:	c3                   	ret    

00000c77 <str_ht_call41>:
     c77:	68 74 5f 63 61       	push   $0x61635f74
     c7c:	6c                   	insb   (%dx),%es:(%edi)
     c7d:	6c                   	insb   (%dx),%es:(%edi)
     c7e:	34 31                	xor    $0x31,%al
	...

00000c81 <ht_call41>:
CS550HTSYSCALL(ht_call41)
     c81:	b8 77 0c 00 00       	mov    $0xc77,%eax
     c86:	cd 42                	int    $0x42
     c88:	c3                   	ret    

00000c89 <str_ht_call42>:
     c89:	68 74 5f 63 61       	push   $0x61635f74
     c8e:	6c                   	insb   (%dx),%es:(%edi)
     c8f:	6c                   	insb   (%dx),%es:(%edi)
     c90:	34 32                	xor    $0x32,%al
	...

00000c93 <ht_call42>:
CS550HTSYSCALL(ht_call42)
     c93:	b8 89 0c 00 00       	mov    $0xc89,%eax
     c98:	cd 42                	int    $0x42
     c9a:	c3                   	ret    

00000c9b <str_ht_call43>:
     c9b:	68 74 5f 63 61       	push   $0x61635f74
     ca0:	6c                   	insb   (%dx),%es:(%edi)
     ca1:	6c                   	insb   (%dx),%es:(%edi)
     ca2:	34 33                	xor    $0x33,%al
	...

00000ca5 <ht_call43>:
CS550HTSYSCALL(ht_call43)
     ca5:	b8 9b 0c 00 00       	mov    $0xc9b,%eax
     caa:	cd 42                	int    $0x42
     cac:	c3                   	ret    

00000cad <str_ht_call44>:
     cad:	68 74 5f 63 61       	push   $0x61635f74
     cb2:	6c                   	insb   (%dx),%es:(%edi)
     cb3:	6c                   	insb   (%dx),%es:(%edi)
     cb4:	34 34                	xor    $0x34,%al
	...

00000cb7 <ht_call44>:
CS550HTSYSCALL(ht_call44)
     cb7:	b8 ad 0c 00 00       	mov    $0xcad,%eax
     cbc:	cd 42                	int    $0x42
     cbe:	c3                   	ret    

00000cbf <str_ht_call45>:
     cbf:	68 74 5f 63 61       	push   $0x61635f74
     cc4:	6c                   	insb   (%dx),%es:(%edi)
     cc5:	6c                   	insb   (%dx),%es:(%edi)
     cc6:	34 35                	xor    $0x35,%al
	...

00000cc9 <ht_call45>:
CS550HTSYSCALL(ht_call45)
     cc9:	b8 bf 0c 00 00       	mov    $0xcbf,%eax
     cce:	cd 42                	int    $0x42
     cd0:	c3                   	ret    

00000cd1 <str_ht_call46>:
     cd1:	68 74 5f 63 61       	push   $0x61635f74
     cd6:	6c                   	insb   (%dx),%es:(%edi)
     cd7:	6c                   	insb   (%dx),%es:(%edi)
     cd8:	34 36                	xor    $0x36,%al
	...

00000cdb <ht_call46>:
CS550HTSYSCALL(ht_call46)
     cdb:	b8 d1 0c 00 00       	mov    $0xcd1,%eax
     ce0:	cd 42                	int    $0x42
     ce2:	c3                   	ret    

00000ce3 <str_ht_call47>:
     ce3:	68 74 5f 63 61       	push   $0x61635f74
     ce8:	6c                   	insb   (%dx),%es:(%edi)
     ce9:	6c                   	insb   (%dx),%es:(%edi)
     cea:	34 37                	xor    $0x37,%al
	...

00000ced <ht_call47>:
CS550HTSYSCALL(ht_call47)
     ced:	b8 e3 0c 00 00       	mov    $0xce3,%eax
     cf2:	cd 42                	int    $0x42
     cf4:	c3                   	ret    

00000cf5 <str_ht_call48>:
     cf5:	68 74 5f 63 61       	push   $0x61635f74
     cfa:	6c                   	insb   (%dx),%es:(%edi)
     cfb:	6c                   	insb   (%dx),%es:(%edi)
     cfc:	34 38                	xor    $0x38,%al
	...

00000cff <ht_call48>:
CS550HTSYSCALL(ht_call48)
     cff:	b8 f5 0c 00 00       	mov    $0xcf5,%eax
     d04:	cd 42                	int    $0x42
     d06:	c3                   	ret    

00000d07 <str_ht_call49>:
     d07:	68 74 5f 63 61       	push   $0x61635f74
     d0c:	6c                   	insb   (%dx),%es:(%edi)
     d0d:	6c                   	insb   (%dx),%es:(%edi)
     d0e:	34 39                	xor    $0x39,%al
	...

00000d11 <ht_call49>:
CS550HTSYSCALL(ht_call49)
     d11:	b8 07 0d 00 00       	mov    $0xd07,%eax
     d16:	cd 42                	int    $0x42
     d18:	c3                   	ret    

00000d19 <str_ht_call50>:
     d19:	68 74 5f 63 61       	push   $0x61635f74
     d1e:	6c                   	insb   (%dx),%es:(%edi)
     d1f:	6c                   	insb   (%dx),%es:(%edi)
     d20:	35                   	.byte 0x35
     d21:	30 00                	xor    %al,(%eax)

00000d23 <ht_call50>:
CS550HTSYSCALL(ht_call50)
     d23:	b8 19 0d 00 00       	mov    $0xd19,%eax
     d28:	cd 42                	int    $0x42
     d2a:	c3                   	ret    

00000d2b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     d2b:	55                   	push   %ebp
     d2c:	89 e5                	mov    %esp,%ebp
     d2e:	83 ec 18             	sub    $0x18,%esp
     d31:	8b 45 0c             	mov    0xc(%ebp),%eax
     d34:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     d37:	83 ec 04             	sub    $0x4,%esp
     d3a:	6a 01                	push   $0x1
     d3c:	8d 45 f4             	lea    -0xc(%ebp),%eax
     d3f:	50                   	push   %eax
     d40:	ff 75 08             	pushl  0x8(%ebp)
     d43:	e8 65 f8 ff ff       	call   5ad <write>
     d48:	83 c4 10             	add    $0x10,%esp
}
     d4b:	90                   	nop
     d4c:	c9                   	leave  
     d4d:	c3                   	ret    

00000d4e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     d4e:	55                   	push   %ebp
     d4f:	89 e5                	mov    %esp,%ebp
     d51:	53                   	push   %ebx
     d52:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     d55:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     d5c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     d60:	74 17                	je     d79 <printint+0x2b>
     d62:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     d66:	79 11                	jns    d79 <printint+0x2b>
    neg = 1;
     d68:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     d6f:	8b 45 0c             	mov    0xc(%ebp),%eax
     d72:	f7 d8                	neg    %eax
     d74:	89 45 ec             	mov    %eax,-0x14(%ebp)
     d77:	eb 06                	jmp    d7f <printint+0x31>
  } else {
    x = xx;
     d79:	8b 45 0c             	mov    0xc(%ebp),%eax
     d7c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     d7f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     d86:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     d89:	8d 41 01             	lea    0x1(%ecx),%eax
     d8c:	89 45 f4             	mov    %eax,-0xc(%ebp)
     d8f:	8b 5d 10             	mov    0x10(%ebp),%ebx
     d92:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d95:	ba 00 00 00 00       	mov    $0x0,%edx
     d9a:	f7 f3                	div    %ebx
     d9c:	89 d0                	mov    %edx,%eax
     d9e:	0f b6 80 c4 14 00 00 	movzbl 0x14c4(%eax),%eax
     da5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     da9:	8b 5d 10             	mov    0x10(%ebp),%ebx
     dac:	8b 45 ec             	mov    -0x14(%ebp),%eax
     daf:	ba 00 00 00 00       	mov    $0x0,%edx
     db4:	f7 f3                	div    %ebx
     db6:	89 45 ec             	mov    %eax,-0x14(%ebp)
     db9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     dbd:	75 c7                	jne    d86 <printint+0x38>
  if(neg)
     dbf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     dc3:	74 2d                	je     df2 <printint+0xa4>
    buf[i++] = '-';
     dc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dc8:	8d 50 01             	lea    0x1(%eax),%edx
     dcb:	89 55 f4             	mov    %edx,-0xc(%ebp)
     dce:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     dd3:	eb 1d                	jmp    df2 <printint+0xa4>
    putc(fd, buf[i]);
     dd5:	8d 55 dc             	lea    -0x24(%ebp),%edx
     dd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ddb:	01 d0                	add    %edx,%eax
     ddd:	0f b6 00             	movzbl (%eax),%eax
     de0:	0f be c0             	movsbl %al,%eax
     de3:	83 ec 08             	sub    $0x8,%esp
     de6:	50                   	push   %eax
     de7:	ff 75 08             	pushl  0x8(%ebp)
     dea:	e8 3c ff ff ff       	call   d2b <putc>
     def:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     df2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     df6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     dfa:	79 d9                	jns    dd5 <printint+0x87>
    putc(fd, buf[i]);
}
     dfc:	90                   	nop
     dfd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e00:	c9                   	leave  
     e01:	c3                   	ret    

00000e02 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e02:	55                   	push   %ebp
     e03:	89 e5                	mov    %esp,%ebp
     e05:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     e08:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     e0f:	8d 45 0c             	lea    0xc(%ebp),%eax
     e12:	83 c0 04             	add    $0x4,%eax
     e15:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     e18:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     e1f:	e9 59 01 00 00       	jmp    f7d <printf+0x17b>
    c = fmt[i] & 0xff;
     e24:	8b 55 0c             	mov    0xc(%ebp),%edx
     e27:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e2a:	01 d0                	add    %edx,%eax
     e2c:	0f b6 00             	movzbl (%eax),%eax
     e2f:	0f be c0             	movsbl %al,%eax
     e32:	25 ff 00 00 00       	and    $0xff,%eax
     e37:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     e3a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     e3e:	75 2c                	jne    e6c <printf+0x6a>
      if(c == '%'){
     e40:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     e44:	75 0c                	jne    e52 <printf+0x50>
        state = '%';
     e46:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     e4d:	e9 27 01 00 00       	jmp    f79 <printf+0x177>
      } else {
        putc(fd, c);
     e52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     e55:	0f be c0             	movsbl %al,%eax
     e58:	83 ec 08             	sub    $0x8,%esp
     e5b:	50                   	push   %eax
     e5c:	ff 75 08             	pushl  0x8(%ebp)
     e5f:	e8 c7 fe ff ff       	call   d2b <putc>
     e64:	83 c4 10             	add    $0x10,%esp
     e67:	e9 0d 01 00 00       	jmp    f79 <printf+0x177>
      }
    } else if(state == '%'){
     e6c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     e70:	0f 85 03 01 00 00    	jne    f79 <printf+0x177>
      if(c == 'd'){
     e76:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     e7a:	75 1e                	jne    e9a <printf+0x98>
        printint(fd, *ap, 10, 1);
     e7c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e7f:	8b 00                	mov    (%eax),%eax
     e81:	6a 01                	push   $0x1
     e83:	6a 0a                	push   $0xa
     e85:	50                   	push   %eax
     e86:	ff 75 08             	pushl  0x8(%ebp)
     e89:	e8 c0 fe ff ff       	call   d4e <printint>
     e8e:	83 c4 10             	add    $0x10,%esp
        ap++;
     e91:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     e95:	e9 d8 00 00 00       	jmp    f72 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
     e9a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     e9e:	74 06                	je     ea6 <printf+0xa4>
     ea0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     ea4:	75 1e                	jne    ec4 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     ea6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ea9:	8b 00                	mov    (%eax),%eax
     eab:	6a 00                	push   $0x0
     ead:	6a 10                	push   $0x10
     eaf:	50                   	push   %eax
     eb0:	ff 75 08             	pushl  0x8(%ebp)
     eb3:	e8 96 fe ff ff       	call   d4e <printint>
     eb8:	83 c4 10             	add    $0x10,%esp
        ap++;
     ebb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     ebf:	e9 ae 00 00 00       	jmp    f72 <printf+0x170>
      } else if(c == 's'){
     ec4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     ec8:	75 43                	jne    f0d <printf+0x10b>
        s = (char*)*ap;
     eca:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ecd:	8b 00                	mov    (%eax),%eax
     ecf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     ed2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     ed6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     eda:	75 25                	jne    f01 <printf+0xff>
          s = "(null)";
     edc:	c7 45 f4 ee 11 00 00 	movl   $0x11ee,-0xc(%ebp)
        while(*s != 0){
     ee3:	eb 1c                	jmp    f01 <printf+0xff>
          putc(fd, *s);
     ee5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ee8:	0f b6 00             	movzbl (%eax),%eax
     eeb:	0f be c0             	movsbl %al,%eax
     eee:	83 ec 08             	sub    $0x8,%esp
     ef1:	50                   	push   %eax
     ef2:	ff 75 08             	pushl  0x8(%ebp)
     ef5:	e8 31 fe ff ff       	call   d2b <putc>
     efa:	83 c4 10             	add    $0x10,%esp
          s++;
     efd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     f01:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f04:	0f b6 00             	movzbl (%eax),%eax
     f07:	84 c0                	test   %al,%al
     f09:	75 da                	jne    ee5 <printf+0xe3>
     f0b:	eb 65                	jmp    f72 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     f0d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     f11:	75 1d                	jne    f30 <printf+0x12e>
        putc(fd, *ap);
     f13:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f16:	8b 00                	mov    (%eax),%eax
     f18:	0f be c0             	movsbl %al,%eax
     f1b:	83 ec 08             	sub    $0x8,%esp
     f1e:	50                   	push   %eax
     f1f:	ff 75 08             	pushl  0x8(%ebp)
     f22:	e8 04 fe ff ff       	call   d2b <putc>
     f27:	83 c4 10             	add    $0x10,%esp
        ap++;
     f2a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     f2e:	eb 42                	jmp    f72 <printf+0x170>
      } else if(c == '%'){
     f30:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     f34:	75 17                	jne    f4d <printf+0x14b>
        putc(fd, c);
     f36:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f39:	0f be c0             	movsbl %al,%eax
     f3c:	83 ec 08             	sub    $0x8,%esp
     f3f:	50                   	push   %eax
     f40:	ff 75 08             	pushl  0x8(%ebp)
     f43:	e8 e3 fd ff ff       	call   d2b <putc>
     f48:	83 c4 10             	add    $0x10,%esp
     f4b:	eb 25                	jmp    f72 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     f4d:	83 ec 08             	sub    $0x8,%esp
     f50:	6a 25                	push   $0x25
     f52:	ff 75 08             	pushl  0x8(%ebp)
     f55:	e8 d1 fd ff ff       	call   d2b <putc>
     f5a:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     f5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f60:	0f be c0             	movsbl %al,%eax
     f63:	83 ec 08             	sub    $0x8,%esp
     f66:	50                   	push   %eax
     f67:	ff 75 08             	pushl  0x8(%ebp)
     f6a:	e8 bc fd ff ff       	call   d2b <putc>
     f6f:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     f72:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f79:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     f7d:	8b 55 0c             	mov    0xc(%ebp),%edx
     f80:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f83:	01 d0                	add    %edx,%eax
     f85:	0f b6 00             	movzbl (%eax),%eax
     f88:	84 c0                	test   %al,%al
     f8a:	0f 85 94 fe ff ff    	jne    e24 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     f90:	90                   	nop
     f91:	c9                   	leave  
     f92:	c3                   	ret    

00000f93 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     f93:	55                   	push   %ebp
     f94:	89 e5                	mov    %esp,%ebp
     f96:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     f99:	8b 45 08             	mov    0x8(%ebp),%eax
     f9c:	83 e8 08             	sub    $0x8,%eax
     f9f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fa2:	a1 e8 14 00 00       	mov    0x14e8,%eax
     fa7:	89 45 fc             	mov    %eax,-0x4(%ebp)
     faa:	eb 24                	jmp    fd0 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fac:	8b 45 fc             	mov    -0x4(%ebp),%eax
     faf:	8b 00                	mov    (%eax),%eax
     fb1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     fb4:	77 12                	ja     fc8 <free+0x35>
     fb6:	8b 45 f8             	mov    -0x8(%ebp),%eax
     fb9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     fbc:	77 24                	ja     fe2 <free+0x4f>
     fbe:	8b 45 fc             	mov    -0x4(%ebp),%eax
     fc1:	8b 00                	mov    (%eax),%eax
     fc3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     fc6:	77 1a                	ja     fe2 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fc8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     fcb:	8b 00                	mov    (%eax),%eax
     fcd:	89 45 fc             	mov    %eax,-0x4(%ebp)
     fd0:	8b 45 f8             	mov    -0x8(%ebp),%eax
     fd3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     fd6:	76 d4                	jbe    fac <free+0x19>
     fd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     fdb:	8b 00                	mov    (%eax),%eax
     fdd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     fe0:	76 ca                	jbe    fac <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     fe2:	8b 45 f8             	mov    -0x8(%ebp),%eax
     fe5:	8b 40 04             	mov    0x4(%eax),%eax
     fe8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     fef:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ff2:	01 c2                	add    %eax,%edx
     ff4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ff7:	8b 00                	mov    (%eax),%eax
     ff9:	39 c2                	cmp    %eax,%edx
     ffb:	75 24                	jne    1021 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     ffd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1000:	8b 50 04             	mov    0x4(%eax),%edx
    1003:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1006:	8b 00                	mov    (%eax),%eax
    1008:	8b 40 04             	mov    0x4(%eax),%eax
    100b:	01 c2                	add    %eax,%edx
    100d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1010:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1013:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1016:	8b 00                	mov    (%eax),%eax
    1018:	8b 10                	mov    (%eax),%edx
    101a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    101d:	89 10                	mov    %edx,(%eax)
    101f:	eb 0a                	jmp    102b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    1021:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1024:	8b 10                	mov    (%eax),%edx
    1026:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1029:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    102b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    102e:	8b 40 04             	mov    0x4(%eax),%eax
    1031:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1038:	8b 45 fc             	mov    -0x4(%ebp),%eax
    103b:	01 d0                	add    %edx,%eax
    103d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1040:	75 20                	jne    1062 <free+0xcf>
    p->s.size += bp->s.size;
    1042:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1045:	8b 50 04             	mov    0x4(%eax),%edx
    1048:	8b 45 f8             	mov    -0x8(%ebp),%eax
    104b:	8b 40 04             	mov    0x4(%eax),%eax
    104e:	01 c2                	add    %eax,%edx
    1050:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1053:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1056:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1059:	8b 10                	mov    (%eax),%edx
    105b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    105e:	89 10                	mov    %edx,(%eax)
    1060:	eb 08                	jmp    106a <free+0xd7>
  } else
    p->s.ptr = bp;
    1062:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1065:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1068:	89 10                	mov    %edx,(%eax)
  freep = p;
    106a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    106d:	a3 e8 14 00 00       	mov    %eax,0x14e8
}
    1072:	90                   	nop
    1073:	c9                   	leave  
    1074:	c3                   	ret    

00001075 <morecore>:

static Header*
morecore(uint nu)
{
    1075:	55                   	push   %ebp
    1076:	89 e5                	mov    %esp,%ebp
    1078:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    107b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1082:	77 07                	ja     108b <morecore+0x16>
    nu = 4096;
    1084:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    108b:	8b 45 08             	mov    0x8(%ebp),%eax
    108e:	c1 e0 03             	shl    $0x3,%eax
    1091:	83 ec 0c             	sub    $0xc,%esp
    1094:	50                   	push   %eax
    1095:	e8 7b f5 ff ff       	call   615 <sbrk>
    109a:	83 c4 10             	add    $0x10,%esp
    109d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    10a0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    10a4:	75 07                	jne    10ad <morecore+0x38>
    return 0;
    10a6:	b8 00 00 00 00       	mov    $0x0,%eax
    10ab:	eb 26                	jmp    10d3 <morecore+0x5e>
  hp = (Header*)p;
    10ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    10b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10b6:	8b 55 08             	mov    0x8(%ebp),%edx
    10b9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    10bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10bf:	83 c0 08             	add    $0x8,%eax
    10c2:	83 ec 0c             	sub    $0xc,%esp
    10c5:	50                   	push   %eax
    10c6:	e8 c8 fe ff ff       	call   f93 <free>
    10cb:	83 c4 10             	add    $0x10,%esp
  return freep;
    10ce:	a1 e8 14 00 00       	mov    0x14e8,%eax
}
    10d3:	c9                   	leave  
    10d4:	c3                   	ret    

000010d5 <malloc>:

void*
malloc(uint nbytes)
{
    10d5:	55                   	push   %ebp
    10d6:	89 e5                	mov    %esp,%ebp
    10d8:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10db:	8b 45 08             	mov    0x8(%ebp),%eax
    10de:	83 c0 07             	add    $0x7,%eax
    10e1:	c1 e8 03             	shr    $0x3,%eax
    10e4:	83 c0 01             	add    $0x1,%eax
    10e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    10ea:	a1 e8 14 00 00       	mov    0x14e8,%eax
    10ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
    10f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10f6:	75 23                	jne    111b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    10f8:	c7 45 f0 e0 14 00 00 	movl   $0x14e0,-0x10(%ebp)
    10ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1102:	a3 e8 14 00 00       	mov    %eax,0x14e8
    1107:	a1 e8 14 00 00       	mov    0x14e8,%eax
    110c:	a3 e0 14 00 00       	mov    %eax,0x14e0
    base.s.size = 0;
    1111:	c7 05 e4 14 00 00 00 	movl   $0x0,0x14e4
    1118:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    111b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    111e:	8b 00                	mov    (%eax),%eax
    1120:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1123:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1126:	8b 40 04             	mov    0x4(%eax),%eax
    1129:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    112c:	72 4d                	jb     117b <malloc+0xa6>
      if(p->s.size == nunits)
    112e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1131:	8b 40 04             	mov    0x4(%eax),%eax
    1134:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1137:	75 0c                	jne    1145 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1139:	8b 45 f4             	mov    -0xc(%ebp),%eax
    113c:	8b 10                	mov    (%eax),%edx
    113e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1141:	89 10                	mov    %edx,(%eax)
    1143:	eb 26                	jmp    116b <malloc+0x96>
      else {
        p->s.size -= nunits;
    1145:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1148:	8b 40 04             	mov    0x4(%eax),%eax
    114b:	2b 45 ec             	sub    -0x14(%ebp),%eax
    114e:	89 c2                	mov    %eax,%edx
    1150:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1153:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1156:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1159:	8b 40 04             	mov    0x4(%eax),%eax
    115c:	c1 e0 03             	shl    $0x3,%eax
    115f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1162:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1165:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1168:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    116b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    116e:	a3 e8 14 00 00       	mov    %eax,0x14e8
      return (void*)(p + 1);
    1173:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1176:	83 c0 08             	add    $0x8,%eax
    1179:	eb 3b                	jmp    11b6 <malloc+0xe1>
    }
    if(p == freep)
    117b:	a1 e8 14 00 00       	mov    0x14e8,%eax
    1180:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1183:	75 1e                	jne    11a3 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    1185:	83 ec 0c             	sub    $0xc,%esp
    1188:	ff 75 ec             	pushl  -0x14(%ebp)
    118b:	e8 e5 fe ff ff       	call   1075 <morecore>
    1190:	83 c4 10             	add    $0x10,%esp
    1193:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1196:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    119a:	75 07                	jne    11a3 <malloc+0xce>
        return 0;
    119c:	b8 00 00 00 00       	mov    $0x0,%eax
    11a1:	eb 13                	jmp    11b6 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    11a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11ac:	8b 00                	mov    (%eax),%eax
    11ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    11b1:	e9 6d ff ff ff       	jmp    1123 <malloc+0x4e>
}
    11b6:	c9                   	leave  
    11b7:	c3                   	ret    
