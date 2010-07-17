package com.aaronHardy.speedDial.model
{
	import com.aaronHardy.speedDial.model.events.AppModelEvent;
	import com.aaronHardy.speedDial.model.vo.Contact;
	
	import flash.net.URLRequestHeader;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	public class AppModel extends Actor
	{
		public var authHeader:URLRequestHeader;
		
		//-------------------------------------------------------------------------
		
		private var _authenticating:Boolean;
		
		public function get authenticating():Boolean
		{
			return _authenticating;
		}
		
		public function set authenticating(value:Boolean):void
		{
			if (_authenticating != value)
			{
				_authenticating = value;
				dispatch(new AppModelEvent(AppModelEvent.AUTHENTICATING_CHANGED));
			}
		}
		
		//-------------------------------------------------------------------------
		
		private var _contacts:ArrayCollection;
		
		public function get contacts():ArrayCollection
		{
			return _contacts;
		}

		public function set contacts(value:ArrayCollection):void
		{
			if (_contacts != value)
			{
				_contacts = value;
				dispatch(new AppModelEvent(AppModelEvent.CONTACTS_CHANGED));
			}
		}
		
		//-------------------------------------------------------------------------
		
		public function setContactsCredentials(username:String, password:String):void
		{
			if (username != _username || password != _password)
			{
				_username = username;
				_password = password;
				dispatch(new AppModelEvent(AppModelEvent.CONTACTS_CREDENTIALS_CHANGED));
			}
		}
		
		protected var _username:String;
		
		public function get username():String
		{
			return _username;
		}
		
		protected var _password:String;
		
		public function get password():String
		{
			return _password;
		}
		
		//-------------------------------------------------------------------------
		
		public function setPhoneCredentials(extension:String, pin:String):void
		{
			if (extension != _extension || pin != _pin)
			{
				_extension = extension;
				_pin = pin;
				dispatch(new AppModelEvent(AppModelEvent.PHONE_CREDENTIALS_CHANGED));
			}
		}
		
		protected var _extension:String;
		
		public function get extension():String
		{
			return _extension;
		}
		
		protected var _pin:String;
		
		public function get pin():String
		{
			return _pin;
		}
	}
}