package com.aaronHardy.speedDial.controller
{
	import com.aaronHardy.speedDial.controller.events.ContactsCredentialsEvent;
	import com.aaronHardy.speedDial.service.contactsCredentials.IContactsCredentialsService;
	
	import flash.data.EncryptedLocalStore;
	import flash.utils.ByteArray;
	
	import org.robotlegs.mvcs.Command;
	
	public class CmdSaveContactsCredentials extends Command
	{
		[Inject]
		public var event:ContactsCredentialsEvent;
		
		[Inject]
		public var service:IContactsCredentialsService;
		
		override public function execute():void
		{
			service.saveCredentials(event.username, event.password);
		}
	}
}