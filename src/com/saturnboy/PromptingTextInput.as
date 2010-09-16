package com.saturnboy {
	import flash.events.FocusEvent;
	
	import mx.events.FlexEvent;
	
	import spark.components.Label;
	import spark.components.TextInput;
	import spark.events.TextOperationEvent;
	
	[SkinState("prompting")]
	public class PromptingTextInput extends TextInput {
		
		[SkinPart("false")]
		public var promptDisplay:Label;
		
		private var _prompt:String = '';
		private var _focused:Boolean = false;
		
		public function PromptingTextInput() {
			super();
			
			//watch for programmatic changes to text property
			this.addEventListener(FlexEvent.VALUE_COMMIT, textChangedHandler, false, 0, true);
			
			//watch for user changes (aka typing) to text property
			this.addEventListener(TextOperationEvent.CHANGE, textChangedHandler, false, 0, true);
		}
		
		[Bindable]public function get prompt():String {
			return _prompt;
		}
		public function set prompt(value:String):void {
			if (_prompt != value) {
				_prompt = value;
				if (promptDisplay != null) {
					promptDisplay.text = value;
				}
			}
		}
		
		private function textChangedHandler(e:Event):void {
			invalidateSkinState();
		}
		
		override protected function focusInHandler(event:FocusEvent):void {
			super.focusInHandler(event);
			_focused = true;
			invalidateSkinState();
		}
		override protected function focusOutHandler(event:FocusEvent):void {
			super.focusOutHandler(event);
			_focused = false;
			invalidateSkinState();
		}
		
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);
			
			if (instance == promptDisplay) {
				promptDisplay.text = prompt;
			}
		}
		
		override protected function getCurrentSkinState():String {
			if (prompt.length > 0 && text.length == 0 && !_focused) {
				return 'prompting';
			}
			return super.getCurrentSkinState();
		}
	}
}