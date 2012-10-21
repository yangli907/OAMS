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

package com.adobe.windowedApplication.events
{
	import flash.events.Event;

	public class SelectionEvent extends Event
	{
		public var key:Object = null;
		
		public function SelectionEvent(type:String, key:Object)
		{
			super(type, true, true);
			this.key = key;
		}
		
	}
}