package com.mail
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert; 
    
	public class MailUtil
	{
		private var socket:Socket;  
        private var smtp:String;  
        private var _user:String;
        private var _pwd:String;
        private var _mailFrom:String;
        private var _mailTo:String;
        private var _subject:String;
        private var _content:String;
        private var num:int=99;
        
        
		public function MailUtil(smtp:String)
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
            Alert.show("error!");
            Alert.show(String(evt.text));
        }  
          
        public function ConnectionHandler(evt:Event):void  
        {  
            Alert.show("链接成功");
        }  
          
        public function CloseHandler(evt:Event):void  
        {   
            Alert.show("已经从服务器断开");
        }  
          
        private function ReceiveHandler(evt:Event):void  
        {  
            var msg:String = "";  
            while(socket.bytesAvailable)  
            {  
                msg += socket.readMultiByte(socket.bytesAvailable,"utf8");  
            }  
            //Alert.show(msg);
            if(num==0){
            	sendUserName(_user);
            	num++;
            }else if(num==1){
            	sendPassword(_pwd);
            	num++;
            }else if(num==2){
            	setFromandTo(_mailFrom,_mailTo);
            	num++;
            }else if(num==3){
            	sendContent(_subject,_content);
            	num++;
            }else if(num==4){
            	Alert.show("发送成功");
            	num++;
            }
        }  
          
        public function Send(user:String, pwd:String, mailFrom:String, mailTo:String,subject:String,content:String):void  
        {  
            if(socket==null || !socket.connected)  
            {  
                initSocket(this.smtp);  
            }  
            
            this._user=user;
            this._pwd=pwd;
            this._mailFrom=mailFrom;
            this._mailTo=mailTo;
            this._subject=subject;
            this._content=content;
            Alert.show(this._user+" "+ this._content);
            sendHello();
            num=0;
        } 
        
        private function sendHello():void{
        	sendMessage("HELO mail"); 
            sendMessage("AUTH LOGIN"); 	
        } 
        
        private function sendUserName(user:String):void{
        	sendMessage(Base64.encode(user));
        }
        
        private function sendPassword(pwd:String):void{
        	sendMessage(Base64.encode(pwd));
        }
        
        private function setFromandTo(mailFrom:String,mailTo:String):void{
        	sendMessage("MAIL FROM: <"+mailFrom+">");  
            sendMessage("RCPT TO: <"+mailTo+">");  
            sendMessage("DATA");
        }
        
        private function sendContent(subject:String,content:String):void{
        	sendMessage("Content-Type: text/html");  
            sendMessage("Subject: "+subject);  
            sendMessage("");  
            sendMessage("");  
            sendMessage(content);  
            sendMessage(".");  
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