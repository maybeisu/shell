
#Q:编写一个服务，用于查询之前定义好的信息。如在服务器端定义了foo=2014 那么客户端可以通过foo得到2014这个数据。 

#思路：服务端启动定义服务的功能，定义服务格式为：msg＝value，将定义好的信息保存在字典里 ，并等待客户端连接，客户端发送msg到服务端查询已经定义好的value，服务端查询字典里面有没有这个信息，如果有则返回，如果没有，则返回错误信息。

import socket,sys,string
host="localhost"
port=8081

def getmsg():
	sock=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	sock.connect((host,port))
	message = raw_input(“msg-defined:”)
	sock.send(message.strip())
	print sock.recv(1024)
	sock.close()

if __name__=="__main__":
	while True:
		getmsg()


