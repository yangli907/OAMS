package com.mvc.models
{
	[RemoteClass(alias="appmanage.cfcs.mvc.Edit_uploadFiles.uploadfilesBean")]

	[Bindable]
	public class uploadfilesBean
	{

		public var id:Number = 0;
		public var aid:Number = 0;
		public var filename:String = "";
		public var originalname:String = "";
		public var path:String = "";
		public var user:String = "";


		public function uploadfilesBean()
		{
		}

	}
}