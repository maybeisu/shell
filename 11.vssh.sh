#!/bin/bash
#Q:在对单台机器做操作时我们经常会用“ssh ip”的方式登录到一台服务器上，能不能编写这样一个工具vssh ip1,ip2,...ipn来模拟登录到n台服务器， 登录后所有操作相当于同时对n台服务器生效。

#思路：将host和passwd写在单独的一个文件里面，每次从文件里面读取host和passwd，并在后台模拟手动输入的结果，并发送命令到读取到的host

dir="~/"
$command=$1

while read line
do
host=`echo $line| awk '{print $1}'`  #host
passwd=`echo $line | awk '{print $2}'` #password
$dir/ssh.sh $host $passwd  $command&
done < $dir/host.txt  #存储host和password 的文本


