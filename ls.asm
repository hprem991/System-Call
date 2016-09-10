
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	53                   	push   %ebx
       4:	83 ec 14             	sub    $0x14,%esp
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
       7:	83 ec 0c             	sub    $0xc,%esp
       a:	ff 75 08             	pushl  0x8(%ebp)
       d:	e8 c9 03 00 00       	call   3db <strlen>
      12:	83 c4 10             	add    $0x10,%esp
      15:	89 c2                	mov    %eax,%edx
      17:	8b 45 08             	mov    0x8(%ebp),%eax
      1a:	01 d0                	add    %edx,%eax
      1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
      1f:	eb 04                	jmp    25 <fmtname+0x25>
      21:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
      25:	8b 45 f4             	mov    -0xc(%ebp),%eax
      28:	3b 45 08             	cmp    0x8(%ebp),%eax
      2b:	72 0a                	jb     37 <fmtname+0x37>
      2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      30:	0f b6 00             	movzbl (%eax),%eax
      33:	3c 2f                	cmp    $0x2f,%al
      35:	75 ea                	jne    21 <fmtname+0x21>
    ;
  p++;
      37:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
      3b:	83 ec 0c             	sub    $0xc,%esp
      3e:	ff 75 f4             	pushl  -0xc(%ebp)
      41:	e8 95 03 00 00       	call   3db <strlen>
      46:	83 c4 10             	add    $0x10,%esp
      49:	83 f8 0d             	cmp    $0xd,%eax
      4c:	76 05                	jbe    53 <fmtname+0x53>
    return p;
      4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
      51:	eb 60                	jmp    b3 <fmtname+0xb3>
  memmove(buf, p, strlen(p));
      53:	83 ec 0c             	sub    $0xc,%esp
      56:	ff 75 f4             	pushl  -0xc(%ebp)
      59:	e8 7d 03 00 00       	call   3db <strlen>
      5e:	83 c4 10             	add    $0x10,%esp
      61:	83 ec 04             	sub    $0x4,%esp
      64:	50                   	push   %eax
      65:	ff 75 f4             	pushl  -0xc(%ebp)
      68:	68 d0 14 00 00       	push   $0x14d0
      6d:	e8 e6 04 00 00       	call   558 <memmove>
      72:	83 c4 10             	add    $0x10,%esp
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
      75:	83 ec 0c             	sub    $0xc,%esp
      78:	ff 75 f4             	pushl  -0xc(%ebp)
      7b:	e8 5b 03 00 00       	call   3db <strlen>
      80:	83 c4 10             	add    $0x10,%esp
      83:	ba 0e 00 00 00       	mov    $0xe,%edx
      88:	89 d3                	mov    %edx,%ebx
      8a:	29 c3                	sub    %eax,%ebx
      8c:	83 ec 0c             	sub    $0xc,%esp
      8f:	ff 75 f4             	pushl  -0xc(%ebp)
      92:	e8 44 03 00 00       	call   3db <strlen>
      97:	83 c4 10             	add    $0x10,%esp
      9a:	05 d0 14 00 00       	add    $0x14d0,%eax
      9f:	83 ec 04             	sub    $0x4,%esp
      a2:	53                   	push   %ebx
      a3:	6a 20                	push   $0x20
      a5:	50                   	push   %eax
      a6:	e8 57 03 00 00       	call   402 <memset>
      ab:	83 c4 10             	add    $0x10,%esp
  return buf;
      ae:	b8 d0 14 00 00       	mov    $0x14d0,%eax
}
      b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      b6:	c9                   	leave  
      b7:	c3                   	ret    

000000b8 <ls>:

void
ls(char *path)
{
      b8:	55                   	push   %ebp
      b9:	89 e5                	mov    %esp,%ebp
      bb:	57                   	push   %edi
      bc:	56                   	push   %esi
      bd:	53                   	push   %ebx
      be:	81 ec 3c 02 00 00    	sub    $0x23c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
      c4:	83 ec 08             	sub    $0x8,%esp
      c7:	6a 00                	push   $0x0
      c9:	ff 75 08             	pushl  0x8(%ebp)
      cc:	e8 0c 05 00 00       	call   5dd <open>
      d1:	83 c4 10             	add    $0x10,%esp
      d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      d7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
      db:	79 1a                	jns    f7 <ls+0x3f>
    printf(2, "ls: cannot open %s\n", path);
      dd:	83 ec 04             	sub    $0x4,%esp
      e0:	ff 75 08             	pushl  0x8(%ebp)
      e3:	68 c8 11 00 00       	push   $0x11c8
      e8:	6a 02                	push   $0x2
      ea:	e8 23 0d 00 00       	call   e12 <printf>
      ef:	83 c4 10             	add    $0x10,%esp
    return;
      f2:	e9 e3 01 00 00       	jmp    2da <ls+0x222>
  }
  
  if(fstat(fd, &st) < 0){
      f7:	83 ec 08             	sub    $0x8,%esp
      fa:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
     100:	50                   	push   %eax
     101:	ff 75 e4             	pushl  -0x1c(%ebp)
     104:	e8 ec 04 00 00       	call   5f5 <fstat>
     109:	83 c4 10             	add    $0x10,%esp
     10c:	85 c0                	test   %eax,%eax
     10e:	79 28                	jns    138 <ls+0x80>
    printf(2, "ls: cannot stat %s\n", path);
     110:	83 ec 04             	sub    $0x4,%esp
     113:	ff 75 08             	pushl  0x8(%ebp)
     116:	68 dc 11 00 00       	push   $0x11dc
     11b:	6a 02                	push   $0x2
     11d:	e8 f0 0c 00 00       	call   e12 <printf>
     122:	83 c4 10             	add    $0x10,%esp
    close(fd);
     125:	83 ec 0c             	sub    $0xc,%esp
     128:	ff 75 e4             	pushl  -0x1c(%ebp)
     12b:	e8 95 04 00 00       	call   5c5 <close>
     130:	83 c4 10             	add    $0x10,%esp
    return;
     133:	e9 a2 01 00 00       	jmp    2da <ls+0x222>
  }
  
  switch(st.type){
     138:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
     13f:	98                   	cwtl   
     140:	83 f8 01             	cmp    $0x1,%eax
     143:	74 48                	je     18d <ls+0xd5>
     145:	83 f8 02             	cmp    $0x2,%eax
     148:	0f 85 7e 01 00 00    	jne    2cc <ls+0x214>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     14e:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
     154:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
     15a:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
     161:	0f bf d8             	movswl %ax,%ebx
     164:	83 ec 0c             	sub    $0xc,%esp
     167:	ff 75 08             	pushl  0x8(%ebp)
     16a:	e8 91 fe ff ff       	call   0 <fmtname>
     16f:	83 c4 10             	add    $0x10,%esp
     172:	83 ec 08             	sub    $0x8,%esp
     175:	57                   	push   %edi
     176:	56                   	push   %esi
     177:	53                   	push   %ebx
     178:	50                   	push   %eax
     179:	68 f0 11 00 00       	push   $0x11f0
     17e:	6a 01                	push   $0x1
     180:	e8 8d 0c 00 00       	call   e12 <printf>
     185:	83 c4 20             	add    $0x20,%esp
    break;
     188:	e9 3f 01 00 00       	jmp    2cc <ls+0x214>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     18d:	83 ec 0c             	sub    $0xc,%esp
     190:	ff 75 08             	pushl  0x8(%ebp)
     193:	e8 43 02 00 00       	call   3db <strlen>
     198:	83 c4 10             	add    $0x10,%esp
     19b:	83 c0 10             	add    $0x10,%eax
     19e:	3d 00 02 00 00       	cmp    $0x200,%eax
     1a3:	76 17                	jbe    1bc <ls+0x104>
      printf(1, "ls: path too long\n");
     1a5:	83 ec 08             	sub    $0x8,%esp
     1a8:	68 fd 11 00 00       	push   $0x11fd
     1ad:	6a 01                	push   $0x1
     1af:	e8 5e 0c 00 00       	call   e12 <printf>
     1b4:	83 c4 10             	add    $0x10,%esp
      break;
     1b7:	e9 10 01 00 00       	jmp    2cc <ls+0x214>
    }
    strcpy(buf, path);
     1bc:	83 ec 08             	sub    $0x8,%esp
     1bf:	ff 75 08             	pushl  0x8(%ebp)
     1c2:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     1c8:	50                   	push   %eax
     1c9:	e8 9e 01 00 00       	call   36c <strcpy>
     1ce:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
     1d1:	83 ec 0c             	sub    $0xc,%esp
     1d4:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     1da:	50                   	push   %eax
     1db:	e8 fb 01 00 00       	call   3db <strlen>
     1e0:	83 c4 10             	add    $0x10,%esp
     1e3:	89 c2                	mov    %eax,%edx
     1e5:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     1eb:	01 d0                	add    %edx,%eax
     1ed:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
     1f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1f3:	8d 50 01             	lea    0x1(%eax),%edx
     1f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
     1f9:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     1fc:	e9 aa 00 00 00       	jmp    2ab <ls+0x1f3>
      if(de.inum == 0)
     201:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
     208:	66 85 c0             	test   %ax,%ax
     20b:	75 05                	jne    212 <ls+0x15a>
        continue;
     20d:	e9 99 00 00 00       	jmp    2ab <ls+0x1f3>
      memmove(p, de.name, DIRSIZ);
     212:	83 ec 04             	sub    $0x4,%esp
     215:	6a 0e                	push   $0xe
     217:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     21d:	83 c0 02             	add    $0x2,%eax
     220:	50                   	push   %eax
     221:	ff 75 e0             	pushl  -0x20(%ebp)
     224:	e8 2f 03 00 00       	call   558 <memmove>
     229:	83 c4 10             	add    $0x10,%esp
      p[DIRSIZ] = 0;
     22c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     22f:	83 c0 0e             	add    $0xe,%eax
     232:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
     235:	83 ec 08             	sub    $0x8,%esp
     238:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
     23e:	50                   	push   %eax
     23f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     245:	50                   	push   %eax
     246:	e8 73 02 00 00       	call   4be <stat>
     24b:	83 c4 10             	add    $0x10,%esp
     24e:	85 c0                	test   %eax,%eax
     250:	79 1b                	jns    26d <ls+0x1b5>
        printf(1, "ls: cannot stat %s\n", buf);
     252:	83 ec 04             	sub    $0x4,%esp
     255:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     25b:	50                   	push   %eax
     25c:	68 dc 11 00 00       	push   $0x11dc
     261:	6a 01                	push   $0x1
     263:	e8 aa 0b 00 00       	call   e12 <printf>
     268:	83 c4 10             	add    $0x10,%esp
        continue;
     26b:	eb 3e                	jmp    2ab <ls+0x1f3>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
     26d:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
     273:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
     279:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
     280:	0f bf d8             	movswl %ax,%ebx
     283:	83 ec 0c             	sub    $0xc,%esp
     286:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     28c:	50                   	push   %eax
     28d:	e8 6e fd ff ff       	call   0 <fmtname>
     292:	83 c4 10             	add    $0x10,%esp
     295:	83 ec 08             	sub    $0x8,%esp
     298:	57                   	push   %edi
     299:	56                   	push   %esi
     29a:	53                   	push   %ebx
     29b:	50                   	push   %eax
     29c:	68 f0 11 00 00       	push   $0x11f0
     2a1:	6a 01                	push   $0x1
     2a3:	e8 6a 0b 00 00       	call   e12 <printf>
     2a8:	83 c4 20             	add    $0x20,%esp
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     2ab:	83 ec 04             	sub    $0x4,%esp
     2ae:	6a 10                	push   $0x10
     2b0:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2b6:	50                   	push   %eax
     2b7:	ff 75 e4             	pushl  -0x1c(%ebp)
     2ba:	e8 f6 02 00 00       	call   5b5 <read>
     2bf:	83 c4 10             	add    $0x10,%esp
     2c2:	83 f8 10             	cmp    $0x10,%eax
     2c5:	0f 84 36 ff ff ff    	je     201 <ls+0x149>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
     2cb:	90                   	nop
  }
  close(fd);
     2cc:	83 ec 0c             	sub    $0xc,%esp
     2cf:	ff 75 e4             	pushl  -0x1c(%ebp)
     2d2:	e8 ee 02 00 00       	call   5c5 <close>
     2d7:	83 c4 10             	add    $0x10,%esp
}
     2da:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2dd:	5b                   	pop    %ebx
     2de:	5e                   	pop    %esi
     2df:	5f                   	pop    %edi
     2e0:	5d                   	pop    %ebp
     2e1:	c3                   	ret    

000002e2 <main>:

