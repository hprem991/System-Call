
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
       a:	75 05                	jne    11 <runcmd+0x11>
    exit();
       c:	e8 c4 0e 00 00       	call   ed5 <exit>
  
  switch(cmd->type){
      11:	8b 45 08             	mov    0x8(%ebp),%eax
      14:	8b 00                	mov    (%eax),%eax
      16:	83 f8 05             	cmp    $0x5,%eax
      19:	77 09                	ja     24 <runcmd+0x24>
      1b:	8b 04 85 2c 1b 00 00 	mov    0x1b2c(,%eax,4),%eax
      22:	ff e0                	jmp    *%eax
  default:
    panic("runcmd");
      24:	83 ec 0c             	sub    $0xc,%esp
      27:	68 00 1b 00 00       	push   $0x1b00
      2c:	e8 6b 03 00 00       	call   39c <panic>
      31:	83 c4 10             	add    $0x10,%esp

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      34:	8b 45 08             	mov    0x8(%ebp),%eax
      37:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
      3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
      3d:	8b 40 04             	mov    0x4(%eax),%eax
      40:	85 c0                	test   %eax,%eax
      42:	75 05                	jne    49 <runcmd+0x49>
      exit();
      44:	e8 8c 0e 00 00       	call   ed5 <exit>
    exec(ecmd->argv[0], ecmd->argv);
      49:	8b 45 f4             	mov    -0xc(%ebp),%eax
      4c:	8d 50 04             	lea    0x4(%eax),%edx
      4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
      52:	8b 40 04             	mov    0x4(%eax),%eax
      55:	83 ec 08             	sub    $0x8,%esp
      58:	52                   	push   %edx
      59:	50                   	push   %eax
      5a:	e8 ae 0e 00 00       	call   f0d <exec>
      5f:	83 c4 10             	add    $0x10,%esp
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      62:	8b 45 f4             	mov    -0xc(%ebp),%eax
      65:	8b 40 04             	mov    0x4(%eax),%eax
      68:	83 ec 04             	sub    $0x4,%esp
      6b:	50                   	push   %eax
      6c:	68 07 1b 00 00       	push   $0x1b07
      71:	6a 02                	push   $0x2
      73:	e8 d2 16 00 00       	call   174a <printf>
      78:	83 c4 10             	add    $0x10,%esp
    break;
      7b:	e9 c6 01 00 00       	jmp    246 <runcmd+0x246>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      80:	8b 45 08             	mov    0x8(%ebp),%eax
      83:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(rcmd->fd);
      86:	8b 45 f0             	mov    -0x10(%ebp),%eax
      89:	8b 40 14             	mov    0x14(%eax),%eax
      8c:	83 ec 0c             	sub    $0xc,%esp
      8f:	50                   	push   %eax
      90:	e8 68 0e 00 00       	call   efd <close>
      95:	83 c4 10             	add    $0x10,%esp
    if(open(rcmd->file, rcmd->mode) < 0){
      98:	8b 45 f0             	mov    -0x10(%ebp),%eax
      9b:	8b 50 10             	mov    0x10(%eax),%edx
      9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
      a1:	8b 40 08             	mov    0x8(%eax),%eax
      a4:	83 ec 08             	sub    $0x8,%esp
      a7:	52                   	push   %edx
      a8:	50                   	push   %eax
      a9:	e8 67 0e 00 00       	call   f15 <open>
      ae:	83 c4 10             	add    $0x10,%esp
      b1:	85 c0                	test   %eax,%eax
      b3:	79 1e                	jns    d3 <runcmd+0xd3>
      printf(2, "open %s failed\n", rcmd->file);
      b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
      b8:	8b 40 08             	mov    0x8(%eax),%eax
      bb:	83 ec 04             	sub    $0x4,%esp
      be:	50                   	push   %eax
      bf:	68 17 1b 00 00       	push   $0x1b17
      c4:	6a 02                	push   $0x2
      c6:	e8 7f 16 00 00       	call   174a <printf>
      cb:	83 c4 10             	add    $0x10,%esp
      exit();
      ce:	e8 02 0e 00 00       	call   ed5 <exit>
    }
    runcmd(rcmd->cmd);
      d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
      d6:	8b 40 04             	mov    0x4(%eax),%eax
      d9:	83 ec 0c             	sub    $0xc,%esp
      dc:	50                   	push   %eax
      dd:	e8 1e ff ff ff       	call   0 <runcmd>
      e2:	83 c4 10             	add    $0x10,%esp
    break;
      e5:	e9 5c 01 00 00       	jmp    246 <runcmd+0x246>

  case LIST:
    lcmd = (struct listcmd*)cmd;
      ea:	8b 45 08             	mov    0x8(%ebp),%eax
      ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fork1() == 0)
      f0:	e8 c7 02 00 00       	call   3bc <fork1>
      f5:	85 c0                	test   %eax,%eax
      f7:	75 12                	jne    10b <runcmd+0x10b>
      runcmd(lcmd->left);
      f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
      fc:	8b 40 04             	mov    0x4(%eax),%eax
      ff:	83 ec 0c             	sub    $0xc,%esp
     102:	50                   	push   %eax
     103:	e8 f8 fe ff ff       	call   0 <runcmd>
     108:	83 c4 10             	add    $0x10,%esp
    wait();
     10b:	e8 cd 0d 00 00       	call   edd <wait>
    runcmd(lcmd->right);
     110:	8b 45 ec             	mov    -0x14(%ebp),%eax
     113:	8b 40 08             	mov    0x8(%eax),%eax
     116:	83 ec 0c             	sub    $0xc,%esp
     119:	50                   	push   %eax
     11a:	e8 e1 fe ff ff       	call   0 <runcmd>
     11f:	83 c4 10             	add    $0x10,%esp
    break;
     122:	e9 1f 01 00 00       	jmp    246 <runcmd+0x246>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     127:	8b 45 08             	mov    0x8(%ebp),%eax
     12a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pipe(p) < 0)
     12d:	83 ec 0c             	sub    $0xc,%esp
     130:	8d 45 dc             	lea    -0x24(%ebp),%eax
     133:	50                   	push   %eax
     134:	e8 ac 0d 00 00       	call   ee5 <pipe>
     139:	83 c4 10             	add    $0x10,%esp
     13c:	85 c0                	test   %eax,%eax
     13e:	79 10                	jns    150 <runcmd+0x150>
      panic("pipe");
     140:	83 ec 0c             	sub    $0xc,%esp
     143:	68 27 1b 00 00       	push   $0x1b27
     148:	e8 4f 02 00 00       	call   39c <panic>
     14d:	83 c4 10             	add    $0x10,%esp
    if(fork1() == 0){
     150:	e8 67 02 00 00       	call   3bc <fork1>
     155:	85 c0                	test   %eax,%eax
     157:	75 4c                	jne    1a5 <runcmd+0x1a5>
      close(1);
     159:	83 ec 0c             	sub    $0xc,%esp
     15c:	6a 01                	push   $0x1
     15e:	e8 9a 0d 00 00       	call   efd <close>
     163:	83 c4 10             	add    $0x10,%esp
      dup(p[1]);
     166:	8b 45 e0             	mov    -0x20(%ebp),%eax
     169:	83 ec 0c             	sub    $0xc,%esp
     16c:	50                   	push   %eax
     16d:	e8 db 0d 00 00       	call   f4d <dup>
     172:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
     175:	8b 45 dc             	mov    -0x24(%ebp),%eax
     178:	83 ec 0c             	sub    $0xc,%esp
     17b:	50                   	push   %eax
     17c:	e8 7c 0d 00 00       	call   efd <close>
     181:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
     184:	8b 45 e0             	mov    -0x20(%ebp),%eax
     187:	83 ec 0c             	sub    $0xc,%esp
     18a:	50                   	push   %eax
     18b:	e8 6d 0d 00 00       	call   efd <close>
     190:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->left);
     193:	8b 45 e8             	mov    -0x18(%ebp),%eax
     196:	8b 40 04             	mov    0x4(%eax),%eax
     199:	83 ec 0c             	sub    $0xc,%esp
     19c:	50                   	push   %eax
     19d:	e8 5e fe ff ff       	call   0 <runcmd>
     1a2:	83 c4 10             	add    $0x10,%esp
    }
    if(fork1() == 0){
     1a5:	e8 12 02 00 00       	call   3bc <fork1>
     1aa:	85 c0                	test   %eax,%eax
     1ac:	75 4c                	jne    1fa <runcmd+0x1fa>
      close(0);
     1ae:	83 ec 0c             	sub    $0xc,%esp
     1b1:	6a 00                	push   $0x0
     1b3:	e8 45 0d 00 00       	call   efd <close>
     1b8:	83 c4 10             	add    $0x10,%esp
      dup(p[0]);
     1bb:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1be:	83 ec 0c             	sub    $0xc,%esp
     1c1:	50                   	push   %eax
     1c2:	e8 86 0d 00 00       	call   f4d <dup>
     1c7:	83 c4 10             	add    $0x10,%esp
      close(p[0]);
     1ca:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1cd:	83 ec 0c             	sub    $0xc,%esp
     1d0:	50                   	push   %eax
     1d1:	e8 27 0d 00 00       	call   efd <close>
     1d6:	83 c4 10             	add    $0x10,%esp
      close(p[1]);
     1d9:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1dc:	83 ec 0c             	sub    $0xc,%esp
     1df:	50                   	push   %eax
     1e0:	e8 18 0d 00 00       	call   efd <close>
     1e5:	83 c4 10             	add    $0x10,%esp
      runcmd(pcmd->right);
     1e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
     1eb:	8b 40 08             	mov    0x8(%eax),%eax
     1ee:	83 ec 0c             	sub    $0xc,%esp
     1f1:	50                   	push   %eax
     1f2:	e8 09 fe ff ff       	call   0 <runcmd>
     1f7:	83 c4 10             	add    $0x10,%esp
    }
    close(p[0]);
     1fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1fd:	83 ec 0c             	sub    $0xc,%esp
     200:	50                   	push   %eax
     201:	e8 f7 0c 00 00       	call   efd <close>
     206:	83 c4 10             	add    $0x10,%esp
    close(p[1]);
     209:	8b 45 e0             	mov    -0x20(%ebp),%eax
     20c:	83 ec 0c             	sub    $0xc,%esp
     20f:	50                   	push   %eax
     210:	e8 e8 0c 00 00       	call   efd <close>
     215:	83 c4 10             	add    $0x10,%esp
    wait();
     218:	e8 c0 0c 00 00       	call   edd <wait>
    wait();
     21d:	e8 bb 0c 00 00       	call   edd <wait>
    break;
     222:	eb 22                	jmp    246 <runcmd+0x246>
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
     224:	8b 45 08             	mov    0x8(%ebp),%eax
     227:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(fork1() == 0)
     22a:	e8 8d 01 00 00       	call   3bc <fork1>
     22f:	85 c0                	test   %eax,%eax
     231:	75 12                	jne    245 <runcmd+0x245>
      runcmd(bcmd->cmd);
     233:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     236:	8b 40 04             	mov    0x4(%eax),%eax
     239:	83 ec 0c             	sub    $0xc,%esp
     23c:	50                   	push   %eax
     23d:	e8 be fd ff ff       	call   0 <runcmd>
     242:	83 c4 10             	add    $0x10,%esp
    break;
     245:	90                   	nop
  }
  exit();
     246:	e8 8a 0c 00 00       	call   ed5 <exit>

0000024b <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     24b:	55                   	push   %ebp
     24c:	89 e5                	mov    %esp,%ebp
     24e:	83 ec 08             	sub    $0x8,%esp
  printf(2, "$ ");
     251:	83 ec 08             	sub    $0x8,%esp
     254:	68 44 1b 00 00       	push   $0x1b44
     259:	6a 02                	push   $0x2
     25b:	e8 ea 14 00 00       	call   174a <printf>
     260:	83 c4 10             	add    $0x10,%esp
  memset(buf, 0, nbuf);
     263:	8b 45 0c             	mov    0xc(%ebp),%eax
     266:	83 ec 04             	sub    $0x4,%esp
     269:	50                   	push   %eax
     26a:	6a 00                	push   $0x0
     26c:	ff 75 08             	pushl  0x8(%ebp)
     26f:	e8 c6 0a 00 00       	call   d3a <memset>
     274:	83 c4 10             	add    $0x10,%esp
  gets(buf, nbuf);
     277:	83 ec 08             	sub    $0x8,%esp
     27a:	ff 75 0c             	pushl  0xc(%ebp)
     27d:	ff 75 08             	pushl  0x8(%ebp)
     280:	e8 02 0b 00 00       	call   d87 <gets>
     285:	83 c4 10             	add    $0x10,%esp
  if(buf[0] == 0) // EOF
     288:	8b 45 08             	mov    0x8(%ebp),%eax
     28b:	0f b6 00             	movzbl (%eax),%eax
     28e:	84 c0                	test   %al,%al
     290:	75 07                	jne    299 <getcmd+0x4e>
    return -1;
     292:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     297:	eb 05                	jmp    29e <getcmd+0x53>
  return 0;
     299:	b8 00 00 00 00       	mov    $0x0,%eax
}
     29e:	c9                   	leave  
     29f:	c3                   	ret    

000002a0 <main>:

