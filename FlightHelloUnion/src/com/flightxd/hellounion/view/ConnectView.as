package com.flightxd.hellounion.view 
{
	import flight.binding.Bind;
	import flight.events.PropertyEvent;

	import com.flightxd.hellounion.domains.union.UnionController;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author John Lindquist
	 */
	public class ConnectView extends Sprite 
	{
		private var domain:UnionController = UnionController.getInstance();
		public var connectionStatusDisplay:TextField = new TextField();
		public var connectButton:Sprite = new Sprite();

		public function ConnectView()
		{
			//textfield for showing union logs
			connectionStatusDisplay.width = 500;
			addChild(connectionStatusDisplay);
			
			//connection status button. green = connected, red = disconnected
			showDisconnectedButton();
			connectButton.y = 40;
			addChild(connectButton);
			
			connectButton.addEventListener(MouseEvent.CLICK, connectButton_clickHandler);
			
			setupBindings();
		}

		private function setupBindings():void
		{
			Bind.addBinding(connectionStatusDisplay, "text", domain, "model.connectionStatus");
			Bind.addListener(connectionChanged, domain, "model.isConnected");
		}

		private function connectionChanged(event:PropertyEvent):void
		{
			if(domain.model.isConnected)
			{
				showConnectedButton();
			}
			else
			{
				showDisconnectedButton();
			}
		}

		private function showDisconnectedButton():void
		{
			connectButton.graphics.clear();
			connectButton.graphics.beginFill(0xcc0000);
			connectButton.graphics.drawRect(0, 0, 100, 20);
			connectButton.graphics.endFill();
		}

		private function showConnectedButton():void
		{
			connectButton.graphics.clear();
			connectButton.graphics.beginFill(0x00cc00);
			connectButton.graphics.drawRect(0, 0, 100, 20);
			connectButton.graphics.endFill();
		}

		private function connectButton_clickHandler(event:MouseEvent):void
		{
			domain.connect();	
		}
	}
}
