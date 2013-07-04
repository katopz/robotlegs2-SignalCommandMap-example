package modules.moduleone.view.main
{
	import flash.events.MouseEvent;
	
	import modules.moduleone.controller.signals.GetUsersSignal;
	import modules.moduleone.model.UserModel;
	
	import robotlegs.bender.bundles.mvcs.Mediator;


	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class ModuleOneMainViewMediator extends Mediator
	{
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------

		[Inject]
		public var view:ModuleOneMainView;

		[Inject]
		public var getUsersSignal:GetUsersSignal;

		[Inject]
		public var userModel:UserModel;

		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------

		public function ModuleOneMainViewMediator()
		{
		}

		//--------------------------------------------------------------------------
		//
		// Initialize
		// 
		//--------------------------------------------------------------------------

		override public function initialize():void
		{
			// View
			view.addEventListener(MouseEvent.CLICK, onClick_loadUsersButton);

			// Model
			userModel.usersChanged.add(onUsersChanged);
		}

		//--------------------------------------------------------------------------
		//
		// Private Methods
		// 
		//--------------------------------------------------------------------------

		private function onClick_loadUsersButton(event:MouseEvent):void
		{
			if (event.target.name == "signalsTestButton")
				getUsersSignal.dispatch(int(Math.random()*100));
			else
				view.destroy();
		}

		private function onUsersChanged():void
		{
			view.users = userModel.users;
		}

		override public function destroy():void
		{
			trace("i'm dead!");
		}
	}
}