package com.fisi.projects.cvsdsl.model.entity
{
	
	//import com.fisi.projects.cvsdsl.model.vars.CVSDSL_CONST;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class Line extends Sprite
	{
		private var _xi:int;
		private var _yi:int;
		private var _stamp:Boolean;
		private var _orientation:int=0;
		private var _mx:int;
		private var _my:int;
		private var _mSquare:Array=new Array();
		private var w:int=40;
		
		public function Line()
		{
			_stamp=false;
		}

		public function get mSquare():Array
		{
			return _mSquare;
		}

		public function set mSquare(value:Array):void
		{
			_mSquare = value;
		}

		public function init():void{
			
		}
		
		public function draw():void{
			if(orientation == 2){
				this.graphics.beginFill(0xffffff);
				this.graphics.drawRect(0,0,w,20);
				this.graphics.endFill();
			}else{
				this.graphics.beginFill(0xffffff);
				this.graphics.drawRect(0,0,20,w);
				this.graphics.endFill();
			}	
		}
		public function stamping(color:uint):void
		{
			if(!_stamp){
				if(orientation==2){
					trace("entra");
					this.graphics.beginFill(color)
					this.graphics.drawRect(0,0, w ,20);
					this.graphics.endFill();
				}else{
					this.graphics.beginFill(color)
					this.graphics.drawRect(0,0,20,w );
					this.graphics.endFill();
				}
				_stamp=true;
			}
			
		}
		
		public function get xi():int
		{
			return _xi;
		}

		public function set xi(value:int):void
		{
			_xi = value;
		}

		public function get yi():int
		{
			return _yi;
		}

		public function set yi(value:int):void
		{
			_yi = value;
		}

		public function get stamp():Boolean
		{
			return _stamp;
		}

		public function set stamp(value:Boolean):void
		{
			_stamp = value;
		}

		public function get orientation():int
		{
			return _orientation;
		}

		public function set orientation(value:int):void
		{
			_orientation = value;
		}

		public function get mx():int
		{
			return _mx;
		}

		public function set mx(value:int):void
		{
			_mx = value;
		}

		public function get my():int
		{
			return _my;
		}

		public function set my(value:int):void
		{
			_my = value;
		}


	}
}