int
main(void)
{
     2a0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     2a4:	83 e4 f0             	and    $0xfffffff0,%esp
     2a7:	ff 71 fc             	pushl  -0x4(%ecx)
     2aa:	55                   	push   %ebp
     2ab:	89 e5                	mov    %esp,%ebp
     2ad:	51                   	push   %ecx
     2ae:	83 ec 14             	sub    $0x14,%esp
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     2b1:	eb 16                	jmp    2c9 <main+0x29>
    if(fd >= 3){
     2b3:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
     2b7:	7e 10                	jle    2c9 <main+0x29>
      close(fd);
     2b9:	83 ec 0c             	sub    $0xc,%esp
     2bc:	ff 75 f4             	pushl  -0xc(%ebp)
     2bf:	e8 39 0c 00 00       	call   efd <close>
     2c4:	83 c4 10             	add    $0x10,%esp
      break;
     2c7:	eb 1b                	jmp    2e4 <main+0x44>
{
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     2c9:	83 ec 08             	sub    $0x8,%esp
     2cc:	6a 02                	push   $0x2
     2ce:	68 47 1b 00 00       	push   $0x1b47
     2d3:	e8 3d 0c 00 00       	call   f15 <open>
     2d8:	83 c4 10             	add    $0x10,%esp
     2db:	89 45 f4             	mov    %eax,-0xc(%ebp)
     2de:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     2e2:	79 cf                	jns    2b3 <main+0x13>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     2e4:	e9 94 00 00 00       	jmp    37d <main+0xdd>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     2e9:	0f b6 05 a0 20 00 00 	movzbl 0x20a0,%eax
     2f0:	3c 63                	cmp    $0x63,%al
     2f2:	75 5f                	jne    353 <main+0xb3>
     2f4:	0f b6 05 a1 20 00 00 	movzbl 0x20a1,%eax
     2fb:	3c 64                	cmp    $0x64,%al
     2fd:	75 54                	jne    353 <main+0xb3>
     2ff:	0f b6 05 a2 20 00 00 	movzbl 0x20a2,%eax
     306:	3c 20                	cmp    $0x20,%al
     308:	75 49                	jne    353 <main+0xb3>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     30a:	83 ec 0c             	sub    $0xc,%esp
     30d:	68 a0 20 00 00       	push   $0x20a0
     312:	e8 fc 09 00 00       	call   d13 <strlen>
     317:	83 c4 10             	add    $0x10,%esp
     31a:	83 e8 01             	sub    $0x1,%eax
     31d:	c6 80 a0 20 00 00 00 	movb   $0x0,0x20a0(%eax)
      if(chdir(buf+3) < 0)
     324:	b8 a3 20 00 00       	mov    $0x20a3,%eax
     329:	83 ec 0c             	sub    $0xc,%esp
     32c:	50                   	push   %eax
     32d:	e8 13 0c 00 00       	call   f45 <chdir>
     332:	83 c4 10             	add    $0x10,%esp
     335:	85 c0                	test   %eax,%eax
     337:	79 44                	jns    37d <main+0xdd>
        printf(2, "cannot cd %s\n", buf+3);
     339:	b8 a3 20 00 00       	mov    $0x20a3,%eax
     33e:	83 ec 04             	sub    $0x4,%esp
     341:	50                   	push   %eax
     342:	68 4f 1b 00 00       	push   $0x1b4f
     347:	6a 02                	push   $0x2
     349:	e8 fc 13 00 00       	call   174a <printf>
     34e:	83 c4 10             	add    $0x10,%esp
      continue;
     351:	eb 2a                	jmp    37d <main+0xdd>
    }
    if(fork1() == 0)
     353:	e8 64 00 00 00       	call   3bc <fork1>
     358:	85 c0                	test   %eax,%eax
     35a:	75 1c                	jne    378 <main+0xd8>
      runcmd(parsecmd(buf));
     35c:	83 ec 0c             	sub    $0xc,%esp
     35f:	68 a0 20 00 00       	push   $0x20a0
     364:	e8 ab 03 00 00       	call   714 <parsecmd>
     369:	83 c4 10             	add    $0x10,%esp
     36c:	83 ec 0c             	sub    $0xc,%esp
     36f:	50                   	push   %eax
     370:	e8 8b fc ff ff       	call   0 <runcmd>
     375:	83 c4 10             	add    $0x10,%esp
    wait();
     378:	e8 60 0b 00 00       	call   edd <wait>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     37d:	83 ec 08             	sub    $0x8,%esp
     380:	6a 64                	push   $0x64
     382:	68 a0 20 00 00       	push   $0x20a0
     387:	e8 bf fe ff ff       	call   24b <getcmd>
     38c:	83 c4 10             	add    $0x10,%esp
     38f:	85 c0                	test   %eax,%eax
     391:	0f 89 52 ff ff ff    	jns    2e9 <main+0x49>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
     397:	e8 39 0b 00 00       	call   ed5 <exit>

0000039c <panic>:
}

void
panic(char *s)
{
     39c:	55                   	push   %ebp
     39d:	89 e5                	mov    %esp,%ebp
     39f:	83 ec 08             	sub    $0x8,%esp
  printf(2, "%s\n", s);
     3a2:	83 ec 04             	sub    $0x4,%esp
     3a5:	ff 75 08             	pushl  0x8(%ebp)
     3a8:	68 5d 1b 00 00       	push   $0x1b5d
     3ad:	6a 02                	push   $0x2
     3af:	e8 96 13 00 00       	call   174a <printf>
     3b4:	83 c4 10             	add    $0x10,%esp
  exit();
     3b7:	e8 19 0b 00 00       	call   ed5 <exit>

000003bc <fork1>:
}

int
fork1(void)
{
     3bc:	55                   	push   %ebp
     3bd:	89 e5                	mov    %esp,%ebp
     3bf:	83 ec 18             	sub    $0x18,%esp
  int pid;
  
  pid = fork();
     3c2:	e8 06 0b 00 00       	call   ecd <fork>
     3c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid == -1)
     3ca:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     3ce:	75 10                	jne    3e0 <fork1+0x24>
    panic("fork");
     3d0:	83 ec 0c             	sub    $0xc,%esp
     3d3:	68 61 1b 00 00       	push   $0x1b61
     3d8:	e8 bf ff ff ff       	call   39c <panic>
     3dd:	83 c4 10             	add    $0x10,%esp
  return pid;
     3e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3e3:	c9                   	leave  
     3e4:	c3                   	ret    

000003e5 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3e5:	55                   	push   %ebp
     3e6:	89 e5                	mov    %esp,%ebp
     3e8:	83 ec 18             	sub    $0x18,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3eb:	83 ec 0c             	sub    $0xc,%esp
     3ee:	6a 54                	push   $0x54
     3f0:	e8 28 16 00 00       	call   1a1d <malloc>
     3f5:	83 c4 10             	add    $0x10,%esp
     3f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3fb:	83 ec 04             	sub    $0x4,%esp
     3fe:	6a 54                	push   $0x54
     400:	6a 00                	push   $0x0
     402:	ff 75 f4             	pushl  -0xc(%ebp)
     405:	e8 30 09 00 00       	call   d3a <memset>
     40a:	83 c4 10             	add    $0x10,%esp
  cmd->type = EXEC;
     40d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     410:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     416:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     419:	c9                   	leave  
     41a:	c3                   	ret    

0000041b <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     41b:	55                   	push   %ebp
     41c:	89 e5                	mov    %esp,%ebp
     41e:	83 ec 18             	sub    $0x18,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     421:	83 ec 0c             	sub    $0xc,%esp
     424:	6a 18                	push   $0x18
     426:	e8 f2 15 00 00       	call   1a1d <malloc>
     42b:	83 c4 10             	add    $0x10,%esp
     42e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     431:	83 ec 04             	sub    $0x4,%esp
     434:	6a 18                	push   $0x18
     436:	6a 00                	push   $0x0
     438:	ff 75 f4             	pushl  -0xc(%ebp)
     43b:	e8 fa 08 00 00       	call   d3a <memset>
     440:	83 c4 10             	add    $0x10,%esp
  cmd->type = REDIR;
     443:	8b 45 f4             	mov    -0xc(%ebp),%eax
     446:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     44c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     44f:	8b 55 08             	mov    0x8(%ebp),%edx
     452:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     455:	8b 45 f4             	mov    -0xc(%ebp),%eax
     458:	8b 55 0c             	mov    0xc(%ebp),%edx
     45b:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     45e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     461:	8b 55 10             	mov    0x10(%ebp),%edx
     464:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     467:	8b 45 f4             	mov    -0xc(%ebp),%eax
     46a:	8b 55 14             	mov    0x14(%ebp),%edx
     46d:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     470:	8b 45 f4             	mov    -0xc(%ebp),%eax
     473:	8b 55 18             	mov    0x18(%ebp),%edx
     476:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     479:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     47c:	c9                   	leave  
     47d:	c3                   	ret    

0000047e <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     47e:	55                   	push   %ebp
     47f:	89 e5                	mov    %esp,%ebp
     481:	83 ec 18             	sub    $0x18,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     484:	83 ec 0c             	sub    $0xc,%esp
     487:	6a 0c                	push   $0xc
     489:	e8 8f 15 00 00       	call   1a1d <malloc>
     48e:	83 c4 10             	add    $0x10,%esp
     491:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     494:	83 ec 04             	sub    $0x4,%esp
     497:	6a 0c                	push   $0xc
     499:	6a 00                	push   $0x0
     49b:	ff 75 f4             	pushl  -0xc(%ebp)
     49e:	e8 97 08 00 00       	call   d3a <memset>
     4a3:	83 c4 10             	add    $0x10,%esp
  cmd->type = PIPE;
     4a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4a9:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     4af:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4b2:	8b 55 08             	mov    0x8(%ebp),%edx
     4b5:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     4b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4bb:	8b 55 0c             	mov    0xc(%ebp),%edx
     4be:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     4c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     4c4:	c9                   	leave  
     4c5:	c3                   	ret    

000004c6 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     4c6:	55                   	push   %ebp
     4c7:	89 e5                	mov    %esp,%ebp
     4c9:	83 ec 18             	sub    $0x18,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4cc:	83 ec 0c             	sub    $0xc,%esp
     4cf:	6a 0c                	push   $0xc
     4d1:	e8 47 15 00 00       	call   1a1d <malloc>
     4d6:	83 c4 10             	add    $0x10,%esp
     4d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     4dc:	83 ec 04             	sub    $0x4,%esp
     4df:	6a 0c                	push   $0xc
     4e1:	6a 00                	push   $0x0
     4e3:	ff 75 f4             	pushl  -0xc(%ebp)
     4e6:	e8 4f 08 00 00       	call   d3a <memset>
     4eb:	83 c4 10             	add    $0x10,%esp
  cmd->type = LIST;
     4ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4f1:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     4f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4fa:	8b 55 08             	mov    0x8(%ebp),%edx
     4fd:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     500:	8b 45 f4             	mov    -0xc(%ebp),%eax
     503:	8b 55 0c             	mov    0xc(%ebp),%edx
     506:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     509:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     50c:	c9                   	leave  
     50d:	c3                   	ret    

0000050e <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     50e:	55                   	push   %ebp
     50f:	89 e5                	mov    %esp,%ebp
     511:	83 ec 18             	sub    $0x18,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     514:	83 ec 0c             	sub    $0xc,%esp
     517:	6a 08                	push   $0x8
     519:	e8 ff 14 00 00       	call   1a1d <malloc>
     51e:	83 c4 10             	add    $0x10,%esp
     521:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     524:	83 ec 04             	sub    $0x4,%esp
     527:	6a 08                	push   $0x8
     529:	6a 00                	push   $0x0
     52b:	ff 75 f4             	pushl  -0xc(%ebp)
     52e:	e8 07 08 00 00       	call   d3a <memset>
     533:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     536:	8b 45 f4             	mov    -0xc(%ebp),%eax
     539:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     53f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     542:	8b 55 08             	mov    0x8(%ebp),%edx
     545:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     548:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     54b:	c9                   	leave  
     54c:	c3                   	ret    

0000054d <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     54d:	55                   	push   %ebp
     54e:	89 e5                	mov    %esp,%ebp
     550:	83 ec 18             	sub    $0x18,%esp
  char *s;
  int ret;
  
  s = *ps;
     553:	8b 45 08             	mov    0x8(%ebp),%eax
     556:	8b 00                	mov    (%eax),%eax
     558:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     55b:	eb 04                	jmp    561 <gettoken+0x14>
    s++;
     55d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     561:	8b 45 f4             	mov    -0xc(%ebp),%eax
     564:	3b 45 0c             	cmp    0xc(%ebp),%eax
     567:	73 1e                	jae    587 <gettoken+0x3a>
     569:	8b 45 f4             	mov    -0xc(%ebp),%eax
     56c:	0f b6 00             	movzbl (%eax),%eax
     56f:	0f be c0             	movsbl %al,%eax
     572:	83 ec 08             	sub    $0x8,%esp
     575:	50                   	push   %eax
     576:	68 7c 20 00 00       	push   $0x207c
     57b:	e8 d4 07 00 00       	call   d54 <strchr>
     580:	83 c4 10             	add    $0x10,%esp
     583:	85 c0                	test   %eax,%eax
     585:	75 d6                	jne    55d <gettoken+0x10>
    s++;
  if(q)
     587:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     58b:	74 08                	je     595 <gettoken+0x48>
    *q = s;
     58d:	8b 45 10             	mov    0x10(%ebp),%eax
     590:	8b 55 f4             	mov    -0xc(%ebp),%edx
     593:	89 10                	mov    %edx,(%eax)
  ret = *s;
     595:	8b 45 f4             	mov    -0xc(%ebp),%eax
     598:	0f b6 00             	movzbl (%eax),%eax
     59b:	0f be c0             	movsbl %al,%eax
     59e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
     5a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5a4:	0f b6 00             	movzbl (%eax),%eax
     5a7:	0f be c0             	movsbl %al,%eax
     5aa:	83 f8 29             	cmp    $0x29,%eax
     5ad:	7f 14                	jg     5c3 <gettoken+0x76>
     5af:	83 f8 28             	cmp    $0x28,%eax
     5b2:	7d 28                	jge    5dc <gettoken+0x8f>
     5b4:	85 c0                	test   %eax,%eax
     5b6:	0f 84 94 00 00 00    	je     650 <gettoken+0x103>
     5bc:	83 f8 26             	cmp    $0x26,%eax
     5bf:	74 1b                	je     5dc <gettoken+0x8f>
     5c1:	eb 3a                	jmp    5fd <gettoken+0xb0>
     5c3:	83 f8 3e             	cmp    $0x3e,%eax
     5c6:	74 1a                	je     5e2 <gettoken+0x95>
     5c8:	83 f8 3e             	cmp    $0x3e,%eax
     5cb:	7f 0a                	jg     5d7 <gettoken+0x8a>
     5cd:	83 e8 3b             	sub    $0x3b,%eax
     5d0:	83 f8 01             	cmp    $0x1,%eax
     5d3:	77 28                	ja     5fd <gettoken+0xb0>
     5d5:	eb 05                	jmp    5dc <gettoken+0x8f>
     5d7:	83 f8 7c             	cmp    $0x7c,%eax
     5da:	75 21                	jne    5fd <gettoken+0xb0>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     5dc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
     5e0:	eb 75                	jmp    657 <gettoken+0x10a>
  case '>':
    s++;
     5e2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
     5e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5e9:	0f b6 00             	movzbl (%eax),%eax
     5ec:	3c 3e                	cmp    $0x3e,%al
     5ee:	75 63                	jne    653 <gettoken+0x106>
      ret = '+';
     5f0:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
     5f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
     5fb:	eb 56                	jmp    653 <gettoken+0x106>
  default:
    ret = 'a';
     5fd:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     604:	eb 04                	jmp    60a <gettoken+0xbd>
      s++;
     606:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     60a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     60d:	3b 45 0c             	cmp    0xc(%ebp),%eax
     610:	73 44                	jae    656 <gettoken+0x109>
     612:	8b 45 f4             	mov    -0xc(%ebp),%eax
     615:	0f b6 00             	movzbl (%eax),%eax
     618:	0f be c0             	movsbl %al,%eax
     61b:	83 ec 08             	sub    $0x8,%esp
     61e:	50                   	push   %eax
     61f:	68 7c 20 00 00       	push   $0x207c
     624:	e8 2b 07 00 00       	call   d54 <strchr>
     629:	83 c4 10             	add    $0x10,%esp
     62c:	85 c0                	test   %eax,%eax
     62e:	75 26                	jne    656 <gettoken+0x109>
     630:	8b 45 f4             	mov    -0xc(%ebp),%eax
     633:	0f b6 00             	movzbl (%eax),%eax
     636:	0f be c0             	movsbl %al,%eax
     639:	83 ec 08             	sub    $0x8,%esp
     63c:	50                   	push   %eax
     63d:	68 84 20 00 00       	push   $0x2084
     642:	e8 0d 07 00 00       	call   d54 <strchr>
     647:	83 c4 10             	add    $0x10,%esp
     64a:	85 c0                	test   %eax,%eax
     64c:	74 b8                	je     606 <gettoken+0xb9>
      s++;
    break;
     64e:	eb 06                	jmp    656 <gettoken+0x109>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
     650:	90                   	nop
     651:	eb 04                	jmp    657 <gettoken+0x10a>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
     653:	90                   	nop
     654:	eb 01                	jmp    657 <gettoken+0x10a>
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
     656:	90                   	nop
  }
  if(eq)
     657:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     65b:	74 0e                	je     66b <gettoken+0x11e>
    *eq = s;
     65d:	8b 45 14             	mov    0x14(%ebp),%eax
     660:	8b 55 f4             	mov    -0xc(%ebp),%edx
     663:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
     665:	eb 04                	jmp    66b <gettoken+0x11e>
    s++;
     667:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
     66b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     66e:	3b 45 0c             	cmp    0xc(%ebp),%eax
     671:	73 1e                	jae    691 <gettoken+0x144>
     673:	8b 45 f4             	mov    -0xc(%ebp),%eax
     676:	0f b6 00             	movzbl (%eax),%eax
     679:	0f be c0             	movsbl %al,%eax
     67c:	83 ec 08             	sub    $0x8,%esp
     67f:	50                   	push   %eax
     680:	68 7c 20 00 00       	push   $0x207c
     685:	e8 ca 06 00 00       	call   d54 <strchr>
     68a:	83 c4 10             	add    $0x10,%esp
     68d:	85 c0                	test   %eax,%eax
     68f:	75 d6                	jne    667 <gettoken+0x11a>
    s++;
  *ps = s;
     691:	8b 45 08             	mov    0x8(%ebp),%eax
     694:	8b 55 f4             	mov    -0xc(%ebp),%edx
     697:	89 10                	mov    %edx,(%eax)
  return ret;
     699:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     69c:	c9                   	leave  
     69d:	c3                   	ret    

0000069e <peek>:

int
peek(char **ps, char *es, char *toks)
{
     69e:	55                   	push   %ebp
     69f:	89 e5                	mov    %esp,%ebp
     6a1:	83 ec 18             	sub    $0x18,%esp
  char *s;
  
  s = *ps;
     6a4:	8b 45 08             	mov    0x8(%ebp),%eax
     6a7:	8b 00                	mov    (%eax),%eax
     6a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     6ac:	eb 04                	jmp    6b2 <peek+0x14>
    s++;
     6ae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     6b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6b5:	3b 45 0c             	cmp    0xc(%ebp),%eax
     6b8:	73 1e                	jae    6d8 <peek+0x3a>
     6ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6bd:	0f b6 00             	movzbl (%eax),%eax
     6c0:	0f be c0             	movsbl %al,%eax
     6c3:	83 ec 08             	sub    $0x8,%esp
     6c6:	50                   	push   %eax
     6c7:	68 7c 20 00 00       	push   $0x207c
     6cc:	e8 83 06 00 00       	call   d54 <strchr>
     6d1:	83 c4 10             	add    $0x10,%esp
     6d4:	85 c0                	test   %eax,%eax
     6d6:	75 d6                	jne    6ae <peek+0x10>
    s++;
  *ps = s;
     6d8:	8b 45 08             	mov    0x8(%ebp),%eax
     6db:	8b 55 f4             	mov    -0xc(%ebp),%edx
     6de:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
     6e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6e3:	0f b6 00             	movzbl (%eax),%eax
     6e6:	84 c0                	test   %al,%al
     6e8:	74 23                	je     70d <peek+0x6f>
     6ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6ed:	0f b6 00             	movzbl (%eax),%eax
     6f0:	0f be c0             	movsbl %al,%eax
     6f3:	83 ec 08             	sub    $0x8,%esp
     6f6:	50                   	push   %eax
     6f7:	ff 75 10             	pushl  0x10(%ebp)
     6fa:	e8 55 06 00 00       	call   d54 <strchr>
     6ff:	83 c4 10             	add    $0x10,%esp
     702:	85 c0                	test   %eax,%eax
     704:	74 07                	je     70d <peek+0x6f>
     706:	b8 01 00 00 00       	mov    $0x1,%eax
     70b:	eb 05                	jmp    712 <peek+0x74>
     70d:	b8 00 00 00 00       	mov    $0x0,%eax
}
     712:	c9                   	leave  
     713:	c3                   	ret    

00000714 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     714:	55                   	push   %ebp
     715:	89 e5                	mov    %esp,%ebp
     717:	53                   	push   %ebx
     718:	83 ec 14             	sub    $0x14,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     71e:	8b 45 08             	mov    0x8(%ebp),%eax
     721:	83 ec 0c             	sub    $0xc,%esp
     724:	50                   	push   %eax
     725:	e8 e9 05 00 00       	call   d13 <strlen>
     72a:	83 c4 10             	add    $0x10,%esp
     72d:	01 d8                	add    %ebx,%eax
     72f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  cmd = parseline(&s, es);
     732:	83 ec 08             	sub    $0x8,%esp
     735:	ff 75 f4             	pushl  -0xc(%ebp)
     738:	8d 45 08             	lea    0x8(%ebp),%eax
     73b:	50                   	push   %eax
     73c:	e8 61 00 00 00       	call   7a2 <parseline>
     741:	83 c4 10             	add    $0x10,%esp
     744:	89 45 f0             	mov    %eax,-0x10(%ebp)
  peek(&s, es, "");
     747:	83 ec 04             	sub    $0x4,%esp
     74a:	68 66 1b 00 00       	push   $0x1b66
     74f:	ff 75 f4             	pushl  -0xc(%ebp)
     752:	8d 45 08             	lea    0x8(%ebp),%eax
     755:	50                   	push   %eax
     756:	e8 43 ff ff ff       	call   69e <peek>
     75b:	83 c4 10             	add    $0x10,%esp
  if(s != es){
     75e:	8b 45 08             	mov    0x8(%ebp),%eax
     761:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     764:	74 26                	je     78c <parsecmd+0x78>
    printf(2, "leftovers: %s\n", s);
     766:	8b 45 08             	mov    0x8(%ebp),%eax
     769:	83 ec 04             	sub    $0x4,%esp
     76c:	50                   	push   %eax
     76d:	68 67 1b 00 00       	push   $0x1b67
     772:	6a 02                	push   $0x2
     774:	e8 d1 0f 00 00       	call   174a <printf>
     779:	83 c4 10             	add    $0x10,%esp
    panic("syntax");
     77c:	83 ec 0c             	sub    $0xc,%esp
     77f:	68 76 1b 00 00       	push   $0x1b76
     784:	e8 13 fc ff ff       	call   39c <panic>
     789:	83 c4 10             	add    $0x10,%esp
  }
  nulterminate(cmd);
     78c:	83 ec 0c             	sub    $0xc,%esp
     78f:	ff 75 f0             	pushl  -0x10(%ebp)
     792:	e8 eb 03 00 00       	call   b82 <nulterminate>
     797:	83 c4 10             	add    $0x10,%esp
  return cmd;
     79a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     79d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     7a0:	c9                   	leave  
     7a1:	c3                   	ret    

