package com.mvc.models
{
	[RemoteClass(alias="appmanage.cfcs.mvc.Edit_application.applicationBean")]

	[Bindable]
	public class Edit_application
	{

		public var id:Number = 0;
		public var sid:Number = 0;
		public var pid:String = "";
		public var decid:Number = 0;
		public var citizid:Number = 0;
		public var progcode:Number = 0;
		public var sessionid:Number = 0;
		public var batrans:String = "";
		public var matrans:String = "";
		public var grev:String = "";
		public var greq:String = "";
		public var grea:String = "";
		public var toefl:String = "";
		public var letter1:String = "";
		public var letter2:String = "";
		public var letter3:String = "";
		public function Edit_application()
		{
		}

	}
}