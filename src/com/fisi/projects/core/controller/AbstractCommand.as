package com.fisi.projects.core.controller
{
	import com.fisi.projects.core.view.AbstractMediator;
	
	import flash.display.DisplayObject;

	public class AbstractCommand
	{
		private var _mediator:AbstractMediator;
		
		public function AbstractCommand($med:AbstractMediator)
		{
			_mediator=$med;
			
			init();
		}
		
		public function init():void
		{
		}
	}
}