int
main(int argc, char *argv[])
{
     2e2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     2e6:	83 e4 f0             	and    $0xfffffff0,%esp
     2e9:	ff 71 fc             	pushl  -0x4(%ecx)
     2ec:	55                   	push   %ebp
     2ed:	89 e5                	mov    %esp,%ebp
     2ef:	53                   	push   %ebx
     2f0:	51                   	push   %ecx
     2f1:	83 ec 10             	sub    $0x10,%esp
     2f4:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
     2f6:	83 3b 01             	cmpl   $0x1,(%ebx)
     2f9:	7f 15                	jg     310 <main+0x2e>
    ls(".");
     2fb:	83 ec 0c             	sub    $0xc,%esp
     2fe:	68 10 12 00 00       	push   $0x1210
     303:	e8 b0 fd ff ff       	call   b8 <ls>
     308:	83 c4 10             	add    $0x10,%esp
    exit();
     30b:	e8 8d 02 00 00       	call   59d <exit>
  }
  for(i=1; i<argc; i++)
     310:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
     317:	eb 21                	jmp    33a <main+0x58>
    ls(argv[i]);
     319:	8b 45 f4             	mov    -0xc(%ebp),%eax
     31c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     323:	8b 43 04             	mov    0x4(%ebx),%eax
     326:	01 d0                	add    %edx,%eax
     328:	8b 00                	mov    (%eax),%eax
     32a:	83 ec 0c             	sub    $0xc,%esp
     32d:	50                   	push   %eax
     32e:	e8 85 fd ff ff       	call   b8 <ls>
     333:	83 c4 10             	add    $0x10,%esp

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
     336:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     33a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     33d:	3b 03                	cmp    (%ebx),%eax
     33f:	7c d8                	jl     319 <main+0x37>
    ls(argv[i]);
  exit();
     341:	e8 57 02 00 00       	call   59d <exit>

00000346 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     346:	55                   	push   %ebp
     347:	89 e5                	mov    %esp,%ebp
     349:	57                   	push   %edi
     34a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     34b:	8b 4d 08             	mov    0x8(%ebp),%ecx
     34e:	8b 55 10             	mov    0x10(%ebp),%edx
     351:	8b 45 0c             	mov    0xc(%ebp),%eax
     354:	89 cb                	mov    %ecx,%ebx
     356:	89 df                	mov    %ebx,%edi
     358:	89 d1                	mov    %edx,%ecx
     35a:	fc                   	cld    
     35b:	f3 aa                	rep stos %al,%es:(%edi)
     35d:	89 ca                	mov    %ecx,%edx
     35f:	89 fb                	mov    %edi,%ebx
     361:	89 5d 08             	mov    %ebx,0x8(%ebp)
     364:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     367:	90                   	nop
     368:	5b                   	pop    %ebx
     369:	5f                   	pop    %edi
     36a:	5d                   	pop    %ebp
     36b:	c3                   	ret    

0000036c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     36c:	55                   	push   %ebp
     36d:	89 e5                	mov    %esp,%ebp
     36f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     372:	8b 45 08             	mov    0x8(%ebp),%eax
     375:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     378:	90                   	nop
     379:	8b 45 08             	mov    0x8(%ebp),%eax
     37c:	8d 50 01             	lea    0x1(%eax),%edx
     37f:	89 55 08             	mov    %edx,0x8(%ebp)
     382:	8b 55 0c             	mov    0xc(%ebp),%edx
     385:	8d 4a 01             	lea    0x1(%edx),%ecx
     388:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     38b:	0f b6 12             	movzbl (%edx),%edx
     38e:	88 10                	mov    %dl,(%eax)
     390:	0f b6 00             	movzbl (%eax),%eax
     393:	84 c0                	test   %al,%al
     395:	75 e2                	jne    379 <strcpy+0xd>
    ;
  return os;
     397:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     39a:	c9                   	leave  
     39b:	c3                   	ret    

0000039c <strcmp>:

int
strcmp(const char *p, const char *q)
{
     39c:	55                   	push   %ebp
     39d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     39f:	eb 08                	jmp    3a9 <strcmp+0xd>
    p++, q++;
     3a1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     3a5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     3a9:	8b 45 08             	mov    0x8(%ebp),%eax
     3ac:	0f b6 00             	movzbl (%eax),%eax
     3af:	84 c0                	test   %al,%al
     3b1:	74 10                	je     3c3 <strcmp+0x27>
     3b3:	8b 45 08             	mov    0x8(%ebp),%eax
     3b6:	0f b6 10             	movzbl (%eax),%edx
     3b9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3bc:	0f b6 00             	movzbl (%eax),%eax
     3bf:	38 c2                	cmp    %al,%dl
     3c1:	74 de                	je     3a1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     3c3:	8b 45 08             	mov    0x8(%ebp),%eax
     3c6:	0f b6 00             	movzbl (%eax),%eax
     3c9:	0f b6 d0             	movzbl %al,%edx
     3cc:	8b 45 0c             	mov    0xc(%ebp),%eax
     3cf:	0f b6 00             	movzbl (%eax),%eax
     3d2:	0f b6 c0             	movzbl %al,%eax
     3d5:	29 c2                	sub    %eax,%edx
     3d7:	89 d0                	mov    %edx,%eax
}
     3d9:	5d                   	pop    %ebp
     3da:	c3                   	ret    

000003db <strlen>:

