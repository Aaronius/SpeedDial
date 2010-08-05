package com.aaronHardy.speedDial.view.views.contacts
{
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.model.events.AppModelEvent;
	import com.aaronHardy.speedDial.controller.events.CallEvent;
	
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
					view_callTriggeredHandler);
		}
		
		protected function model_contactsChangedHandler(event:AppModelEvent):void
		{
			updateViewContacts();
		}
		
		protected function updateViewContacts():void
		{
			view.contacts = model.contacts;
		}

		protected function view_callTriggeredHandler(event:CallEvent):void
		{
			dispatch(event);
		}
	}
}