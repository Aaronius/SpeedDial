package com.aaronHardy.speedDial.service.clipboard
{
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.utils.PhoneNumberUtil;
	
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	
	import mx.events.AIREvent;
	
	import spark.components.WindowedApplication;

	public class ClipboardService implements IClipboardService
	{
		[Inject]
		public var model:AppModel;
		
		public function watchForPhoneNumbers():void
		{
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, windowActivateHandler);
		}

		protected function windowActivateHandler(event:Event):void
		{
			checkClipboard();
		}
		
		protected function checkClipboard():void
		{
			var content:String = Clipboard.generalClipboard.getData(
					ClipboardFormats.TEXT_FORMAT) as String;
			// Remove any non-digit characters.
			if (content)
			{
				var phoneNumber:String = PhoneNumberUtil.removeNonNumerics(content);
				
				if (phoneNumber.length > 0)
				{
					model.clipboard = phoneNumber;
				}
			}
		}
	}
}