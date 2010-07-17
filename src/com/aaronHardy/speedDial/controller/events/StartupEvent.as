package com.aaronHardy.speedDial.controller.events
{
	import flash.events.Event;
	
	public class StartupEvent extends Event
	{
		public static const STARTUP:String = 'startup'
		
		public function StartupEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new StartupEvent(type);
		}
	}
}