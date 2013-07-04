package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import modules.moduleone.config.ModuleOneConfig;
	import modules.moduleone.view.main.ModuleOneMainView;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	import simple.SimpleConfig;
	import simple.view.ButtonContainer;
	import simple.view.TextContainer;

	/**
	 * Merged Event base and Signals base (Flex) version from...
	 * 
	 * @referrer https://github.com/probertson/robotlegs-examples-Simple_NoFlex
	 * @referrer https://github.com/dotdotcommadot/ModularRL
	 * 
	 * For Robotlegs 2 HelloWorld purpose, You can expected dirty. ;)
	 *  
	 * @author katopz
	 */
	public class Main extends Sprite
	{
		public function Main()
		{
			_initialize();
		}

		private function _initialize():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			var _context:IContext = new Context().install(MVCSBundle).configure(SimpleConfig, new ContextView(this));

			addEventListener(Event.ADDED_TO_STAGE, _onApplication_AddedToStageHandler);
		}

		private function _onApplication_AddedToStageHandler(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _onApplication_AddedToStageHandler);

			_createChildren();
			stage.nativeWindow.visible = true;
		}

		private function _createChildren():void
		{
			var _buttonContainer:ButtonContainer = new ButtonContainer();
			_buttonContainer.x = 30;
			_buttonContainer.y = 50;
			addChild(_buttonContainer);

			var _textContainer:TextContainer = new TextContainer();
			_textContainer.x = 30;
			_textContainer.y = 90;
			addChild(_textContainer);

			// test sub view
			var subView:Sprite = new ModuleOneMainView;
			addChild(subView);

			var subContext:IContext = new Context().install(MVCSBundle, SignalCommandMapExtension).configure(ModuleOneConfig, new ContextView(subView));
		}
	}
}
