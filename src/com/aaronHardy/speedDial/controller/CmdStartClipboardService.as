package com.aaronHardy.speedDial.controller
{
	import com.aaronHardy.speedDial.service.clipboard.IClipboardService;
	
	import org.robotlegs.mvcs.Command;
	
	public class CmdStartClipboardService extends Command
	{
		[Inject]
		public var service:IClipboardService;
		
		override public function execute():void
		{
			service.watchForPhoneNumbers();
		}
	}
}