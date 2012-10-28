package com.fisi.projects.cvsdsl.model.entity
{
	import flash.display.Sprite;

	public class Square extends Sprite
	{
		private var _l1:Line;
		private var _l2:Line;
		private var _l3:Line;
		private var _l4:Line;
		private var _owner:Player=null;
		
		private var _xi:int;
		private var _yi:int;
		public function Square(x:int, y:int)
		{
			this._xi=x;
			this._yi=y;
		}

		public function get l1():Line
		{
			return _l1;
		}

		public function set l1(value:Line):void
		{
			_l1 = value;
		}

		public function get l2():Line
		{
			return _l2;
		}

		public function set l2(value:Line):void
		{
			_l2 = value;
		}

		public function get l3():Line
		{
			return _l3;
		}

		public function set l3(value:Line):void
		{
			_l3 = value;
		}

		public function get l4():Line
		{
			return _l4;
		}

		public function set l4(value:Line):void
		{
			_l4 = value;
		}

		public function get owner():Player
		{
			return _owner;
		}

		public function set owner(value:Player):void
		{
			_owner = value;
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


		public function isMarked():Boolean
		{
			// TODO Auto Generated method stub
			return false;
		}
		
		public function isFull():Boolean
		{
			// TODO Auto Generated method stub
			return false;
		}
	}
}