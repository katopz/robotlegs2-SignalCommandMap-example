package simple.controller
{
	import robotlegs.bender.bundles.mvcs.Command;

	import simple.service.IFileService;

	public class ChooseFileCommand extends Command
	{
		[Inject]
		public var fileService:IFileService;


		override public function execute():void
		{
			fileService.promptToChooseFile();
		}
	}
}
