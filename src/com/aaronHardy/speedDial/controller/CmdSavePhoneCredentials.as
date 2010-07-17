package com.aaronHardy.speedDial.controller
{
	import com.aaronHardy.speedDial.controller.events.PhoneCredentialsEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.service.phoneCredentials.IPhoneCredentialsService;
	
	import org.robotlegs.mvcs.Command;
	
	public class CmdSavePhoneCredentials extends Command
	{
		[Inject]
		public var event:PhoneCredentialsEvent;
		
		[Inject]
		public var service:IPhoneCredentialsService;
		
		[Inject]
		public var model:AppModel;
		
		override public function execute():void
		{
			service.saveCredentials(event.extension, event.pin);
			model.setPhoneCredentials(event.extension, event.pin);
		}
	}
}