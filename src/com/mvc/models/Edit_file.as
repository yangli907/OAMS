package com.mvc.models
{
	[RemoteClass(alias="appmanage.cfcs.mvc.Edit_file.fileBean")]

	[Bindable]
	public class Edit_file
	{

		public var id:Number = 0;
		public var aid:Number = 0;
		public var name:String = "";
		public var path:String = "";
		public var typeid:Number = 0;


		public function Edit_file()
		{
		}

	}
}