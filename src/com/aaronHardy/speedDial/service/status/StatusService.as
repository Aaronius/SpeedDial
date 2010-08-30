package com.aaronHardy.speedDial.service.status
{
	import com.aaronHardy.speedDial.controller.events.StatusMessageEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	import org.robotlegs.mvcs.Actor;

	/**
	 * @inheritDoc
	 */
	public class StatusService extends Actor implements IStatusService
	{
		[Inject]
		public var model:AppModel;
		
		protected var statuses:Array = [];
		protected var timerByStatus:Object = {};
		protected var statusByTimer:Dictionary = new Dictionary();
		
		/**
		 * @inheritDoc
		 */
		public function monitorStatus():void
		{
			eventDispatcher.addEventListener(StatusMessageEvent.ADD_STATUS, addStatusHandler);
			eventDispatcher.addEventListener(StatusMessageEvent.REMOVE_STATUS, removeStatusHandler);
		}
		
		/**
		 * Handles StatusMessageEvent.ADD_STATUS.
		 */
		protected function addStatusHandler(event:StatusMessageEvent):void
		{
			addStatus(event.message, event.duration);
		}
		
		/**
		 * Handles StatusMessageEvent.REMOVE_STATUS.
		 */
		protected function removeStatusHandler(event:StatusMessageEvent):void
		{
			removeStatus(event.message);
		}
		
		/**
		 * Adds a status to list of statuses and sets it on the model.  If a duration is specified, 
		 * a timer is set up and started.
		 */
		protected function addStatus(message:String, duration:uint):void
		{
			if (statuses.indexOf(message) == -1)
			{
				statuses.push(message);
				
				if (duration > 0)
				{
					var timer:Timer = new Timer(duration, 1);
					timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);
					timer.start();
					timerByStatus[message] = timer;
					statusByTimer[timer] = message;
				}
				
				model.statusMessage = message;
			}
		}
		
		/**
		 * Handles a status's duration completion.
		 */
		protected function timerCompleteHandler(event:TimerEvent):void
		{
			var status:String = statusByTimer[event.target];
			removeStatus(status);
		}
		
		/**
		 * Removes a status from the list of statuses.  Stops and removes a duration timer if one
		 * exists for the status.  Updates the model's statusMessage property.
		 */
		protected function removeStatus(message:String):void
		{
			var index:int = statuses.indexOf(message);
			
			if (index > -1)
			{
				statuses.splice(index, 1);
				var timer:Timer = timerByStatus[message];
				delete timerByStatus[message];
				
				if (timer)
				{
					timer.stop();
					timer.removeEventListener(TimerEvent.TIMER_COMPLETE, timerCompleteHandler);
					delete statusByTimer[timer];
				}
				
				if (model.statusMessage == message)
				{
					if (statuses.length > 0)
					{
						model.statusMessage = statuses[statuses.length - 1];
					}
					else
					{
						model.statusMessage = null;
					}
				}
			}
		}
	}
}