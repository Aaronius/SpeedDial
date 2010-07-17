package com.aaronHardy.speedDial.view.components
{
	import flash.events.MouseEvent;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.SkinnableContainer;
	import spark.components.supportClasses.SkinnableComponent;
	
	[SkinState("open")]
	public class Expander extends SkinnableContainer
	{
		[SkinPart(required="true")]
		public var toggleButton:Button;
		
		private var _toggleLabel:String;
		private var toggleLabelChanged:Boolean;
		
		public function get toggleLabel():String
		{
			return _toggleLabel;
		}	
		
		public function set toggleLabel(value:String):void
		{
			if (_toggleLabel != value)
			{
				_toggleLabel = value;
				updateTriggerButtonLabel();
			}
		}
		
		private var _open:Boolean;
		
		public function get open():Boolean
		{
			return _open;
		}
		
		public function set open(value:Boolean):void
		{
			if (_open != value)
			{
				_open = value;
				invalidateSkinState();
			}
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			if (instance == toggleButton)
			{
				updateTriggerButtonLabel();
				toggleButton.addEventListener(MouseEvent.CLICK, triggerButton_clickHandler);
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			if (instance == toggleButton)
			{
				toggleButton.removeEventListener(MouseEvent.CLICK, triggerButton_clickHandler);
			}
		}

		protected function triggerButton_clickHandler(event:MouseEvent):void
		{
			open = !open;
		}
		
		override protected function getCurrentSkinState():String
		{
			if (enabled)
			{
				if (open)
				{
					return 'open';
				}
				else
				{
					return 'normal';
				}
			}
			else
			{
				return 'disabled';
			}	
		}
			
		protected function updateTriggerButtonLabel():void
		{
			if (toggleButton)
			{
				toggleButton.label = toggleLabel;
			}
		}
	}
}