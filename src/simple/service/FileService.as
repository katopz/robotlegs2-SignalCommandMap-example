package simple.service
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;

	import simple.events.FileResultEvent;

	public class FileService implements IFileService
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;

		private var _file:File;

		public function promptToChooseFile():void
		{
			_file = File.desktopDirectory;
			_file.addEventListener(Event.SELECT, onFileSelect);
			_file.browseForOpen("Choose text file");
		}


		private function onFileSelect(event:Event):void
		{
			eventDispatcher.dispatchEvent(new FileResultEvent(FileResultEvent.FILE_RESULT, _file.name, _file.nativePath));
		}
	}
}
