////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2003-2006 Adobe Macromedia Software LLC and its licensors.
//  All Rights Reserved. The following is Source Code and is subject to all
//  restrictions on such code as contained in the End User License Agreement
//  accompanying this product. If you have received this file from a source
//  other than Adobe, then your use, modification, or distribution of this file
//  requires the prior written permission of Adobe.
//
//  @author Mike Nimer
////////////////////////////////////////////////////////////////////////////////

package com.adobe.windowedApplication.managers
{
	import mx.managers.PopUpManager;
	import mx.core.IFlexDisplayObject;
	import flash.display.DisplayObject;
	import mx.core.UIComponent;
	import mx.core.Application;
	import mx.controls.Alert;

	public class WindowManager extends PopUpManager 
	{
		public static var windowList:Array = [];
		
		public static function add(window:IFlexDisplayObject, parent:DisplayObject, modal:Boolean = false, childList:String = null):void
		{
			// track windows
			WindowManager.windowList[WindowManager.windowList.length] = window;

			// open window
			PopUpManager.addPopUp(window, parent, modal, childList);
			
			// cascade the windows
			WindowManager.position(window);
			// set the default size
			//WindowManager.resize(window);
			// or maximize them.
			// WindowManager.maximize(window);
		}
		
		public static function remove(win:IFlexDisplayObject):void
		{
			for(var i:int=0; i<WindowManager.windowList.length; i++)
			{
				if( WindowManager.windowList[i] == win )
				{
					WindowManager.windowList.splice(i, 1);	
					break;	
				}
			}
			PopUpManager.removePopUp(win);
		}
		
		public static function position(win:IFlexDisplayObject):void
		{
			var x:int =  WindowManager.windowList.length * 40;
			var y:int =  WindowManager.windowList.length * 40;
			
			if( WindowManager.windowList.length > 1 )
			{
				var c:IFlexDisplayObject = IFlexDisplayObject(WindowManager.windowList[WindowManager.windowList.length -1]); 
				//x = c.x;
				//y = c.y;
			}

			win.x = x;
			win.y = y;

			// cycle back around
			if( (win.x + win.width) > Application.application.width ) win.x = 40;
			if( (win.y + win.height) > Application.application.height ) win.y = 40;
		}
		
		// set a min. width/height
		public static function resize(win:IFlexDisplayObject):void
		{	
			var w:int = Application.application.width * .6;
			var h:int = Application.application.height * .6
			if( w > win.width )
				win.width = w;
			if( h > win.height )
				win.height=h;
		}
		
		public static function maximize(win:IFlexDisplayObject):void
		{					
			win.x=10;
			win.y=40;
			win.width = Application.application.width - 20;
			win.height = Application.application.height - 60;	
		}
	}
}