package com.aaronHardy.speedDial.controller
{
	import air.update.ApplicationUpdaterUI;
	import air.update.events.UpdateEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.robotlegs.mvcs.Command;
	
	public class CmdCheckForUpdate extends Command
	{
		protected var appUpdater:ApplicationUpdaterUI = new ApplicationUpdaterUI();
		protected var waitTimer:Timer;
		
		override public function execute():void
		{
			commandMap.detain(this);
			
			// A lot of other stuff is going on at startup including transitions.  We'll wait a 
			// while to let things calm down and then check.  No rush.
			waitTimer = new Timer(10000, 1);
			waitTimer.addEventListener(TimerEvent.TIMER_COMPLETE, waitTimer_timerCompleteHandler);
			waitTimer.start();
		}

		protected function waitTimer_timerCompleteHandler(event:TimerEvent):void
		{
			waitTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, waitTimer_timerCompleteHandler);
			waitTimer = null;
			
			appUpdater.updateURL = 'http://aaronhardy.com/apps/speeddial/update.xml';
			appUpdater.isCheckForUpdateVisible = false;
			appUpdater.addEventListener(UpdateEvent.INITIALIZED, initHandler);
			appUpdater.initialize();
		}
		
		protected function initHandler(event:UpdateEvent):void
		{
			appUpdater.checkNow();
			commandMap.release(this);
		}
	}
}