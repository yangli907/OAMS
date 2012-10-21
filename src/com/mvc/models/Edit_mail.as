package com.mvc.models
{
	[RemoteClass(alias="appmanage.cfcs.mvc.Edit_mail.mailaddrBean")]

	[Bindable]
	public class Edit_mail
	{
		public var id:Number = 0;
		public var pid:String = "";
		public var fname:String = "";
		public var lname:String = "";
		public var email:String = "";
		public var addr:String = "";
		public var city:String = "";
		public var state:String = "";
		public var zip:String = "";
		public var country:String = "";
		public var decision:String = "";
		public var progno:String = "";
		

		public function Edit_mail()
		{
		}

	}
}