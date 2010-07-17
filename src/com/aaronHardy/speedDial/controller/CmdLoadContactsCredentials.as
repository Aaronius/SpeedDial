package com.aaronHardy.speedDial.controller
{
	import com.aaronHardy.speedDial.service.contactsCredentials.IContactsCredentialsService;
	
	import flash.data.EncryptedLocalStore;
	import flash.utils.ByteArray;
	
	import org.robotlegs.mvcs.Command;
	
	public class CmdLoadContactsCredentials extends Command
	{
		[Inject]
		public var service:IContactsCredentialsService;
		
		override public function execute():void
		{
			service.loadCredentials();
		}
	}
}