uint
strlen(char *s)
{
     3db:	55                   	push   %ebp
     3dc:	89 e5                	mov    %esp,%ebp
     3de:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     3e1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     3e8:	eb 04                	jmp    3ee <strlen+0x13>
     3ea:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     3ee:	8b 55 fc             	mov    -0x4(%ebp),%edx
     3f1:	8b 45 08             	mov    0x8(%ebp),%eax
     3f4:	01 d0                	add    %edx,%eax
     3f6:	0f b6 00             	movzbl (%eax),%eax
     3f9:	84 c0                	test   %al,%al
     3fb:	75 ed                	jne    3ea <strlen+0xf>
    ;
  return n;
     3fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     400:	c9                   	leave  
     401:	c3                   	ret    

00000402 <memset>:

void*
memset(void *dst, int c, uint n)
{
     402:	55                   	push   %ebp
     403:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     405:	8b 45 10             	mov    0x10(%ebp),%eax
     408:	50                   	push   %eax
     409:	ff 75 0c             	pushl  0xc(%ebp)
     40c:	ff 75 08             	pushl  0x8(%ebp)
     40f:	e8 32 ff ff ff       	call   346 <stosb>
     414:	83 c4 0c             	add    $0xc,%esp
  return dst;
     417:	8b 45 08             	mov    0x8(%ebp),%eax
}
     41a:	c9                   	leave  
     41b:	c3                   	ret    

0000041c <strchr>:

char*
strchr(const char *s, char c)
{
     41c:	55                   	push   %ebp
     41d:	89 e5                	mov    %esp,%ebp
     41f:	83 ec 04             	sub    $0x4,%esp
     422:	8b 45 0c             	mov    0xc(%ebp),%eax
     425:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     428:	eb 14                	jmp    43e <strchr+0x22>
    if(*s == c)
     42a:	8b 45 08             	mov    0x8(%ebp),%eax
     42d:	0f b6 00             	movzbl (%eax),%eax
     430:	3a 45 fc             	cmp    -0x4(%ebp),%al
     433:	75 05                	jne    43a <strchr+0x1e>
      return (char*)s;
     435:	8b 45 08             	mov    0x8(%ebp),%eax
     438:	eb 13                	jmp    44d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     43a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     43e:	8b 45 08             	mov    0x8(%ebp),%eax
     441:	0f b6 00             	movzbl (%eax),%eax
     444:	84 c0                	test   %al,%al
     446:	75 e2                	jne    42a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     448:	b8 00 00 00 00       	mov    $0x0,%eax
}
     44d:	c9                   	leave  
     44e:	c3                   	ret    

0000044f <gets>:

char*
gets(char *buf, int max)
{
     44f:	55                   	push   %ebp
     450:	89 e5                	mov    %esp,%ebp
     452:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     455:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     45c:	eb 42                	jmp    4a0 <gets+0x51>
    cc = read(0, &c, 1);
     45e:	83 ec 04             	sub    $0x4,%esp
     461:	6a 01                	push   $0x1
     463:	8d 45 ef             	lea    -0x11(%ebp),%eax
     466:	50                   	push   %eax
     467:	6a 00                	push   $0x0
     469:	e8 47 01 00 00       	call   5b5 <read>
     46e:	83 c4 10             	add    $0x10,%esp
     471:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     474:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     478:	7e 33                	jle    4ad <gets+0x5e>
      break;
    buf[i++] = c;
     47a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     47d:	8d 50 01             	lea    0x1(%eax),%edx
     480:	89 55 f4             	mov    %edx,-0xc(%ebp)
     483:	89 c2                	mov    %eax,%edx
     485:	8b 45 08             	mov    0x8(%ebp),%eax
     488:	01 c2                	add    %eax,%edx
     48a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     48e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     490:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     494:	3c 0a                	cmp    $0xa,%al
     496:	74 16                	je     4ae <gets+0x5f>
     498:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     49c:	3c 0d                	cmp    $0xd,%al
     49e:	74 0e                	je     4ae <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     4a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4a3:	83 c0 01             	add    $0x1,%eax
     4a6:	3b 45 0c             	cmp    0xc(%ebp),%eax
     4a9:	7c b3                	jl     45e <gets+0xf>
     4ab:	eb 01                	jmp    4ae <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     4ad:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     4ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
     4b1:	8b 45 08             	mov    0x8(%ebp),%eax
     4b4:	01 d0                	add    %edx,%eax
     4b6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     4b9:	8b 45 08             	mov    0x8(%ebp),%eax
}
     4bc:	c9                   	leave  
     4bd:	c3                   	ret    

000004be <stat>:

int
stat(char *n, struct stat *st)
{
     4be:	55                   	push   %ebp
     4bf:	89 e5                	mov    %esp,%ebp
     4c1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     4c4:	83 ec 08             	sub    $0x8,%esp
     4c7:	6a 00                	push   $0x0
     4c9:	ff 75 08             	pushl  0x8(%ebp)
     4cc:	e8 0c 01 00 00       	call   5dd <open>
     4d1:	83 c4 10             	add    $0x10,%esp
     4d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     4d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     4db:	79 07                	jns    4e4 <stat+0x26>
    return -1;
     4dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     4e2:	eb 25                	jmp    509 <stat+0x4b>
  r = fstat(fd, st);
     4e4:	83 ec 08             	sub    $0x8,%esp
     4e7:	ff 75 0c             	pushl  0xc(%ebp)
     4ea:	ff 75 f4             	pushl  -0xc(%ebp)
     4ed:	e8 03 01 00 00       	call   5f5 <fstat>
     4f2:	83 c4 10             	add    $0x10,%esp
     4f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     4f8:	83 ec 0c             	sub    $0xc,%esp
     4fb:	ff 75 f4             	pushl  -0xc(%ebp)
     4fe:	e8 c2 00 00 00       	call   5c5 <close>
     503:	83 c4 10             	add    $0x10,%esp
  return r;
     506:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     509:	c9                   	leave  
     50a:	c3                   	ret    

0000050b <atoi>:

int
atoi(const char *s)
{
     50b:	55                   	push   %ebp
     50c:	89 e5                	mov    %esp,%ebp
     50e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     511:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     518:	eb 25                	jmp    53f <atoi+0x34>
    n = n*10 + *s++ - '0';
     51a:	8b 55 fc             	mov    -0x4(%ebp),%edx
     51d:	89 d0                	mov    %edx,%eax
     51f:	c1 e0 02             	shl    $0x2,%eax
     522:	01 d0                	add    %edx,%eax
     524:	01 c0                	add    %eax,%eax
     526:	89 c1                	mov    %eax,%ecx
     528:	8b 45 08             	mov    0x8(%ebp),%eax
     52b:	8d 50 01             	lea    0x1(%eax),%edx
     52e:	89 55 08             	mov    %edx,0x8(%ebp)
     531:	0f b6 00             	movzbl (%eax),%eax
     534:	0f be c0             	movsbl %al,%eax
     537:	01 c8                	add    %ecx,%eax
     539:	83 e8 30             	sub    $0x30,%eax
     53c:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     53f:	8b 45 08             	mov    0x8(%ebp),%eax
     542:	0f b6 00             	movzbl (%eax),%eax
     545:	3c 2f                	cmp    $0x2f,%al
     547:	7e 0a                	jle    553 <atoi+0x48>
     549:	8b 45 08             	mov    0x8(%ebp),%eax
     54c:	0f b6 00             	movzbl (%eax),%eax
     54f:	3c 39                	cmp    $0x39,%al
     551:	7e c7                	jle    51a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     553:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     556:	c9                   	leave  
     557:	c3                   	ret    

00000558 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     558:	55                   	push   %ebp
     559:	89 e5                	mov    %esp,%ebp
     55b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     55e:	8b 45 08             	mov    0x8(%ebp),%eax
     561:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     564:	8b 45 0c             	mov    0xc(%ebp),%eax
     567:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     56a:	eb 17                	jmp    583 <memmove+0x2b>
    *dst++ = *src++;
     56c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     56f:	8d 50 01             	lea    0x1(%eax),%edx
     572:	89 55 fc             	mov    %edx,-0x4(%ebp)
     575:	8b 55 f8             	mov    -0x8(%ebp),%edx
     578:	8d 4a 01             	lea    0x1(%edx),%ecx
     57b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     57e:	0f b6 12             	movzbl (%edx),%edx
     581:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     583:	8b 45 10             	mov    0x10(%ebp),%eax
     586:	8d 50 ff             	lea    -0x1(%eax),%edx
     589:	89 55 10             	mov    %edx,0x10(%ebp)
     58c:	85 c0                	test   %eax,%eax
     58e:	7f dc                	jg     56c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     590:	8b 45 08             	mov    0x8(%ebp),%eax
}
     593:	c9                   	leave  
     594:	c3                   	ret    

00000595 <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
     595:	b8 01 00 00 00       	mov    $0x1,%eax
     59a:	cd 40                	int    $0x40
     59c:	c3                   	ret    

0000059d <exit>:
SYSCALL(exit)
     59d:	b8 02 00 00 00       	mov    $0x2,%eax
     5a2:	cd 40                	int    $0x40
     5a4:	c3                   	ret    

000005a5 <wait>:
SYSCALL(wait)
     5a5:	b8 03 00 00 00       	mov    $0x3,%eax
     5aa:	cd 40                	int    $0x40
     5ac:	c3                   	ret    

000005ad <pipe>:
SYSCALL(pipe)
     5ad:	b8 04 00 00 00       	mov    $0x4,%eax
     5b2:	cd 40                	int    $0x40
     5b4:	c3                   	ret    

000005b5 <read>:
SYSCALL(read)
     5b5:	b8 05 00 00 00       	mov    $0x5,%eax
     5ba:	cd 40                	int    $0x40
     5bc:	c3                   	ret    

000005bd <write>:
SYSCALL(write)
     5bd:	b8 10 00 00 00       	mov    $0x10,%eax
     5c2:	cd 40                	int    $0x40
     5c4:	c3                   	ret    

000005c5 <close>:
SYSCALL(close)
     5c5:	b8 15 00 00 00       	mov    $0x15,%eax
     5ca:	cd 40                	int    $0x40
     5cc:	c3                   	ret    

000005cd <kill>:
SYSCALL(kill)
     5cd:	b8 06 00 00 00       	mov    $0x6,%eax
     5d2:	cd 40                	int    $0x40
     5d4:	c3                   	ret    

000005d5 <exec>:
SYSCALL(exec)
     5d5:	b8 07 00 00 00       	mov    $0x7,%eax
     5da:	cd 40                	int    $0x40
     5dc:	c3                   	ret    

000005dd <open>:
SYSCALL(open)
     5dd:	b8 0f 00 00 00       	mov    $0xf,%eax
     5e2:	cd 40                	int    $0x40
     5e4:	c3                   	ret    

000005e5 <mknod>:
SYSCALL(mknod)
     5e5:	b8 11 00 00 00       	mov    $0x11,%eax
     5ea:	cd 40                	int    $0x40
     5ec:	c3                   	ret    

000005ed <unlink>:
SYSCALL(unlink)
     5ed:	b8 12 00 00 00       	mov    $0x12,%eax
     5f2:	cd 40                	int    $0x40
     5f4:	c3                   	ret    

000005f5 <fstat>:
SYSCALL(fstat)
     5f5:	b8 08 00 00 00       	mov    $0x8,%eax
     5fa:	cd 40                	int    $0x40
     5fc:	c3                   	ret    

000005fd <link>:
SYSCALL(link)
     5fd:	b8 13 00 00 00       	mov    $0x13,%eax
     602:	cd 40                	int    $0x40
     604:	c3                   	ret    

00000605 <mkdir>:
SYSCALL(mkdir)
     605:	b8 14 00 00 00       	mov    $0x14,%eax
     60a:	cd 40                	int    $0x40
     60c:	c3                   	ret    

0000060d <chdir>:
SYSCALL(chdir)
     60d:	b8 09 00 00 00       	mov    $0x9,%eax
     612:	cd 40                	int    $0x40
     614:	c3                   	ret    

00000615 <dup>:
SYSCALL(dup)
     615:	b8 0a 00 00 00       	mov    $0xa,%eax
     61a:	cd 40                	int    $0x40
     61c:	c3                   	ret    

0000061d <getpid>:
SYSCALL(getpid)
     61d:	b8 0b 00 00 00       	mov    $0xb,%eax
     622:	cd 40                	int    $0x40
     624:	c3                   	ret    

00000625 <sbrk>:
SYSCALL(sbrk)
     625:	b8 0c 00 00 00       	mov    $0xc,%eax
     62a:	cd 40                	int    $0x40
     62c:	c3                   	ret    

0000062d <sleep>:
SYSCALL(sleep)
     62d:	b8 0d 00 00 00       	mov    $0xd,%eax
     632:	cd 40                	int    $0x40
     634:	c3                   	ret    

00000635 <uptime>:
SYSCALL(uptime)
     635:	b8 0e 00 00 00       	mov    $0xe,%eax
     63a:	cd 40                	int    $0x40
     63c:	c3                   	ret    

0000063d <date>:

// Assignment starts here

SYSCALL(date)
     63d:	b8 16 00 00 00       	mov    $0x16,%eax
     642:	cd 40                	int    $0x40
     644:	c3                   	ret    

00000645 <str_ls_call1>:
     645:	6c                   	insb   (%dx),%es:(%edi)
     646:	73 5f                	jae    6a7 <ls_call6+0x4>
     648:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     64b:	6c                   	insb   (%dx),%es:(%edi)
     64c:	31 00                	xor    %eax,(%eax)

0000064e <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
     64e:	b8 45 06 00 00       	mov    $0x645,%eax
     653:	cd 41                	int    $0x41
     655:	c3                   	ret    

00000656 <str_ls_call2>:
     656:	6c                   	insb   (%dx),%es:(%edi)
     657:	73 5f                	jae    6b8 <ls_call7+0x4>
     659:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     65c:	6c                   	insb   (%dx),%es:(%edi)
     65d:	32 00                	xor    (%eax),%al

0000065f <ls_call2>:
CS550LSSYSCALL(ls_call2)
     65f:	b8 56 06 00 00       	mov    $0x656,%eax
     664:	cd 41                	int    $0x41
     666:	c3                   	ret    

00000667 <str_ls_call3>:
     667:	6c                   	insb   (%dx),%es:(%edi)
     668:	73 5f                	jae    6c9 <ls_call8+0x4>
     66a:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     66d:	6c                   	insb   (%dx),%es:(%edi)
     66e:	33 00                	xor    (%eax),%eax

00000670 <ls_call3>:
CS550LSSYSCALL(ls_call3)
     670:	b8 67 06 00 00       	mov    $0x667,%eax
     675:	cd 41                	int    $0x41
     677:	c3                   	ret    

00000678 <str_ls_call4>:
     678:	6c                   	insb   (%dx),%es:(%edi)
     679:	73 5f                	jae    6da <ls_call9+0x4>
     67b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     67e:	6c                   	insb   (%dx),%es:(%edi)
     67f:	34 00                	xor    $0x0,%al

00000681 <ls_call4>:
CS550LSSYSCALL(ls_call4)
     681:	b8 78 06 00 00       	mov    $0x678,%eax
     686:	cd 41                	int    $0x41
     688:	c3                   	ret    

00000689 <str_ls_call5>:
     689:	6c                   	insb   (%dx),%es:(%edi)
     68a:	73 5f                	jae    6eb <ls_call10+0x3>
     68c:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     68f:	6c                   	insb   (%dx),%es:(%edi)
     690:	35                   	.byte 0x35
	...

00000692 <ls_call5>:
CS550LSSYSCALL(ls_call5)
     692:	b8 89 06 00 00       	mov    $0x689,%eax
     697:	cd 41                	int    $0x41
     699:	c3                   	ret    

0000069a <str_ls_call6>:
     69a:	6c                   	insb   (%dx),%es:(%edi)
     69b:	73 5f                	jae    6fc <ls_call11+0x2>
     69d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6a0:	6c                   	insb   (%dx),%es:(%edi)
     6a1:	36                   	ss
	...

000006a3 <ls_call6>:
CS550LSSYSCALL(ls_call6)
     6a3:	b8 9a 06 00 00       	mov    $0x69a,%eax
     6a8:	cd 41                	int    $0x41
     6aa:	c3                   	ret    

000006ab <str_ls_call7>:
     6ab:	6c                   	insb   (%dx),%es:(%edi)
     6ac:	73 5f                	jae    70d <ls_call12+0x1>
     6ae:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6b1:	6c                   	insb   (%dx),%es:(%edi)
     6b2:	37                   	aaa    
	...

000006b4 <ls_call7>:
CS550LSSYSCALL(ls_call7)
     6b4:	b8 ab 06 00 00       	mov    $0x6ab,%eax
     6b9:	cd 41                	int    $0x41
     6bb:	c3                   	ret    

000006bc <str_ls_call8>:
     6bc:	6c                   	insb   (%dx),%es:(%edi)
     6bd:	73 5f                	jae    71e <ls_call13>
     6bf:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6c2:	6c                   	insb   (%dx),%es:(%edi)
     6c3:	38 00                	cmp    %al,(%eax)

000006c5 <ls_call8>:
CS550LSSYSCALL(ls_call8)
     6c5:	b8 bc 06 00 00       	mov    $0x6bc,%eax
     6ca:	cd 41                	int    $0x41
     6cc:	c3                   	ret    

000006cd <str_ls_call9>:
     6cd:	6c                   	insb   (%dx),%es:(%edi)
     6ce:	73 5f                	jae    72f <str_ls_call14+0x9>
     6d0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6d3:	6c                   	insb   (%dx),%es:(%edi)
     6d4:	39 00                	cmp    %eax,(%eax)

000006d6 <ls_call9>:
CS550LSSYSCALL(ls_call9)
     6d6:	b8 cd 06 00 00       	mov    $0x6cd,%eax
     6db:	cd 41                	int    $0x41
     6dd:	c3                   	ret    

000006de <str_ls_call10>:
     6de:	6c                   	insb   (%dx),%es:(%edi)
     6df:	73 5f                	jae    740 <str_ls_call15+0x8>
     6e1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6e4:	6c                   	insb   (%dx),%es:(%edi)
     6e5:	31 30                	xor    %esi,(%eax)
	...

000006e8 <ls_call10>:
CS550LSSYSCALL(ls_call10)
     6e8:	b8 de 06 00 00       	mov    $0x6de,%eax
     6ed:	cd 41                	int    $0x41
     6ef:	c3                   	ret    

000006f0 <str_ls_call11>:
     6f0:	6c                   	insb   (%dx),%es:(%edi)
     6f1:	73 5f                	jae    752 <str_ls_call16+0x8>
     6f3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     6f6:	6c                   	insb   (%dx),%es:(%edi)
     6f7:	31 31                	xor    %esi,(%ecx)
	...

000006fa <ls_call11>:
CS550LSSYSCALL(ls_call11)
     6fa:	b8 f0 06 00 00       	mov    $0x6f0,%eax
     6ff:	cd 41                	int    $0x41
     701:	c3                   	ret    

00000702 <str_ls_call12>:
     702:	6c                   	insb   (%dx),%es:(%edi)
     703:	73 5f                	jae    764 <str_ls_call17+0x8>
     705:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     708:	6c                   	insb   (%dx),%es:(%edi)
     709:	31 32                	xor    %esi,(%edx)
	...

0000070c <ls_call12>:
CS550LSSYSCALL(ls_call12)
     70c:	b8 02 07 00 00       	mov    $0x702,%eax
     711:	cd 41                	int    $0x41
     713:	c3                   	ret    

00000714 <str_ls_call13>:
     714:	6c                   	insb   (%dx),%es:(%edi)
     715:	73 5f                	jae    776 <str_ls_call18+0x8>
     717:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     71a:	6c                   	insb   (%dx),%es:(%edi)
     71b:	31 33                	xor    %esi,(%ebx)
	...

0000071e <ls_call13>:
CS550LSSYSCALL(ls_call13)
     71e:	b8 14 07 00 00       	mov    $0x714,%eax
     723:	cd 41                	int    $0x41
     725:	c3                   	ret    

00000726 <str_ls_call14>:
     726:	6c                   	insb   (%dx),%es:(%edi)
     727:	73 5f                	jae    788 <str_ls_call19+0x8>
     729:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     72c:	6c                   	insb   (%dx),%es:(%edi)
     72d:	31 34 00             	xor    %esi,(%eax,%eax,1)

00000730 <ls_call14>:
CS550LSSYSCALL(ls_call14)
     730:	b8 26 07 00 00       	mov    $0x726,%eax
     735:	cd 41                	int    $0x41
     737:	c3                   	ret    

00000738 <str_ls_call15>:
     738:	6c                   	insb   (%dx),%es:(%edi)
     739:	73 5f                	jae    79a <str_ls_call20+0x8>
     73b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     73e:	6c                   	insb   (%dx),%es:(%edi)
     73f:	31                   	.byte 0x31
     740:	35                   	.byte 0x35
	...

00000742 <ls_call15>:
CS550LSSYSCALL(ls_call15)
     742:	b8 38 07 00 00       	mov    $0x738,%eax
     747:	cd 41                	int    $0x41
     749:	c3                   	ret    

0000074a <str_ls_call16>:
     74a:	6c                   	insb   (%dx),%es:(%edi)
     74b:	73 5f                	jae    7ac <str_ls_call21+0x8>
     74d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     750:	6c                   	insb   (%dx),%es:(%edi)
     751:	31 36                	xor    %esi,(%esi)
	...

00000754 <ls_call16>:
CS550LSSYSCALL(ls_call16)
     754:	b8 4a 07 00 00       	mov    $0x74a,%eax
     759:	cd 41                	int    $0x41
     75b:	c3                   	ret    

0000075c <str_ls_call17>:
     75c:	6c                   	insb   (%dx),%es:(%edi)
     75d:	73 5f                	jae    7be <str_ls_call22+0x8>
     75f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     762:	6c                   	insb   (%dx),%es:(%edi)
     763:	31 37                	xor    %esi,(%edi)
	...

00000766 <ls_call17>:
CS550LSSYSCALL(ls_call17)
     766:	b8 5c 07 00 00       	mov    $0x75c,%eax
     76b:	cd 41                	int    $0x41
     76d:	c3                   	ret    

0000076e <str_ls_call18>:
     76e:	6c                   	insb   (%dx),%es:(%edi)
     76f:	73 5f                	jae    7d0 <str_ls_call23+0x8>
     771:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     774:	6c                   	insb   (%dx),%es:(%edi)
     775:	31 38                	xor    %edi,(%eax)
	...

00000778 <ls_call18>:
CS550LSSYSCALL(ls_call18)
     778:	b8 6e 07 00 00       	mov    $0x76e,%eax
     77d:	cd 41                	int    $0x41
     77f:	c3                   	ret    

00000780 <str_ls_call19>:
     780:	6c                   	insb   (%dx),%es:(%edi)
     781:	73 5f                	jae    7e2 <str_ls_call24+0x8>
     783:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     786:	6c                   	insb   (%dx),%es:(%edi)
     787:	31 39                	xor    %edi,(%ecx)
	...

0000078a <ls_call19>:
CS550LSSYSCALL(ls_call19)
     78a:	b8 80 07 00 00       	mov    $0x780,%eax
     78f:	cd 41                	int    $0x41
     791:	c3                   	ret    

00000792 <str_ls_call20>:
     792:	6c                   	insb   (%dx),%es:(%edi)
     793:	73 5f                	jae    7f4 <str_ls_call25+0x8>
     795:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     798:	6c                   	insb   (%dx),%es:(%edi)
     799:	32 30                	xor    (%eax),%dh
	...

0000079c <ls_call20>:
CS550LSSYSCALL(ls_call20)
     79c:	b8 92 07 00 00       	mov    $0x792,%eax
     7a1:	cd 41                	int    $0x41
     7a3:	c3                   	ret    

000007a4 <str_ls_call21>:
     7a4:	6c                   	insb   (%dx),%es:(%edi)
     7a5:	73 5f                	jae    806 <str_ls_call26+0x8>
     7a7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7aa:	6c                   	insb   (%dx),%es:(%edi)
     7ab:	32 31                	xor    (%ecx),%dh
	...

000007ae <ls_call21>:
CS550LSSYSCALL(ls_call21)
     7ae:	b8 a4 07 00 00       	mov    $0x7a4,%eax
     7b3:	cd 41                	int    $0x41
     7b5:	c3                   	ret    

000007b6 <str_ls_call22>:
     7b6:	6c                   	insb   (%dx),%es:(%edi)
     7b7:	73 5f                	jae    818 <str_ls_call27+0x8>
     7b9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7bc:	6c                   	insb   (%dx),%es:(%edi)
     7bd:	32 32                	xor    (%edx),%dh
	...

000007c0 <ls_call22>:
CS550LSSYSCALL(ls_call22)
     7c0:	b8 b6 07 00 00       	mov    $0x7b6,%eax
     7c5:	cd 41                	int    $0x41
     7c7:	c3                   	ret    

000007c8 <str_ls_call23>:
     7c8:	6c                   	insb   (%dx),%es:(%edi)
     7c9:	73 5f                	jae    82a <str_ls_call28+0x8>
     7cb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7ce:	6c                   	insb   (%dx),%es:(%edi)
     7cf:	32 33                	xor    (%ebx),%dh
	...

000007d2 <ls_call23>:
CS550LSSYSCALL(ls_call23)
     7d2:	b8 c8 07 00 00       	mov    $0x7c8,%eax
     7d7:	cd 41                	int    $0x41
     7d9:	c3                   	ret    

000007da <str_ls_call24>:
     7da:	6c                   	insb   (%dx),%es:(%edi)
     7db:	73 5f                	jae    83c <str_ls_call29+0x8>
     7dd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7e0:	6c                   	insb   (%dx),%es:(%edi)
     7e1:	32 34 00             	xor    (%eax,%eax,1),%dh

000007e4 <ls_call24>:
CS550LSSYSCALL(ls_call24)
     7e4:	b8 da 07 00 00       	mov    $0x7da,%eax
     7e9:	cd 41                	int    $0x41
     7eb:	c3                   	ret    

000007ec <str_ls_call25>:
     7ec:	6c                   	insb   (%dx),%es:(%edi)
     7ed:	73 5f                	jae    84e <str_ls_call30+0x8>
     7ef:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     7f2:	6c                   	insb   (%dx),%es:(%edi)
     7f3:	32                   	.byte 0x32
     7f4:	35                   	.byte 0x35
	...

000007f6 <ls_call25>:
CS550LSSYSCALL(ls_call25)
     7f6:	b8 ec 07 00 00       	mov    $0x7ec,%eax
     7fb:	cd 41                	int    $0x41
     7fd:	c3                   	ret    

000007fe <str_ls_call26>:
     7fe:	6c                   	insb   (%dx),%es:(%edi)
     7ff:	73 5f                	jae    860 <str_ls_call31+0x8>
     801:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     804:	6c                   	insb   (%dx),%es:(%edi)
     805:	32 36                	xor    (%esi),%dh
	...

00000808 <ls_call26>:
CS550LSSYSCALL(ls_call26)
     808:	b8 fe 07 00 00       	mov    $0x7fe,%eax
     80d:	cd 41                	int    $0x41
     80f:	c3                   	ret    

00000810 <str_ls_call27>:
     810:	6c                   	insb   (%dx),%es:(%edi)
     811:	73 5f                	jae    872 <str_ls_call32+0x8>
     813:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     816:	6c                   	insb   (%dx),%es:(%edi)
     817:	32 37                	xor    (%edi),%dh
	...

0000081a <ls_call27>:
CS550LSSYSCALL(ls_call27)
     81a:	b8 10 08 00 00       	mov    $0x810,%eax
     81f:	cd 41                	int    $0x41
     821:	c3                   	ret    

00000822 <str_ls_call28>:
     822:	6c                   	insb   (%dx),%es:(%edi)
     823:	73 5f                	jae    884 <str_ls_call33+0x8>
     825:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     828:	6c                   	insb   (%dx),%es:(%edi)
     829:	32 38                	xor    (%eax),%bh
	...

0000082c <ls_call28>:
CS550LSSYSCALL(ls_call28)
     82c:	b8 22 08 00 00       	mov    $0x822,%eax
     831:	cd 41                	int    $0x41
     833:	c3                   	ret    

00000834 <str_ls_call29>:
     834:	6c                   	insb   (%dx),%es:(%edi)
     835:	73 5f                	jae    896 <str_ls_call34+0x8>
     837:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     83a:	6c                   	insb   (%dx),%es:(%edi)
     83b:	32 39                	xor    (%ecx),%bh
	...

0000083e <ls_call29>:
CS550LSSYSCALL(ls_call29)
     83e:	b8 34 08 00 00       	mov    $0x834,%eax
     843:	cd 41                	int    $0x41
     845:	c3                   	ret    

00000846 <str_ls_call30>:
     846:	6c                   	insb   (%dx),%es:(%edi)
     847:	73 5f                	jae    8a8 <str_ls_call35+0x8>
     849:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     84c:	6c                   	insb   (%dx),%es:(%edi)
     84d:	33 30                	xor    (%eax),%esi
	...

00000850 <ls_call30>:
CS550LSSYSCALL(ls_call30)
     850:	b8 46 08 00 00       	mov    $0x846,%eax
     855:	cd 41                	int    $0x41
     857:	c3                   	ret    

00000858 <str_ls_call31>:
     858:	6c                   	insb   (%dx),%es:(%edi)
     859:	73 5f                	jae    8ba <str_ls_call36+0x8>
     85b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     85e:	6c                   	insb   (%dx),%es:(%edi)
     85f:	33 31                	xor    (%ecx),%esi
	...

00000862 <ls_call31>:
CS550LSSYSCALL(ls_call31)
     862:	b8 58 08 00 00       	mov    $0x858,%eax
     867:	cd 41                	int    $0x41
     869:	c3                   	ret    

0000086a <str_ls_call32>:
     86a:	6c                   	insb   (%dx),%es:(%edi)
     86b:	73 5f                	jae    8cc <str_ls_call37+0x8>
     86d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     870:	6c                   	insb   (%dx),%es:(%edi)
     871:	33 32                	xor    (%edx),%esi
	...

00000874 <ls_call32>:
CS550LSSYSCALL(ls_call32)
     874:	b8 6a 08 00 00       	mov    $0x86a,%eax
     879:	cd 41                	int    $0x41
     87b:	c3                   	ret    

0000087c <str_ls_call33>:
     87c:	6c                   	insb   (%dx),%es:(%edi)
     87d:	73 5f                	jae    8de <str_ls_call38+0x8>
     87f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     882:	6c                   	insb   (%dx),%es:(%edi)
     883:	33 33                	xor    (%ebx),%esi
	...

00000886 <ls_call33>:
CS550LSSYSCALL(ls_call33)
     886:	b8 7c 08 00 00       	mov    $0x87c,%eax
     88b:	cd 41                	int    $0x41
     88d:	c3                   	ret    

0000088e <str_ls_call34>:
     88e:	6c                   	insb   (%dx),%es:(%edi)
     88f:	73 5f                	jae    8f0 <str_ls_call39+0x8>
     891:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     894:	6c                   	insb   (%dx),%es:(%edi)
     895:	33 34 00             	xor    (%eax,%eax,1),%esi

00000898 <ls_call34>:
CS550LSSYSCALL(ls_call34)
     898:	b8 8e 08 00 00       	mov    $0x88e,%eax
     89d:	cd 41                	int    $0x41
     89f:	c3                   	ret    

000008a0 <str_ls_call35>:
     8a0:	6c                   	insb   (%dx),%es:(%edi)
     8a1:	73 5f                	jae    902 <str_ls_call40+0x8>
     8a3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8a6:	6c                   	insb   (%dx),%es:(%edi)
     8a7:	33                   	.byte 0x33
     8a8:	35                   	.byte 0x35
	...

000008aa <ls_call35>:
CS550LSSYSCALL(ls_call35)
     8aa:	b8 a0 08 00 00       	mov    $0x8a0,%eax
     8af:	cd 41                	int    $0x41
     8b1:	c3                   	ret    

000008b2 <str_ls_call36>:
     8b2:	6c                   	insb   (%dx),%es:(%edi)
     8b3:	73 5f                	jae    914 <str_ls_call41+0x8>
     8b5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8b8:	6c                   	insb   (%dx),%es:(%edi)
     8b9:	33 36                	xor    (%esi),%esi
	...

000008bc <ls_call36>:
CS550LSSYSCALL(ls_call36)
     8bc:	b8 b2 08 00 00       	mov    $0x8b2,%eax
     8c1:	cd 41                	int    $0x41
     8c3:	c3                   	ret    

000008c4 <str_ls_call37>:
     8c4:	6c                   	insb   (%dx),%es:(%edi)
     8c5:	73 5f                	jae    926 <str_ls_call42+0x8>
     8c7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8ca:	6c                   	insb   (%dx),%es:(%edi)
     8cb:	33 37                	xor    (%edi),%esi
	...

000008ce <ls_call37>:
CS550LSSYSCALL(ls_call37)
     8ce:	b8 c4 08 00 00       	mov    $0x8c4,%eax
     8d3:	cd 41                	int    $0x41
     8d5:	c3                   	ret    

000008d6 <str_ls_call38>:
     8d6:	6c                   	insb   (%dx),%es:(%edi)
     8d7:	73 5f                	jae    938 <str_ls_call43+0x8>
     8d9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8dc:	6c                   	insb   (%dx),%es:(%edi)
     8dd:	33 38                	xor    (%eax),%edi
	...

000008e0 <ls_call38>:
CS550LSSYSCALL(ls_call38)
     8e0:	b8 d6 08 00 00       	mov    $0x8d6,%eax
     8e5:	cd 41                	int    $0x41
     8e7:	c3                   	ret    

000008e8 <str_ls_call39>:
     8e8:	6c                   	insb   (%dx),%es:(%edi)
     8e9:	73 5f                	jae    94a <str_ls_call44+0x8>
     8eb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     8ee:	6c                   	insb   (%dx),%es:(%edi)
     8ef:	33 39                	xor    (%ecx),%edi
	...

000008f2 <ls_call39>:
CS550LSSYSCALL(ls_call39)
     8f2:	b8 e8 08 00 00       	mov    $0x8e8,%eax
     8f7:	cd 41                	int    $0x41
     8f9:	c3                   	ret    

000008fa <str_ls_call40>:
     8fa:	6c                   	insb   (%dx),%es:(%edi)
     8fb:	73 5f                	jae    95c <str_ls_call45+0x8>
     8fd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     900:	6c                   	insb   (%dx),%es:(%edi)
     901:	34 30                	xor    $0x30,%al
	...

00000904 <ls_call40>:
CS550LSSYSCALL(ls_call40)
     904:	b8 fa 08 00 00       	mov    $0x8fa,%eax
     909:	cd 41                	int    $0x41
     90b:	c3                   	ret    

0000090c <str_ls_call41>:
     90c:	6c                   	insb   (%dx),%es:(%edi)
     90d:	73 5f                	jae    96e <str_ls_call46+0x8>
     90f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     912:	6c                   	insb   (%dx),%es:(%edi)
     913:	34 31                	xor    $0x31,%al
	...

00000916 <ls_call41>:
CS550LSSYSCALL(ls_call41)
     916:	b8 0c 09 00 00       	mov    $0x90c,%eax
     91b:	cd 41                	int    $0x41
     91d:	c3                   	ret    

0000091e <str_ls_call42>:
     91e:	6c                   	insb   (%dx),%es:(%edi)
     91f:	73 5f                	jae    980 <str_ls_call47+0x8>
     921:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     924:	6c                   	insb   (%dx),%es:(%edi)
     925:	34 32                	xor    $0x32,%al
	...

00000928 <ls_call42>:
CS550LSSYSCALL(ls_call42)
     928:	b8 1e 09 00 00       	mov    $0x91e,%eax
     92d:	cd 41                	int    $0x41
     92f:	c3                   	ret    

00000930 <str_ls_call43>:
     930:	6c                   	insb   (%dx),%es:(%edi)
     931:	73 5f                	jae    992 <str_ls_call48+0x8>
     933:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     936:	6c                   	insb   (%dx),%es:(%edi)
     937:	34 33                	xor    $0x33,%al
	...

0000093a <ls_call43>:
CS550LSSYSCALL(ls_call43)
     93a:	b8 30 09 00 00       	mov    $0x930,%eax
     93f:	cd 41                	int    $0x41
     941:	c3                   	ret    

00000942 <str_ls_call44>:
     942:	6c                   	insb   (%dx),%es:(%edi)
     943:	73 5f                	jae    9a4 <str_ls_call49+0x8>
     945:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     948:	6c                   	insb   (%dx),%es:(%edi)
     949:	34 34                	xor    $0x34,%al
	...

0000094c <ls_call44>:
CS550LSSYSCALL(ls_call44)
     94c:	b8 42 09 00 00       	mov    $0x942,%eax
     951:	cd 41                	int    $0x41
     953:	c3                   	ret    

00000954 <str_ls_call45>:
     954:	6c                   	insb   (%dx),%es:(%edi)
     955:	73 5f                	jae    9b6 <str_ls_call50+0x8>
     957:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     95a:	6c                   	insb   (%dx),%es:(%edi)
     95b:	34 35                	xor    $0x35,%al
	...

0000095e <ls_call45>:
CS550LSSYSCALL(ls_call45)
     95e:	b8 54 09 00 00       	mov    $0x954,%eax
     963:	cd 41                	int    $0x41
     965:	c3                   	ret    

00000966 <str_ls_call46>:
     966:	6c                   	insb   (%dx),%es:(%edi)
     967:	73 5f                	jae    9c8 <str_ht_call1+0x8>
     969:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     96c:	6c                   	insb   (%dx),%es:(%edi)
     96d:	34 36                	xor    $0x36,%al
	...

00000970 <ls_call46>:
CS550LSSYSCALL(ls_call46)
     970:	b8 66 09 00 00       	mov    $0x966,%eax
     975:	cd 41                	int    $0x41
     977:	c3                   	ret    

00000978 <str_ls_call47>:
     978:	6c                   	insb   (%dx),%es:(%edi)
     979:	73 5f                	jae    9da <ht_call2>
     97b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     97e:	6c                   	insb   (%dx),%es:(%edi)
     97f:	34 37                	xor    $0x37,%al
	...

00000982 <ls_call47>:
CS550LSSYSCALL(ls_call47)
     982:	b8 78 09 00 00       	mov    $0x978,%eax
     987:	cd 41                	int    $0x41
     989:	c3                   	ret    

0000098a <str_ls_call48>:
     98a:	6c                   	insb   (%dx),%es:(%edi)
     98b:	73 5f                	jae    9ec <ht_call3+0x1>
     98d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     990:	6c                   	insb   (%dx),%es:(%edi)
     991:	34 38                	xor    $0x38,%al
	...

00000994 <ls_call48>:
CS550LSSYSCALL(ls_call48)
     994:	b8 8a 09 00 00       	mov    $0x98a,%eax
     999:	cd 41                	int    $0x41
     99b:	c3                   	ret    

0000099c <str_ls_call49>:
     99c:	6c                   	insb   (%dx),%es:(%edi)
     99d:	73 5f                	jae    9fe <ht_call4+0x2>
     99f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     9a2:	6c                   	insb   (%dx),%es:(%edi)
     9a3:	34 39                	xor    $0x39,%al
	...

000009a6 <ls_call49>:
CS550LSSYSCALL(ls_call49)
     9a6:	b8 9c 09 00 00       	mov    $0x99c,%eax
     9ab:	cd 41                	int    $0x41
     9ad:	c3                   	ret    

000009ae <str_ls_call50>:
     9ae:	6c                   	insb   (%dx),%es:(%edi)
     9af:	73 5f                	jae    a10 <ht_call5+0x3>
     9b1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     9b4:	6c                   	insb   (%dx),%es:(%edi)
     9b5:	35                   	.byte 0x35
     9b6:	30 00                	xor    %al,(%eax)

000009b8 <ls_call50>:
CS550LSSYSCALL(ls_call50)
     9b8:	b8 ae 09 00 00       	mov    $0x9ae,%eax
     9bd:	cd 41                	int    $0x41
     9bf:	c3                   	ret    

000009c0 <str_ht_call1>:
     9c0:	68 74 5f 63 61       	push   $0x61635f74
     9c5:	6c                   	insb   (%dx),%es:(%edi)
     9c6:	6c                   	insb   (%dx),%es:(%edi)
     9c7:	31 00                	xor    %eax,(%eax)

000009c9 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
     9c9:	b8 c0 09 00 00       	mov    $0x9c0,%eax
     9ce:	cd 42                	int    $0x42
     9d0:	c3                   	ret    

000009d1 <str_ht_call2>:
     9d1:	68 74 5f 63 61       	push   $0x61635f74
     9d6:	6c                   	insb   (%dx),%es:(%edi)
     9d7:	6c                   	insb   (%dx),%es:(%edi)
     9d8:	32 00                	xor    (%eax),%al

000009da <ht_call2>:
CS550HTSYSCALL(ht_call2)
     9da:	b8 d1 09 00 00       	mov    $0x9d1,%eax
     9df:	cd 42                	int    $0x42
     9e1:	c3                   	ret    

000009e2 <str_ht_call3>:
     9e2:	68 74 5f 63 61       	push   $0x61635f74
     9e7:	6c                   	insb   (%dx),%es:(%edi)
     9e8:	6c                   	insb   (%dx),%es:(%edi)
     9e9:	33 00                	xor    (%eax),%eax

000009eb <ht_call3>:
CS550HTSYSCALL(ht_call3)
     9eb:	b8 e2 09 00 00       	mov    $0x9e2,%eax
     9f0:	cd 42                	int    $0x42
     9f2:	c3                   	ret    

000009f3 <str_ht_call4>:
     9f3:	68 74 5f 63 61       	push   $0x61635f74
     9f8:	6c                   	insb   (%dx),%es:(%edi)
     9f9:	6c                   	insb   (%dx),%es:(%edi)
     9fa:	34 00                	xor    $0x0,%al

000009fc <ht_call4>:
CS550HTSYSCALL(ht_call4)
     9fc:	b8 f3 09 00 00       	mov    $0x9f3,%eax
     a01:	cd 42                	int    $0x42
     a03:	c3                   	ret    

00000a04 <str_ht_call5>:
     a04:	68 74 5f 63 61       	push   $0x61635f74
     a09:	6c                   	insb   (%dx),%es:(%edi)
     a0a:	6c                   	insb   (%dx),%es:(%edi)
     a0b:	35                   	.byte 0x35
	...

00000a0d <ht_call5>:
CS550HTSYSCALL(ht_call5)
     a0d:	b8 04 0a 00 00       	mov    $0xa04,%eax
     a12:	cd 42                	int    $0x42
     a14:	c3                   	ret    

00000a15 <str_ht_call6>:
     a15:	68 74 5f 63 61       	push   $0x61635f74
     a1a:	6c                   	insb   (%dx),%es:(%edi)
     a1b:	6c                   	insb   (%dx),%es:(%edi)
     a1c:	36                   	ss
	...

00000a1e <ht_call6>:
CS550HTSYSCALL(ht_call6)
     a1e:	b8 15 0a 00 00       	mov    $0xa15,%eax
     a23:	cd 42                	int    $0x42
     a25:	c3                   	ret    

00000a26 <str_ht_call7>:
     a26:	68 74 5f 63 61       	push   $0x61635f74
     a2b:	6c                   	insb   (%dx),%es:(%edi)
     a2c:	6c                   	insb   (%dx),%es:(%edi)
     a2d:	37                   	aaa    
	...

00000a2f <ht_call7>:
CS550HTSYSCALL(ht_call7)
     a2f:	b8 26 0a 00 00       	mov    $0xa26,%eax
     a34:	cd 42                	int    $0x42
     a36:	c3                   	ret    

00000a37 <str_ht_call8>:
     a37:	68 74 5f 63 61       	push   $0x61635f74
     a3c:	6c                   	insb   (%dx),%es:(%edi)
     a3d:	6c                   	insb   (%dx),%es:(%edi)
     a3e:	38 00                	cmp    %al,(%eax)

00000a40 <ht_call8>:
CS550HTSYSCALL(ht_call8)
     a40:	b8 37 0a 00 00       	mov    $0xa37,%eax
     a45:	cd 42                	int    $0x42
     a47:	c3                   	ret    

00000a48 <str_ht_call9>:
     a48:	68 74 5f 63 61       	push   $0x61635f74
     a4d:	6c                   	insb   (%dx),%es:(%edi)
     a4e:	6c                   	insb   (%dx),%es:(%edi)
     a4f:	39 00                	cmp    %eax,(%eax)

00000a51 <ht_call9>:
CS550HTSYSCALL(ht_call9)
     a51:	b8 48 0a 00 00       	mov    $0xa48,%eax
     a56:	cd 42                	int    $0x42
     a58:	c3                   	ret    

00000a59 <str_ht_call10>:
     a59:	68 74 5f 63 61       	push   $0x61635f74
     a5e:	6c                   	insb   (%dx),%es:(%edi)
     a5f:	6c                   	insb   (%dx),%es:(%edi)
     a60:	31 30                	xor    %esi,(%eax)
	...

00000a63 <ht_call10>:
CS550HTSYSCALL(ht_call10)
     a63:	b8 59 0a 00 00       	mov    $0xa59,%eax
     a68:	cd 42                	int    $0x42
     a6a:	c3                   	ret    

00000a6b <str_ht_call11>:
     a6b:	68 74 5f 63 61       	push   $0x61635f74
     a70:	6c                   	insb   (%dx),%es:(%edi)
     a71:	6c                   	insb   (%dx),%es:(%edi)
     a72:	31 31                	xor    %esi,(%ecx)
	...

00000a75 <ht_call11>:
CS550HTSYSCALL(ht_call11)
     a75:	b8 6b 0a 00 00       	mov    $0xa6b,%eax
     a7a:	cd 42                	int    $0x42
     a7c:	c3                   	ret    

00000a7d <str_ht_call12>:
     a7d:	68 74 5f 63 61       	push   $0x61635f74
     a82:	6c                   	insb   (%dx),%es:(%edi)
     a83:	6c                   	insb   (%dx),%es:(%edi)
     a84:	31 32                	xor    %esi,(%edx)
	...

00000a87 <ht_call12>:
CS550HTSYSCALL(ht_call12)
     a87:	b8 7d 0a 00 00       	mov    $0xa7d,%eax
     a8c:	cd 42                	int    $0x42
     a8e:	c3                   	ret    

00000a8f <str_ht_call13>:
     a8f:	68 74 5f 63 61       	push   $0x61635f74
     a94:	6c                   	insb   (%dx),%es:(%edi)
     a95:	6c                   	insb   (%dx),%es:(%edi)
     a96:	31 33                	xor    %esi,(%ebx)
	...

00000a99 <ht_call13>:
CS550HTSYSCALL(ht_call13)
     a99:	b8 8f 0a 00 00       	mov    $0xa8f,%eax
     a9e:	cd 42                	int    $0x42
     aa0:	c3                   	ret    

00000aa1 <str_ht_call14>:
     aa1:	68 74 5f 63 61       	push   $0x61635f74
     aa6:	6c                   	insb   (%dx),%es:(%edi)
     aa7:	6c                   	insb   (%dx),%es:(%edi)
     aa8:	31 34 00             	xor    %esi,(%eax,%eax,1)

00000aab <ht_call14>:
CS550HTSYSCALL(ht_call14)
     aab:	b8 a1 0a 00 00       	mov    $0xaa1,%eax
     ab0:	cd 42                	int    $0x42
     ab2:	c3                   	ret    

00000ab3 <str_ht_call15>:
     ab3:	68 74 5f 63 61       	push   $0x61635f74
     ab8:	6c                   	insb   (%dx),%es:(%edi)
     ab9:	6c                   	insb   (%dx),%es:(%edi)
     aba:	31                   	.byte 0x31
     abb:	35                   	.byte 0x35
	...

00000abd <ht_call15>:
CS550HTSYSCALL(ht_call15)
     abd:	b8 b3 0a 00 00       	mov    $0xab3,%eax
     ac2:	cd 42                	int    $0x42
     ac4:	c3                   	ret    

00000ac5 <str_ht_call16>:
     ac5:	68 74 5f 63 61       	push   $0x61635f74
     aca:	6c                   	insb   (%dx),%es:(%edi)
     acb:	6c                   	insb   (%dx),%es:(%edi)
     acc:	31 36                	xor    %esi,(%esi)
	...

00000acf <ht_call16>:
CS550HTSYSCALL(ht_call16)
     acf:	b8 c5 0a 00 00       	mov    $0xac5,%eax
     ad4:	cd 42                	int    $0x42
     ad6:	c3                   	ret    

00000ad7 <str_ht_call17>:
     ad7:	68 74 5f 63 61       	push   $0x61635f74
     adc:	6c                   	insb   (%dx),%es:(%edi)
     add:	6c                   	insb   (%dx),%es:(%edi)
     ade:	31 37                	xor    %esi,(%edi)
	...

00000ae1 <ht_call17>:
CS550HTSYSCALL(ht_call17)
     ae1:	b8 d7 0a 00 00       	mov    $0xad7,%eax
     ae6:	cd 42                	int    $0x42
     ae8:	c3                   	ret    

00000ae9 <str_ht_call18>:
     ae9:	68 74 5f 63 61       	push   $0x61635f74
     aee:	6c                   	insb   (%dx),%es:(%edi)
     aef:	6c                   	insb   (%dx),%es:(%edi)
     af0:	31 38                	xor    %edi,(%eax)
	...

00000af3 <ht_call18>:
CS550HTSYSCALL(ht_call18)
     af3:	b8 e9 0a 00 00       	mov    $0xae9,%eax
     af8:	cd 42                	int    $0x42
     afa:	c3                   	ret    

00000afb <str_ht_call19>:
     afb:	68 74 5f 63 61       	push   $0x61635f74
     b00:	6c                   	insb   (%dx),%es:(%edi)
     b01:	6c                   	insb   (%dx),%es:(%edi)
     b02:	31 39                	xor    %edi,(%ecx)
	...

00000b05 <ht_call19>:
CS550HTSYSCALL(ht_call19)
     b05:	b8 fb 0a 00 00       	mov    $0xafb,%eax
     b0a:	cd 42                	int    $0x42
     b0c:	c3                   	ret    

00000b0d <str_ht_call20>:
     b0d:	68 74 5f 63 61       	push   $0x61635f74
     b12:	6c                   	insb   (%dx),%es:(%edi)
     b13:	6c                   	insb   (%dx),%es:(%edi)
     b14:	32 30                	xor    (%eax),%dh
	...

00000b17 <ht_call20>:
CS550HTSYSCALL(ht_call20)
     b17:	b8 0d 0b 00 00       	mov    $0xb0d,%eax
     b1c:	cd 42                	int    $0x42
     b1e:	c3                   	ret    

00000b1f <str_ht_call21>:
     b1f:	68 74 5f 63 61       	push   $0x61635f74
     b24:	6c                   	insb   (%dx),%es:(%edi)
     b25:	6c                   	insb   (%dx),%es:(%edi)
     b26:	32 31                	xor    (%ecx),%dh
	...

00000b29 <ht_call21>:
CS550HTSYSCALL(ht_call21)
     b29:	b8 1f 0b 00 00       	mov    $0xb1f,%eax
     b2e:	cd 42                	int    $0x42
     b30:	c3                   	ret    

00000b31 <str_ht_call22>:
     b31:	68 74 5f 63 61       	push   $0x61635f74
     b36:	6c                   	insb   (%dx),%es:(%edi)
     b37:	6c                   	insb   (%dx),%es:(%edi)
     b38:	32 32                	xor    (%edx),%dh
	...

00000b3b <ht_call22>:
CS550HTSYSCALL(ht_call22)
     b3b:	b8 31 0b 00 00       	mov    $0xb31,%eax
     b40:	cd 42                	int    $0x42
     b42:	c3                   	ret    

00000b43 <str_ht_call23>:
     b43:	68 74 5f 63 61       	push   $0x61635f74
     b48:	6c                   	insb   (%dx),%es:(%edi)
     b49:	6c                   	insb   (%dx),%es:(%edi)
     b4a:	32 33                	xor    (%ebx),%dh
	...

00000b4d <ht_call23>:
CS550HTSYSCALL(ht_call23)
     b4d:	b8 43 0b 00 00       	mov    $0xb43,%eax
     b52:	cd 42                	int    $0x42
     b54:	c3                   	ret    

00000b55 <str_ht_call24>:
     b55:	68 74 5f 63 61       	push   $0x61635f74
     b5a:	6c                   	insb   (%dx),%es:(%edi)
     b5b:	6c                   	insb   (%dx),%es:(%edi)
     b5c:	32 34 00             	xor    (%eax,%eax,1),%dh

00000b5f <ht_call24>:
CS550HTSYSCALL(ht_call24)
     b5f:	b8 55 0b 00 00       	mov    $0xb55,%eax
     b64:	cd 42                	int    $0x42
     b66:	c3                   	ret    

00000b67 <str_ht_call25>:
     b67:	68 74 5f 63 61       	push   $0x61635f74
     b6c:	6c                   	insb   (%dx),%es:(%edi)
     b6d:	6c                   	insb   (%dx),%es:(%edi)
     b6e:	32                   	.byte 0x32
     b6f:	35                   	.byte 0x35
	...

00000b71 <ht_call25>:
CS550HTSYSCALL(ht_call25)
     b71:	b8 67 0b 00 00       	mov    $0xb67,%eax
     b76:	cd 42                	int    $0x42
     b78:	c3                   	ret    

00000b79 <str_ht_call26>:
     b79:	68 74 5f 63 61       	push   $0x61635f74
     b7e:	6c                   	insb   (%dx),%es:(%edi)
     b7f:	6c                   	insb   (%dx),%es:(%edi)
     b80:	32 36                	xor    (%esi),%dh
	...

00000b83 <ht_call26>:
CS550HTSYSCALL(ht_call26)
     b83:	b8 79 0b 00 00       	mov    $0xb79,%eax
     b88:	cd 42                	int    $0x42
     b8a:	c3                   	ret    

00000b8b <str_ht_call27>:
     b8b:	68 74 5f 63 61       	push   $0x61635f74
     b90:	6c                   	insb   (%dx),%es:(%edi)
     b91:	6c                   	insb   (%dx),%es:(%edi)
     b92:	32 37                	xor    (%edi),%dh
	...

00000b95 <ht_call27>:
CS550HTSYSCALL(ht_call27)
     b95:	b8 8b 0b 00 00       	mov    $0xb8b,%eax
     b9a:	cd 42                	int    $0x42
     b9c:	c3                   	ret    

00000b9d <str_ht_call28>:
     b9d:	68 74 5f 63 61       	push   $0x61635f74
     ba2:	6c                   	insb   (%dx),%es:(%edi)
     ba3:	6c                   	insb   (%dx),%es:(%edi)
     ba4:	32 38                	xor    (%eax),%bh
	...

00000ba7 <ht_call28>:
CS550HTSYSCALL(ht_call28)
     ba7:	b8 9d 0b 00 00       	mov    $0xb9d,%eax
     bac:	cd 42                	int    $0x42
     bae:	c3                   	ret    

00000baf <str_ht_call29>:
     baf:	68 74 5f 63 61       	push   $0x61635f74
     bb4:	6c                   	insb   (%dx),%es:(%edi)
     bb5:	6c                   	insb   (%dx),%es:(%edi)
     bb6:	32 39                	xor    (%ecx),%bh
	...

00000bb9 <ht_call29>:
CS550HTSYSCALL(ht_call29)
     bb9:	b8 af 0b 00 00       	mov    $0xbaf,%eax
     bbe:	cd 42                	int    $0x42
     bc0:	c3                   	ret    

00000bc1 <str_ht_call30>:
     bc1:	68 74 5f 63 61       	push   $0x61635f74
     bc6:	6c                   	insb   (%dx),%es:(%edi)
     bc7:	6c                   	insb   (%dx),%es:(%edi)
     bc8:	33 30                	xor    (%eax),%esi
	...

00000bcb <ht_call30>:
CS550HTSYSCALL(ht_call30)
     bcb:	b8 c1 0b 00 00       	mov    $0xbc1,%eax
     bd0:	cd 42                	int    $0x42
     bd2:	c3                   	ret    

00000bd3 <str_ht_call31>:
     bd3:	68 74 5f 63 61       	push   $0x61635f74
     bd8:	6c                   	insb   (%dx),%es:(%edi)
     bd9:	6c                   	insb   (%dx),%es:(%edi)
     bda:	33 31                	xor    (%ecx),%esi
	...

00000bdd <ht_call31>:
CS550HTSYSCALL(ht_call31)
     bdd:	b8 d3 0b 00 00       	mov    $0xbd3,%eax
     be2:	cd 42                	int    $0x42
     be4:	c3                   	ret    

00000be5 <str_ht_call32>:
     be5:	68 74 5f 63 61       	push   $0x61635f74
     bea:	6c                   	insb   (%dx),%es:(%edi)
     beb:	6c                   	insb   (%dx),%es:(%edi)
     bec:	33 32                	xor    (%edx),%esi
	...

00000bef <ht_call32>:
CS550HTSYSCALL(ht_call32)
     bef:	b8 e5 0b 00 00       	mov    $0xbe5,%eax
     bf4:	cd 42                	int    $0x42
     bf6:	c3                   	ret    

00000bf7 <str_ht_call33>:
     bf7:	68 74 5f 63 61       	push   $0x61635f74
     bfc:	6c                   	insb   (%dx),%es:(%edi)
     bfd:	6c                   	insb   (%dx),%es:(%edi)
     bfe:	33 33                	xor    (%ebx),%esi
	...

00000c01 <ht_call33>:
CS550HTSYSCALL(ht_call33)
     c01:	b8 f7 0b 00 00       	mov    $0xbf7,%eax
     c06:	cd 42                	int    $0x42
     c08:	c3                   	ret    

00000c09 <str_ht_call34>:
     c09:	68 74 5f 63 61       	push   $0x61635f74
     c0e:	6c                   	insb   (%dx),%es:(%edi)
     c0f:	6c                   	insb   (%dx),%es:(%edi)
     c10:	33 34 00             	xor    (%eax,%eax,1),%esi

00000c13 <ht_call34>:
CS550HTSYSCALL(ht_call34)
     c13:	b8 09 0c 00 00       	mov    $0xc09,%eax
     c18:	cd 42                	int    $0x42
     c1a:	c3                   	ret    

00000c1b <str_ht_call35>:
     c1b:	68 74 5f 63 61       	push   $0x61635f74
     c20:	6c                   	insb   (%dx),%es:(%edi)
     c21:	6c                   	insb   (%dx),%es:(%edi)
     c22:	33                   	.byte 0x33
     c23:	35                   	.byte 0x35
	...

00000c25 <ht_call35>:
CS550HTSYSCALL(ht_call35)
     c25:	b8 1b 0c 00 00       	mov    $0xc1b,%eax
     c2a:	cd 42                	int    $0x42
     c2c:	c3                   	ret    

00000c2d <str_ht_call36>:
     c2d:	68 74 5f 63 61       	push   $0x61635f74
     c32:	6c                   	insb   (%dx),%es:(%edi)
     c33:	6c                   	insb   (%dx),%es:(%edi)
     c34:	33 36                	xor    (%esi),%esi
	...

00000c37 <ht_call36>:
CS550HTSYSCALL(ht_call36)
     c37:	b8 2d 0c 00 00       	mov    $0xc2d,%eax
     c3c:	cd 42                	int    $0x42
     c3e:	c3                   	ret    

00000c3f <str_ht_call37>:
     c3f:	68 74 5f 63 61       	push   $0x61635f74
     c44:	6c                   	insb   (%dx),%es:(%edi)
     c45:	6c                   	insb   (%dx),%es:(%edi)
     c46:	33 37                	xor    (%edi),%esi
	...

00000c49 <ht_call37>:
CS550HTSYSCALL(ht_call37)
     c49:	b8 3f 0c 00 00       	mov    $0xc3f,%eax
     c4e:	cd 42                	int    $0x42
     c50:	c3                   	ret    

00000c51 <str_ht_call38>:
     c51:	68 74 5f 63 61       	push   $0x61635f74
     c56:	6c                   	insb   (%dx),%es:(%edi)
     c57:	6c                   	insb   (%dx),%es:(%edi)
     c58:	33 38                	xor    (%eax),%edi
	...

00000c5b <ht_call38>:
CS550HTSYSCALL(ht_call38)
     c5b:	b8 51 0c 00 00       	mov    $0xc51,%eax
     c60:	cd 42                	int    $0x42
     c62:	c3                   	ret    

00000c63 <str_ht_call39>:
     c63:	68 74 5f 63 61       	push   $0x61635f74
     c68:	6c                   	insb   (%dx),%es:(%edi)
     c69:	6c                   	insb   (%dx),%es:(%edi)
     c6a:	33 39                	xor    (%ecx),%edi
	...

00000c6d <ht_call39>:
CS550HTSYSCALL(ht_call39)
     c6d:	b8 63 0c 00 00       	mov    $0xc63,%eax
     c72:	cd 42                	int    $0x42
     c74:	c3                   	ret    

00000c75 <str_ht_call40>:
     c75:	68 74 5f 63 61       	push   $0x61635f74
     c7a:	6c                   	insb   (%dx),%es:(%edi)
     c7b:	6c                   	insb   (%dx),%es:(%edi)
     c7c:	34 30                	xor    $0x30,%al
	...

00000c7f <ht_call40>:
CS550HTSYSCALL(ht_call40)
     c7f:	b8 75 0c 00 00       	mov    $0xc75,%eax
     c84:	cd 42                	int    $0x42
     c86:	c3                   	ret    

00000c87 <str_ht_call41>:
     c87:	68 74 5f 63 61       	push   $0x61635f74
     c8c:	6c                   	insb   (%dx),%es:(%edi)
     c8d:	6c                   	insb   (%dx),%es:(%edi)
     c8e:	34 31                	xor    $0x31,%al
	...

00000c91 <ht_call41>:
CS550HTSYSCALL(ht_call41)
     c91:	b8 87 0c 00 00       	mov    $0xc87,%eax
     c96:	cd 42                	int    $0x42
     c98:	c3                   	ret    

00000c99 <str_ht_call42>:
     c99:	68 74 5f 63 61       	push   $0x61635f74
     c9e:	6c                   	insb   (%dx),%es:(%edi)
     c9f:	6c                   	insb   (%dx),%es:(%edi)
     ca0:	34 32                	xor    $0x32,%al
	...

00000ca3 <ht_call42>:
CS550HTSYSCALL(ht_call42)
     ca3:	b8 99 0c 00 00       	mov    $0xc99,%eax
     ca8:	cd 42                	int    $0x42
     caa:	c3                   	ret    

00000cab <str_ht_call43>:
     cab:	68 74 5f 63 61       	push   $0x61635f74
     cb0:	6c                   	insb   (%dx),%es:(%edi)
     cb1:	6c                   	insb   (%dx),%es:(%edi)
     cb2:	34 33                	xor    $0x33,%al
	...

00000cb5 <ht_call43>:
CS550HTSYSCALL(ht_call43)
     cb5:	b8 ab 0c 00 00       	mov    $0xcab,%eax
     cba:	cd 42                	int    $0x42
     cbc:	c3                   	ret    

00000cbd <str_ht_call44>:
     cbd:	68 74 5f 63 61       	push   $0x61635f74
     cc2:	6c                   	insb   (%dx),%es:(%edi)
     cc3:	6c                   	insb   (%dx),%es:(%edi)
     cc4:	34 34                	xor    $0x34,%al
	...

00000cc7 <ht_call44>:
CS550HTSYSCALL(ht_call44)
     cc7:	b8 bd 0c 00 00       	mov    $0xcbd,%eax
     ccc:	cd 42                	int    $0x42
     cce:	c3                   	ret    

00000ccf <str_ht_call45>:
     ccf:	68 74 5f 63 61       	push   $0x61635f74
     cd4:	6c                   	insb   (%dx),%es:(%edi)
     cd5:	6c                   	insb   (%dx),%es:(%edi)
     cd6:	34 35                	xor    $0x35,%al
	...

00000cd9 <ht_call45>:
CS550HTSYSCALL(ht_call45)
     cd9:	b8 cf 0c 00 00       	mov    $0xccf,%eax
     cde:	cd 42                	int    $0x42
     ce0:	c3                   	ret    

00000ce1 <str_ht_call46>:
     ce1:	68 74 5f 63 61       	push   $0x61635f74
     ce6:	6c                   	insb   (%dx),%es:(%edi)
     ce7:	6c                   	insb   (%dx),%es:(%edi)
     ce8:	34 36                	xor    $0x36,%al
	...

00000ceb <ht_call46>:
CS550HTSYSCALL(ht_call46)
     ceb:	b8 e1 0c 00 00       	mov    $0xce1,%eax
     cf0:	cd 42                	int    $0x42
     cf2:	c3                   	ret    

00000cf3 <str_ht_call47>:
     cf3:	68 74 5f 63 61       	push   $0x61635f74
     cf8:	6c                   	insb   (%dx),%es:(%edi)
     cf9:	6c                   	insb   (%dx),%es:(%edi)
     cfa:	34 37                	xor    $0x37,%al
	...

00000cfd <ht_call47>:
CS550HTSYSCALL(ht_call47)
     cfd:	b8 f3 0c 00 00       	mov    $0xcf3,%eax
     d02:	cd 42                	int    $0x42
     d04:	c3                   	ret    

00000d05 <str_ht_call48>:
     d05:	68 74 5f 63 61       	push   $0x61635f74
     d0a:	6c                   	insb   (%dx),%es:(%edi)
     d0b:	6c                   	insb   (%dx),%es:(%edi)
     d0c:	34 38                	xor    $0x38,%al
	...

00000d0f <ht_call48>:
CS550HTSYSCALL(ht_call48)
     d0f:	b8 05 0d 00 00       	mov    $0xd05,%eax
     d14:	cd 42                	int    $0x42
     d16:	c3                   	ret    

00000d17 <str_ht_call49>:
     d17:	68 74 5f 63 61       	push   $0x61635f74
     d1c:	6c                   	insb   (%dx),%es:(%edi)
     d1d:	6c                   	insb   (%dx),%es:(%edi)
     d1e:	34 39                	xor    $0x39,%al
	...

00000d21 <ht_call49>:
CS550HTSYSCALL(ht_call49)
     d21:	b8 17 0d 00 00       	mov    $0xd17,%eax
     d26:	cd 42                	int    $0x42
     d28:	c3                   	ret    

00000d29 <str_ht_call50>:
     d29:	68 74 5f 63 61       	push   $0x61635f74
     d2e:	6c                   	insb   (%dx),%es:(%edi)
     d2f:	6c                   	insb   (%dx),%es:(%edi)
     d30:	35                   	.byte 0x35
     d31:	30 00                	xor    %al,(%eax)

00000d33 <ht_call50>:
CS550HTSYSCALL(ht_call50)
     d33:	b8 29 0d 00 00       	mov    $0xd29,%eax
     d38:	cd 42                	int    $0x42
     d3a:	c3                   	ret    

00000d3b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     d3b:	55                   	push   %ebp
     d3c:	89 e5                	mov    %esp,%ebp
     d3e:	83 ec 18             	sub    $0x18,%esp
     d41:	8b 45 0c             	mov    0xc(%ebp),%eax
     d44:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     d47:	83 ec 04             	sub    $0x4,%esp
     d4a:	6a 01                	push   $0x1
     d4c:	8d 45 f4             	lea    -0xc(%ebp),%eax
     d4f:	50                   	push   %eax
     d50:	ff 75 08             	pushl  0x8(%ebp)
     d53:	e8 65 f8 ff ff       	call   5bd <write>
     d58:	83 c4 10             	add    $0x10,%esp
}
     d5b:	90                   	nop
     d5c:	c9                   	leave  
     d5d:	c3                   	ret    

00000d5e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     d5e:	55                   	push   %ebp
     d5f:	89 e5                	mov    %esp,%ebp
     d61:	53                   	push   %ebx
     d62:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     d65:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     d6c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     d70:	74 17                	je     d89 <printint+0x2b>
     d72:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     d76:	79 11                	jns    d89 <printint+0x2b>
    neg = 1;
     d78:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     d7f:	8b 45 0c             	mov    0xc(%ebp),%eax
     d82:	f7 d8                	neg    %eax
     d84:	89 45 ec             	mov    %eax,-0x14(%ebp)
     d87:	eb 06                	jmp    d8f <printint+0x31>
  } else {
    x = xx;
     d89:	8b 45 0c             	mov    0xc(%ebp),%eax
     d8c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     d8f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     d96:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     d99:	8d 41 01             	lea    0x1(%ecx),%eax
     d9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
     d9f:	8b 5d 10             	mov    0x10(%ebp),%ebx
     da2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     da5:	ba 00 00 00 00       	mov    $0x0,%edx
     daa:	f7 f3                	div    %ebx
     dac:	89 d0                	mov    %edx,%eax
     dae:	0f b6 80 bc 14 00 00 	movzbl 0x14bc(%eax),%eax
     db5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     db9:	8b 5d 10             	mov    0x10(%ebp),%ebx
     dbc:	8b 45 ec             	mov    -0x14(%ebp),%eax
     dbf:	ba 00 00 00 00       	mov    $0x0,%edx
     dc4:	f7 f3                	div    %ebx
     dc6:	89 45 ec             	mov    %eax,-0x14(%ebp)
     dc9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     dcd:	75 c7                	jne    d96 <printint+0x38>
  if(neg)
     dcf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     dd3:	74 2d                	je     e02 <printint+0xa4>
    buf[i++] = '-';
     dd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dd8:	8d 50 01             	lea    0x1(%eax),%edx
     ddb:	89 55 f4             	mov    %edx,-0xc(%ebp)
     dde:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     de3:	eb 1d                	jmp    e02 <printint+0xa4>
    putc(fd, buf[i]);
     de5:	8d 55 dc             	lea    -0x24(%ebp),%edx
     de8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     deb:	01 d0                	add    %edx,%eax
     ded:	0f b6 00             	movzbl (%eax),%eax
     df0:	0f be c0             	movsbl %al,%eax
     df3:	83 ec 08             	sub    $0x8,%esp
     df6:	50                   	push   %eax
     df7:	ff 75 08             	pushl  0x8(%ebp)
     dfa:	e8 3c ff ff ff       	call   d3b <putc>
     dff:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     e02:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     e06:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e0a:	79 d9                	jns    de5 <printint+0x87>
    putc(fd, buf[i]);
}
     e0c:	90                   	nop
     e0d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e10:	c9                   	leave  
     e11:	c3                   	ret    

