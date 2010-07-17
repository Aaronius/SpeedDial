package com.aaronHardy.speedDial.view.components.contactsAuthentication
{
	import com.aaronHardy.speedDial.controller.events.ContactsCredentialsEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.model.events.AppModelEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ContactsAuthenticationMediator extends Mediator
	{
		[Inject]
		public var view:ContactsAuthentication;
		
		[Inject]
		public var model:AppModel;
		
		override public function onRegister():void
		{
			super.onRegister();
			
			eventMap.mapListener(
					eventDispatcher,
					AppModelEvent.CONTACTS_CREDENTIALS_CHANGED,
					model_credentialsChangedHandler);
			updateViewCredentials();
		}
		
		protected function model_credentialsChangedHandler(event:AppModelEvent):void
		{
			updateViewCredentials();
		}
		
		protected function updateViewCredentials():void
		{
			view.setCredentials(model.username, model.password);
		}
	}
}