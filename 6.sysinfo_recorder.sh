#!bin/sh

#Q:写一个本地服务，定时的搜集系统的cpu使用情况并记录下来。
#需要考虑到cup的使用情况包括哪项信息，用什么方式存储数据（记录文件的大小不能一直增长，记录的数据易于展示）。

#思路：写入crontab服务：每三分钟记录一次top信息，每1天切割一次记录日志，每十天打包一次旧的日志。

usrname=$(whoami)
tabfile="/var/spool/cron/"username

echo "3 * * * * echo -n \$(date +%Y-%m-%d-%H-%M) >>/tmp/cpu.log ; top -n 1|grep \"Cpu\" >>/tmp/cpu.log " >> $tabfile
echo "* */1 * * * cat /tmp/cpu.log >> /tmp/cpu_old\$(date +%Y-%m-%d-%H-%M).log ; rm /tmp/cpu.log" >> $tabfile
echo "* * 10 * * * tar -zcvf /tmp/cpu_\$(date +%Y-%m-%d-%H-%M).tar.gz /tmp/cpu_old*" >> $tabfile
