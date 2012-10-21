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

package com.adobe.ColdFusion.components 
{
	import mx.controls.TextInput;
	import com.adobe.ColdFusion.formatters.MaskFormatter;
	import mx.controls.Alert;
	import mx.utils.ObjectUtil;
	import flash.events.Event;

	public class TextInputMask extends TextInput 
	{
		private var _mask:String;
		private var maskFormatter:MaskFormatter;
		
		public function TextInputMask() 
		{
			super();
			this.addEventListener("change", onChange);
			this.addEventListener("creationComplete", onChange);
		}
		
		public function set inputMask(mask:String):void
		{
			this._mask = mask;
			this.maskFormatter = new MaskFormatter(this, this._mask);			
		}
		public function get inputMask():String
		{
			return this._mask;	
		}
		
		private function onChange(event:Event):void
		{
			if( this.maskFormatter != null )
			{
				this.text = this.maskFormatter.format(event.currentTarget.text);		
				this.validateNow();
				this.setSelection(this.text.length, this.text.length);
			}
			//Alert.show( ObjectUtil.toString(event.currentTarget.text)) ;
		}
		
	}
}