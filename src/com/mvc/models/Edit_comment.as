package com.mvc.models
{
	[RemoteClass(alias="appmanage.cfcs.mvc.Edit_comment.commentBean")]

	[Bindable]
	public class Edit_comment
	{

		public var id:Number = 0;
		public var pid:Number = 0;
		public var content:String = "";
		public var addtime:Date = null;
		public var user:String = "";
		public var broadcast:Number = 0;

		public function Edit_comment()
		{
		}

	}
}