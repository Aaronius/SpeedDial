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

	/**
	 * Watches the clipboard for any phone numbers.  If a number is found, it is set onto the model.
	 */
	public class ClipboardService implements IClipboardService
	{
		[Inject]
		public var model:AppModel;
		
		public function watchForPhoneNumbers():void
		{
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, windowActivateHandler);
		}

		/**
		 * Whenever the main window is activated, we'll check the clipboard to see if there's a
		 * phone number we can use.
		 */ 
		protected function windowActivateHandler(event:Event):void
		{
			checkClipboard();
		}
		
		/**
		 * Checks the clipboard for any text.  If there's text, non-numeric characters are removed
		 * and the number is dropped onto the model.
		 */
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