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

	public class GuidValidator extends RegExpValidator 
	{
		private var regex:String = "[A-Fa-f0-9]{8,8}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{12,12}";
		
		public function GuidValidator() 
		{
			this.expression = regex;
			super();
		}
		
	}
}