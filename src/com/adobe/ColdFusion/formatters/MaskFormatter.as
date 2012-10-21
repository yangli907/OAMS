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

package com.adobe.ColdFusion.formatters 
{
	import mx.formatters.Formatter;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.controls.TextInput;

	public class MaskFormatter extends Formatter 
	{
		
		/********** constructor **********/
		public function MaskFormatter(element:TextInput, mask:String) 
		{
			super();
			this.element = element;
			this.mask = mask;
		}

		private var element:TextInput;
		private var firsttime:Boolean = true;
		private var oldText:String = "";		
		private var _mask:String;
		
		private function set mask(m:String):void 
		{
			this._mask = m;
		}
		private function get mask():String
		{
			return this._mask;
		}

		
		
		/********** 
		validateSingle function
			description:
				Validates single character agains single mask component
			params: 
				ascchar: character
					single character, to test if it is correct in the context of the mask character 
				maskchar: character
					single mask character, see below for meaning
			returns: 
				boolean
		 **********/
		private function validateSingle(ascchar:String, maskchar:String):Boolean 
		{
			var cchar:int = ascchar.charCodeAt(0);
			switch (maskchar) 
			{
				case "9": //numeric
					if ( cchar > 47 && cchar < 58) 
					{
						return true;
					}
					break;
				case "A": //letter
					if ((cchar > 64 && cchar < 91) || (cchar > 96 && cchar < 123 )) 
					{
						return true;
					}
					break;
				case "X": //letter or numeric
					if ((cchar > 64 && cchar < 91) || (cchar > 96 && cchar < 123) || (cchar > 47 && cchar < 58)) 
					{
						return true;
					}
					break;
				case "?": //any character
					return true;
					break;
				default:
					return true;
					break;
			}
			return false;
		}
	
		/********** 
		maskDefaultValue function
			description:
				Called with a special mask character, returns the default value for that type of mask
			params:
				maskchar: character
					single mask character, see below for meaning
			returns:
				character
		**********/
		private function maskDefaultValue(maskchar:String):String
		{
			switch (maskchar) 
			{
				case "9": //numeric
					return '';
					break;
				case "A": //letter
					return '';
					break;
				case "X": //letter or numeric
					return '';
					break;
				case "?": //any character
					return '';
					break;
				default:
					return '';
					break;
			}
		}
	
		/********** 
		isSpecialChar function
			description:
				Checks if the parameter is a special mask character
			params:
				ascchar: character
					Special mask characters: 
					9 - numeric
					A - letters
					X - letter or number
					? - any character
			returns:
				boolean
		**********/
		private function isSpecialChar(ascchar:String):Boolean
		{
			if (ascchar == '9' || ascchar == 'A' || ascchar == 'X' || ascchar == '?')  
			{
				return true;
			} else {
				return false;
			}
		}
	
		/**********
		format function
			description:
				Called when 
					- the user types something in the input
					- the input loses the focus
				It validates the input's value against the input's mask
			params: 
				none
			returns:
				none
		**********/
		override public function format( value:Object ):String
		{		
			var mask:String = this._mask;
			var val:String = value.toString();
			var moveCursor:Boolean = false;
	
			
			if (this.firsttime == true) 
			{
				this.firsttime = false;
				return mask_parseFirstTime(val);
			}
			
			
	
			if (val == this.oldText) 
			{
				// if the field content did not change since the last update, do nothing
				return val;
			}
			if (val.length > mask.length) 
			{
				// strip trailing characters if text length is bigger than mask length
				val = val.substr(0, mask.length);
				moveCursor = true;
			}
			for (var i:int=0; i < mask.length ; i++) 
			{
				if (val.charCodeAt(i).toString() != 'NaN') 
				{
					//if the char is inserted
					if (isSpecialChar(mask.charAt(i))) 
					{
						if (validateSingle(val.charAt(i), mask.charAt(i))) 
						{
							//character is correct, go to next
							continue;
						} 
						else 
						{
							//revert to the last known good value, increase index to break loop
							val = this.oldText;
							i = mask.length;
							break;
						}
					} else {
						//normal character in the mask
						if (val.charAt(i) != mask.charAt(i)) 
						{
							//if the character is different from the mask
							if (i == val.length - 1) 
							{
								//append last character and move cursor to the end
								var lastChar:String = val.substr(val.length -1, val.length);
								val = val.substr(0, val.length -1) + mask.charAt(i) + lastChar;
								moveCursor = true;
								continue;
							} 
							else 
							{
								//revert to the last known good value, increase index to break loop
								val = this.oldText;
								i = mask.length;
							}
							break;
						}
					}
				} 
				else 
				{
					//if the current char is not inserted
					if (val.length < this.oldText.length) 
					{
						//deleted character
						break;
					}
					for (var x:int=i;x<mask.length;x++) 
					{
						if (!isSpecialChar(mask.charAt(x))) 
						{
							//re-enter the mask characters if it has been deleted
							val += mask.charAt(x);
							moveCursor = true;
						} 
						else 
						{
							break;
						}
					}
					break;
				}
			}
			if (val.length > mask.length) 
			{
				// strip trailing characters if text length is bigger than mask length
				val = val.substr(0, mask.length);
				moveCursor = true;
			}
			if (value != val) 
			{
				//element.text = val; //last calculated correct value
			}
			this.oldText = val; //update so we can check on next character
			if (moveCursor) 
			{
				//element.redraw();
				//element.setSelection(val.length, val.length); //move cursor to the end of the input
			}
		
			return val;
		}
	
		/********** 
		mask_parseFirstTime function
			description:
				Called from mask_onSetFocus, only the first time ( when obj.mask is undefined)
				Tries to parse the initial value into a valid format, with the following algorithm:
				- normalizes the string adding non special mask characters if they do not exist
				- it strips the mask of all non special characters
				- rebuilds the string using the stripped mask
				- compares the string with the stripped mask and changes the values if they are invalid
				- rebuild the string and returns
			params:
				none
			returns:
				none
		**********/
		public function mask_parseFirstTime(value:String):String
		{
			var strippedmask:String = ''; 
			var strippedvalue:String = '';
			var cond:int = 1; 
			var imask:int = 0; 
			var ival:int = 0;
			var cnt:int = 0;
	
			if( value.length == 0 )
			{
			    return value;
			}
			//NORMALIZE VALUE: add non special characters
			while (cond == 1) 
			{
				cond = 1;
				if (!isSpecialChar(mask.charAt(imask))) 
				{
					if (value.charCodeAt(ival).toString() != 'NaN') 
					{
						if (mask.charAt(imask) == value.charAt(ival)) 
						{
							imask++;ival++;
						} 
						else 
						{
							value = value.substr(0, ival) + mask.charAt(imask) + value.substr(ival, value.length);
							imask = 0; ival = 0; cond = 1;
						}
					} 
					else 
					{
						value += maskDefaultValue(mask.charAt(imask));
					}
				} 
				else 
				{
					imask++;ival++;
				}
				if (imask >= mask.length || ival >= value.length) 
				{
					cond = 0;
				}
			}
	
			//save only the special chars in a mask
			for (var i:int=0;i<mask.length;i++) 
			{
				if (isSpecialChar(mask.charAt(i))) 
				{
					strippedmask += mask.charAt(i);
					if (value.charCodeAt(i).toString() != 'NaN') 
					{
						strippedvalue += value.charAt(i);
					} else {
						strippedvalue += maskDefaultValue(mask.charAt(i));
					}
				}
			}
	
			this.oldText = value; //save the old value for reference
			return value;
			
			/*
			value = strippedvalue;
			var newvalue:String = '';
	
			//rebuild the string removing invalid values and replacing them with defaults
			for (i=0;i<strippedmask.length;i++) 
			{
					if (!validateSingle(value.charAt(i), strippedmask.charAt(i))) 
					{
						newvalue += maskDefaultValue(strippedmask.charAt(i));
					} else {
						newvalue += value.charAt(i);
					}
			}
	
			//rebuild the value,by adding the initial non special mask characters
			var toret:String = ''; 
			var j:int = 0; //j holds the index in the stripped mask
			for (var i:int=0;i<oldvalue.length;i++) 
			{
				if (isSpecialChar(mask.charAt(i))) 
				{
					toret += newvalue.charAt(j++);
				} else {
					toret += mask.charAt(i);
				}
			}
			this.firsttime = 0;
			return toret;
			*/
		}		
			
	}
}