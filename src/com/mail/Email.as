package com.mail
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import mx.controls.Alert;
	import mx.formatters.DateFormatter;
	
	public class Email
	{
		private var socket:Socket;
		private var isLogin:Boolean = false;
		private var smtp:String;
		
		public function Email(smtp:String)
		{
			initSocket(smtp);
		}
		
		public function initSocket(smtp:String):void
		{
			this.smtp = smtp;
			if(socket==null || !socket.connected)
			{
				socket = new Socket();
				socket.connect(smtp,25);
				socket.addEventListener(Event.CONNECT,ConnectionHandler);
				socket.addEventListener(Event.CLOSE,CloseHandler);
				socket.addEventListener(ProgressEvent.SOCKET_DATA,ReceiveHandler);
				socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,ErrorHandler);
			}
		}
		
		private function ErrorHandler(evt:SecurityErrorEvent):void
		{
			trace("error!");
		}
		
		public function ConnectionHandler(evt:Event):void
		{
			trace("successful!");
		}
		
		public function CloseHandler(evt:Event):void
		{
			isLogin = false;
			trace("Disconnected");
		}
		
		private function ReceiveHandler(evt:Event):void
		{
			var msg:String = "";
			while(socket.bytesAvailable)
			{
				msg += socket.readMultiByte(socket.bytesAvailable,"utf8");
			}
			trace(msg);
		}
		
		public function Send(user:String, pwd:String, mailFrom:String, mailTo:String,subject:String,content:String):void
		{
			if(socket==null || !socket.connected)
			{
				initSocket(this.smtp);
			}
			sendMessage("HELO mail");
			if(!isLogin)
			{
				sendMessage("AUTH LOGIN");
				sendMessage(Base64.encode(user));
				sendMessage(Base64.encode(pwd));
				isLogin = true;
			}
			sendMessage("MAIL FROM: <"+mailFrom+">");
			sendMessage("RCPT TO: <"+mailTo+">");
			sendMessage("DATA");
			var dateFormatter:DateFormatter = new DateFormatter();
			dateFormatter.formatString = "yyyy-mm-dd";
			sendMessage("Date: "+dateFormatter.format(new Date()));
			sendMessage("From: "+mailFrom);
			sendMessage("To: "+mailTo);
			sendMessage("Content-Type: text/html");
			sendMessage("Subject: "+subject);
			sendMessage("");
			sendMessage("");
			sendMessage(content);
			sendMessage(".");
			//Alert.show(user+" From: "+mailFrom+" To: "+mailTo+" Send successfully!");
			
		}
		internal function sendMessage(msg:String):void
		{
			var message:ByteArray = new ByteArray();
			message.writeUTFBytes(msg+"\r\n");
			socket.writeBytes(message);
			socket.flush();
		}
	}
}