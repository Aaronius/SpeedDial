package com.aaronHardy.speedDial.controller.events
{
	import flash.events.Event;
	
	public class ContactsCredentialsEvent extends Event
	{
		public static const AUTHENTICATION_TRIGGERED:String = 'authenticate';
		public static const AUTHENTICATED:String = 'authenticated';
		public static const CREDENTIALS_LOADED:String = 'credentialsLoaded';
		
		public var username:String;
		public var password:String;
		
		public function ContactsCredentialsEvent(type:String, 
				username:String, password:String)
		{
			super(type);
			this.username = username;
			this.password = password;
		}
		
		override public function clone():Event
		{
			return new ContactsCredentialsEvent(type, username, password);
		}
	}
}