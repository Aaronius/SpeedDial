package com.aaronHardy.speedDial.controller
{
	import com.aaronHardy.speedDial.controller.events.ContactsCredentialsEvent;
	import com.aaronHardy.speedDial.service.contactsAuthentication.IContactsAuthenticationService;
	
	import org.robotlegs.mvcs.Command;
	
	public class CmdContactsAuthenticate extends Command
	{
		[Inject]
		public var event:ContactsCredentialsEvent;
		
		[Inject]
		public var service:IContactsAuthenticationService;
		
		override public function execute():void
		{
			service.authenticate(event.username, event.password);
		}
	}
}