package com.fisi.projects.cvsdsl.view
{
	import com.fisi.projects.core.controller.AbstractCommand;
	import com.fisi.projects.core.view.AbstractMediator;
	import com.fisi.projects.cvsdsl.controller.game.ConstructorCommand;
	import com.fisi.projects.cvsdsl.model.ManagerView;
	
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	
	public class PresentationMediator extends AbstractMediator
	{
		
		private var _mview:PresentationScreen;
		private var _manager:ManagerView;
		private var cmdConstruct:ConstructorCommand;
		public function PresentationMediator($view:DisplayObject, $data:*=null, $model:EventDispatcher=null, $cmd:AbstractCommand=null)
		{
			super($view, $data, $model, $cmd);
			mview=(PresentationScreen)($view);
			manager=(ManagerView)($model);
			init();
		}
		
		override public function init():void{
			cmdConstruct=new ConstructorCommand(this);
			
		}

		public function get mview():PresentationScreen
		{
			return _mview;
		}

		public function set mview(value:PresentationScreen):void
		{
			_mview = value;
		}

		public function get manager():ManagerView
		{
			return _manager;
		}

		public function set manager(value:ManagerView):void
		{
			_manager = value;
		}


	}
}