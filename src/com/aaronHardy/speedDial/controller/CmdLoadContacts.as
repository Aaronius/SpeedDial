package com.aaronHardy.speedDial.controller
{
	import com.aaronHardy.speedDial.service.contacts.IContactsService;
	
	import org.robotlegs.mvcs.Command;
	
	public class CmdLoadContacts extends Command
	{
		[Inject]
		public var service:IContactsService;
		
		override public function execute():void
		{
			service.loadContacts();
		}
	}
}