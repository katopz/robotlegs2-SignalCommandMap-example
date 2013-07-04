package simple.events
{
	import flash.events.Event;

	public class FileResultEvent extends Event
	{
		public static const FILE_RESULT:String = "fileResult";

		public function FileResultEvent(type:String, fileName:String, filePath:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			_fileName = fileName;
			_filePath = filePath;
		}

		private var _fileName:String;

		public function get fileName():String
		{
			return _fileName;
		}

		private var _filePath:String;

		public function get filePath():String
		{
			return _filePath;
		}


		override public function clone():Event
		{
			return new FileResultEvent(type, fileName, filePath, bubbles, cancelable);
		}
	}
}
