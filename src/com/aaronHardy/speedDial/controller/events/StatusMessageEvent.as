package com.aaronHardy.speedDial.controller.events
{
	import flash.events.Event;
	
	public class StatusMessageEvent extends Event
	{
		public static const ADD_STATUS:String = 'addStatus';
		public static const REMOVE_STATUS:String = 'removeStatus';
		
		/**
		 * The status message to add or remove.
		 */
		public var message:String;
		
		/**
		 * The duration for which the status message should be active.  If 0, the status message
		 * will remain active until explicitly removed.
		 */
		public var duration:uint;
		
		public function StatusMessageEvent(type:String, message:String, duration:uint=3000, 
				bubbles:Boolean=false)
		{
			super(type, bubbles);
			
			this.message = message;
			this.duration = duration;
		}
		
		override public function clone():Event
		{
			return new StatusMessageEvent(type, message, duration, bubbles);
		}
	}
}