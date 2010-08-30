package com.aaronHardy.speedDial.controller
{
	import com.aaronHardy.speedDial.controller.events.CallEvent;
	import com.aaronHardy.speedDial.controller.events.StatusMessageEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.utils.PhoneNumberUtil;
	import com.aaronHardy.speedDial.view.components.statusMessage.StatusMessage;
	
	import flash.events.ErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	import org.robotlegs.mvcs.Command;
	
	public class CmdPlaceCall extends Command
	{
		[Inject]
		public var event:CallEvent;
		
		[Inject]
		public var model:AppModel;
		
		override public function execute():void
		{
			if (!model.extension || model.extension.length == 0 ||
					!model.pin || model.pin.length == 0)
			{
				dispatch(new StatusMessageEvent(StatusMessageEvent.ADD_STATUS, 'Extension & PIN needed.'));
				return;
			}
			
			var destNumber:String = PhoneNumberUtil.removeNonNumerics(event.contact.phone);
			
			if (destNumber.length > 0)
			{
				var request:URLRequest = new URLRequest(
						'https://phones.mediarain.com/api?cmd=call&' +
						'dial_first=' + model.extension + 
						'&dial_second=' + destNumber + 
						'&password=' + model.pin);
				var loader:URLLoader = new URLLoader();
				loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
				loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorHandler);
				loader.load(request);
				
				dispatch(new StatusMessageEvent(StatusMessageEvent.ADD_STATUS, 'Calling...', 5000));
			}
		}

		protected function errorHandler(event:ErrorEvent):void
		{
			dispatch(new StatusMessageEvent(StatusMessageEvent.ADD_STATUS, 'Error placing call.'));
		}
	}
}