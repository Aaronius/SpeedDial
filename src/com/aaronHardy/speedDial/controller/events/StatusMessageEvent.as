package com.aaronHardy.speedDial.controller.events
{
	import flash.events.Event;
	
	public class StatusMessageEvent extends Event
	{
		public static const SHOW_MESSAGE:String = 'showMessage';
		
		public var text:String;
		public var duration:uint;
		
		public function StatusMessageEvent(type:String, text:String, duration:uint)
		{
			super(type);
			
			this.text = text;
			this.duration = duration;
		}
		
		override public function clone():Event
		{
			return new StatusMessageEvent(type, text, duration);
		}
	}
}