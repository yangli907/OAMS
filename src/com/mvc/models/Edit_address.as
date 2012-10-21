package com.mvc.models
{
	[RemoteClass(alias="appmanage.cfcs.mvc.Edit_address.addressBean")]

	[Bindable]
	public class Edit_address
	{

		public var id:Number = 0;
		public var sid:Number = 0;
		public var address1:String = "";
		public var address2:String = "";
		public var city:String = "";
		public var state:String = "";
		public var country:String = "";
		public var zip:String = "";
		public var phone:String = "";
		public var email:String = "";


		public function Edit_address()
		{
		}

	}
}