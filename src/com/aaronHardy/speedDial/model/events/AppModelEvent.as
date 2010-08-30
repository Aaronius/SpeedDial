package com.aaronHardy.speedDial.model.events
{
	import flash.events.Event;
	
	public class AppModelEvent extends Event
	{
		public static const AUTHENTICATING_CHANGED:String = 'authenticatingChanged';
		public static const CONTACTS_CHANGED:String = 'contactsChanged';
		public static const CONTACTS_CREDENTIALS_CHANGED:String = 'contactsCredentialsChanged';
		public static const PHONE_CREDENTIALS_CHANGED:String = 'phoneCredentialsChanged';
		public static const CLIPBOARD_CHANGED:String = 'clipboardChanged';
		public static const STATUS_MESSAGE_CHANGED:String = 'statusMessageChanged';
		
		public function AppModelEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new AppModelEvent(type);
		}
	}
}