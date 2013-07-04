package modules.moduleone.view.main
{
	import com.bit101.components.PushButton;

	import flash.display.Sprite;

	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class ModuleOneMainView extends Sprite
	{
		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		private var _users:Array;

		private var _signalsTestButton:PushButton;

		public function ModuleOneMainView()
		{
			_signalsTestButton = new PushButton(this, 100, 0, "test signals cmd");
			_signalsTestButton.name = "signalsTestButton";

			// test destroy sub view
			new PushButton(this, 200, 0, "kill me");
		}

		public function get users():Array
		{
			return _users;
		}

		public function set users(value:Array):void
		{
			_users = value;

			trace("view just get users : " + _users.length);
			
			_signalsTestButton.label = "working! : " + _users.length;
		}

		public function destroy():void
		{
			if (parent)
				parent.removeChild(this);
		}
	}
}
