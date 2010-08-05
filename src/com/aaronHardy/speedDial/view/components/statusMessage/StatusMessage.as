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
		
		protected var showTimer:Timer;
		
		public function showMessage(text:String, duration:uint):void
		{
			if (messageLabel)
			{
				messageLabel.text = text;
				skinState = 'show';
				invalidateSkinState();
				
				if (!showTimer)
				{
					showTimer = new Timer(0, 1);
					showTimer.addEventListener(TimerEvent.TIMER_COMPLETE, showTimer_completeHandler);
				}
				
				showTimer.delay = duration;
				showTimer.reset();
				showTimer.start();
			}
		}

		protected function showTimer_completeHandler(event:TimerEvent):void
		{
			skinState = 'hide';
			invalidateSkinState();
		}
		
		override protected function getCurrentSkinState():String
		{
			return skinState;
		}
	}
}