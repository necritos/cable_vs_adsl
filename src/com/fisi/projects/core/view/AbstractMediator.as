package com.fisi.projects.core.view
{
	import com.fisi.projects.core.controller.AbstractCommand;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class AbstractMediator
	{
		private var _view:DisplayObject;
		private var _model:EventDispatcher;
		private var _data:*;
		private var _cmd:AbstractCommand;
		
		public function AbstractMediator($view:DisplayObject,$data:*=null,$model:EventDispatcher=null,$cmd:AbstractCommand=null)
		{
			_view=$view;
			_model=$model;
			_data=$data;
			_cmd=$cmd;
		}
		
		public function get data():*
		{
			return _data;
		}

		public function get model():EventDispatcher
		{
			return _model;
		}

		public function get view():DisplayObject
		{
			return _view;
		}

		public function init():void{}
		public function pause():void{};
		public function resize(e:Event=null):void{};
		public function destroy():void{};
		
	}
}