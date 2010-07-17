package com.aaronHardy.speedDial.controller.events
{
	import com.aaronHardy.speedDial.model.vo.Contact;
	
	import flash.events.Event;
	
	public class CallEvent extends Event
	{
		public static const CALL_TRIGGERED:String = 'callTriggered'
		
		public var contact:Contact;
		
		public function CallEvent(type:String, contact:Contact)
		{
			super(type, true);
			this.contact = contact;
		}
		
		override public function clone():Event
		{
			return new CallEvent(type, contact);
		}
	}
}