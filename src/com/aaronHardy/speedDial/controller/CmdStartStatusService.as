package com.aaronHardy.speedDial.controller
{
	import com.aaronHardy.speedDial.service.status.IStatusService;
	
	import org.robotlegs.mvcs.Command;
	
	public class CmdStartStatusService extends Command
	{
		[Inject]
		public var service:IStatusService;
		
		override public function execute():void
		{
			service.monitorStatus();
		}
	}
}