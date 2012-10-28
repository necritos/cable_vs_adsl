package com.fisi.projects.cvsdsl.model 
{

	import com.fisi.projects.core.view.AbstractMediator;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.FullScreenEvent;
	import flash.events.IEventDispatcher;
	import flash.external.ExternalInterface;
	import flash.geom.ColorTransform;
	import flash.media.SoundMixer;
	import com.fisi.projects.cvsdsl.view.PresentationMediator;


	
	
	public class ManagerView extends EventDispatcher 
	{
		public static const PRESENTATION:String = 'presentation';

		
		
		public static const HORIZONTAL:String="horizontal";
		public static const VERTICAL:String="vertical";
		//public static const GAME:String = 'game';
		//public static const GAMEOVER:String = 'gameover';
		//public static const INSTRUCTION:String = 'instruction';
		//public static const SHOWMENU:String = "showmenu";
		
		private var _currentMed:AbstractMediator;
		private var _currentPopupMed:AbstractMediator;
		
		private var _context:DisplayObject;
		private var _content:DisplayObjectContainer;
		private var _popup:DisplayObjectContainer;
		
		private var _function:Function = null;
		public var activeMenu:Boolean = true;
		private  var _stage:Stage;
		public var _position:String="vertical";
		//public var _fb:FacebookTools;
		private var _heads:Array=[];
		public function ManagerView($context:DisplayObjectContainer,$stage:Stage) 
		{
			super();
			
			_stage=$stage;
			_context =($context);
			//_content = _context['_content'];
			_content = (CVSDSL)(_context).content();
			_popup = (CVSDSL)(_context).popup();
			
			//_fb=new FacebookTools(KidPadPalConst.FbAppID,KidPadPalConst.FbAppSecret,_stage);
			
			//_fbVO = new FacebookVo();
		}
		//Popup ------------------------------------------------------------------------
		public function showPopup($name:String, $data:*):void
		{
			if (_currentPopupMed)
			{
				if (_popup.numChildren > 0)
				{
					
					_popup.removeChild(_currentPopupMed.view);
					_currentPopupMed.destroy();
				}
			}
			
			_currentPopupMed = null;
			var aux1:AbstractMediator = factoryView($name, $data);
			if (aux1)
			{
				_popup.addChild(aux1.view);
				_currentPopupMed = aux1;
			}
			
			_context.stage.dispatchEvent(new Event(Event.RESIZE));
		}
		public function hidePopup():void
		{
			if (_currentPopupMed)
			{
				if (_popup.numChildren > 0)
				{
					
					_popup.removeChild(_currentPopupMed.view);
					_currentPopupMed.destroy();
				}
			}
			
			_currentPopupMed = null;
		}
		//ChangeView -------------------------------------------------------------------
		public function changeView($name:String, $data:*):void
		{
			//activeMenu = $activemenu;
			
			if (_currentMed)
			{
				if (_content.numChildren > 0)
				{
					
					_content.removeChild(_currentMed.view);
					_currentMed.destroy();
				}
			}

			_currentMed = null;
			var aux1:AbstractMediator = factoryView($name, $data);
			if (aux1)
			{
				_content.addChild(aux1.view);
				_currentMed = aux1;
			}

			_context.stage.dispatchEvent(new Event(Event.RESIZE));
			//dispatchEvent(new Event(ManagerView.SHOWMENU));
		}

		private function factoryView($name:String, $data:*):AbstractMediator
		{
			var med:AbstractMediator = null;
			
			switch ($name) 
			{
				case 'presentation':
					med = new PresentationMediator(new PresentationScreen(),$data,this);
					return med;	
				

				default:
			}
			return med; 
		}
		
		//resize
		public function resize(e:Event):void
		{
			if(_stage.stageWidth>_stage.stageHeight)
			{
				_position=HORIZONTAL;
			}else
			{
				_position=VERTICAL;
			}
				//_currentMed.view.x = _stage.stageWidth*0.5 - KidPadPalConst.WIDTH_DISPLAY*0.5;
				//_currentMed.view.y = _stage.stageHeight*0.5 - KidPadPalConst.HEIGHT_DISPLAY*0.5;
			switch(_position)
			{
				case VERTICAL:
				{
					//_currentMed.view['bg'].height=_stage.stageHeight;
					//_currentMed.view['bg'].scaleX=_currentMed.view['bg'].scaleY;
					break;
				}
				case HORIZONTAL:
				{
					//_currentMed.view['bg'].width=_stage.stageWidth;
					//_currentMed.view['bg'].scaleY=_currentMed.view['bg'].scaleX;
					if (_currentMed)
					{
						_currentMed.view.width=_stage.stageWidth;
						_currentMed.view.scaleY=_currentMed.view.scaleX;
					}
					if(_currentPopupMed)
					{
						_currentPopupMed.view.height=_stage.stageHeight;
						_currentPopupMed.view.scaleX=_currentPopupMed.view.scaleY;
						
						_currentPopupMed.view.x=_stage.stageWidth*0.5-_currentPopupMed.view.width*0.5;
						//_currentPopupMed.view.y=_stage.stageWidth*0.5-_currentPopupMed.view.width*0.5;
						//_currentMed.view.scaleY=_currentMed.view.scaleX;
						//_popup.width=_stage.stageWidth;
						//_currentMed.view.scaleX=_currentMed.view.scaleY;
						//_popup.x=_stage.stageWidth*0.5-_popup.width*0.5;//862
						//_popup.y=_stage.stageHeight*0.5-_popup.height*0.5;//640
					}
				}
					
				default:
				{
					break;
				}
			
				//_currentMed.view.x=_stage.stageWidth*0.5-_currentMed.view.width*0.5;//862
				//_currentMed.view.y=_stage.stageHeight*0.5-_currentMed.view.height*0.5;//640
				//_currentMed.view.scaleY=0.6;
			}

		}
		public function FULLSCREEN_handler(e:FullScreenEvent):void
		{
			/*if (_currentMed)
			{
				_currentMed.view.x = _stage.stageWidth*0.5 - KidPadPalConst.WIDTH_DISPLAY*0.5;
				_currentMed.view.y = _stage.stageHeight*0.5 - KidPadPalConst.HEIGHT_DISPLAY*0.5;
			}*/
		}
		
		public function stage():Stage
		{
			return _stage;
		}

		public function get heads():Array
		{
			return _heads;
		}

		public function set heads(value:Array):void
		{
			_heads = value;
		}

		
	}

}