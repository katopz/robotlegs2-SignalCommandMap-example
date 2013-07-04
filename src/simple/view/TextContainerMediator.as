package simple.view
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import simple.events.SimpleModelEvent;

	public class TextContainerMediator extends Mediator
	{
		[Inject]
		public var view:TextContainer;

		override public function initialize():void
		{
			addContextListener(SimpleModelEvent.FILE_NAME_CHANGE, onFileNameChange, SimpleModelEvent);
			addContextListener(SimpleModelEvent.FILE_PATH_CHANGE, onFilePathChange, SimpleModelEvent);
		}


		private function onFileNameChange(event:SimpleModelEvent):void
		{
			view.setFileName(event.value);
		}


		private function onFilePathChange(event:SimpleModelEvent):void
		{
			view.setFilePath(event.value);
		}
	}
}
