package com.aaronHardy.speedDial.view.components.statusMessage
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import spark.components.Label;
	import spark.components.supportClasses.SkinnableComponent;
	
	[SkinState("show")]
	[SkinState("hide")]
	public class StatusMessage extends SkinnableComponent
	{
		[SkinPart(required="true")]
		public var messageLabel:Label;
		
		protected var skinState:String = 'hide';
		
		public function set message(value:String):void
		{
			if (value && value.length > 0)
			{
				// We only set the message text if it's a real value, otherwise we'll keep it the
				// way it is while the state changes.  If we were to set it to a null value,
				// the label would be empty while it was in the process of hiding.
				messageLabel.text = value;
				skinState = 'show';
				invalidateSkinState();
			}
			else
			{
				skinState = 'hide';
				invalidateSkinState();
			}
		}
		
		override protected function getCurrentSkinState():String
		{
			return skinState;
		}
	}
}