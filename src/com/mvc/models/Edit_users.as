package com.mvc.models
{
	[RemoteClass(alias="framework.cfcs.mvc.Edit_users.usersBean")]

	[Bindable]
	public class Edit_users
	{

		public var id:Number = 0;
		public var first:String = "";
		public var last:String = "";
		public var email:String = "";
		public var phone:String = "";
		public var loc:String = "";
		public var grp:Number = 0;
		public var pass:String = "";
		public var admin:Number = 0;
		public var sgrp:Number = 0;
		public var sgadmin:Number = 0;


		public function Edit_users()
		{
		}

	}
}