package com.flightxd.hellounion.domains.union.model 
{
	import net.user1.reactor.Reactor;

	/**
	 * @author John Lindquist
	 */
	public class UnionModel 
	{
		[Bindable]
		public var connectionStatus:String = "not connected";

		[Bindable]
		public var isConnected:Boolean = false;
		
		public var reactor:Reactor = new Reactor();
	}
}
