package com.aaronHardy.speedDial.view.components.statusMessage
{
	import com.aaronHardy.speedDial.controller.events.StatusMessageEvent;
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.model.events.AppModelEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class StatusMessageMediator extends Mediator
	{
		[Inject]
		public var view:StatusMessage;
		
		[Inject]
		public var model:AppModel;
		
		override public function onRegister():void
		{
			super.onRegister();
			
			eventMap.mapListener(
					eventDispatcher,
					AppModelEvent.STATUS_MESSAGE_CHANGED,
					model_statusMessageChangedHandler);
			updateStatus();
		}
		
		protected function model_statusMessageChangedHandler(event:AppModelEvent):void
		{
			updateStatus();
		}
		
		protected function updateStatus():void
		{
			view.message = model.statusMessage;
		}
	}
}