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
	import mx.core.IFactory;
	import com.adobe.ColdFusion.components.BindableComboBox;

	public class DataGridComboFactory implements IFactory
	{
		private var column:DataGridComboColumn;
		
		public function DataGridComboFactory(column:DataGridComboColumn)
		{
			this.column = column;
		}
		
		public function newInstance():*
		{
			var combo:BindableComboBox = new BindableComboBox();
			combo.dataProvider = column.dataProvider;
			combo.labelFields = column.labelFields;
			combo.valueField = column.valueField;
			return combo;
		}
		
	}
}