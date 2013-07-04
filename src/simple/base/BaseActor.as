package simple.base
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class BaseActor
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;


		protected function dispatch(e:Event):void
		{
			if (eventDispatcher.hasEventListener(e.type))
				eventDispatcher.dispatchEvent(e);
		}
	}
}
