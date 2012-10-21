////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2003-2006 Adobe Macromedia Software LLC and its licensors.
//  All Rights Reserved. The following is Source Code and is subject to all
//  restrictions on such code as contained in the End User License Agreement
//  accompanying this product. If you have received this file from a source
//  other than Adobe, then your use, modification, or distribution of this file
//  requires the prior written permission of Adobe.
//
//  @author Dean Harmon
////////////////////////////////////////////////////////////////////////////////

package com.adobe.ColdFusion.components.datagrid
{
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.rpc.remoting.RemoteObject;
	import mx.controls.dataGridClasses.DataGridItemRenderer;
	import mx.core.ClassFactory;
	import mx.utils.ObjectUtil;
	import mx.collections.ArrayCollection;
	import mx.core.mx_internal;

	public class DataGridComboColumn extends DataGridColumn
	{
		private var _labelFields:Array = [];
		
		private var _valueField:String = "";
		
		private var _dataProvider:ArrayCollection = null;				
				
		public function DataGridComboColumn()
		{
			labelFunction=renderLabelFunction;
			
			var editItemFactory:DataGridComboFactory = new DataGridComboFactory(this);
			itemEditor = editItemFactory;
			editorDataField="selectedItemValue";
		}
		
		// make the item look pretty in the grid with the right values (what 
		// would be in the combo box)
		public function renderLabelFunction(item:Object, column:DataGridColumn):String 
		{
			if (_dataProvider != null && _labelFields.length > 0)
			{
				var row: Object;
				for (var i:int = 0; i < _dataProvider.length; i++)
				{
					row = _dataProvider.getItemAt(i);		
					if (row[dataField] == item[dataField])
					{
						var result:String = "";
						for(var j:int=0; j < _labelFields.length; j++)
						{
							if (j > 0)
							{
								result += " ";
							}
							 
							result += row[_labelFields[j]];
						}
						return result;
					}
				}
				//  we didn't find anything, display an empty string.
				return "";
			}

			//no data provider, show the actualy ID
			return item[dataField];
		}
		
		
		public function get dataProvider():ArrayCollection
		{
			return _dataProvider;
		}
		
		public function set dataProvider(value:ArrayCollection):void
		{
			_dataProvider = value;
			
	        if (mx_internal::owner)
	        {
	            mx_internal::owner.invalidateList();
	        }			
		}
		
		
		public function get labelFields():Array
		{
			return _labelFields;
		}
		
		public function set labelFields(value:Array):void
		{
			_labelFields = value;

	        if (mx_internal::owner && _dataProvider)
	        {
	            mx_internal::owner.invalidateList();
	        }
		}
		
		public function get valueField():String
		{
			return _valueField;
		}
		
		public function set valueField(value:String):void
		{
			_valueField = value;

	        if (mx_internal::owner && _dataProvider)
	        {
	            mx_internal::owner.invalidateList();
	        }
		}
		
		
	}
}