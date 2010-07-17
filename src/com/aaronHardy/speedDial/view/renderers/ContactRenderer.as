package com.aaronHardy.speedDial.view.renderers
{
	import com.aaronHardy.speedDial.controller.events.CallEvent;
	import com.aaronHardy.speedDial.model.vo.Contact;
	import com.aaronHardy.speedDial.view.skin.ButtonSkin;
	
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
		
		private var contact:Contact;
		
		public function get data():Object
		{
			return contact;
		}
		
		public function set data(value:Object):void
		{
			contact = value as Contact;
			setNameLabelText();
			setPhoneLabelText();
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
			if (nameLabel && contact)
			{
				nameLabel.text = contact.name;
			}
		}
		
		protected function setPhoneLabelText():void
		{
			if (phoneLabel && contact)
			{
				phoneLabel.text = '111-111-1111';
			}
		}
		
		override protected function clickHandler(event:MouseEvent):void
		{
			super.clickHandler(event);
			dispatchEvent(new CallEvent(CallEvent.CALL_TRIGGERED, contact));
		}
	}
}