package com.aaronHardy.speedDial.controller.events
{
	import flash.events.Event;
	
	public class PhoneCredentialsEvent extends Event
	{
		public static const CREDENTIALS_LOADED:String = 'credentialsLoaded';
		public static const CREDENTIALS_SAVE_TRIGGERED:String = 'credentialsSaveTriggered';
		
		public var extension:String;
		public var pin:String;
		
		public function PhoneCredentialsEvent(type:String, extension:String, pin:String)
		{
			super(type);
			this.extension = extension;
			this.pin = pin;
		}
		
		override public function clone():Event
		{
			return new PhoneCredentialsEvent(type, extension, pin);
		}
	}
}