000007a2 <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     7a2:	55                   	push   %ebp
     7a3:	89 e5                	mov    %esp,%ebp
     7a5:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     7a8:	83 ec 08             	sub    $0x8,%esp
     7ab:	ff 75 0c             	pushl  0xc(%ebp)
     7ae:	ff 75 08             	pushl  0x8(%ebp)
     7b1:	e8 99 00 00 00       	call   84f <parsepipe>
     7b6:	83 c4 10             	add    $0x10,%esp
     7b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
     7bc:	eb 23                	jmp    7e1 <parseline+0x3f>
    gettoken(ps, es, 0, 0);
     7be:	6a 00                	push   $0x0
     7c0:	6a 00                	push   $0x0
     7c2:	ff 75 0c             	pushl  0xc(%ebp)
     7c5:	ff 75 08             	pushl  0x8(%ebp)
     7c8:	e8 80 fd ff ff       	call   54d <gettoken>
     7cd:	83 c4 10             	add    $0x10,%esp
    cmd = backcmd(cmd);
     7d0:	83 ec 0c             	sub    $0xc,%esp
     7d3:	ff 75 f4             	pushl  -0xc(%ebp)
     7d6:	e8 33 fd ff ff       	call   50e <backcmd>
     7db:	83 c4 10             	add    $0x10,%esp
     7de:	89 45 f4             	mov    %eax,-0xc(%ebp)
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     7e1:	83 ec 04             	sub    $0x4,%esp
     7e4:	68 7d 1b 00 00       	push   $0x1b7d
     7e9:	ff 75 0c             	pushl  0xc(%ebp)
     7ec:	ff 75 08             	pushl  0x8(%ebp)
     7ef:	e8 aa fe ff ff       	call   69e <peek>
     7f4:	83 c4 10             	add    $0x10,%esp
     7f7:	85 c0                	test   %eax,%eax
     7f9:	75 c3                	jne    7be <parseline+0x1c>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     7fb:	83 ec 04             	sub    $0x4,%esp
     7fe:	68 7f 1b 00 00       	push   $0x1b7f
     803:	ff 75 0c             	pushl  0xc(%ebp)
     806:	ff 75 08             	pushl  0x8(%ebp)
     809:	e8 90 fe ff ff       	call   69e <peek>
     80e:	83 c4 10             	add    $0x10,%esp
     811:	85 c0                	test   %eax,%eax
     813:	74 35                	je     84a <parseline+0xa8>
    gettoken(ps, es, 0, 0);
     815:	6a 00                	push   $0x0
     817:	6a 00                	push   $0x0
     819:	ff 75 0c             	pushl  0xc(%ebp)
     81c:	ff 75 08             	pushl  0x8(%ebp)
     81f:	e8 29 fd ff ff       	call   54d <gettoken>
     824:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
     827:	83 ec 08             	sub    $0x8,%esp
     82a:	ff 75 0c             	pushl  0xc(%ebp)
     82d:	ff 75 08             	pushl  0x8(%ebp)
     830:	e8 6d ff ff ff       	call   7a2 <parseline>
     835:	83 c4 10             	add    $0x10,%esp
     838:	83 ec 08             	sub    $0x8,%esp
     83b:	50                   	push   %eax
     83c:	ff 75 f4             	pushl  -0xc(%ebp)
     83f:	e8 82 fc ff ff       	call   4c6 <listcmd>
     844:	83 c4 10             	add    $0x10,%esp
     847:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     84a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     84d:	c9                   	leave  
     84e:	c3                   	ret    

0000084f <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     84f:	55                   	push   %ebp
     850:	89 e5                	mov    %esp,%ebp
     852:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     855:	83 ec 08             	sub    $0x8,%esp
     858:	ff 75 0c             	pushl  0xc(%ebp)
     85b:	ff 75 08             	pushl  0x8(%ebp)
     85e:	e8 ec 01 00 00       	call   a4f <parseexec>
     863:	83 c4 10             	add    $0x10,%esp
     866:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|")){
     869:	83 ec 04             	sub    $0x4,%esp
     86c:	68 81 1b 00 00       	push   $0x1b81
     871:	ff 75 0c             	pushl  0xc(%ebp)
     874:	ff 75 08             	pushl  0x8(%ebp)
     877:	e8 22 fe ff ff       	call   69e <peek>
     87c:	83 c4 10             	add    $0x10,%esp
     87f:	85 c0                	test   %eax,%eax
     881:	74 35                	je     8b8 <parsepipe+0x69>
    gettoken(ps, es, 0, 0);
     883:	6a 00                	push   $0x0
     885:	6a 00                	push   $0x0
     887:	ff 75 0c             	pushl  0xc(%ebp)
     88a:	ff 75 08             	pushl  0x8(%ebp)
     88d:	e8 bb fc ff ff       	call   54d <gettoken>
     892:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     895:	83 ec 08             	sub    $0x8,%esp
     898:	ff 75 0c             	pushl  0xc(%ebp)
     89b:	ff 75 08             	pushl  0x8(%ebp)
     89e:	e8 ac ff ff ff       	call   84f <parsepipe>
     8a3:	83 c4 10             	add    $0x10,%esp
     8a6:	83 ec 08             	sub    $0x8,%esp
     8a9:	50                   	push   %eax
     8aa:	ff 75 f4             	pushl  -0xc(%ebp)
     8ad:	e8 cc fb ff ff       	call   47e <pipecmd>
     8b2:	83 c4 10             	add    $0x10,%esp
     8b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     8b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     8bb:	c9                   	leave  
     8bc:	c3                   	ret    

000008bd <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     8bd:	55                   	push   %ebp
     8be:	89 e5                	mov    %esp,%ebp
     8c0:	83 ec 18             	sub    $0x18,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     8c3:	e9 b6 00 00 00       	jmp    97e <parseredirs+0xc1>
    tok = gettoken(ps, es, 0, 0);
     8c8:	6a 00                	push   $0x0
     8ca:	6a 00                	push   $0x0
     8cc:	ff 75 10             	pushl  0x10(%ebp)
     8cf:	ff 75 0c             	pushl  0xc(%ebp)
     8d2:	e8 76 fc ff ff       	call   54d <gettoken>
     8d7:	83 c4 10             	add    $0x10,%esp
     8da:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
     8dd:	8d 45 ec             	lea    -0x14(%ebp),%eax
     8e0:	50                   	push   %eax
     8e1:	8d 45 f0             	lea    -0x10(%ebp),%eax
     8e4:	50                   	push   %eax
     8e5:	ff 75 10             	pushl  0x10(%ebp)
     8e8:	ff 75 0c             	pushl  0xc(%ebp)
     8eb:	e8 5d fc ff ff       	call   54d <gettoken>
     8f0:	83 c4 10             	add    $0x10,%esp
     8f3:	83 f8 61             	cmp    $0x61,%eax
     8f6:	74 10                	je     908 <parseredirs+0x4b>
      panic("missing file for redirection");
     8f8:	83 ec 0c             	sub    $0xc,%esp
     8fb:	68 83 1b 00 00       	push   $0x1b83
     900:	e8 97 fa ff ff       	call   39c <panic>
     905:	83 c4 10             	add    $0x10,%esp
    switch(tok){
     908:	8b 45 f4             	mov    -0xc(%ebp),%eax
     90b:	83 f8 3c             	cmp    $0x3c,%eax
     90e:	74 0c                	je     91c <parseredirs+0x5f>
     910:	83 f8 3e             	cmp    $0x3e,%eax
     913:	74 26                	je     93b <parseredirs+0x7e>
     915:	83 f8 2b             	cmp    $0x2b,%eax
     918:	74 43                	je     95d <parseredirs+0xa0>
     91a:	eb 62                	jmp    97e <parseredirs+0xc1>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     91c:	8b 55 ec             	mov    -0x14(%ebp),%edx
     91f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     922:	83 ec 0c             	sub    $0xc,%esp
     925:	6a 00                	push   $0x0
     927:	6a 00                	push   $0x0
     929:	52                   	push   %edx
     92a:	50                   	push   %eax
     92b:	ff 75 08             	pushl  0x8(%ebp)
     92e:	e8 e8 fa ff ff       	call   41b <redircmd>
     933:	83 c4 20             	add    $0x20,%esp
     936:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     939:	eb 43                	jmp    97e <parseredirs+0xc1>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     93b:	8b 55 ec             	mov    -0x14(%ebp),%edx
     93e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     941:	83 ec 0c             	sub    $0xc,%esp
     944:	6a 01                	push   $0x1
     946:	68 01 02 00 00       	push   $0x201
     94b:	52                   	push   %edx
     94c:	50                   	push   %eax
     94d:	ff 75 08             	pushl  0x8(%ebp)
     950:	e8 c6 fa ff ff       	call   41b <redircmd>
     955:	83 c4 20             	add    $0x20,%esp
     958:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     95b:	eb 21                	jmp    97e <parseredirs+0xc1>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     95d:	8b 55 ec             	mov    -0x14(%ebp),%edx
     960:	8b 45 f0             	mov    -0x10(%ebp),%eax
     963:	83 ec 0c             	sub    $0xc,%esp
     966:	6a 01                	push   $0x1
     968:	68 01 02 00 00       	push   $0x201
     96d:	52                   	push   %edx
     96e:	50                   	push   %eax
     96f:	ff 75 08             	pushl  0x8(%ebp)
     972:	e8 a4 fa ff ff       	call   41b <redircmd>
     977:	83 c4 20             	add    $0x20,%esp
     97a:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     97d:	90                   	nop
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     97e:	83 ec 04             	sub    $0x4,%esp
     981:	68 a0 1b 00 00       	push   $0x1ba0
     986:	ff 75 10             	pushl  0x10(%ebp)
     989:	ff 75 0c             	pushl  0xc(%ebp)
     98c:	e8 0d fd ff ff       	call   69e <peek>
     991:	83 c4 10             	add    $0x10,%esp
     994:	85 c0                	test   %eax,%eax
     996:	0f 85 2c ff ff ff    	jne    8c8 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
     99c:	8b 45 08             	mov    0x8(%ebp),%eax
}
     99f:	c9                   	leave  
     9a0:	c3                   	ret    

000009a1 <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     9a1:	55                   	push   %ebp
     9a2:	89 e5                	mov    %esp,%ebp
     9a4:	83 ec 18             	sub    $0x18,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     9a7:	83 ec 04             	sub    $0x4,%esp
     9aa:	68 a3 1b 00 00       	push   $0x1ba3
     9af:	ff 75 0c             	pushl  0xc(%ebp)
     9b2:	ff 75 08             	pushl  0x8(%ebp)
     9b5:	e8 e4 fc ff ff       	call   69e <peek>
     9ba:	83 c4 10             	add    $0x10,%esp
     9bd:	85 c0                	test   %eax,%eax
     9bf:	75 10                	jne    9d1 <parseblock+0x30>
    panic("parseblock");
     9c1:	83 ec 0c             	sub    $0xc,%esp
     9c4:	68 a5 1b 00 00       	push   $0x1ba5
     9c9:	e8 ce f9 ff ff       	call   39c <panic>
     9ce:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
     9d1:	6a 00                	push   $0x0
     9d3:	6a 00                	push   $0x0
     9d5:	ff 75 0c             	pushl  0xc(%ebp)
     9d8:	ff 75 08             	pushl  0x8(%ebp)
     9db:	e8 6d fb ff ff       	call   54d <gettoken>
     9e0:	83 c4 10             	add    $0x10,%esp
  cmd = parseline(ps, es);
     9e3:	83 ec 08             	sub    $0x8,%esp
     9e6:	ff 75 0c             	pushl  0xc(%ebp)
     9e9:	ff 75 08             	pushl  0x8(%ebp)
     9ec:	e8 b1 fd ff ff       	call   7a2 <parseline>
     9f1:	83 c4 10             	add    $0x10,%esp
     9f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
     9f7:	83 ec 04             	sub    $0x4,%esp
     9fa:	68 b0 1b 00 00       	push   $0x1bb0
     9ff:	ff 75 0c             	pushl  0xc(%ebp)
     a02:	ff 75 08             	pushl  0x8(%ebp)
     a05:	e8 94 fc ff ff       	call   69e <peek>
     a0a:	83 c4 10             	add    $0x10,%esp
     a0d:	85 c0                	test   %eax,%eax
     a0f:	75 10                	jne    a21 <parseblock+0x80>
    panic("syntax - missing )");
     a11:	83 ec 0c             	sub    $0xc,%esp
     a14:	68 b2 1b 00 00       	push   $0x1bb2
     a19:	e8 7e f9 ff ff       	call   39c <panic>
     a1e:	83 c4 10             	add    $0x10,%esp
  gettoken(ps, es, 0, 0);
     a21:	6a 00                	push   $0x0
     a23:	6a 00                	push   $0x0
     a25:	ff 75 0c             	pushl  0xc(%ebp)
     a28:	ff 75 08             	pushl  0x8(%ebp)
     a2b:	e8 1d fb ff ff       	call   54d <gettoken>
     a30:	83 c4 10             	add    $0x10,%esp
  cmd = parseredirs(cmd, ps, es);
     a33:	83 ec 04             	sub    $0x4,%esp
     a36:	ff 75 0c             	pushl  0xc(%ebp)
     a39:	ff 75 08             	pushl  0x8(%ebp)
     a3c:	ff 75 f4             	pushl  -0xc(%ebp)
     a3f:	e8 79 fe ff ff       	call   8bd <parseredirs>
     a44:	83 c4 10             	add    $0x10,%esp
     a47:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
     a4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     a4d:	c9                   	leave  
     a4e:	c3                   	ret    

00000a4f <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     a4f:	55                   	push   %ebp
     a50:	89 e5                	mov    %esp,%ebp
     a52:	83 ec 28             	sub    $0x28,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     a55:	83 ec 04             	sub    $0x4,%esp
     a58:	68 a3 1b 00 00       	push   $0x1ba3
     a5d:	ff 75 0c             	pushl  0xc(%ebp)
     a60:	ff 75 08             	pushl  0x8(%ebp)
     a63:	e8 36 fc ff ff       	call   69e <peek>
     a68:	83 c4 10             	add    $0x10,%esp
     a6b:	85 c0                	test   %eax,%eax
     a6d:	74 16                	je     a85 <parseexec+0x36>
    return parseblock(ps, es);
     a6f:	83 ec 08             	sub    $0x8,%esp
     a72:	ff 75 0c             	pushl  0xc(%ebp)
     a75:	ff 75 08             	pushl  0x8(%ebp)
     a78:	e8 24 ff ff ff       	call   9a1 <parseblock>
     a7d:	83 c4 10             	add    $0x10,%esp
     a80:	e9 fb 00 00 00       	jmp    b80 <parseexec+0x131>

  ret = execcmd();
     a85:	e8 5b f9 ff ff       	call   3e5 <execcmd>
     a8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
     a8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a90:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
     a93:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
     a9a:	83 ec 04             	sub    $0x4,%esp
     a9d:	ff 75 0c             	pushl  0xc(%ebp)
     aa0:	ff 75 08             	pushl  0x8(%ebp)
     aa3:	ff 75 f0             	pushl  -0x10(%ebp)
     aa6:	e8 12 fe ff ff       	call   8bd <parseredirs>
     aab:	83 c4 10             	add    $0x10,%esp
     aae:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
     ab1:	e9 87 00 00 00       	jmp    b3d <parseexec+0xee>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     ab6:	8d 45 e0             	lea    -0x20(%ebp),%eax
     ab9:	50                   	push   %eax
     aba:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     abd:	50                   	push   %eax
     abe:	ff 75 0c             	pushl  0xc(%ebp)
     ac1:	ff 75 08             	pushl  0x8(%ebp)
     ac4:	e8 84 fa ff ff       	call   54d <gettoken>
     ac9:	83 c4 10             	add    $0x10,%esp
     acc:	89 45 e8             	mov    %eax,-0x18(%ebp)
     acf:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     ad3:	0f 84 84 00 00 00    	je     b5d <parseexec+0x10e>
      break;
    if(tok != 'a')
     ad9:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
     add:	74 10                	je     aef <parseexec+0xa0>
      panic("syntax");
     adf:	83 ec 0c             	sub    $0xc,%esp
     ae2:	68 76 1b 00 00       	push   $0x1b76
     ae7:	e8 b0 f8 ff ff       	call   39c <panic>
     aec:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
     aef:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     af2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     af5:	8b 55 f4             	mov    -0xc(%ebp),%edx
     af8:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
     afc:	8b 55 e0             	mov    -0x20(%ebp),%edx
     aff:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b02:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     b05:	83 c1 08             	add    $0x8,%ecx
     b08:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
     b0c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= MAXARGS)
     b10:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
     b14:	7e 10                	jle    b26 <parseexec+0xd7>
      panic("too many args");
     b16:	83 ec 0c             	sub    $0xc,%esp
     b19:	68 c5 1b 00 00       	push   $0x1bc5
     b1e:	e8 79 f8 ff ff       	call   39c <panic>
     b23:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
     b26:	83 ec 04             	sub    $0x4,%esp
     b29:	ff 75 0c             	pushl  0xc(%ebp)
     b2c:	ff 75 08             	pushl  0x8(%ebp)
     b2f:	ff 75 f0             	pushl  -0x10(%ebp)
     b32:	e8 86 fd ff ff       	call   8bd <parseredirs>
     b37:	83 c4 10             	add    $0x10,%esp
     b3a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     b3d:	83 ec 04             	sub    $0x4,%esp
     b40:	68 d3 1b 00 00       	push   $0x1bd3
     b45:	ff 75 0c             	pushl  0xc(%ebp)
     b48:	ff 75 08             	pushl  0x8(%ebp)
     b4b:	e8 4e fb ff ff       	call   69e <peek>
     b50:	83 c4 10             	add    $0x10,%esp
     b53:	85 c0                	test   %eax,%eax
     b55:	0f 84 5b ff ff ff    	je     ab6 <parseexec+0x67>
     b5b:	eb 01                	jmp    b5e <parseexec+0x10f>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
     b5d:	90                   	nop
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     b5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b61:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b64:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
     b6b:	00 
  cmd->eargv[argc] = 0;
     b6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b6f:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b72:	83 c2 08             	add    $0x8,%edx
     b75:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
     b7c:	00 
  return ret;
     b7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     b80:	c9                   	leave  
     b81:	c3                   	ret    

