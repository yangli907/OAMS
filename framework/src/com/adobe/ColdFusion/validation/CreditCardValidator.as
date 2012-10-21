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
	import mx.validators.Validator;
	import mx.validators.ValidationResult;

	public class CreditCardValidator extends Validator 
	{
		public static var INVALIDCREDITCARD:String = "Invalid credit card number.";
		public static var INVALIDCREDITCARDCHAR:String = "Invalid credit card character.";
		public static var INVALIDCREDITCARDLENGTH:String = "Invalid credit card length.";
		
		public function CreditCardValidator() 
		{
			super();
		}
		
		override protected function doValidation(value:Object):Array
	    {
			var results:Array = super.doValidation(value);
			
			// Return if there are errors
			// or if the required property is set to false and length is 0.
			var val:String = value ? String(value) : "";
			if (results.length > 0 || ((val.length == 0) && !required))
				return results;
			else
			    return CreditCardValidator.validateCreditCard(this, val, null);
	    }
		
		
	
		/**
		 *  Convenience method for calling a validator.
		 *  Each of the standard Flex validators has a similar convenience method.
		 *
		 *  @param validator The CreditCardValidator instance.
		 *
		 *  @param value A field to validate.
		 *
		 *  @param baseField Text representation of the subfield
		 *  specified in the <code>value</code> parameter.
		 *  For example, if the <code>value</code> parameter specifies
		 *  value.mystring, the <code>baseField</code> value
		 *  is <code>"mystring"</code>.
	     *
		 *  @return An Array of ValidationResult objects, with one
		 *  ValidationResult  object for each field examined by the validator. 
		 *
		 *  @see mx.validators.ValidationResult
		 */		
		public static function validateCreditCard(validator:CreditCardValidator, object_value:String, baseField:String):Array
		{
			var results:Array = [];
			
		//trim whitespace before we validate
		    var object_value:String = object_value.replace(/^\s+/,'').replace(/\s+$/,'');
		
			if (object_value.length == 0)
			{
				results.push( new ValidationResult(false, baseField, "","") );
				return results;
			}
			var white_space:String = " -";
			var creditcard_string:String="";
			var check_char:Number;
		
			
			for (var i:int = 0; i < object_value.length; i++)
			{
				check_char = white_space.indexOf(object_value.charAt(i)) as Number;
				if (check_char < 0)
					creditcard_string += object_value.substring(i, (i + 1));
			}	
		

			if (creditcard_string.length < 13 || creditcard_string.length > 19)
			{
			trace("cc length:" +creditcard_string.length);
				results.push( new ValidationResult(true, baseField, "invalid", CreditCardValidator.INVALIDCREDITCARDLENGTH) );
				return results;	
			}
		
			if (creditcard_string.charAt(0) == "+")
			{
				results.push( new ValidationResult(true, baseField, "invalid", CreditCardValidator.INVALIDCREDITCARDCHAR) );
				return results;	
			}
		
			//if (!_CF_checkinteger(creditcard_string))
			//	return false;
		
			var doubledigit:Boolean = creditcard_string.length % 2 == 1 ? false : true;
			var checkdigit:Number = 0;
			var tempdigit:Number;
		
			for (var i:int = 0; i < creditcard_string.length; i++)
			{
				tempdigit = new Number(creditcard_string.charAt(i));
		
				if (doubledigit)
				{
					tempdigit *= 2;
					checkdigit += (tempdigit % 10);
		
					if ((tempdigit / 10) >= 1.0)
						checkdigit++;
		
					doubledigit = false;
				}
				else
				{
					checkdigit += tempdigit;
					doubledigit = true;
				}
			}	
		
			
			if( (checkdigit % 10) == 0 )
			{
				//results.push( new ValidationResult(false, baseField, "","") );
				return results;	
			}
			else
			{
				results.push( new ValidationResult(true, baseField, "invalid", CreditCardValidator.INVALIDCREDITCARD) );
				return results;	
			}
			
		}
		
	}
}