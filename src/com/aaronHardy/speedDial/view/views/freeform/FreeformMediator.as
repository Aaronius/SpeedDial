package com.aaronHardy.speedDial.view.views.freeform
{
	import com.aaronHardy.speedDial.controller.events.CallEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.model.events.AppModelEvent;
	import com.aaronHardy.speedDial.model.vo.Contact;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class FreeformMediator extends Mediator
	{
		[Inject]
		public var model:AppModel;
		
		[Inject]
		public var view:Freeform;
		
		override public function onRegister():void
		{
			super.onRegister();
			
			eventMap.mapListener(eventDispatcher,
					AppModelEvent.CLIPBOARD_CHANGED,
					model_clipboardChangedHandler);
			
			eventMap.mapListener(view.goButton,
					MouseEvent.CLICK,
					goButton_clickHandler);
		}
		
		protected function model_clipboardChangedHandler(event:AppModelEvent):void
		{
			if (model.clipboard)
			{
				view.open = true;
				view.phoneNumber = model.clipboard;
			}
		}
		
		protected function goButton_clickHandler(event:MouseEvent):void
		{
			var contact:Contact = new Contact();
			contact.name = 'Unknown';
			contact.phone = view.phoneInput.text;
			dispatch(new CallEvent(CallEvent.CALL_TRIGGERED, contact));
		}
	}
}