00000b82 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     b82:	55                   	push   %ebp
     b83:	89 e5                	mov    %esp,%ebp
     b85:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     b88:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     b8c:	75 0a                	jne    b98 <nulterminate+0x16>
    return 0;
     b8e:	b8 00 00 00 00       	mov    $0x0,%eax
     b93:	e9 e4 00 00 00       	jmp    c7c <nulterminate+0xfa>
  
  switch(cmd->type){
     b98:	8b 45 08             	mov    0x8(%ebp),%eax
     b9b:	8b 00                	mov    (%eax),%eax
     b9d:	83 f8 05             	cmp    $0x5,%eax
     ba0:	0f 87 d3 00 00 00    	ja     c79 <nulterminate+0xf7>
     ba6:	8b 04 85 d8 1b 00 00 	mov    0x1bd8(,%eax,4),%eax
     bad:	ff e0                	jmp    *%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     baf:	8b 45 08             	mov    0x8(%ebp),%eax
     bb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
     bb5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     bbc:	eb 14                	jmp    bd2 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
     bbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bc1:	8b 55 f4             	mov    -0xc(%ebp),%edx
     bc4:	83 c2 08             	add    $0x8,%edx
     bc7:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
     bcb:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     bce:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     bd2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bd5:	8b 55 f4             	mov    -0xc(%ebp),%edx
     bd8:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
     bdc:	85 c0                	test   %eax,%eax
     bde:	75 de                	jne    bbe <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
     be0:	e9 94 00 00 00       	jmp    c79 <nulterminate+0xf7>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     be5:	8b 45 08             	mov    0x8(%ebp),%eax
     be8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
     beb:	8b 45 ec             	mov    -0x14(%ebp),%eax
     bee:	8b 40 04             	mov    0x4(%eax),%eax
     bf1:	83 ec 0c             	sub    $0xc,%esp
     bf4:	50                   	push   %eax
     bf5:	e8 88 ff ff ff       	call   b82 <nulterminate>
     bfa:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     bfd:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c00:	8b 40 0c             	mov    0xc(%eax),%eax
     c03:	c6 00 00             	movb   $0x0,(%eax)
    break;
     c06:	eb 71                	jmp    c79 <nulterminate+0xf7>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     c08:	8b 45 08             	mov    0x8(%ebp),%eax
     c0b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
     c0e:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c11:	8b 40 04             	mov    0x4(%eax),%eax
     c14:	83 ec 0c             	sub    $0xc,%esp
     c17:	50                   	push   %eax
     c18:	e8 65 ff ff ff       	call   b82 <nulterminate>
     c1d:	83 c4 10             	add    $0x10,%esp
    nulterminate(pcmd->right);
     c20:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c23:	8b 40 08             	mov    0x8(%eax),%eax
     c26:	83 ec 0c             	sub    $0xc,%esp
     c29:	50                   	push   %eax
     c2a:	e8 53 ff ff ff       	call   b82 <nulterminate>
     c2f:	83 c4 10             	add    $0x10,%esp
    break;
     c32:	eb 45                	jmp    c79 <nulterminate+0xf7>
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
     c34:	8b 45 08             	mov    0x8(%ebp),%eax
     c37:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
     c3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c3d:	8b 40 04             	mov    0x4(%eax),%eax
     c40:	83 ec 0c             	sub    $0xc,%esp
     c43:	50                   	push   %eax
     c44:	e8 39 ff ff ff       	call   b82 <nulterminate>
     c49:	83 c4 10             	add    $0x10,%esp
    nulterminate(lcmd->right);
     c4c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c4f:	8b 40 08             	mov    0x8(%eax),%eax
     c52:	83 ec 0c             	sub    $0xc,%esp
     c55:	50                   	push   %eax
     c56:	e8 27 ff ff ff       	call   b82 <nulterminate>
     c5b:	83 c4 10             	add    $0x10,%esp
    break;
     c5e:	eb 19                	jmp    c79 <nulterminate+0xf7>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     c60:	8b 45 08             	mov    0x8(%ebp),%eax
     c63:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
     c66:	8b 45 e0             	mov    -0x20(%ebp),%eax
     c69:	8b 40 04             	mov    0x4(%eax),%eax
     c6c:	83 ec 0c             	sub    $0xc,%esp
     c6f:	50                   	push   %eax
     c70:	e8 0d ff ff ff       	call   b82 <nulterminate>
     c75:	83 c4 10             	add    $0x10,%esp
    break;
     c78:	90                   	nop
  }
  return cmd;
     c79:	8b 45 08             	mov    0x8(%ebp),%eax
}
     c7c:	c9                   	leave  
     c7d:	c3                   	ret    

00000c7e <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     c7e:	55                   	push   %ebp
     c7f:	89 e5                	mov    %esp,%ebp
     c81:	57                   	push   %edi
     c82:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     c83:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c86:	8b 55 10             	mov    0x10(%ebp),%edx
     c89:	8b 45 0c             	mov    0xc(%ebp),%eax
     c8c:	89 cb                	mov    %ecx,%ebx
     c8e:	89 df                	mov    %ebx,%edi
     c90:	89 d1                	mov    %edx,%ecx
     c92:	fc                   	cld    
     c93:	f3 aa                	rep stos %al,%es:(%edi)
     c95:	89 ca                	mov    %ecx,%edx
     c97:	89 fb                	mov    %edi,%ebx
     c99:	89 5d 08             	mov    %ebx,0x8(%ebp)
     c9c:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     c9f:	90                   	nop
     ca0:	5b                   	pop    %ebx
     ca1:	5f                   	pop    %edi
     ca2:	5d                   	pop    %ebp
     ca3:	c3                   	ret    

00000ca4 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     ca4:	55                   	push   %ebp
     ca5:	89 e5                	mov    %esp,%ebp
     ca7:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     caa:	8b 45 08             	mov    0x8(%ebp),%eax
     cad:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     cb0:	90                   	nop
     cb1:	8b 45 08             	mov    0x8(%ebp),%eax
     cb4:	8d 50 01             	lea    0x1(%eax),%edx
     cb7:	89 55 08             	mov    %edx,0x8(%ebp)
     cba:	8b 55 0c             	mov    0xc(%ebp),%edx
     cbd:	8d 4a 01             	lea    0x1(%edx),%ecx
     cc0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     cc3:	0f b6 12             	movzbl (%edx),%edx
     cc6:	88 10                	mov    %dl,(%eax)
     cc8:	0f b6 00             	movzbl (%eax),%eax
     ccb:	84 c0                	test   %al,%al
     ccd:	75 e2                	jne    cb1 <strcpy+0xd>
    ;
  return os;
     ccf:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     cd2:	c9                   	leave  
     cd3:	c3                   	ret    

00000cd4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     cd4:	55                   	push   %ebp
     cd5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     cd7:	eb 08                	jmp    ce1 <strcmp+0xd>
    p++, q++;
     cd9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     cdd:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     ce1:	8b 45 08             	mov    0x8(%ebp),%eax
     ce4:	0f b6 00             	movzbl (%eax),%eax
     ce7:	84 c0                	test   %al,%al
     ce9:	74 10                	je     cfb <strcmp+0x27>
     ceb:	8b 45 08             	mov    0x8(%ebp),%eax
     cee:	0f b6 10             	movzbl (%eax),%edx
     cf1:	8b 45 0c             	mov    0xc(%ebp),%eax
     cf4:	0f b6 00             	movzbl (%eax),%eax
     cf7:	38 c2                	cmp    %al,%dl
     cf9:	74 de                	je     cd9 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     cfb:	8b 45 08             	mov    0x8(%ebp),%eax
     cfe:	0f b6 00             	movzbl (%eax),%eax
     d01:	0f b6 d0             	movzbl %al,%edx
     d04:	8b 45 0c             	mov    0xc(%ebp),%eax
     d07:	0f b6 00             	movzbl (%eax),%eax
     d0a:	0f b6 c0             	movzbl %al,%eax
     d0d:	29 c2                	sub    %eax,%edx
     d0f:	89 d0                	mov    %edx,%eax
}
     d11:	5d                   	pop    %ebp
     d12:	c3                   	ret    

00000d13 <strlen>:

