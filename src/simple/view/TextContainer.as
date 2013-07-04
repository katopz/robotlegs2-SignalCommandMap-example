package simple.view
{
	import com.bit101.components.InputText;
	import com.bit101.components.TextArea;

	import flash.display.Sprite;

	public class TextContainer extends Sprite
	{
		public function setFileName(name:String):void
		{
			_fileName.text = name;
		}

		public function setFilePath(path:String):void
		{
			_filePath.text = path;
		}


		private var _fileName:InputText;
		private var _filePath:TextArea;


		public function TextContainer()
		{
			_createChildren();
		}

		private function _createChildren():void
		{
			_fileName = new InputText(this, 0, 0);
			_fileName.width = 200;
			_filePath = new TextArea(this, 0, 30);
			_filePath.width = 250;
		}
	}
}