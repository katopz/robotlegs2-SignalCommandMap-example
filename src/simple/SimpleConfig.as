package simple
{
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	import simple.controller.ChooseFileCommand;
	import simple.controller.SetSelectedFileCommand;
	import simple.events.FileResultEvent;
	import simple.events.SimpleAppEvent;
	import simple.model.SimpleModel;
	import simple.service.FileService;
	import simple.service.IFileService;
	import simple.view.ButtonContainer;
	import simple.view.ButtonContainerMediator;
	import simple.view.TextContainer;
	import simple.view.TextContainerMediator;

	public class SimpleConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;

		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var commandMap:IEventCommandMap;

		public function configure():void
		{
			commandMap.map(SimpleAppEvent.CHOOSE_FILE, SimpleAppEvent).toCommand(ChooseFileCommand);
			commandMap.map(FileResultEvent.FILE_RESULT, FileResultEvent).toCommand(SetSelectedFileCommand);

			injector.map(IFileService).toSingleton(FileService);

			injector.map(SimpleModel).asSingleton();

			mediatorMap.map(ButtonContainer).toMediator(ButtonContainerMediator);
			mediatorMap.map(TextContainer).toMediator(TextContainerMediator);
		}
	}
}