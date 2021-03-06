package com.flightxd.hellounion.domains.union.commands 
{
	import flight.config.Config;
	import flight.domain.AsyncCommand;
	import flight.net.IResponse;

	import net.user1.reactor.Reactor;

	import com.flightxd.hellounion.domains.union.UnionController;	import com.flightxd.hellounion.domains.union.business.UnionDelegate;

	/**
	 * @author John Lindquist
	 */
	public class Connect extends AsyncCommand
	{
		private var $:* = Config.main;
		private var delegate:UnionDelegate = $.unionDelegate;
		private var controller:UnionController = UnionController.getInstance();

		override public function execute():void
		{
			var commandResponse:IResponse = delegate.connect();
			response = commandResponse;
			response.addResultHandler(connectResult);
		}

		private function connectResult(reactor:Reactor):void
		{
			controller.connectSuccess();
		}
	}
}
