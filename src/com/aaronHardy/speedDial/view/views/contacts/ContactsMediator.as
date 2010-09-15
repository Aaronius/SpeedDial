package com.aaronHardy.speedDial.view.views.contacts
{
	import com.aaronHardy.speedDial.controller.events.CallEvent;
	import com.aaronHardy.speedDial.controller.events.StatusMessageEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.model.events.AppModelEvent;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ContactsMediator extends Mediator
	{
		[Inject]
		public var model:AppModel;
		
		[Inject]
		public var view:Contacts;
		
		override public function onRegister():void
		{
			super.onRegister();
			
			eventMap.mapListener(
					eventDispatcher, 
					AppModelEvent.CONTACTS_CHANGED,
					model_contactsChangedHandler);
			updateViewContacts();
			
			eventMap.mapListener(view,
					CallEvent.CALL_TRIGGERED,
					redispatch);
			
			eventMap.mapListener(view,
					StatusMessageEvent.ADD_STATUS,
					redispatch);
		}
		
		protected function model_contactsChangedHandler(event:AppModelEvent):void
		{
			updateViewContacts();
		}
		
		protected function updateViewContacts():void
		{
			view.contacts = model.contacts;
		}

		protected function redispatch(event:Event):void
		{
			dispatch(event);
		}
	}
}