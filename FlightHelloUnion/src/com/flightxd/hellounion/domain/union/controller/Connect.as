package com.flightxd.hellounion.domain.union.controller 
{
	import net.user1.reactor.Reactor;
	import com.flightxd.hellounion.domains.union.UnionDomain;
	import flight.config.Config;
	import flight.domain.AsyncCommand;
	import flight.net.IResponse;

	import com.flightxd.hellounion.domains.union.business.UnionDelegate;

	/**
	 * @author John Lindquist
	 */
	public class Connect extends AsyncCommand
	{
		private var $:* = Config.main;
		private var delegate:UnionDelegate = $.unionDelegate;
		private var domain:UnionDomain = UnionDomain.getInstance();

		override public function execute():void
		{
			var commandResponse:IResponse = delegate.connect();
			response = commandResponse;
			
			//should this just be an event listener in the domain instead?	
			response.addResultHandler(connectResult);
		}
		
		private function connectResult(reactor:Reactor):void
		{
			domain.connectSuccess();
		}
	}
}