// ActionScript file
package {
	[Bindable]
	public class User {
		public var id:Number = 0;
		public var sgrp:Number = 0;
		public var grp:Number = 0;
		public var admin:Boolean = false;
		public var sgadmin:Boolean = false;
		public var sel_sg:Number = 0;
		public var first:String = "";
		public var last:String = "";
		static private var myInstance:User;
		
		public function User(){
			
		}
		public static function getInstance():User {
			if (User.myInstance == null) {
				User.myInstance = new User();
			}
			
			return User.myInstance;
		}
	}
}