uint
strlen(char *s)
{
     d13:	55                   	push   %ebp
     d14:	89 e5                	mov    %esp,%ebp
     d16:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     d19:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     d20:	eb 04                	jmp    d26 <strlen+0x13>
     d22:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     d26:	8b 55 fc             	mov    -0x4(%ebp),%edx
     d29:	8b 45 08             	mov    0x8(%ebp),%eax
     d2c:	01 d0                	add    %edx,%eax
     d2e:	0f b6 00             	movzbl (%eax),%eax
     d31:	84 c0                	test   %al,%al
     d33:	75 ed                	jne    d22 <strlen+0xf>
    ;
  return n;
     d35:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     d38:	c9                   	leave  
     d39:	c3                   	ret    

00000d3a <memset>:

void*
memset(void *dst, int c, uint n)
{
     d3a:	55                   	push   %ebp
     d3b:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
     d3d:	8b 45 10             	mov    0x10(%ebp),%eax
     d40:	50                   	push   %eax
     d41:	ff 75 0c             	pushl  0xc(%ebp)
     d44:	ff 75 08             	pushl  0x8(%ebp)
     d47:	e8 32 ff ff ff       	call   c7e <stosb>
     d4c:	83 c4 0c             	add    $0xc,%esp
  return dst;
     d4f:	8b 45 08             	mov    0x8(%ebp),%eax
}
     d52:	c9                   	leave  
     d53:	c3                   	ret    

00000d54 <strchr>:

char*
strchr(const char *s, char c)
{
     d54:	55                   	push   %ebp
     d55:	89 e5                	mov    %esp,%ebp
     d57:	83 ec 04             	sub    $0x4,%esp
     d5a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d5d:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     d60:	eb 14                	jmp    d76 <strchr+0x22>
    if(*s == c)
     d62:	8b 45 08             	mov    0x8(%ebp),%eax
     d65:	0f b6 00             	movzbl (%eax),%eax
     d68:	3a 45 fc             	cmp    -0x4(%ebp),%al
     d6b:	75 05                	jne    d72 <strchr+0x1e>
      return (char*)s;
     d6d:	8b 45 08             	mov    0x8(%ebp),%eax
     d70:	eb 13                	jmp    d85 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     d72:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     d76:	8b 45 08             	mov    0x8(%ebp),%eax
     d79:	0f b6 00             	movzbl (%eax),%eax
     d7c:	84 c0                	test   %al,%al
     d7e:	75 e2                	jne    d62 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     d80:	b8 00 00 00 00       	mov    $0x0,%eax
}
     d85:	c9                   	leave  
     d86:	c3                   	ret    

00000d87 <gets>:

char*
gets(char *buf, int max)
{
     d87:	55                   	push   %ebp
     d88:	89 e5                	mov    %esp,%ebp
     d8a:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     d8d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     d94:	eb 42                	jmp    dd8 <gets+0x51>
    cc = read(0, &c, 1);
     d96:	83 ec 04             	sub    $0x4,%esp
     d99:	6a 01                	push   $0x1
     d9b:	8d 45 ef             	lea    -0x11(%ebp),%eax
     d9e:	50                   	push   %eax
     d9f:	6a 00                	push   $0x0
     da1:	e8 47 01 00 00       	call   eed <read>
     da6:	83 c4 10             	add    $0x10,%esp
     da9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     dac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     db0:	7e 33                	jle    de5 <gets+0x5e>
      break;
    buf[i++] = c;
     db2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     db5:	8d 50 01             	lea    0x1(%eax),%edx
     db8:	89 55 f4             	mov    %edx,-0xc(%ebp)
     dbb:	89 c2                	mov    %eax,%edx
     dbd:	8b 45 08             	mov    0x8(%ebp),%eax
     dc0:	01 c2                	add    %eax,%edx
     dc2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     dc6:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     dc8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     dcc:	3c 0a                	cmp    $0xa,%al
     dce:	74 16                	je     de6 <gets+0x5f>
     dd0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     dd4:	3c 0d                	cmp    $0xd,%al
     dd6:	74 0e                	je     de6 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     dd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ddb:	83 c0 01             	add    $0x1,%eax
     dde:	3b 45 0c             	cmp    0xc(%ebp),%eax
     de1:	7c b3                	jl     d96 <gets+0xf>
     de3:	eb 01                	jmp    de6 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     de5:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     de6:	8b 55 f4             	mov    -0xc(%ebp),%edx
     de9:	8b 45 08             	mov    0x8(%ebp),%eax
     dec:	01 d0                	add    %edx,%eax
     dee:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     df1:	8b 45 08             	mov    0x8(%ebp),%eax
}
     df4:	c9                   	leave  
     df5:	c3                   	ret    

00000df6 <stat>:

int
stat(char *n, struct stat *st)
{
     df6:	55                   	push   %ebp
     df7:	89 e5                	mov    %esp,%ebp
     df9:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     dfc:	83 ec 08             	sub    $0x8,%esp
     dff:	6a 00                	push   $0x0
     e01:	ff 75 08             	pushl  0x8(%ebp)
     e04:	e8 0c 01 00 00       	call   f15 <open>
     e09:	83 c4 10             	add    $0x10,%esp
     e0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     e0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e13:	79 07                	jns    e1c <stat+0x26>
    return -1;
     e15:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     e1a:	eb 25                	jmp    e41 <stat+0x4b>
  r = fstat(fd, st);
     e1c:	83 ec 08             	sub    $0x8,%esp
     e1f:	ff 75 0c             	pushl  0xc(%ebp)
     e22:	ff 75 f4             	pushl  -0xc(%ebp)
     e25:	e8 03 01 00 00       	call   f2d <fstat>
     e2a:	83 c4 10             	add    $0x10,%esp
     e2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     e30:	83 ec 0c             	sub    $0xc,%esp
     e33:	ff 75 f4             	pushl  -0xc(%ebp)
     e36:	e8 c2 00 00 00       	call   efd <close>
     e3b:	83 c4 10             	add    $0x10,%esp
  return r;
     e3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     e41:	c9                   	leave  
     e42:	c3                   	ret    

00000e43 <atoi>:

int
atoi(const char *s)
{
     e43:	55                   	push   %ebp
     e44:	89 e5                	mov    %esp,%ebp
     e46:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     e49:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     e50:	eb 25                	jmp    e77 <atoi+0x34>
    n = n*10 + *s++ - '0';
     e52:	8b 55 fc             	mov    -0x4(%ebp),%edx
     e55:	89 d0                	mov    %edx,%eax
     e57:	c1 e0 02             	shl    $0x2,%eax
     e5a:	01 d0                	add    %edx,%eax
     e5c:	01 c0                	add    %eax,%eax
     e5e:	89 c1                	mov    %eax,%ecx
     e60:	8b 45 08             	mov    0x8(%ebp),%eax
     e63:	8d 50 01             	lea    0x1(%eax),%edx
     e66:	89 55 08             	mov    %edx,0x8(%ebp)
     e69:	0f b6 00             	movzbl (%eax),%eax
     e6c:	0f be c0             	movsbl %al,%eax
     e6f:	01 c8                	add    %ecx,%eax
     e71:	83 e8 30             	sub    $0x30,%eax
     e74:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     e77:	8b 45 08             	mov    0x8(%ebp),%eax
     e7a:	0f b6 00             	movzbl (%eax),%eax
     e7d:	3c 2f                	cmp    $0x2f,%al
     e7f:	7e 0a                	jle    e8b <atoi+0x48>
     e81:	8b 45 08             	mov    0x8(%ebp),%eax
     e84:	0f b6 00             	movzbl (%eax),%eax
     e87:	3c 39                	cmp    $0x39,%al
     e89:	7e c7                	jle    e52 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     e8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     e8e:	c9                   	leave  
     e8f:	c3                   	ret    

00000e90 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     e90:	55                   	push   %ebp
     e91:	89 e5                	mov    %esp,%ebp
     e93:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     e96:	8b 45 08             	mov    0x8(%ebp),%eax
     e99:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     e9c:	8b 45 0c             	mov    0xc(%ebp),%eax
     e9f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     ea2:	eb 17                	jmp    ebb <memmove+0x2b>
    *dst++ = *src++;
     ea4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ea7:	8d 50 01             	lea    0x1(%eax),%edx
     eaa:	89 55 fc             	mov    %edx,-0x4(%ebp)
     ead:	8b 55 f8             	mov    -0x8(%ebp),%edx
     eb0:	8d 4a 01             	lea    0x1(%edx),%ecx
     eb3:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     eb6:	0f b6 12             	movzbl (%edx),%edx
     eb9:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     ebb:	8b 45 10             	mov    0x10(%ebp),%eax
     ebe:	8d 50 ff             	lea    -0x1(%eax),%edx
     ec1:	89 55 10             	mov    %edx,0x10(%ebp)
     ec4:	85 c0                	test   %eax,%eax
     ec6:	7f dc                	jg     ea4 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     ec8:	8b 45 08             	mov    0x8(%ebp),%eax
}
     ecb:	c9                   	leave  
     ecc:	c3                   	ret    

00000ecd <fork>:
  name :  movl $str_ ## name, %eax; \
    int $T_CS550HTSYSCALL; \
   ret


SYSCALL(fork)
     ecd:	b8 01 00 00 00       	mov    $0x1,%eax
     ed2:	cd 40                	int    $0x40
     ed4:	c3                   	ret    

00000ed5 <exit>:
SYSCALL(exit)
     ed5:	b8 02 00 00 00       	mov    $0x2,%eax
     eda:	cd 40                	int    $0x40
     edc:	c3                   	ret    

00000edd <wait>:
SYSCALL(wait)
     edd:	b8 03 00 00 00       	mov    $0x3,%eax
     ee2:	cd 40                	int    $0x40
     ee4:	c3                   	ret    

00000ee5 <pipe>:
SYSCALL(pipe)
     ee5:	b8 04 00 00 00       	mov    $0x4,%eax
     eea:	cd 40                	int    $0x40
     eec:	c3                   	ret    

00000eed <read>:
SYSCALL(read)
     eed:	b8 05 00 00 00       	mov    $0x5,%eax
     ef2:	cd 40                	int    $0x40
     ef4:	c3                   	ret    

00000ef5 <write>:
SYSCALL(write)
     ef5:	b8 10 00 00 00       	mov    $0x10,%eax
     efa:	cd 40                	int    $0x40
     efc:	c3                   	ret    

00000efd <close>:
SYSCALL(close)
     efd:	b8 15 00 00 00       	mov    $0x15,%eax
     f02:	cd 40                	int    $0x40
     f04:	c3                   	ret    

00000f05 <kill>:
SYSCALL(kill)
     f05:	b8 06 00 00 00       	mov    $0x6,%eax
     f0a:	cd 40                	int    $0x40
     f0c:	c3                   	ret    

00000f0d <exec>:
SYSCALL(exec)
     f0d:	b8 07 00 00 00       	mov    $0x7,%eax
     f12:	cd 40                	int    $0x40
     f14:	c3                   	ret    

00000f15 <open>:
SYSCALL(open)
     f15:	b8 0f 00 00 00       	mov    $0xf,%eax
     f1a:	cd 40                	int    $0x40
     f1c:	c3                   	ret    

00000f1d <mknod>:
SYSCALL(mknod)
     f1d:	b8 11 00 00 00       	mov    $0x11,%eax
     f22:	cd 40                	int    $0x40
     f24:	c3                   	ret    

00000f25 <unlink>:
SYSCALL(unlink)
     f25:	b8 12 00 00 00       	mov    $0x12,%eax
     f2a:	cd 40                	int    $0x40
     f2c:	c3                   	ret    

00000f2d <fstat>:
SYSCALL(fstat)
     f2d:	b8 08 00 00 00       	mov    $0x8,%eax
     f32:	cd 40                	int    $0x40
     f34:	c3                   	ret    

00000f35 <link>:
SYSCALL(link)
     f35:	b8 13 00 00 00       	mov    $0x13,%eax
     f3a:	cd 40                	int    $0x40
     f3c:	c3                   	ret    

00000f3d <mkdir>:
SYSCALL(mkdir)
     f3d:	b8 14 00 00 00       	mov    $0x14,%eax
     f42:	cd 40                	int    $0x40
     f44:	c3                   	ret    

00000f45 <chdir>:
SYSCALL(chdir)
     f45:	b8 09 00 00 00       	mov    $0x9,%eax
     f4a:	cd 40                	int    $0x40
     f4c:	c3                   	ret    

00000f4d <dup>:
SYSCALL(dup)
     f4d:	b8 0a 00 00 00       	mov    $0xa,%eax
     f52:	cd 40                	int    $0x40
     f54:	c3                   	ret    

00000f55 <getpid>:
SYSCALL(getpid)
     f55:	b8 0b 00 00 00       	mov    $0xb,%eax
     f5a:	cd 40                	int    $0x40
     f5c:	c3                   	ret    

00000f5d <sbrk>:
SYSCALL(sbrk)
     f5d:	b8 0c 00 00 00       	mov    $0xc,%eax
     f62:	cd 40                	int    $0x40
     f64:	c3                   	ret    

00000f65 <sleep>:
SYSCALL(sleep)
     f65:	b8 0d 00 00 00       	mov    $0xd,%eax
     f6a:	cd 40                	int    $0x40
     f6c:	c3                   	ret    

00000f6d <uptime>:
SYSCALL(uptime)
     f6d:	b8 0e 00 00 00       	mov    $0xe,%eax
     f72:	cd 40                	int    $0x40
     f74:	c3                   	ret    

00000f75 <date>:

// Assignment starts here

SYSCALL(date)
     f75:	b8 16 00 00 00       	mov    $0x16,%eax
     f7a:	cd 40                	int    $0x40
     f7c:	c3                   	ret    

00000f7d <str_ls_call1>:
     f7d:	6c                   	insb   (%dx),%es:(%edi)
     f7e:	73 5f                	jae    fdf <ls_call6+0x4>
     f80:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     f83:	6c                   	insb   (%dx),%es:(%edi)
     f84:	31 00                	xor    %eax,(%eax)

00000f86 <ls_call1>:

// ls call

CS550LSSYSCALL(ls_call1)
     f86:	b8 7d 0f 00 00       	mov    $0xf7d,%eax
     f8b:	cd 41                	int    $0x41
     f8d:	c3                   	ret    

00000f8e <str_ls_call2>:
     f8e:	6c                   	insb   (%dx),%es:(%edi)
     f8f:	73 5f                	jae    ff0 <ls_call7+0x4>
     f91:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     f94:	6c                   	insb   (%dx),%es:(%edi)
     f95:	32 00                	xor    (%eax),%al

00000f97 <ls_call2>:
CS550LSSYSCALL(ls_call2)
     f97:	b8 8e 0f 00 00       	mov    $0xf8e,%eax
     f9c:	cd 41                	int    $0x41
     f9e:	c3                   	ret    

00000f9f <str_ls_call3>:
     f9f:	6c                   	insb   (%dx),%es:(%edi)
     fa0:	73 5f                	jae    1001 <ls_call8+0x4>
     fa2:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     fa5:	6c                   	insb   (%dx),%es:(%edi)
     fa6:	33 00                	xor    (%eax),%eax

00000fa8 <ls_call3>:
CS550LSSYSCALL(ls_call3)
     fa8:	b8 9f 0f 00 00       	mov    $0xf9f,%eax
     fad:	cd 41                	int    $0x41
     faf:	c3                   	ret    

00000fb0 <str_ls_call4>:
     fb0:	6c                   	insb   (%dx),%es:(%edi)
     fb1:	73 5f                	jae    1012 <ls_call9+0x4>
     fb3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     fb6:	6c                   	insb   (%dx),%es:(%edi)
     fb7:	34 00                	xor    $0x0,%al

00000fb9 <ls_call4>:
CS550LSSYSCALL(ls_call4)
     fb9:	b8 b0 0f 00 00       	mov    $0xfb0,%eax
     fbe:	cd 41                	int    $0x41
     fc0:	c3                   	ret    

00000fc1 <str_ls_call5>:
     fc1:	6c                   	insb   (%dx),%es:(%edi)
     fc2:	73 5f                	jae    1023 <ls_call10+0x3>
     fc4:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     fc7:	6c                   	insb   (%dx),%es:(%edi)
     fc8:	35                   	.byte 0x35
	...

00000fca <ls_call5>:
CS550LSSYSCALL(ls_call5)
     fca:	b8 c1 0f 00 00       	mov    $0xfc1,%eax
     fcf:	cd 41                	int    $0x41
     fd1:	c3                   	ret    

00000fd2 <str_ls_call6>:
     fd2:	6c                   	insb   (%dx),%es:(%edi)
     fd3:	73 5f                	jae    1034 <ls_call11+0x2>
     fd5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     fd8:	6c                   	insb   (%dx),%es:(%edi)
     fd9:	36                   	ss
	...

00000fdb <ls_call6>:
CS550LSSYSCALL(ls_call6)
     fdb:	b8 d2 0f 00 00       	mov    $0xfd2,%eax
     fe0:	cd 41                	int    $0x41
     fe2:	c3                   	ret    

00000fe3 <str_ls_call7>:
     fe3:	6c                   	insb   (%dx),%es:(%edi)
     fe4:	73 5f                	jae    1045 <ls_call12+0x1>
     fe6:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     fe9:	6c                   	insb   (%dx),%es:(%edi)
     fea:	37                   	aaa    
	...

00000fec <ls_call7>:
CS550LSSYSCALL(ls_call7)
     fec:	b8 e3 0f 00 00       	mov    $0xfe3,%eax
     ff1:	cd 41                	int    $0x41
     ff3:	c3                   	ret    

00000ff4 <str_ls_call8>:
     ff4:	6c                   	insb   (%dx),%es:(%edi)
     ff5:	73 5f                	jae    1056 <ls_call13>
     ff7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
     ffa:	6c                   	insb   (%dx),%es:(%edi)
     ffb:	38 00                	cmp    %al,(%eax)

00000ffd <ls_call8>:
CS550LSSYSCALL(ls_call8)
     ffd:	b8 f4 0f 00 00       	mov    $0xff4,%eax
    1002:	cd 41                	int    $0x41
    1004:	c3                   	ret    

00001005 <str_ls_call9>:
    1005:	6c                   	insb   (%dx),%es:(%edi)
    1006:	73 5f                	jae    1067 <str_ls_call14+0x9>
    1008:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    100b:	6c                   	insb   (%dx),%es:(%edi)
    100c:	39 00                	cmp    %eax,(%eax)

0000100e <ls_call9>:
CS550LSSYSCALL(ls_call9)
    100e:	b8 05 10 00 00       	mov    $0x1005,%eax
    1013:	cd 41                	int    $0x41
    1015:	c3                   	ret    

00001016 <str_ls_call10>:
    1016:	6c                   	insb   (%dx),%es:(%edi)
    1017:	73 5f                	jae    1078 <str_ls_call15+0x8>
    1019:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    101c:	6c                   	insb   (%dx),%es:(%edi)
    101d:	31 30                	xor    %esi,(%eax)
	...

00001020 <ls_call10>:
CS550LSSYSCALL(ls_call10)
    1020:	b8 16 10 00 00       	mov    $0x1016,%eax
    1025:	cd 41                	int    $0x41
    1027:	c3                   	ret    

00001028 <str_ls_call11>:
    1028:	6c                   	insb   (%dx),%es:(%edi)
    1029:	73 5f                	jae    108a <str_ls_call16+0x8>
    102b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    102e:	6c                   	insb   (%dx),%es:(%edi)
    102f:	31 31                	xor    %esi,(%ecx)
	...

00001032 <ls_call11>:
CS550LSSYSCALL(ls_call11)
    1032:	b8 28 10 00 00       	mov    $0x1028,%eax
    1037:	cd 41                	int    $0x41
    1039:	c3                   	ret    

0000103a <str_ls_call12>:
    103a:	6c                   	insb   (%dx),%es:(%edi)
    103b:	73 5f                	jae    109c <str_ls_call17+0x8>
    103d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1040:	6c                   	insb   (%dx),%es:(%edi)
    1041:	31 32                	xor    %esi,(%edx)
	...

00001044 <ls_call12>:
CS550LSSYSCALL(ls_call12)
    1044:	b8 3a 10 00 00       	mov    $0x103a,%eax
    1049:	cd 41                	int    $0x41
    104b:	c3                   	ret    

0000104c <str_ls_call13>:
    104c:	6c                   	insb   (%dx),%es:(%edi)
    104d:	73 5f                	jae    10ae <str_ls_call18+0x8>
    104f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1052:	6c                   	insb   (%dx),%es:(%edi)
    1053:	31 33                	xor    %esi,(%ebx)
	...

00001056 <ls_call13>:
CS550LSSYSCALL(ls_call13)
    1056:	b8 4c 10 00 00       	mov    $0x104c,%eax
    105b:	cd 41                	int    $0x41
    105d:	c3                   	ret    

0000105e <str_ls_call14>:
    105e:	6c                   	insb   (%dx),%es:(%edi)
    105f:	73 5f                	jae    10c0 <str_ls_call19+0x8>
    1061:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1064:	6c                   	insb   (%dx),%es:(%edi)
    1065:	31 34 00             	xor    %esi,(%eax,%eax,1)

00001068 <ls_call14>:
CS550LSSYSCALL(ls_call14)
    1068:	b8 5e 10 00 00       	mov    $0x105e,%eax
    106d:	cd 41                	int    $0x41
    106f:	c3                   	ret    

00001070 <str_ls_call15>:
    1070:	6c                   	insb   (%dx),%es:(%edi)
    1071:	73 5f                	jae    10d2 <str_ls_call20+0x8>
    1073:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1076:	6c                   	insb   (%dx),%es:(%edi)
    1077:	31                   	.byte 0x31
    1078:	35                   	.byte 0x35
	...

0000107a <ls_call15>:
CS550LSSYSCALL(ls_call15)
    107a:	b8 70 10 00 00       	mov    $0x1070,%eax
    107f:	cd 41                	int    $0x41
    1081:	c3                   	ret    

00001082 <str_ls_call16>:
    1082:	6c                   	insb   (%dx),%es:(%edi)
    1083:	73 5f                	jae    10e4 <str_ls_call21+0x8>
    1085:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1088:	6c                   	insb   (%dx),%es:(%edi)
    1089:	31 36                	xor    %esi,(%esi)
	...

0000108c <ls_call16>:
CS550LSSYSCALL(ls_call16)
    108c:	b8 82 10 00 00       	mov    $0x1082,%eax
    1091:	cd 41                	int    $0x41
    1093:	c3                   	ret    

00001094 <str_ls_call17>:
    1094:	6c                   	insb   (%dx),%es:(%edi)
    1095:	73 5f                	jae    10f6 <str_ls_call22+0x8>
    1097:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    109a:	6c                   	insb   (%dx),%es:(%edi)
    109b:	31 37                	xor    %esi,(%edi)
	...

0000109e <ls_call17>:
CS550LSSYSCALL(ls_call17)
    109e:	b8 94 10 00 00       	mov    $0x1094,%eax
    10a3:	cd 41                	int    $0x41
    10a5:	c3                   	ret    

000010a6 <str_ls_call18>:
    10a6:	6c                   	insb   (%dx),%es:(%edi)
    10a7:	73 5f                	jae    1108 <str_ls_call23+0x8>
    10a9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    10ac:	6c                   	insb   (%dx),%es:(%edi)
    10ad:	31 38                	xor    %edi,(%eax)
	...

000010b0 <ls_call18>:
CS550LSSYSCALL(ls_call18)
    10b0:	b8 a6 10 00 00       	mov    $0x10a6,%eax
    10b5:	cd 41                	int    $0x41
    10b7:	c3                   	ret    

000010b8 <str_ls_call19>:
    10b8:	6c                   	insb   (%dx),%es:(%edi)
    10b9:	73 5f                	jae    111a <str_ls_call24+0x8>
    10bb:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    10be:	6c                   	insb   (%dx),%es:(%edi)
    10bf:	31 39                	xor    %edi,(%ecx)
	...

000010c2 <ls_call19>:
CS550LSSYSCALL(ls_call19)
    10c2:	b8 b8 10 00 00       	mov    $0x10b8,%eax
    10c7:	cd 41                	int    $0x41
    10c9:	c3                   	ret    

000010ca <str_ls_call20>:
    10ca:	6c                   	insb   (%dx),%es:(%edi)
    10cb:	73 5f                	jae    112c <str_ls_call25+0x8>
    10cd:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    10d0:	6c                   	insb   (%dx),%es:(%edi)
    10d1:	32 30                	xor    (%eax),%dh
	...

000010d4 <ls_call20>:
CS550LSSYSCALL(ls_call20)
    10d4:	b8 ca 10 00 00       	mov    $0x10ca,%eax
    10d9:	cd 41                	int    $0x41
    10db:	c3                   	ret    

000010dc <str_ls_call21>:
    10dc:	6c                   	insb   (%dx),%es:(%edi)
    10dd:	73 5f                	jae    113e <str_ls_call26+0x8>
    10df:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    10e2:	6c                   	insb   (%dx),%es:(%edi)
    10e3:	32 31                	xor    (%ecx),%dh
	...

000010e6 <ls_call21>:
CS550LSSYSCALL(ls_call21)
    10e6:	b8 dc 10 00 00       	mov    $0x10dc,%eax
    10eb:	cd 41                	int    $0x41
    10ed:	c3                   	ret    

000010ee <str_ls_call22>:
    10ee:	6c                   	insb   (%dx),%es:(%edi)
    10ef:	73 5f                	jae    1150 <str_ls_call27+0x8>
    10f1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    10f4:	6c                   	insb   (%dx),%es:(%edi)
    10f5:	32 32                	xor    (%edx),%dh
	...

000010f8 <ls_call22>:
CS550LSSYSCALL(ls_call22)
    10f8:	b8 ee 10 00 00       	mov    $0x10ee,%eax
    10fd:	cd 41                	int    $0x41
    10ff:	c3                   	ret    

00001100 <str_ls_call23>:
    1100:	6c                   	insb   (%dx),%es:(%edi)
    1101:	73 5f                	jae    1162 <str_ls_call28+0x8>
    1103:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1106:	6c                   	insb   (%dx),%es:(%edi)
    1107:	32 33                	xor    (%ebx),%dh
	...

0000110a <ls_call23>:
CS550LSSYSCALL(ls_call23)
    110a:	b8 00 11 00 00       	mov    $0x1100,%eax
    110f:	cd 41                	int    $0x41
    1111:	c3                   	ret    

00001112 <str_ls_call24>:
    1112:	6c                   	insb   (%dx),%es:(%edi)
    1113:	73 5f                	jae    1174 <str_ls_call29+0x8>
    1115:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1118:	6c                   	insb   (%dx),%es:(%edi)
    1119:	32 34 00             	xor    (%eax,%eax,1),%dh

0000111c <ls_call24>:
CS550LSSYSCALL(ls_call24)
    111c:	b8 12 11 00 00       	mov    $0x1112,%eax
    1121:	cd 41                	int    $0x41
    1123:	c3                   	ret    

00001124 <str_ls_call25>:
    1124:	6c                   	insb   (%dx),%es:(%edi)
    1125:	73 5f                	jae    1186 <str_ls_call30+0x8>
    1127:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    112a:	6c                   	insb   (%dx),%es:(%edi)
    112b:	32                   	.byte 0x32
    112c:	35                   	.byte 0x35
	...

0000112e <ls_call25>:
CS550LSSYSCALL(ls_call25)
    112e:	b8 24 11 00 00       	mov    $0x1124,%eax
    1133:	cd 41                	int    $0x41
    1135:	c3                   	ret    

00001136 <str_ls_call26>:
    1136:	6c                   	insb   (%dx),%es:(%edi)
    1137:	73 5f                	jae    1198 <str_ls_call31+0x8>
    1139:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    113c:	6c                   	insb   (%dx),%es:(%edi)
    113d:	32 36                	xor    (%esi),%dh
	...

00001140 <ls_call26>:
CS550LSSYSCALL(ls_call26)
    1140:	b8 36 11 00 00       	mov    $0x1136,%eax
    1145:	cd 41                	int    $0x41
    1147:	c3                   	ret    

00001148 <str_ls_call27>:
    1148:	6c                   	insb   (%dx),%es:(%edi)
    1149:	73 5f                	jae    11aa <str_ls_call32+0x8>
    114b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    114e:	6c                   	insb   (%dx),%es:(%edi)
    114f:	32 37                	xor    (%edi),%dh
	...

00001152 <ls_call27>:
CS550LSSYSCALL(ls_call27)
    1152:	b8 48 11 00 00       	mov    $0x1148,%eax
    1157:	cd 41                	int    $0x41
    1159:	c3                   	ret    

0000115a <str_ls_call28>:
    115a:	6c                   	insb   (%dx),%es:(%edi)
    115b:	73 5f                	jae    11bc <str_ls_call33+0x8>
    115d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1160:	6c                   	insb   (%dx),%es:(%edi)
    1161:	32 38                	xor    (%eax),%bh
	...

00001164 <ls_call28>:
CS550LSSYSCALL(ls_call28)
    1164:	b8 5a 11 00 00       	mov    $0x115a,%eax
    1169:	cd 41                	int    $0x41
    116b:	c3                   	ret    

0000116c <str_ls_call29>:
    116c:	6c                   	insb   (%dx),%es:(%edi)
    116d:	73 5f                	jae    11ce <str_ls_call34+0x8>
    116f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1172:	6c                   	insb   (%dx),%es:(%edi)
    1173:	32 39                	xor    (%ecx),%bh
	...

00001176 <ls_call29>:
CS550LSSYSCALL(ls_call29)
    1176:	b8 6c 11 00 00       	mov    $0x116c,%eax
    117b:	cd 41                	int    $0x41
    117d:	c3                   	ret    

0000117e <str_ls_call30>:
    117e:	6c                   	insb   (%dx),%es:(%edi)
    117f:	73 5f                	jae    11e0 <str_ls_call35+0x8>
    1181:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1184:	6c                   	insb   (%dx),%es:(%edi)
    1185:	33 30                	xor    (%eax),%esi
	...

00001188 <ls_call30>:
CS550LSSYSCALL(ls_call30)
    1188:	b8 7e 11 00 00       	mov    $0x117e,%eax
    118d:	cd 41                	int    $0x41
    118f:	c3                   	ret    

00001190 <str_ls_call31>:
    1190:	6c                   	insb   (%dx),%es:(%edi)
    1191:	73 5f                	jae    11f2 <str_ls_call36+0x8>
    1193:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1196:	6c                   	insb   (%dx),%es:(%edi)
    1197:	33 31                	xor    (%ecx),%esi
	...

0000119a <ls_call31>:
CS550LSSYSCALL(ls_call31)
    119a:	b8 90 11 00 00       	mov    $0x1190,%eax
    119f:	cd 41                	int    $0x41
    11a1:	c3                   	ret    

000011a2 <str_ls_call32>:
    11a2:	6c                   	insb   (%dx),%es:(%edi)
    11a3:	73 5f                	jae    1204 <str_ls_call37+0x8>
    11a5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    11a8:	6c                   	insb   (%dx),%es:(%edi)
    11a9:	33 32                	xor    (%edx),%esi
	...

000011ac <ls_call32>:
CS550LSSYSCALL(ls_call32)
    11ac:	b8 a2 11 00 00       	mov    $0x11a2,%eax
    11b1:	cd 41                	int    $0x41
    11b3:	c3                   	ret    

000011b4 <str_ls_call33>:
    11b4:	6c                   	insb   (%dx),%es:(%edi)
    11b5:	73 5f                	jae    1216 <str_ls_call38+0x8>
    11b7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    11ba:	6c                   	insb   (%dx),%es:(%edi)
    11bb:	33 33                	xor    (%ebx),%esi
	...

000011be <ls_call33>:
CS550LSSYSCALL(ls_call33)
    11be:	b8 b4 11 00 00       	mov    $0x11b4,%eax
    11c3:	cd 41                	int    $0x41
    11c5:	c3                   	ret    

000011c6 <str_ls_call34>:
    11c6:	6c                   	insb   (%dx),%es:(%edi)
    11c7:	73 5f                	jae    1228 <str_ls_call39+0x8>
    11c9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    11cc:	6c                   	insb   (%dx),%es:(%edi)
    11cd:	33 34 00             	xor    (%eax,%eax,1),%esi

000011d0 <ls_call34>:
CS550LSSYSCALL(ls_call34)
    11d0:	b8 c6 11 00 00       	mov    $0x11c6,%eax
    11d5:	cd 41                	int    $0x41
    11d7:	c3                   	ret    

000011d8 <str_ls_call35>:
    11d8:	6c                   	insb   (%dx),%es:(%edi)
    11d9:	73 5f                	jae    123a <str_ls_call40+0x8>
    11db:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    11de:	6c                   	insb   (%dx),%es:(%edi)
    11df:	33                   	.byte 0x33
    11e0:	35                   	.byte 0x35
	...

000011e2 <ls_call35>:
CS550LSSYSCALL(ls_call35)
    11e2:	b8 d8 11 00 00       	mov    $0x11d8,%eax
    11e7:	cd 41                	int    $0x41
    11e9:	c3                   	ret    

000011ea <str_ls_call36>:
    11ea:	6c                   	insb   (%dx),%es:(%edi)
    11eb:	73 5f                	jae    124c <str_ls_call41+0x8>
    11ed:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    11f0:	6c                   	insb   (%dx),%es:(%edi)
    11f1:	33 36                	xor    (%esi),%esi
	...

000011f4 <ls_call36>:
CS550LSSYSCALL(ls_call36)
    11f4:	b8 ea 11 00 00       	mov    $0x11ea,%eax
    11f9:	cd 41                	int    $0x41
    11fb:	c3                   	ret    

000011fc <str_ls_call37>:
    11fc:	6c                   	insb   (%dx),%es:(%edi)
    11fd:	73 5f                	jae    125e <str_ls_call42+0x8>
    11ff:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1202:	6c                   	insb   (%dx),%es:(%edi)
    1203:	33 37                	xor    (%edi),%esi
	...

00001206 <ls_call37>:
CS550LSSYSCALL(ls_call37)
    1206:	b8 fc 11 00 00       	mov    $0x11fc,%eax
    120b:	cd 41                	int    $0x41
    120d:	c3                   	ret    

0000120e <str_ls_call38>:
    120e:	6c                   	insb   (%dx),%es:(%edi)
    120f:	73 5f                	jae    1270 <str_ls_call43+0x8>
    1211:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1214:	6c                   	insb   (%dx),%es:(%edi)
    1215:	33 38                	xor    (%eax),%edi
	...

00001218 <ls_call38>:
CS550LSSYSCALL(ls_call38)
    1218:	b8 0e 12 00 00       	mov    $0x120e,%eax
    121d:	cd 41                	int    $0x41
    121f:	c3                   	ret    

00001220 <str_ls_call39>:
    1220:	6c                   	insb   (%dx),%es:(%edi)
    1221:	73 5f                	jae    1282 <str_ls_call44+0x8>
    1223:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1226:	6c                   	insb   (%dx),%es:(%edi)
    1227:	33 39                	xor    (%ecx),%edi
	...

0000122a <ls_call39>:
CS550LSSYSCALL(ls_call39)
    122a:	b8 20 12 00 00       	mov    $0x1220,%eax
    122f:	cd 41                	int    $0x41
    1231:	c3                   	ret    

00001232 <str_ls_call40>:
    1232:	6c                   	insb   (%dx),%es:(%edi)
    1233:	73 5f                	jae    1294 <str_ls_call45+0x8>
    1235:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1238:	6c                   	insb   (%dx),%es:(%edi)
    1239:	34 30                	xor    $0x30,%al
	...

0000123c <ls_call40>:
CS550LSSYSCALL(ls_call40)
    123c:	b8 32 12 00 00       	mov    $0x1232,%eax
    1241:	cd 41                	int    $0x41
    1243:	c3                   	ret    

00001244 <str_ls_call41>:
    1244:	6c                   	insb   (%dx),%es:(%edi)
    1245:	73 5f                	jae    12a6 <str_ls_call46+0x8>
    1247:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    124a:	6c                   	insb   (%dx),%es:(%edi)
    124b:	34 31                	xor    $0x31,%al
	...

0000124e <ls_call41>:
CS550LSSYSCALL(ls_call41)
    124e:	b8 44 12 00 00       	mov    $0x1244,%eax
    1253:	cd 41                	int    $0x41
    1255:	c3                   	ret    

00001256 <str_ls_call42>:
    1256:	6c                   	insb   (%dx),%es:(%edi)
    1257:	73 5f                	jae    12b8 <str_ls_call47+0x8>
    1259:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    125c:	6c                   	insb   (%dx),%es:(%edi)
    125d:	34 32                	xor    $0x32,%al
	...

00001260 <ls_call42>:
CS550LSSYSCALL(ls_call42)
    1260:	b8 56 12 00 00       	mov    $0x1256,%eax
    1265:	cd 41                	int    $0x41
    1267:	c3                   	ret    

00001268 <str_ls_call43>:
    1268:	6c                   	insb   (%dx),%es:(%edi)
    1269:	73 5f                	jae    12ca <str_ls_call48+0x8>
    126b:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    126e:	6c                   	insb   (%dx),%es:(%edi)
    126f:	34 33                	xor    $0x33,%al
	...

00001272 <ls_call43>:
CS550LSSYSCALL(ls_call43)
    1272:	b8 68 12 00 00       	mov    $0x1268,%eax
    1277:	cd 41                	int    $0x41
    1279:	c3                   	ret    

0000127a <str_ls_call44>:
    127a:	6c                   	insb   (%dx),%es:(%edi)
    127b:	73 5f                	jae    12dc <str_ls_call49+0x8>
    127d:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1280:	6c                   	insb   (%dx),%es:(%edi)
    1281:	34 34                	xor    $0x34,%al
	...

00001284 <ls_call44>:
CS550LSSYSCALL(ls_call44)
    1284:	b8 7a 12 00 00       	mov    $0x127a,%eax
    1289:	cd 41                	int    $0x41
    128b:	c3                   	ret    

0000128c <str_ls_call45>:
    128c:	6c                   	insb   (%dx),%es:(%edi)
    128d:	73 5f                	jae    12ee <str_ls_call50+0x8>
    128f:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    1292:	6c                   	insb   (%dx),%es:(%edi)
    1293:	34 35                	xor    $0x35,%al
	...

00001296 <ls_call45>:
CS550LSSYSCALL(ls_call45)
    1296:	b8 8c 12 00 00       	mov    $0x128c,%eax
    129b:	cd 41                	int    $0x41
    129d:	c3                   	ret    

0000129e <str_ls_call46>:
    129e:	6c                   	insb   (%dx),%es:(%edi)
    129f:	73 5f                	jae    1300 <str_ht_call1+0x8>
    12a1:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    12a4:	6c                   	insb   (%dx),%es:(%edi)
    12a5:	34 36                	xor    $0x36,%al
	...

000012a8 <ls_call46>:
CS550LSSYSCALL(ls_call46)
    12a8:	b8 9e 12 00 00       	mov    $0x129e,%eax
    12ad:	cd 41                	int    $0x41
    12af:	c3                   	ret    

000012b0 <str_ls_call47>:
    12b0:	6c                   	insb   (%dx),%es:(%edi)
    12b1:	73 5f                	jae    1312 <ht_call2>
    12b3:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    12b6:	6c                   	insb   (%dx),%es:(%edi)
    12b7:	34 37                	xor    $0x37,%al
	...

000012ba <ls_call47>:
CS550LSSYSCALL(ls_call47)
    12ba:	b8 b0 12 00 00       	mov    $0x12b0,%eax
    12bf:	cd 41                	int    $0x41
    12c1:	c3                   	ret    

000012c2 <str_ls_call48>:
    12c2:	6c                   	insb   (%dx),%es:(%edi)
    12c3:	73 5f                	jae    1324 <ht_call3+0x1>
    12c5:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    12c8:	6c                   	insb   (%dx),%es:(%edi)
    12c9:	34 38                	xor    $0x38,%al
	...

000012cc <ls_call48>:
CS550LSSYSCALL(ls_call48)
    12cc:	b8 c2 12 00 00       	mov    $0x12c2,%eax
    12d1:	cd 41                	int    $0x41
    12d3:	c3                   	ret    

000012d4 <str_ls_call49>:
    12d4:	6c                   	insb   (%dx),%es:(%edi)
    12d5:	73 5f                	jae    1336 <ht_call4+0x2>
    12d7:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    12da:	6c                   	insb   (%dx),%es:(%edi)
    12db:	34 39                	xor    $0x39,%al
	...

000012de <ls_call49>:
CS550LSSYSCALL(ls_call49)
    12de:	b8 d4 12 00 00       	mov    $0x12d4,%eax
    12e3:	cd 41                	int    $0x41
    12e5:	c3                   	ret    

000012e6 <str_ls_call50>:
    12e6:	6c                   	insb   (%dx),%es:(%edi)
    12e7:	73 5f                	jae    1348 <ht_call5+0x3>
    12e9:	63 61 6c             	arpl   %sp,0x6c(%ecx)
    12ec:	6c                   	insb   (%dx),%es:(%edi)
    12ed:	35                   	.byte 0x35
    12ee:	30 00                	xor    %al,(%eax)

000012f0 <ls_call50>:
CS550LSSYSCALL(ls_call50)
    12f0:	b8 e6 12 00 00       	mov    $0x12e6,%eax
    12f5:	cd 41                	int    $0x41
    12f7:	c3                   	ret    

000012f8 <str_ht_call1>:
    12f8:	68 74 5f 63 61       	push   $0x61635f74
    12fd:	6c                   	insb   (%dx),%es:(%edi)
    12fe:	6c                   	insb   (%dx),%es:(%edi)
    12ff:	31 00                	xor    %eax,(%eax)

00001301 <ht_call1>:


// ht calls

CS550HTSYSCALL(ht_call1)
    1301:	b8 f8 12 00 00       	mov    $0x12f8,%eax
    1306:	cd 42                	int    $0x42
    1308:	c3                   	ret    

00001309 <str_ht_call2>:
    1309:	68 74 5f 63 61       	push   $0x61635f74
    130e:	6c                   	insb   (%dx),%es:(%edi)
    130f:	6c                   	insb   (%dx),%es:(%edi)
    1310:	32 00                	xor    (%eax),%al

00001312 <ht_call2>:
CS550HTSYSCALL(ht_call2)
    1312:	b8 09 13 00 00       	mov    $0x1309,%eax
    1317:	cd 42                	int    $0x42
    1319:	c3                   	ret    

0000131a <str_ht_call3>:
    131a:	68 74 5f 63 61       	push   $0x61635f74
    131f:	6c                   	insb   (%dx),%es:(%edi)
    1320:	6c                   	insb   (%dx),%es:(%edi)
    1321:	33 00                	xor    (%eax),%eax

00001323 <ht_call3>:
CS550HTSYSCALL(ht_call3)
    1323:	b8 1a 13 00 00       	mov    $0x131a,%eax
    1328:	cd 42                	int    $0x42
    132a:	c3                   	ret    

0000132b <str_ht_call4>:
    132b:	68 74 5f 63 61       	push   $0x61635f74
    1330:	6c                   	insb   (%dx),%es:(%edi)
    1331:	6c                   	insb   (%dx),%es:(%edi)
    1332:	34 00                	xor    $0x0,%al

00001334 <ht_call4>:
CS550HTSYSCALL(ht_call4)
    1334:	b8 2b 13 00 00       	mov    $0x132b,%eax
    1339:	cd 42                	int    $0x42
    133b:	c3                   	ret    

0000133c <str_ht_call5>:
    133c:	68 74 5f 63 61       	push   $0x61635f74
    1341:	6c                   	insb   (%dx),%es:(%edi)
    1342:	6c                   	insb   (%dx),%es:(%edi)
    1343:	35                   	.byte 0x35
	...

00001345 <ht_call5>:
CS550HTSYSCALL(ht_call5)
    1345:	b8 3c 13 00 00       	mov    $0x133c,%eax
    134a:	cd 42                	int    $0x42
    134c:	c3                   	ret    

0000134d <str_ht_call6>:
    134d:	68 74 5f 63 61       	push   $0x61635f74
    1352:	6c                   	insb   (%dx),%es:(%edi)
    1353:	6c                   	insb   (%dx),%es:(%edi)
    1354:	36                   	ss
	...

00001356 <ht_call6>:
CS550HTSYSCALL(ht_call6)
    1356:	b8 4d 13 00 00       	mov    $0x134d,%eax
    135b:	cd 42                	int    $0x42
    135d:	c3                   	ret    

0000135e <str_ht_call7>:
    135e:	68 74 5f 63 61       	push   $0x61635f74
    1363:	6c                   	insb   (%dx),%es:(%edi)
    1364:	6c                   	insb   (%dx),%es:(%edi)
    1365:	37                   	aaa    
	...

00001367 <ht_call7>:
CS550HTSYSCALL(ht_call7)
    1367:	b8 5e 13 00 00       	mov    $0x135e,%eax
    136c:	cd 42                	int    $0x42
    136e:	c3                   	ret    

0000136f <str_ht_call8>:
    136f:	68 74 5f 63 61       	push   $0x61635f74
    1374:	6c                   	insb   (%dx),%es:(%edi)
    1375:	6c                   	insb   (%dx),%es:(%edi)
    1376:	38 00                	cmp    %al,(%eax)

00001378 <ht_call8>:
CS550HTSYSCALL(ht_call8)
    1378:	b8 6f 13 00 00       	mov    $0x136f,%eax
    137d:	cd 42                	int    $0x42
    137f:	c3                   	ret    

00001380 <str_ht_call9>:
    1380:	68 74 5f 63 61       	push   $0x61635f74
    1385:	6c                   	insb   (%dx),%es:(%edi)
    1386:	6c                   	insb   (%dx),%es:(%edi)
    1387:	39 00                	cmp    %eax,(%eax)

00001389 <ht_call9>:
CS550HTSYSCALL(ht_call9)
    1389:	b8 80 13 00 00       	mov    $0x1380,%eax
    138e:	cd 42                	int    $0x42
    1390:	c3                   	ret    

00001391 <str_ht_call10>:
    1391:	68 74 5f 63 61       	push   $0x61635f74
    1396:	6c                   	insb   (%dx),%es:(%edi)
    1397:	6c                   	insb   (%dx),%es:(%edi)
    1398:	31 30                	xor    %esi,(%eax)
	...

0000139b <ht_call10>:
CS550HTSYSCALL(ht_call10)
    139b:	b8 91 13 00 00       	mov    $0x1391,%eax
    13a0:	cd 42                	int    $0x42
    13a2:	c3                   	ret    

000013a3 <str_ht_call11>:
    13a3:	68 74 5f 63 61       	push   $0x61635f74
    13a8:	6c                   	insb   (%dx),%es:(%edi)
    13a9:	6c                   	insb   (%dx),%es:(%edi)
    13aa:	31 31                	xor    %esi,(%ecx)
	...

000013ad <ht_call11>:
CS550HTSYSCALL(ht_call11)
    13ad:	b8 a3 13 00 00       	mov    $0x13a3,%eax
    13b2:	cd 42                	int    $0x42
    13b4:	c3                   	ret    

000013b5 <str_ht_call12>:
    13b5:	68 74 5f 63 61       	push   $0x61635f74
    13ba:	6c                   	insb   (%dx),%es:(%edi)
    13bb:	6c                   	insb   (%dx),%es:(%edi)
    13bc:	31 32                	xor    %esi,(%edx)
	...

000013bf <ht_call12>:
CS550HTSYSCALL(ht_call12)
    13bf:	b8 b5 13 00 00       	mov    $0x13b5,%eax
    13c4:	cd 42                	int    $0x42
    13c6:	c3                   	ret    

000013c7 <str_ht_call13>:
    13c7:	68 74 5f 63 61       	push   $0x61635f74
    13cc:	6c                   	insb   (%dx),%es:(%edi)
    13cd:	6c                   	insb   (%dx),%es:(%edi)
    13ce:	31 33                	xor    %esi,(%ebx)
	...

000013d1 <ht_call13>:
CS550HTSYSCALL(ht_call13)
    13d1:	b8 c7 13 00 00       	mov    $0x13c7,%eax
    13d6:	cd 42                	int    $0x42
    13d8:	c3                   	ret    

000013d9 <str_ht_call14>:
    13d9:	68 74 5f 63 61       	push   $0x61635f74
    13de:	6c                   	insb   (%dx),%es:(%edi)
    13df:	6c                   	insb   (%dx),%es:(%edi)
    13e0:	31 34 00             	xor    %esi,(%eax,%eax,1)

000013e3 <ht_call14>:
CS550HTSYSCALL(ht_call14)
    13e3:	b8 d9 13 00 00       	mov    $0x13d9,%eax
    13e8:	cd 42                	int    $0x42
    13ea:	c3                   	ret    

000013eb <str_ht_call15>:
    13eb:	68 74 5f 63 61       	push   $0x61635f74
    13f0:	6c                   	insb   (%dx),%es:(%edi)
    13f1:	6c                   	insb   (%dx),%es:(%edi)
    13f2:	31                   	.byte 0x31
    13f3:	35                   	.byte 0x35
	...

000013f5 <ht_call15>:
CS550HTSYSCALL(ht_call15)
    13f5:	b8 eb 13 00 00       	mov    $0x13eb,%eax
    13fa:	cd 42                	int    $0x42
    13fc:	c3                   	ret    

000013fd <str_ht_call16>:
    13fd:	68 74 5f 63 61       	push   $0x61635f74
    1402:	6c                   	insb   (%dx),%es:(%edi)
    1403:	6c                   	insb   (%dx),%es:(%edi)
    1404:	31 36                	xor    %esi,(%esi)
	...

00001407 <ht_call16>:
CS550HTSYSCALL(ht_call16)
    1407:	b8 fd 13 00 00       	mov    $0x13fd,%eax
    140c:	cd 42                	int    $0x42
    140e:	c3                   	ret    

0000140f <str_ht_call17>:
    140f:	68 74 5f 63 61       	push   $0x61635f74
    1414:	6c                   	insb   (%dx),%es:(%edi)
    1415:	6c                   	insb   (%dx),%es:(%edi)
    1416:	31 37                	xor    %esi,(%edi)
	...

00001419 <ht_call17>:
CS550HTSYSCALL(ht_call17)
    1419:	b8 0f 14 00 00       	mov    $0x140f,%eax
    141e:	cd 42                	int    $0x42
    1420:	c3                   	ret    

00001421 <str_ht_call18>:
    1421:	68 74 5f 63 61       	push   $0x61635f74
    1426:	6c                   	insb   (%dx),%es:(%edi)
    1427:	6c                   	insb   (%dx),%es:(%edi)
    1428:	31 38                	xor    %edi,(%eax)
	...

0000142b <ht_call18>:
CS550HTSYSCALL(ht_call18)
    142b:	b8 21 14 00 00       	mov    $0x1421,%eax
    1430:	cd 42                	int    $0x42
    1432:	c3                   	ret    

00001433 <str_ht_call19>:
    1433:	68 74 5f 63 61       	push   $0x61635f74
    1438:	6c                   	insb   (%dx),%es:(%edi)
    1439:	6c                   	insb   (%dx),%es:(%edi)
    143a:	31 39                	xor    %edi,(%ecx)
	...

0000143d <ht_call19>:
CS550HTSYSCALL(ht_call19)
    143d:	b8 33 14 00 00       	mov    $0x1433,%eax
    1442:	cd 42                	int    $0x42
    1444:	c3                   	ret    

00001445 <str_ht_call20>:
    1445:	68 74 5f 63 61       	push   $0x61635f74
    144a:	6c                   	insb   (%dx),%es:(%edi)
    144b:	6c                   	insb   (%dx),%es:(%edi)
    144c:	32 30                	xor    (%eax),%dh
	...

0000144f <ht_call20>:
CS550HTSYSCALL(ht_call20)
    144f:	b8 45 14 00 00       	mov    $0x1445,%eax
    1454:	cd 42                	int    $0x42
    1456:	c3                   	ret    

00001457 <str_ht_call21>:
    1457:	68 74 5f 63 61       	push   $0x61635f74
    145c:	6c                   	insb   (%dx),%es:(%edi)
    145d:	6c                   	insb   (%dx),%es:(%edi)
    145e:	32 31                	xor    (%ecx),%dh
	...

00001461 <ht_call21>:
CS550HTSYSCALL(ht_call21)
    1461:	b8 57 14 00 00       	mov    $0x1457,%eax
    1466:	cd 42                	int    $0x42
    1468:	c3                   	ret    

00001469 <str_ht_call22>:
    1469:	68 74 5f 63 61       	push   $0x61635f74
    146e:	6c                   	insb   (%dx),%es:(%edi)
    146f:	6c                   	insb   (%dx),%es:(%edi)
    1470:	32 32                	xor    (%edx),%dh
	...

00001473 <ht_call22>:
CS550HTSYSCALL(ht_call22)
    1473:	b8 69 14 00 00       	mov    $0x1469,%eax
    1478:	cd 42                	int    $0x42
    147a:	c3                   	ret    

0000147b <str_ht_call23>:
    147b:	68 74 5f 63 61       	push   $0x61635f74
    1480:	6c                   	insb   (%dx),%es:(%edi)
    1481:	6c                   	insb   (%dx),%es:(%edi)
    1482:	32 33                	xor    (%ebx),%dh
	...

00001485 <ht_call23>:
CS550HTSYSCALL(ht_call23)
    1485:	b8 7b 14 00 00       	mov    $0x147b,%eax
    148a:	cd 42                	int    $0x42
    148c:	c3                   	ret    

0000148d <str_ht_call24>:
    148d:	68 74 5f 63 61       	push   $0x61635f74
    1492:	6c                   	insb   (%dx),%es:(%edi)
    1493:	6c                   	insb   (%dx),%es:(%edi)
    1494:	32 34 00             	xor    (%eax,%eax,1),%dh

00001497 <ht_call24>:
CS550HTSYSCALL(ht_call24)
    1497:	b8 8d 14 00 00       	mov    $0x148d,%eax
    149c:	cd 42                	int    $0x42
    149e:	c3                   	ret    

0000149f <str_ht_call25>:
    149f:	68 74 5f 63 61       	push   $0x61635f74
    14a4:	6c                   	insb   (%dx),%es:(%edi)
    14a5:	6c                   	insb   (%dx),%es:(%edi)
    14a6:	32                   	.byte 0x32
    14a7:	35                   	.byte 0x35
	...

000014a9 <ht_call25>:
CS550HTSYSCALL(ht_call25)
    14a9:	b8 9f 14 00 00       	mov    $0x149f,%eax
    14ae:	cd 42                	int    $0x42
    14b0:	c3                   	ret    

000014b1 <str_ht_call26>:
    14b1:	68 74 5f 63 61       	push   $0x61635f74
    14b6:	6c                   	insb   (%dx),%es:(%edi)
    14b7:	6c                   	insb   (%dx),%es:(%edi)
    14b8:	32 36                	xor    (%esi),%dh
	...

000014bb <ht_call26>:
CS550HTSYSCALL(ht_call26)
    14bb:	b8 b1 14 00 00       	mov    $0x14b1,%eax
    14c0:	cd 42                	int    $0x42
    14c2:	c3                   	ret    

000014c3 <str_ht_call27>:
    14c3:	68 74 5f 63 61       	push   $0x61635f74
    14c8:	6c                   	insb   (%dx),%es:(%edi)
    14c9:	6c                   	insb   (%dx),%es:(%edi)
    14ca:	32 37                	xor    (%edi),%dh
	...

000014cd <ht_call27>:
CS550HTSYSCALL(ht_call27)
    14cd:	b8 c3 14 00 00       	mov    $0x14c3,%eax
    14d2:	cd 42                	int    $0x42
    14d4:	c3                   	ret    

000014d5 <str_ht_call28>:
    14d5:	68 74 5f 63 61       	push   $0x61635f74
    14da:	6c                   	insb   (%dx),%es:(%edi)
    14db:	6c                   	insb   (%dx),%es:(%edi)
    14dc:	32 38                	xor    (%eax),%bh
	...

000014df <ht_call28>:
CS550HTSYSCALL(ht_call28)
    14df:	b8 d5 14 00 00       	mov    $0x14d5,%eax
    14e4:	cd 42                	int    $0x42
    14e6:	c3                   	ret    

000014e7 <str_ht_call29>:
    14e7:	68 74 5f 63 61       	push   $0x61635f74
    14ec:	6c                   	insb   (%dx),%es:(%edi)
    14ed:	6c                   	insb   (%dx),%es:(%edi)
    14ee:	32 39                	xor    (%ecx),%bh
	...

000014f1 <ht_call29>:
CS550HTSYSCALL(ht_call29)
    14f1:	b8 e7 14 00 00       	mov    $0x14e7,%eax
    14f6:	cd 42                	int    $0x42
    14f8:	c3                   	ret    

000014f9 <str_ht_call30>:
    14f9:	68 74 5f 63 61       	push   $0x61635f74
    14fe:	6c                   	insb   (%dx),%es:(%edi)
    14ff:	6c                   	insb   (%dx),%es:(%edi)
    1500:	33 30                	xor    (%eax),%esi
	...

00001503 <ht_call30>:
CS550HTSYSCALL(ht_call30)
    1503:	b8 f9 14 00 00       	mov    $0x14f9,%eax
    1508:	cd 42                	int    $0x42
    150a:	c3                   	ret    

0000150b <str_ht_call31>:
    150b:	68 74 5f 63 61       	push   $0x61635f74
    1510:	6c                   	insb   (%dx),%es:(%edi)
    1511:	6c                   	insb   (%dx),%es:(%edi)
    1512:	33 31                	xor    (%ecx),%esi
	...

00001515 <ht_call31>:
CS550HTSYSCALL(ht_call31)
    1515:	b8 0b 15 00 00       	mov    $0x150b,%eax
    151a:	cd 42                	int    $0x42
    151c:	c3                   	ret    

0000151d <str_ht_call32>:
    151d:	68 74 5f 63 61       	push   $0x61635f74
    1522:	6c                   	insb   (%dx),%es:(%edi)
    1523:	6c                   	insb   (%dx),%es:(%edi)
    1524:	33 32                	xor    (%edx),%esi
	...

00001527 <ht_call32>:
CS550HTSYSCALL(ht_call32)
    1527:	b8 1d 15 00 00       	mov    $0x151d,%eax
    152c:	cd 42                	int    $0x42
    152e:	c3                   	ret    

0000152f <str_ht_call33>:
    152f:	68 74 5f 63 61       	push   $0x61635f74
    1534:	6c                   	insb   (%dx),%es:(%edi)
    1535:	6c                   	insb   (%dx),%es:(%edi)
    1536:	33 33                	xor    (%ebx),%esi
	...

00001539 <ht_call33>:
CS550HTSYSCALL(ht_call33)
    1539:	b8 2f 15 00 00       	mov    $0x152f,%eax
    153e:	cd 42                	int    $0x42
    1540:	c3                   	ret    

00001541 <str_ht_call34>:
    1541:	68 74 5f 63 61       	push   $0x61635f74
    1546:	6c                   	insb   (%dx),%es:(%edi)
    1547:	6c                   	insb   (%dx),%es:(%edi)
    1548:	33 34 00             	xor    (%eax,%eax,1),%esi

0000154b <ht_call34>:
CS550HTSYSCALL(ht_call34)
    154b:	b8 41 15 00 00       	mov    $0x1541,%eax
    1550:	cd 42                	int    $0x42
    1552:	c3                   	ret    

00001553 <str_ht_call35>:
    1553:	68 74 5f 63 61       	push   $0x61635f74
    1558:	6c                   	insb   (%dx),%es:(%edi)
    1559:	6c                   	insb   (%dx),%es:(%edi)
    155a:	33                   	.byte 0x33
    155b:	35                   	.byte 0x35
	...

0000155d <ht_call35>:
CS550HTSYSCALL(ht_call35)
    155d:	b8 53 15 00 00       	mov    $0x1553,%eax
    1562:	cd 42                	int    $0x42
    1564:	c3                   	ret    

00001565 <str_ht_call36>:
    1565:	68 74 5f 63 61       	push   $0x61635f74
    156a:	6c                   	insb   (%dx),%es:(%edi)
    156b:	6c                   	insb   (%dx),%es:(%edi)
    156c:	33 36                	xor    (%esi),%esi
	...

0000156f <ht_call36>:
CS550HTSYSCALL(ht_call36)
    156f:	b8 65 15 00 00       	mov    $0x1565,%eax
    1574:	cd 42                	int    $0x42
    1576:	c3                   	ret    

00001577 <str_ht_call37>:
    1577:	68 74 5f 63 61       	push   $0x61635f74
    157c:	6c                   	insb   (%dx),%es:(%edi)
    157d:	6c                   	insb   (%dx),%es:(%edi)
    157e:	33 37                	xor    (%edi),%esi
	...

00001581 <ht_call37>:
CS550HTSYSCALL(ht_call37)
    1581:	b8 77 15 00 00       	mov    $0x1577,%eax
    1586:	cd 42                	int    $0x42
    1588:	c3                   	ret    

00001589 <str_ht_call38>:
    1589:	68 74 5f 63 61       	push   $0x61635f74
    158e:	6c                   	insb   (%dx),%es:(%edi)
    158f:	6c                   	insb   (%dx),%es:(%edi)
    1590:	33 38                	xor    (%eax),%edi
	...

00001593 <ht_call38>:
CS550HTSYSCALL(ht_call38)
    1593:	b8 89 15 00 00       	mov    $0x1589,%eax
    1598:	cd 42                	int    $0x42
    159a:	c3                   	ret    

0000159b <str_ht_call39>:
    159b:	68 74 5f 63 61       	push   $0x61635f74
    15a0:	6c                   	insb   (%dx),%es:(%edi)
    15a1:	6c                   	insb   (%dx),%es:(%edi)
    15a2:	33 39                	xor    (%ecx),%edi
	...

000015a5 <ht_call39>:
CS550HTSYSCALL(ht_call39)
    15a5:	b8 9b 15 00 00       	mov    $0x159b,%eax
    15aa:	cd 42                	int    $0x42
    15ac:	c3                   	ret    

000015ad <str_ht_call40>:
    15ad:	68 74 5f 63 61       	push   $0x61635f74
    15b2:	6c                   	insb   (%dx),%es:(%edi)
    15b3:	6c                   	insb   (%dx),%es:(%edi)
    15b4:	34 30                	xor    $0x30,%al
	...

000015b7 <ht_call40>:
CS550HTSYSCALL(ht_call40)
    15b7:	b8 ad 15 00 00       	mov    $0x15ad,%eax
    15bc:	cd 42                	int    $0x42
    15be:	c3                   	ret    

000015bf <str_ht_call41>:
    15bf:	68 74 5f 63 61       	push   $0x61635f74
    15c4:	6c                   	insb   (%dx),%es:(%edi)
    15c5:	6c                   	insb   (%dx),%es:(%edi)
    15c6:	34 31                	xor    $0x31,%al
	...

000015c9 <ht_call41>:
CS550HTSYSCALL(ht_call41)
    15c9:	b8 bf 15 00 00       	mov    $0x15bf,%eax
    15ce:	cd 42                	int    $0x42
    15d0:	c3                   	ret    

000015d1 <str_ht_call42>:
    15d1:	68 74 5f 63 61       	push   $0x61635f74
    15d6:	6c                   	insb   (%dx),%es:(%edi)
    15d7:	6c                   	insb   (%dx),%es:(%edi)
    15d8:	34 32                	xor    $0x32,%al
	...

000015db <ht_call42>:
CS550HTSYSCALL(ht_call42)
    15db:	b8 d1 15 00 00       	mov    $0x15d1,%eax
    15e0:	cd 42                	int    $0x42
    15e2:	c3                   	ret    

000015e3 <str_ht_call43>:
    15e3:	68 74 5f 63 61       	push   $0x61635f74
    15e8:	6c                   	insb   (%dx),%es:(%edi)
    15e9:	6c                   	insb   (%dx),%es:(%edi)
    15ea:	34 33                	xor    $0x33,%al
	...

000015ed <ht_call43>:
CS550HTSYSCALL(ht_call43)
    15ed:	b8 e3 15 00 00       	mov    $0x15e3,%eax
    15f2:	cd 42                	int    $0x42
    15f4:	c3                   	ret    

000015f5 <str_ht_call44>:
    15f5:	68 74 5f 63 61       	push   $0x61635f74
    15fa:	6c                   	insb   (%dx),%es:(%edi)
    15fb:	6c                   	insb   (%dx),%es:(%edi)
    15fc:	34 34                	xor    $0x34,%al
	...

000015ff <ht_call44>:
CS550HTSYSCALL(ht_call44)
    15ff:	b8 f5 15 00 00       	mov    $0x15f5,%eax
    1604:	cd 42                	int    $0x42
    1606:	c3                   	ret    

00001607 <str_ht_call45>:
    1607:	68 74 5f 63 61       	push   $0x61635f74
    160c:	6c                   	insb   (%dx),%es:(%edi)
    160d:	6c                   	insb   (%dx),%es:(%edi)
    160e:	34 35                	xor    $0x35,%al
	...

00001611 <ht_call45>:
CS550HTSYSCALL(ht_call45)
    1611:	b8 07 16 00 00       	mov    $0x1607,%eax
    1616:	cd 42                	int    $0x42
    1618:	c3                   	ret    

00001619 <str_ht_call46>:
    1619:	68 74 5f 63 61       	push   $0x61635f74
    161e:	6c                   	insb   (%dx),%es:(%edi)
    161f:	6c                   	insb   (%dx),%es:(%edi)
    1620:	34 36                	xor    $0x36,%al
	...

00001623 <ht_call46>:
CS550HTSYSCALL(ht_call46)
    1623:	b8 19 16 00 00       	mov    $0x1619,%eax
    1628:	cd 42                	int    $0x42
    162a:	c3                   	ret    

0000162b <str_ht_call47>:
    162b:	68 74 5f 63 61       	push   $0x61635f74
    1630:	6c                   	insb   (%dx),%es:(%edi)
    1631:	6c                   	insb   (%dx),%es:(%edi)
    1632:	34 37                	xor    $0x37,%al
	...

00001635 <ht_call47>:
CS550HTSYSCALL(ht_call47)
    1635:	b8 2b 16 00 00       	mov    $0x162b,%eax
    163a:	cd 42                	int    $0x42
    163c:	c3                   	ret    

0000163d <str_ht_call48>:
    163d:	68 74 5f 63 61       	push   $0x61635f74
    1642:	6c                   	insb   (%dx),%es:(%edi)
    1643:	6c                   	insb   (%dx),%es:(%edi)
    1644:	34 38                	xor    $0x38,%al
	...

00001647 <ht_call48>:
CS550HTSYSCALL(ht_call48)
    1647:	b8 3d 16 00 00       	mov    $0x163d,%eax
    164c:	cd 42                	int    $0x42
    164e:	c3                   	ret    

0000164f <str_ht_call49>:
    164f:	68 74 5f 63 61       	push   $0x61635f74
    1654:	6c                   	insb   (%dx),%es:(%edi)
    1655:	6c                   	insb   (%dx),%es:(%edi)
    1656:	34 39                	xor    $0x39,%al
	...

00001659 <ht_call49>:
CS550HTSYSCALL(ht_call49)
    1659:	b8 4f 16 00 00       	mov    $0x164f,%eax
    165e:	cd 42                	int    $0x42
    1660:	c3                   	ret    

00001661 <str_ht_call50>:
    1661:	68 74 5f 63 61       	push   $0x61635f74
    1666:	6c                   	insb   (%dx),%es:(%edi)
    1667:	6c                   	insb   (%dx),%es:(%edi)
    1668:	35                   	.byte 0x35
    1669:	30 00                	xor    %al,(%eax)

0000166b <ht_call50>:
CS550HTSYSCALL(ht_call50)
    166b:	b8 61 16 00 00       	mov    $0x1661,%eax
    1670:	cd 42                	int    $0x42
    1672:	c3                   	ret    

00001673 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1673:	55                   	push   %ebp
    1674:	89 e5                	mov    %esp,%ebp
    1676:	83 ec 18             	sub    $0x18,%esp
    1679:	8b 45 0c             	mov    0xc(%ebp),%eax
    167c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    167f:	83 ec 04             	sub    $0x4,%esp
    1682:	6a 01                	push   $0x1
    1684:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1687:	50                   	push   %eax
    1688:	ff 75 08             	pushl  0x8(%ebp)
    168b:	e8 65 f8 ff ff       	call   ef5 <write>
    1690:	83 c4 10             	add    $0x10,%esp
}
    1693:	90                   	nop
    1694:	c9                   	leave  
    1695:	c3                   	ret    

00001696 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1696:	55                   	push   %ebp
    1697:	89 e5                	mov    %esp,%ebp
    1699:	53                   	push   %ebx
    169a:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    169d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    16a4:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    16a8:	74 17                	je     16c1 <printint+0x2b>
    16aa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    16ae:	79 11                	jns    16c1 <printint+0x2b>
    neg = 1;
    16b0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    16b7:	8b 45 0c             	mov    0xc(%ebp),%eax
    16ba:	f7 d8                	neg    %eax
    16bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
    16bf:	eb 06                	jmp    16c7 <printint+0x31>
  } else {
    x = xx;
    16c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    16c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    16c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    16ce:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    16d1:	8d 41 01             	lea    0x1(%ecx),%eax
    16d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    16d7:	8b 5d 10             	mov    0x10(%ebp),%ebx
    16da:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16dd:	ba 00 00 00 00       	mov    $0x0,%edx
    16e2:	f7 f3                	div    %ebx
    16e4:	89 d0                	mov    %edx,%eax
    16e6:	0f b6 80 8c 20 00 00 	movzbl 0x208c(%eax),%eax
    16ed:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    16f1:	8b 5d 10             	mov    0x10(%ebp),%ebx
    16f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16f7:	ba 00 00 00 00       	mov    $0x0,%edx
    16fc:	f7 f3                	div    %ebx
    16fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1701:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1705:	75 c7                	jne    16ce <printint+0x38>
  if(neg)
    1707:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    170b:	74 2d                	je     173a <printint+0xa4>
    buf[i++] = '-';
    170d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1710:	8d 50 01             	lea    0x1(%eax),%edx
    1713:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1716:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    171b:	eb 1d                	jmp    173a <printint+0xa4>
    putc(fd, buf[i]);
    171d:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1720:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1723:	01 d0                	add    %edx,%eax
    1725:	0f b6 00             	movzbl (%eax),%eax
    1728:	0f be c0             	movsbl %al,%eax
    172b:	83 ec 08             	sub    $0x8,%esp
    172e:	50                   	push   %eax
    172f:	ff 75 08             	pushl  0x8(%ebp)
    1732:	e8 3c ff ff ff       	call   1673 <putc>
    1737:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    173a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    173e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1742:	79 d9                	jns    171d <printint+0x87>
    putc(fd, buf[i]);
}
    1744:	90                   	nop
    1745:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1748:	c9                   	leave  
    1749:	c3                   	ret    

