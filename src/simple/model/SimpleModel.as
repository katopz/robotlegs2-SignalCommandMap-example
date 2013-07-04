package simple.model
{
	import simple.base.BaseActor;
	import simple.events.SimpleModelEvent;

	public class SimpleModel extends BaseActor
	{
		private var _fileName:String;

		public function get fileName():String
		{
			return _fileName;
		}

		public function set fileName(value:String):void
		{
			_fileName = value;
			dispatch(new SimpleModelEvent(SimpleModelEvent.FILE_NAME_CHANGE, _fileName));
		}


		private var _filePath:String;

		public function get filePath():String
		{
			return _filePath;
		}

		public function set filePath(value:String):void
		{
			_filePath = value;
			dispatch(new SimpleModelEvent(SimpleModelEvent.FILE_PATH_CHANGE, _filePath));
		}
	}
}
