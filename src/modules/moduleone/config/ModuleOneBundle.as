package modules.moduleone.config
{
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.LogLevel;

	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class ModuleOneBundle extends MVCSBundle
	{
		override public function extend(context:IContext):void
		{
			context.logLevel = LogLevel.DEBUG;

			context.install(SignalCommandMapExtension);

			super.extend(context);
		}
	}
}