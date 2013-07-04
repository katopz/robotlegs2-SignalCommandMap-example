package modules.moduleone.config
{
	import modules.moduleone.controller.commands.GetUsersCommand;
	import modules.moduleone.controller.signals.GetUsersSignal;
	import modules.moduleone.model.UserModel;
	import modules.moduleone.service.IUserService;
	import modules.moduleone.service.UserServiceMock;
	import modules.moduleone.view.main.ModuleOneMainView;
	import modules.moduleone.view.main.ModuleOneMainViewMediator;

	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;

	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2012 by dotdotcommadot
	 */
	public class ModuleOneConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var commandMap:ISignalCommandMap;

		[Inject]
		public var injector:IInjector;

		public function configure():void
		{
			//-----------------------------------
			// Models
			//-----------------------------------

			injector.map(UserModel).asSingleton();

			//-----------------------------------
			// Views
			//-----------------------------------

			mediatorMap.map(ModuleOneMainView).toMediator(ModuleOneMainViewMediator);

			//-----------------------------------
			// Commands
			//-----------------------------------

			commandMap.map(GetUsersSignal).toCommand(GetUsersCommand);

			//-----------------------------------
			// Services
			//-----------------------------------

			injector.map(IUserService).toSingleton(UserServiceMock);
		}
	}
}