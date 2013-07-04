package simple.view
{
	import com.bit101.components.PushButton;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	import simple.events.SimpleAppEvent;

	public class ButtonContainer extends Sprite
	{
		private var _button:PushButton;


		public function ButtonContainer()
		{
			_createChildren();
		}


		private function _createChildren():void
		{
			_button = new PushButton(this, 0, 0, "Choose file");
			_button.addEventListener(MouseEvent.CLICK, _button_click);
		}


		private function _button_click(event:MouseEvent):void
		{
			dispatchEvent(new SimpleAppEvent(SimpleAppEvent.CHOOSE_FILE));
		}
	}
}