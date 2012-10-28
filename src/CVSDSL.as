package
{
	
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import com.fisi.projects.cvsdsl.model.ManagerView;




	
	
	public class CVSDSL extends Sprite
	{
		private var aplication:NativeApplication;
		private var _manager:ManagerView;
		private  var _content:Sprite;
		private var _popup:Sprite;
		
		public function CVSDSL()
		{
			super();
			aplication=NativeApplication.nativeApplication;
			aplication.systemIdleMode=SystemIdleMode.KEEP_AWAKE;//mantener pantalla activa
			
			app();
		}
		
		private function app():void
		{
			// TODO Auto Generated method stub
			stage.scaleMode=StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			
			//--------------------------------------
			_content=new Sprite();
			_popup=new Sprite();
			
			addChild(_content);
			addChild(_popup);
			
			_manager=new ManagerView(this,stage);
			
			stage.addEventListener(Event.RESIZE,_manager.resize);
			stage.dispatchEvent(new Event(Event.RESIZE));
			
			//_manager.changeView(ManagerView.LOGIN,null);
			_manager.changeView(ManagerView.PRESENTATION,null);
		}
		public function content():Sprite
		{
			return _content;
		}
		
		public function popup():Sprite
		{
			return _popup;
		}
	}
	
}