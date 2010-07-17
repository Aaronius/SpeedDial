package com.aaronHardy.speedDial.controller
{
	import com.aaronHardy.speedDial.service.phoneCredentials.IPhoneCredentialsService;
	
	import org.robotlegs.mvcs.Command;
	
	public class CmdLoadPhoneCredentials extends Command
	{
		[Inject]
		public var service:IPhoneCredentialsService;
		
		override public function execute():void
		{
			service.loadCredentials();
		}
	}
}