#!bin/sh

#Q:解析ifconfig命令的标准输出，返回一个hash。key是网卡名称 value是对应的ip。
#环境：macosx10.6，先统计ip，在machos上，有ip的网卡都在前面，所以统计有多少个ip，再去找前面对应个数的网卡名称，即可。

ip=$(ifconfig |grep "inet "|awk '{ip=0;getline;sub(/inet/,"");ip = $1;if(match(ip,"[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"))print ip}’)
row=$(echo $ip | wc -l)
echo $ip | read line
do
	key=$(ifconfig | grep "flags" | awk 'BEGIN {OFS=":"}{print $1}'| sed 's/://')
	echo $key" "$line
done
