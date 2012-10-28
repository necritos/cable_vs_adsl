package com.fisi.projects.cvsdsl.model.entity
{
	public class Player
	{
		private var _color:uint;
		private var _nombre:String;
		
		public function Player()
		{
		}

		public function get color():uint
		{
			return _color;
		}

		public function set color(value:uint):void
		{
			_color = value;
		}

		public function get nombre():String
		{
			return _nombre;
		}

		public function set nombre(value:String):void
		{
			_nombre = value;
		}


	}
}