00000e12 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e12:	55                   	push   %ebp
     e13:	89 e5                	mov    %esp,%ebp
     e15:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     e18:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     e1f:	8d 45 0c             	lea    0xc(%ebp),%eax
     e22:	83 c0 04             	add    $0x4,%eax
     e25:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     e28:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     e2f:	e9 59 01 00 00       	jmp    f8d <printf+0x17b>
    c = fmt[i] & 0xff;
     e34:	8b 55 0c             	mov    0xc(%ebp),%edx
     e37:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e3a:	01 d0                	add    %edx,%eax
     e3c:	0f b6 00             	movzbl (%eax),%eax
     e3f:	0f be c0             	movsbl %al,%eax
     e42:	25 ff 00 00 00       	and    $0xff,%eax
     e47:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     e4a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     e4e:	75 2c                	jne    e7c <printf+0x6a>
      if(c == '%'){
     e50:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     e54:	75 0c                	jne    e62 <printf+0x50>
        state = '%';
     e56:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     e5d:	e9 27 01 00 00       	jmp    f89 <printf+0x177>
      } else {
        putc(fd, c);
     e62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     e65:	0f be c0             	movsbl %al,%eax
     e68:	83 ec 08             	sub    $0x8,%esp
     e6b:	50                   	push   %eax
     e6c:	ff 75 08             	pushl  0x8(%ebp)
     e6f:	e8 c7 fe ff ff       	call   d3b <putc>
     e74:	83 c4 10             	add    $0x10,%esp
     e77:	e9 0d 01 00 00       	jmp    f89 <printf+0x177>
      }
    } else if(state == '%'){
     e7c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     e80:	0f 85 03 01 00 00    	jne    f89 <printf+0x177>
      if(c == 'd'){
     e86:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     e8a:	75 1e                	jne    eaa <printf+0x98>
        printint(fd, *ap, 10, 1);
     e8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e8f:	8b 00                	mov    (%eax),%eax
     e91:	6a 01                	push   $0x1
     e93:	6a 0a                	push   $0xa
     e95:	50                   	push   %eax
     e96:	ff 75 08             	pushl  0x8(%ebp)
     e99:	e8 c0 fe ff ff       	call   d5e <printint>
     e9e:	83 c4 10             	add    $0x10,%esp
        ap++;
     ea1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     ea5:	e9 d8 00 00 00       	jmp    f82 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
     eaa:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     eae:	74 06                	je     eb6 <printf+0xa4>
     eb0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     eb4:	75 1e                	jne    ed4 <printf+0xc2>
        printint(fd, *ap, 16, 0);
     eb6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     eb9:	8b 00                	mov    (%eax),%eax
     ebb:	6a 00                	push   $0x0
     ebd:	6a 10                	push   $0x10
     ebf:	50                   	push   %eax
     ec0:	ff 75 08             	pushl  0x8(%ebp)
     ec3:	e8 96 fe ff ff       	call   d5e <printint>
     ec8:	83 c4 10             	add    $0x10,%esp
        ap++;
     ecb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     ecf:	e9 ae 00 00 00       	jmp    f82 <printf+0x170>
      } else if(c == 's'){
     ed4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     ed8:	75 43                	jne    f1d <printf+0x10b>
        s = (char*)*ap;
     eda:	8b 45 e8             	mov    -0x18(%ebp),%eax
     edd:	8b 00                	mov    (%eax),%eax
     edf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     ee2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     ee6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     eea:	75 25                	jne    f11 <printf+0xff>
          s = "(null)";
     eec:	c7 45 f4 12 12 00 00 	movl   $0x1212,-0xc(%ebp)
        while(*s != 0){
     ef3:	eb 1c                	jmp    f11 <printf+0xff>
          putc(fd, *s);
     ef5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ef8:	0f b6 00             	movzbl (%eax),%eax
     efb:	0f be c0             	movsbl %al,%eax
     efe:	83 ec 08             	sub    $0x8,%esp
     f01:	50                   	push   %eax
     f02:	ff 75 08             	pushl  0x8(%ebp)
     f05:	e8 31 fe ff ff       	call   d3b <putc>
     f0a:	83 c4 10             	add    $0x10,%esp
          s++;
     f0d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     f11:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f14:	0f b6 00             	movzbl (%eax),%eax
     f17:	84 c0                	test   %al,%al
     f19:	75 da                	jne    ef5 <printf+0xe3>
     f1b:	eb 65                	jmp    f82 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     f1d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     f21:	75 1d                	jne    f40 <printf+0x12e>
        putc(fd, *ap);
     f23:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f26:	8b 00                	mov    (%eax),%eax
     f28:	0f be c0             	movsbl %al,%eax
     f2b:	83 ec 08             	sub    $0x8,%esp
     f2e:	50                   	push   %eax
     f2f:	ff 75 08             	pushl  0x8(%ebp)
     f32:	e8 04 fe ff ff       	call   d3b <putc>
     f37:	83 c4 10             	add    $0x10,%esp
        ap++;
     f3a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     f3e:	eb 42                	jmp    f82 <printf+0x170>
      } else if(c == '%'){
     f40:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     f44:	75 17                	jne    f5d <printf+0x14b>
        putc(fd, c);
     f46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f49:	0f be c0             	movsbl %al,%eax
     f4c:	83 ec 08             	sub    $0x8,%esp
     f4f:	50                   	push   %eax
     f50:	ff 75 08             	pushl  0x8(%ebp)
     f53:	e8 e3 fd ff ff       	call   d3b <putc>
     f58:	83 c4 10             	add    $0x10,%esp
     f5b:	eb 25                	jmp    f82 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     f5d:	83 ec 08             	sub    $0x8,%esp
     f60:	6a 25                	push   $0x25
     f62:	ff 75 08             	pushl  0x8(%ebp)
     f65:	e8 d1 fd ff ff       	call   d3b <putc>
     f6a:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
     f6d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f70:	0f be c0             	movsbl %al,%eax
     f73:	83 ec 08             	sub    $0x8,%esp
     f76:	50                   	push   %eax
     f77:	ff 75 08             	pushl  0x8(%ebp)
     f7a:	e8 bc fd ff ff       	call   d3b <putc>
     f7f:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
     f82:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f89:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     f8d:	8b 55 0c             	mov    0xc(%ebp),%edx
     f90:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f93:	01 d0                	add    %edx,%eax
     f95:	0f b6 00             	movzbl (%eax),%eax
     f98:	84 c0                	test   %al,%al
     f9a:	0f 85 94 fe ff ff    	jne    e34 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     fa0:	90                   	nop
     fa1:	c9                   	leave  
     fa2:	c3                   	ret    

00000fa3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     fa3:	55                   	push   %ebp
     fa4:	89 e5                	mov    %esp,%ebp
     fa6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     fa9:	8b 45 08             	mov    0x8(%ebp),%eax
     fac:	83 e8 08             	sub    $0x8,%eax
     faf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fb2:	a1 e8 14 00 00       	mov    0x14e8,%eax
     fb7:	89 45 fc             	mov    %eax,-0x4(%ebp)
     fba:	eb 24                	jmp    fe0 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fbc:	8b 45 fc             	mov    -0x4(%ebp),%eax
     fbf:	8b 00                	mov    (%eax),%eax
     fc1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     fc4:	77 12                	ja     fd8 <free+0x35>
     fc6:	8b 45 f8             	mov    -0x8(%ebp),%eax
     fc9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     fcc:	77 24                	ja     ff2 <free+0x4f>
     fce:	8b 45 fc             	mov    -0x4(%ebp),%eax
     fd1:	8b 00                	mov    (%eax),%eax
     fd3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     fd6:	77 1a                	ja     ff2 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     fdb:	8b 00                	mov    (%eax),%eax
     fdd:	89 45 fc             	mov    %eax,-0x4(%ebp)
     fe0:	8b 45 f8             	mov    -0x8(%ebp),%eax
     fe3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     fe6:	76 d4                	jbe    fbc <free+0x19>
     fe8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     feb:	8b 00                	mov    (%eax),%eax
     fed:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     ff0:	76 ca                	jbe    fbc <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     ff2:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ff5:	8b 40 04             	mov    0x4(%eax),%eax
     ff8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     fff:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1002:	01 c2                	add    %eax,%edx
    1004:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1007:	8b 00                	mov    (%eax),%eax
    1009:	39 c2                	cmp    %eax,%edx
    100b:	75 24                	jne    1031 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    100d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1010:	8b 50 04             	mov    0x4(%eax),%edx
    1013:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1016:	8b 00                	mov    (%eax),%eax
    1018:	8b 40 04             	mov    0x4(%eax),%eax
    101b:	01 c2                	add    %eax,%edx
    101d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1020:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1023:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1026:	8b 00                	mov    (%eax),%eax
    1028:	8b 10                	mov    (%eax),%edx
    102a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    102d:	89 10                	mov    %edx,(%eax)
    102f:	eb 0a                	jmp    103b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    1031:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1034:	8b 10                	mov    (%eax),%edx
    1036:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1039:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    103b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    103e:	8b 40 04             	mov    0x4(%eax),%eax
    1041:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1048:	8b 45 fc             	mov    -0x4(%ebp),%eax
    104b:	01 d0                	add    %edx,%eax
    104d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1050:	75 20                	jne    1072 <free+0xcf>
    p->s.size += bp->s.size;
    1052:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1055:	8b 50 04             	mov    0x4(%eax),%edx
    1058:	8b 45 f8             	mov    -0x8(%ebp),%eax
    105b:	8b 40 04             	mov    0x4(%eax),%eax
    105e:	01 c2                	add    %eax,%edx
    1060:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1063:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1066:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1069:	8b 10                	mov    (%eax),%edx
    106b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    106e:	89 10                	mov    %edx,(%eax)
    1070:	eb 08                	jmp    107a <free+0xd7>
  } else
    p->s.ptr = bp;
    1072:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1075:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1078:	89 10                	mov    %edx,(%eax)
  freep = p;
    107a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    107d:	a3 e8 14 00 00       	mov    %eax,0x14e8
}
    1082:	90                   	nop
    1083:	c9                   	leave  
    1084:	c3                   	ret    

00001085 <morecore>:

static Header*
morecore(uint nu)
{
    1085:	55                   	push   %ebp
    1086:	89 e5                	mov    %esp,%ebp
    1088:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    108b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1092:	77 07                	ja     109b <morecore+0x16>
    nu = 4096;
    1094:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    109b:	8b 45 08             	mov    0x8(%ebp),%eax
    109e:	c1 e0 03             	shl    $0x3,%eax
    10a1:	83 ec 0c             	sub    $0xc,%esp
    10a4:	50                   	push   %eax
    10a5:	e8 7b f5 ff ff       	call   625 <sbrk>
    10aa:	83 c4 10             	add    $0x10,%esp
    10ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    10b0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    10b4:	75 07                	jne    10bd <morecore+0x38>
    return 0;
    10b6:	b8 00 00 00 00       	mov    $0x0,%eax
    10bb:	eb 26                	jmp    10e3 <morecore+0x5e>
  hp = (Header*)p;
    10bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    10c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10c6:	8b 55 08             	mov    0x8(%ebp),%edx
    10c9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    10cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10cf:	83 c0 08             	add    $0x8,%eax
    10d2:	83 ec 0c             	sub    $0xc,%esp
    10d5:	50                   	push   %eax
    10d6:	e8 c8 fe ff ff       	call   fa3 <free>
    10db:	83 c4 10             	add    $0x10,%esp
  return freep;
    10de:	a1 e8 14 00 00       	mov    0x14e8,%eax
}
    10e3:	c9                   	leave  
    10e4:	c3                   	ret    

000010e5 <malloc>:

void*
malloc(uint nbytes)
{
    10e5:	55                   	push   %ebp
    10e6:	89 e5                	mov    %esp,%ebp
    10e8:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10eb:	8b 45 08             	mov    0x8(%ebp),%eax
    10ee:	83 c0 07             	add    $0x7,%eax
    10f1:	c1 e8 03             	shr    $0x3,%eax
    10f4:	83 c0 01             	add    $0x1,%eax
    10f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    10fa:	a1 e8 14 00 00       	mov    0x14e8,%eax
    10ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1102:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1106:	75 23                	jne    112b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1108:	c7 45 f0 e0 14 00 00 	movl   $0x14e0,-0x10(%ebp)
    110f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1112:	a3 e8 14 00 00       	mov    %eax,0x14e8
    1117:	a1 e8 14 00 00       	mov    0x14e8,%eax
    111c:	a3 e0 14 00 00       	mov    %eax,0x14e0
    base.s.size = 0;
    1121:	c7 05 e4 14 00 00 00 	movl   $0x0,0x14e4
    1128:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    112b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    112e:	8b 00                	mov    (%eax),%eax
    1130:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1133:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1136:	8b 40 04             	mov    0x4(%eax),%eax
    1139:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    113c:	72 4d                	jb     118b <malloc+0xa6>
      if(p->s.size == nunits)
    113e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1141:	8b 40 04             	mov    0x4(%eax),%eax
    1144:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1147:	75 0c                	jne    1155 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1149:	8b 45 f4             	mov    -0xc(%ebp),%eax
    114c:	8b 10                	mov    (%eax),%edx
    114e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1151:	89 10                	mov    %edx,(%eax)
    1153:	eb 26                	jmp    117b <malloc+0x96>
      else {
        p->s.size -= nunits;
    1155:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1158:	8b 40 04             	mov    0x4(%eax),%eax
    115b:	2b 45 ec             	sub    -0x14(%ebp),%eax
    115e:	89 c2                	mov    %eax,%edx
    1160:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1163:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1166:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1169:	8b 40 04             	mov    0x4(%eax),%eax
    116c:	c1 e0 03             	shl    $0x3,%eax
    116f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1172:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1175:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1178:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    117b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    117e:	a3 e8 14 00 00       	mov    %eax,0x14e8
      return (void*)(p + 1);
    1183:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1186:	83 c0 08             	add    $0x8,%eax
    1189:	eb 3b                	jmp    11c6 <malloc+0xe1>
    }
    if(p == freep)
    118b:	a1 e8 14 00 00       	mov    0x14e8,%eax
    1190:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1193:	75 1e                	jne    11b3 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    1195:	83 ec 0c             	sub    $0xc,%esp
    1198:	ff 75 ec             	pushl  -0x14(%ebp)
    119b:	e8 e5 fe ff ff       	call   1085 <morecore>
    11a0:	83 c4 10             	add    $0x10,%esp
    11a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    11a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11aa:	75 07                	jne    11b3 <malloc+0xce>
        return 0;
    11ac:	b8 00 00 00 00       	mov    $0x0,%eax
    11b1:	eb 13                	jmp    11c6 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    11b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11bc:	8b 00                	mov    (%eax),%eax
    11be:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    11c1:	e9 6d ff ff ff       	jmp    1133 <malloc+0x4e>
}
    11c6:	c9                   	leave  
    11c7:	c3                   	ret    
