package com.aaronHardy.speedDial.view.components.phoneAuthentication
{
	import com.aaronHardy.speedDial.controller.events.PhoneCredentialsEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.model.events.AppModelEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class PhoneAuthenticationMediator extends Mediator
	{
		[Inject]
		public var view:PhoneAuthentication;
		
		[Inject]
		public var model:AppModel;
		
		override public function onRegister():void
		{
			super.onRegister();
			
			eventMap.mapListener(
				eventDispatcher,
				AppModelEvent.PHONE_CREDENTIALS_CHANGED,
				model_credentialsChangedHandler);
			updateViewCredentials();
		}
		
		protected function model_credentialsChangedHandler(event:AppModelEvent):void
		{
			updateViewCredentials();
		}
		
		protected function updateViewCredentials():void
		{
			view.setCredentials(model.extension, model.pin);
		}
	}
}