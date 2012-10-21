package com.mvc.models
{
	[RemoteClass(alias="appmanage.cfcs.mvc.Edit_stuinfo.stuinfoBean")]

	[Bindable]
	public class Edit_stuinfo
	{

		public var id:Number = 0;
		public var pid:String = "";
		public var lname:String = "";
		public var fname:String = "";
		public var gender:String = "";
		public var dob:Date = null;


		public function Edit_stuinfo()
		{
		}

	}
}