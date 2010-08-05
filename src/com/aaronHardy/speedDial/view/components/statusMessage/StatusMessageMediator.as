package com.aaronHardy.speedDial.view.components.statusMessage
{
	import com.aaronHardy.speedDial.controller.events.StatusMessageEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class StatusMessageMediator extends Mediator
	{
		[Inject]
		public var view:StatusMessage;
		
		override public function onRegister():void
		{
			super.onRegister();
			
			eventMap.mapListener(
					eventDispatcher,
					StatusMessageEvent.SHOW_MESSAGE,
					showMessageHandler);
		}
		
		protected function showMessageHandler(event:StatusMessageEvent):void
		{
			view.showMessage(event.text, event.duration);
		}
	}
}