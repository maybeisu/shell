
import socket
import threading,sys,string

port=8081
list=20
msg={}
def defineMsg():
	print "define a msg like foo=2014"
	while True:
		str=raw_input()
		result=str.split('=')
		dic[result[0].strip()]=result[1].strip()


def handle(client,address):
	try:
		client.settimeout(1000)
		buf=client.recv(1024)
		if buf in msg.keys():
			client.send(str(msg[buf]))
		else:
			client.send("%s not defined " % buf)
	except socket.timeout:
		print 'time out'
	client.close()


def main():

	thread=threading.Thread(target=defineMsg)
	thread.start()

	sock=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	sock.bind(('localhost',port))
	sock.listen(list)
	
	while True:
		client,address = sock.accept()
		handleRequest = threading.Thread(target=handle,args=(client,address))
		handleRequest.start()

if __name__=="__main__":
	main()
