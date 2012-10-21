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

package com.adobe.ColdFusion.validation 
{
	import mx.validators.RegExpValidator;

	public class TimeValidator extends RegExpValidator 
	{
		private var regex:String = "^(([0-1]?[0-9]|[2][1-4]):([0-5]?[0-9])(:[0-5]?[0-9])?).?([AP]M|[AP]m|[ap]m|[ap]M)?$";
		
		public function TimeValidator() 
		{
			this.expression = regex;
			super();
		}
		
	}
}