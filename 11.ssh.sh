#!/usr/bin/env expect
#三个参数，一个主机ip，一个密码，一个命令，通过expect免输入登录，
#当然也可以事先配置成ssh免密码登录
set HOST $1
set PASSWD $2
spawn ssh root@$HOST
expect  "(yes/no)?" { send "yes\n" }
expect "*password:" { send "$PASSWD\n" }
expect "*password:" { send "$PASSWD\n" }
expect "*#" { send "$3\n" } 
expect eof