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

	public class SsnValidator extends RegExpValidator 
	{
		private var regex:String = "^[0-9]{3}(-| )[0-9]{2}(-| )[0-9]{4}$";
		
		public function SsnValidator() 
		{
			this.expression = regex;
			super();
		}
		
	}
}