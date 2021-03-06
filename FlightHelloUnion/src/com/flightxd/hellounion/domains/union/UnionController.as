package com.flightxd.hellounion.domains.union 
{
	import flight.domain.DomainController;
	import flight.net.IResponse;
	import flight.utils.Singleton;

	import net.user1.logger.LogEvent;
	import net.user1.logger.Logger;

	import com.flightxd.hellounion.domains.union.commands.Connect;
	import com.flightxd.hellounion.domains.union.model.UnionModel;

	/**
	 * @author John Lindquist
	 */
	public class UnionController extends DomainController
	{
		public static const CONNECT:String = "CONNECT";
		public var model:UnionModel = new UnionModel();

		public static function getInstance():UnionController
		{
			return Singleton.getInstance(UnionController) as UnionController;
		}

		public function UnionController()
		{
			var logger:Logger = model.reactor.getLog();
			logger.addEventListener(LogEvent.UPDATE, logger_logHandler);
		}

		public function connect():IResponse
		{
			return execute(CONNECT);
		}

		public function connectSuccess():void
		{
			model.isConnected = true;
		}

		override protected function init():void
		{
			addCommand(CONNECT, Connect);
		}

		protected function logger_logHandler(event:LogEvent):void
		{
			model.connectionStatus = event.getMessage();
		}
	}
}
