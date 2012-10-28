package com.fisi.projects.core.view
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class AbstractUI extends Sprite
	{
		public function AbstractUI()
		{
			//TODO: implement function
			super();
			if(stage){app();}else
			{
				addEventListener(Event.ADDED_TO_STAGE,app);
			}
		}
		
		protected function app(e:Event=null):void
		{
			// TODO Auto-generated method stub
			
		}
	}
}