package com.aaronHardy.speedDial.view.views.options
{
	import com.aaronHardy.speedDial.controller.events.ContactsCredentialsEvent;
	import com.aaronHardy.speedDial.controller.events.PhoneCredentialsEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.model.events.AppModelEvent;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class OptionsMediator extends Mediator
	{
		[Inject]
		public var view:Options;
		
		[Inject]
		public var model:AppModel;
		
		override public function onRegister():void
		{
			super.onRegister();
			
			eventMap.mapListener(
					eventDispatcher, 
					AppModelEvent.AUTHENTICATING_CHANGED,
					model_authenticatingChangedHandler);
			updateViewAuthenticating();
			
			eventMap.mapListener(
					eventDispatcher,
					AppModelEvent.CONTACTS_CHANGED,
					model_contactsChangedHandler);
			updateViewOpened();
			
			view.addEventListener(
					ContactsCredentialsEvent.AUTHENTICATION_TRIGGERED,
					redispatch);
			view.addEventListener(
					PhoneCredentialsEvent.CREDENTIALS_SAVE_TRIGGERED,
					redispatch);
		}
		
		protected function model_authenticatingChangedHandler(event:AppModelEvent):void
		{
			updateViewAuthenticating();
		}
		
		protected function redispatch(event:Event):void
		{
			dispatch(event);
		}
		
		protected function updateViewAuthenticating():void
		{
			view.authenticating = model.authenticating;
		}
		
		protected function model_contactsChangedHandler(event:AppModelEvent):void
		{
			updateViewOpened();
		}
		
		protected function updateViewOpened():void
		{
			if (model.contacts)
			{
				view.open = false;
			}
		}
	}
}