#Q:日志切割，有这样一个access.log每天会打出大量的日志。实现一个日志切割的功能，并说明该实现方式会有什么缺陷。

#思路：定时备份access.log，让日志分布在多个小文件中

import os , sys ,time

def mkdir(path):
        isExists=os.path.exists(path)
        if not isExists:
            os.makedirs(path)
            return True
        else:
            return False

date=time.strftime('%Y-%m-%d',time.localtime(time.time()))
curtime=time.strftime('%H-%M-%S',time.localtime(time.time()))

newlog=date + '/' + curtime + '_access.log';
mkdir(date);

os.rename("access.log",newlog);

#然后 crontab  -e 添加定时任务，每小时备份一次文件：
#0 * * * * * python task.py

