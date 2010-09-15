package com.aaronHardy.speedDial.view.renderers
{
	import com.aaronHardy.speedDial.controller.events.CallEvent;
	import com.aaronHardy.speedDial.controller.events.StatusMessageEvent;
	import com.aaronHardy.speedDial.model.vo.Contact;
	import com.aaronHardy.speedDial.view.skin.ContactRendererSkin;
	
	import flash.events.MouseEvent;
	
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.UIComponent;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.supportClasses.SkinnableComponent;
	
	public class ContactRenderer extends Button implements IListItemRenderer
	{
		[SkinPart(required="false")]
		public var nameLabel:Label;
		
		[SkinPart(required="false")]
		public var phoneLabel:Label;
		
		public function ContactRenderer()
		{
			percentWidth = 100;
		}
		
		private var _data:Object;
		private var dataChanged:Boolean;
		
		public function get data():Object
		{
			return _data;
		}
		
		public function set data(value:Object):void
		{
			if (_data != value)
			{
				_data = value;
				setNameLabelText();
				setPhoneLabelText();
			}
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if (instance == nameLabel)
			{
				setNameLabelText();
			}
			else if (instance == phoneLabel)
			{
				setPhoneLabelText();
			}
		}
		
		protected function setNameLabelText():void
		{
			if (nameLabel && Contact(data))
			{
				nameLabel.text = Contact(data).name;
			}
		}
		
		protected function setPhoneLabelText():void
		{
			if (phoneLabel && Contact(data))
			{
				if (Contact(data).phone && Contact(data).phone.length > 0)
				{
					phoneLabel.text = Contact(data).phone;
				}
				else
				{
					phoneLabel.text = 'No number listed.';
				}
			}
		}
		
		override protected function clickHandler(event:MouseEvent):void
		{
			super.clickHandler(event);
			
			if (data && Contact(data).phone && Contact(data).phone.length > 0)
			{
				dispatchEvent(new CallEvent(CallEvent.CALL_TRIGGERED, Contact(data)));
			}
			else
			{
				dispatchEvent(new StatusMessageEvent(StatusMessageEvent.ADD_STATUS,
						'No number listed.', 3000, true));
			}
		}
	}
}