0000174a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    174a:	55                   	push   %ebp
    174b:	89 e5                	mov    %esp,%ebp
    174d:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1750:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1757:	8d 45 0c             	lea    0xc(%ebp),%eax
    175a:	83 c0 04             	add    $0x4,%eax
    175d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    1760:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1767:	e9 59 01 00 00       	jmp    18c5 <printf+0x17b>
    c = fmt[i] & 0xff;
    176c:	8b 55 0c             	mov    0xc(%ebp),%edx
    176f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1772:	01 d0                	add    %edx,%eax
    1774:	0f b6 00             	movzbl (%eax),%eax
    1777:	0f be c0             	movsbl %al,%eax
    177a:	25 ff 00 00 00       	and    $0xff,%eax
    177f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1782:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1786:	75 2c                	jne    17b4 <printf+0x6a>
      if(c == '%'){
    1788:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    178c:	75 0c                	jne    179a <printf+0x50>
        state = '%';
    178e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    1795:	e9 27 01 00 00       	jmp    18c1 <printf+0x177>
      } else {
        putc(fd, c);
    179a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    179d:	0f be c0             	movsbl %al,%eax
    17a0:	83 ec 08             	sub    $0x8,%esp
    17a3:	50                   	push   %eax
    17a4:	ff 75 08             	pushl  0x8(%ebp)
    17a7:	e8 c7 fe ff ff       	call   1673 <putc>
    17ac:	83 c4 10             	add    $0x10,%esp
    17af:	e9 0d 01 00 00       	jmp    18c1 <printf+0x177>
      }
    } else if(state == '%'){
    17b4:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    17b8:	0f 85 03 01 00 00    	jne    18c1 <printf+0x177>
      if(c == 'd'){
    17be:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    17c2:	75 1e                	jne    17e2 <printf+0x98>
        printint(fd, *ap, 10, 1);
    17c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17c7:	8b 00                	mov    (%eax),%eax
    17c9:	6a 01                	push   $0x1
    17cb:	6a 0a                	push   $0xa
    17cd:	50                   	push   %eax
    17ce:	ff 75 08             	pushl  0x8(%ebp)
    17d1:	e8 c0 fe ff ff       	call   1696 <printint>
    17d6:	83 c4 10             	add    $0x10,%esp
        ap++;
    17d9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    17dd:	e9 d8 00 00 00       	jmp    18ba <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    17e2:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    17e6:	74 06                	je     17ee <printf+0xa4>
    17e8:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    17ec:	75 1e                	jne    180c <printf+0xc2>
        printint(fd, *ap, 16, 0);
    17ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17f1:	8b 00                	mov    (%eax),%eax
    17f3:	6a 00                	push   $0x0
    17f5:	6a 10                	push   $0x10
    17f7:	50                   	push   %eax
    17f8:	ff 75 08             	pushl  0x8(%ebp)
    17fb:	e8 96 fe ff ff       	call   1696 <printint>
    1800:	83 c4 10             	add    $0x10,%esp
        ap++;
    1803:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1807:	e9 ae 00 00 00       	jmp    18ba <printf+0x170>
      } else if(c == 's'){
    180c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1810:	75 43                	jne    1855 <printf+0x10b>
        s = (char*)*ap;
    1812:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1815:	8b 00                	mov    (%eax),%eax
    1817:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    181a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    181e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1822:	75 25                	jne    1849 <printf+0xff>
          s = "(null)";
    1824:	c7 45 f4 f0 1b 00 00 	movl   $0x1bf0,-0xc(%ebp)
        while(*s != 0){
    182b:	eb 1c                	jmp    1849 <printf+0xff>
          putc(fd, *s);
    182d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1830:	0f b6 00             	movzbl (%eax),%eax
    1833:	0f be c0             	movsbl %al,%eax
    1836:	83 ec 08             	sub    $0x8,%esp
    1839:	50                   	push   %eax
    183a:	ff 75 08             	pushl  0x8(%ebp)
    183d:	e8 31 fe ff ff       	call   1673 <putc>
    1842:	83 c4 10             	add    $0x10,%esp
          s++;
    1845:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1849:	8b 45 f4             	mov    -0xc(%ebp),%eax
    184c:	0f b6 00             	movzbl (%eax),%eax
    184f:	84 c0                	test   %al,%al
    1851:	75 da                	jne    182d <printf+0xe3>
    1853:	eb 65                	jmp    18ba <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1855:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    1859:	75 1d                	jne    1878 <printf+0x12e>
        putc(fd, *ap);
    185b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    185e:	8b 00                	mov    (%eax),%eax
    1860:	0f be c0             	movsbl %al,%eax
    1863:	83 ec 08             	sub    $0x8,%esp
    1866:	50                   	push   %eax
    1867:	ff 75 08             	pushl  0x8(%ebp)
    186a:	e8 04 fe ff ff       	call   1673 <putc>
    186f:	83 c4 10             	add    $0x10,%esp
        ap++;
    1872:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1876:	eb 42                	jmp    18ba <printf+0x170>
      } else if(c == '%'){
    1878:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    187c:	75 17                	jne    1895 <printf+0x14b>
        putc(fd, c);
    187e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1881:	0f be c0             	movsbl %al,%eax
    1884:	83 ec 08             	sub    $0x8,%esp
    1887:	50                   	push   %eax
    1888:	ff 75 08             	pushl  0x8(%ebp)
    188b:	e8 e3 fd ff ff       	call   1673 <putc>
    1890:	83 c4 10             	add    $0x10,%esp
    1893:	eb 25                	jmp    18ba <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1895:	83 ec 08             	sub    $0x8,%esp
    1898:	6a 25                	push   $0x25
    189a:	ff 75 08             	pushl  0x8(%ebp)
    189d:	e8 d1 fd ff ff       	call   1673 <putc>
    18a2:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    18a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18a8:	0f be c0             	movsbl %al,%eax
    18ab:	83 ec 08             	sub    $0x8,%esp
    18ae:	50                   	push   %eax
    18af:	ff 75 08             	pushl  0x8(%ebp)
    18b2:	e8 bc fd ff ff       	call   1673 <putc>
    18b7:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    18ba:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    18c1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    18c5:	8b 55 0c             	mov    0xc(%ebp),%edx
    18c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18cb:	01 d0                	add    %edx,%eax
    18cd:	0f b6 00             	movzbl (%eax),%eax
    18d0:	84 c0                	test   %al,%al
    18d2:	0f 85 94 fe ff ff    	jne    176c <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    18d8:	90                   	nop
    18d9:	c9                   	leave  
    18da:	c3                   	ret    

000018db <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    18db:	55                   	push   %ebp
    18dc:	89 e5                	mov    %esp,%ebp
    18de:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    18e1:	8b 45 08             	mov    0x8(%ebp),%eax
    18e4:	83 e8 08             	sub    $0x8,%eax
    18e7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18ea:	a1 0c 21 00 00       	mov    0x210c,%eax
    18ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
    18f2:	eb 24                	jmp    1918 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    18f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18f7:	8b 00                	mov    (%eax),%eax
    18f9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    18fc:	77 12                	ja     1910 <free+0x35>
    18fe:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1901:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1904:	77 24                	ja     192a <free+0x4f>
    1906:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1909:	8b 00                	mov    (%eax),%eax
    190b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    190e:	77 1a                	ja     192a <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1910:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1913:	8b 00                	mov    (%eax),%eax
    1915:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1918:	8b 45 f8             	mov    -0x8(%ebp),%eax
    191b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    191e:	76 d4                	jbe    18f4 <free+0x19>
    1920:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1923:	8b 00                	mov    (%eax),%eax
    1925:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1928:	76 ca                	jbe    18f4 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    192a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    192d:	8b 40 04             	mov    0x4(%eax),%eax
    1930:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1937:	8b 45 f8             	mov    -0x8(%ebp),%eax
    193a:	01 c2                	add    %eax,%edx
    193c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    193f:	8b 00                	mov    (%eax),%eax
    1941:	39 c2                	cmp    %eax,%edx
    1943:	75 24                	jne    1969 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    1945:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1948:	8b 50 04             	mov    0x4(%eax),%edx
    194b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    194e:	8b 00                	mov    (%eax),%eax
    1950:	8b 40 04             	mov    0x4(%eax),%eax
    1953:	01 c2                	add    %eax,%edx
    1955:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1958:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    195b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    195e:	8b 00                	mov    (%eax),%eax
    1960:	8b 10                	mov    (%eax),%edx
    1962:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1965:	89 10                	mov    %edx,(%eax)
    1967:	eb 0a                	jmp    1973 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    1969:	8b 45 fc             	mov    -0x4(%ebp),%eax
    196c:	8b 10                	mov    (%eax),%edx
    196e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1971:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1973:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1976:	8b 40 04             	mov    0x4(%eax),%eax
    1979:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1980:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1983:	01 d0                	add    %edx,%eax
    1985:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1988:	75 20                	jne    19aa <free+0xcf>
    p->s.size += bp->s.size;
    198a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    198d:	8b 50 04             	mov    0x4(%eax),%edx
    1990:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1993:	8b 40 04             	mov    0x4(%eax),%eax
    1996:	01 c2                	add    %eax,%edx
    1998:	8b 45 fc             	mov    -0x4(%ebp),%eax
    199b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    199e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19a1:	8b 10                	mov    (%eax),%edx
    19a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19a6:	89 10                	mov    %edx,(%eax)
    19a8:	eb 08                	jmp    19b2 <free+0xd7>
  } else
    p->s.ptr = bp;
    19aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19ad:	8b 55 f8             	mov    -0x8(%ebp),%edx
    19b0:	89 10                	mov    %edx,(%eax)
  freep = p;
    19b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19b5:	a3 0c 21 00 00       	mov    %eax,0x210c
}
    19ba:	90                   	nop
    19bb:	c9                   	leave  
    19bc:	c3                   	ret    

000019bd <morecore>:

static Header*
morecore(uint nu)
{
    19bd:	55                   	push   %ebp
    19be:	89 e5                	mov    %esp,%ebp
    19c0:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    19c3:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    19ca:	77 07                	ja     19d3 <morecore+0x16>
    nu = 4096;
    19cc:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    19d3:	8b 45 08             	mov    0x8(%ebp),%eax
    19d6:	c1 e0 03             	shl    $0x3,%eax
    19d9:	83 ec 0c             	sub    $0xc,%esp
    19dc:	50                   	push   %eax
    19dd:	e8 7b f5 ff ff       	call   f5d <sbrk>
    19e2:	83 c4 10             	add    $0x10,%esp
    19e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    19e8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    19ec:	75 07                	jne    19f5 <morecore+0x38>
    return 0;
    19ee:	b8 00 00 00 00       	mov    $0x0,%eax
    19f3:	eb 26                	jmp    1a1b <morecore+0x5e>
  hp = (Header*)p;
    19f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    19fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19fe:	8b 55 08             	mov    0x8(%ebp),%edx
    1a01:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1a04:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a07:	83 c0 08             	add    $0x8,%eax
    1a0a:	83 ec 0c             	sub    $0xc,%esp
    1a0d:	50                   	push   %eax
    1a0e:	e8 c8 fe ff ff       	call   18db <free>
    1a13:	83 c4 10             	add    $0x10,%esp
  return freep;
    1a16:	a1 0c 21 00 00       	mov    0x210c,%eax
}
    1a1b:	c9                   	leave  
    1a1c:	c3                   	ret    

00001a1d <malloc>:

void*
malloc(uint nbytes)
{
    1a1d:	55                   	push   %ebp
    1a1e:	89 e5                	mov    %esp,%ebp
    1a20:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a23:	8b 45 08             	mov    0x8(%ebp),%eax
    1a26:	83 c0 07             	add    $0x7,%eax
    1a29:	c1 e8 03             	shr    $0x3,%eax
    1a2c:	83 c0 01             	add    $0x1,%eax
    1a2f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1a32:	a1 0c 21 00 00       	mov    0x210c,%eax
    1a37:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1a3a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a3e:	75 23                	jne    1a63 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1a40:	c7 45 f0 04 21 00 00 	movl   $0x2104,-0x10(%ebp)
    1a47:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a4a:	a3 0c 21 00 00       	mov    %eax,0x210c
    1a4f:	a1 0c 21 00 00       	mov    0x210c,%eax
    1a54:	a3 04 21 00 00       	mov    %eax,0x2104
    base.s.size = 0;
    1a59:	c7 05 08 21 00 00 00 	movl   $0x0,0x2108
    1a60:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a63:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a66:	8b 00                	mov    (%eax),%eax
    1a68:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a6e:	8b 40 04             	mov    0x4(%eax),%eax
    1a71:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1a74:	72 4d                	jb     1ac3 <malloc+0xa6>
      if(p->s.size == nunits)
    1a76:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a79:	8b 40 04             	mov    0x4(%eax),%eax
    1a7c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1a7f:	75 0c                	jne    1a8d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1a81:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a84:	8b 10                	mov    (%eax),%edx
    1a86:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a89:	89 10                	mov    %edx,(%eax)
    1a8b:	eb 26                	jmp    1ab3 <malloc+0x96>
      else {
        p->s.size -= nunits;
    1a8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a90:	8b 40 04             	mov    0x4(%eax),%eax
    1a93:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1a96:	89 c2                	mov    %eax,%edx
    1a98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a9b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1a9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aa1:	8b 40 04             	mov    0x4(%eax),%eax
    1aa4:	c1 e0 03             	shl    $0x3,%eax
    1aa7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1aaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aad:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1ab0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1ab3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ab6:	a3 0c 21 00 00       	mov    %eax,0x210c
      return (void*)(p + 1);
    1abb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1abe:	83 c0 08             	add    $0x8,%eax
    1ac1:	eb 3b                	jmp    1afe <malloc+0xe1>
    }
    if(p == freep)
    1ac3:	a1 0c 21 00 00       	mov    0x210c,%eax
    1ac8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1acb:	75 1e                	jne    1aeb <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    1acd:	83 ec 0c             	sub    $0xc,%esp
    1ad0:	ff 75 ec             	pushl  -0x14(%ebp)
    1ad3:	e8 e5 fe ff ff       	call   19bd <morecore>
    1ad8:	83 c4 10             	add    $0x10,%esp
    1adb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1ade:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ae2:	75 07                	jne    1aeb <malloc+0xce>
        return 0;
    1ae4:	b8 00 00 00 00       	mov    $0x0,%eax
    1ae9:	eb 13                	jmp    1afe <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1aeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aee:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1af1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1af4:	8b 00                	mov    (%eax),%eax
    1af6:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1af9:	e9 6d ff ff ff       	jmp    1a6b <malloc+0x4e>
}
    1afe:	c9                   	leave  
    1aff:	c3                   	ret    
