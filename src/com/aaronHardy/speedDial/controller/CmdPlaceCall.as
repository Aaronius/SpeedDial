package com.aaronHardy.speedDial.controller
{
	import com.aaronHardy.speedDial.controller.events.CallEvent;
	import com.aaronHardy.speedDial.controller.events.StatusMessageEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.utils.PhoneNumberUtil;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.robotlegs.mvcs.Command;
	
	public class CmdPlaceCall extends Command
	{
		[Inject]
		public var event:CallEvent;
		
		[Inject]
		public var model:AppModel;
		
		override public function execute():void
		{
			var destNumber:String = PhoneNumberUtil.removeNonNumerics(event.contact.phone);
			
			if (destNumber.length > 0)
			{
				trace('place call', event.contact.name, event.contact.phone);
				var request:URLRequest = new URLRequest(
						'https://phones.mediarain.com/api?cmd=call&' +
						'dial_first=' + model.extension + 
						'&dial_second=' + destNumber + 
						'&password=' + model.pin);
				var loader:URLLoader = new URLLoader();
				loader.load(request);
				
				dispatch(new StatusMessageEvent(StatusMessageEvent.SHOW_MESSAGE, 
						'Calling...', 3000));
			}
		}
	}
}