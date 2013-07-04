package simple.view
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import simple.events.SimpleAppEvent;

	public class ButtonContainerMediator extends Mediator
	{
		override public function initialize():void
		{
			addViewListener(SimpleAppEvent.CHOOSE_FILE, dispatch, SimpleAppEvent);
		}
	}
}
