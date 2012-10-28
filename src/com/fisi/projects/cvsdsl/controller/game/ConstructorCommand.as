package com.fisi.projects.cvsdsl.controller.game
{
	import com.fisi.projects.core.controller.AbstractCommand;
	import com.fisi.projects.core.view.AbstractMediator;
	import com.fisi.projects.cvsdsl.model.entity.Line;
	import com.fisi.projects.cvsdsl.model.entity.Square;
	import com.fisi.projects.cvsdsl.view.PresentationMediator;
	
	import flash.events.MouseEvent;
	
	public class ConstructorCommand extends AbstractCommand
	{
		private var _lines:Array;
		private var _labeled:Array;
		private var _unlabeled:Array;
		private var _mx:Array;
		private var _mxpoint:Array;
		private var _mxempty:Array;
		private var med:PresentationMediator;
		public function ConstructorCommand($med:AbstractMediator)
		{
			med=(PresentationMediator)($med);
			super($med);
		}
		
		public function get mxempty():Array
		{
			return _mxempty;
		}

		public function set mxempty(value:Array):void
		{
			_mxempty = value;
		}

		public function get mxpoint():Array
		{
			return _mxpoint;
		}

		public function set mxpoint(value:Array):void
		{
			_mxpoint = value;
		}

		public function get unlabeled():Array
		{
			return _unlabeled;
		}

		public function set unlabeled(value:Array):void
		{
			_unlabeled = value;
		}

		public function get labeled():Array
		{
			return _labeled;
		}

		public function set labeled(value:Array):void
		{
			_labeled = value;
		}

		override public function init():void{
			_mx=new Array();
			_lines=new Array();
			_labeled=new Array();
			_unlabeled=new Array();
			for(var i:int=0;i< 7;i++){
				for(var j:int=0;j<7;j++){
					_mx.push(new Square(i,j));
				}
			}
			//lineas verticales
			for(var z:int=0;z<7+1;z++){
				for(var h:int=0;h<7;h++){
					trace(z+" "+h);
					var lauxa:Line=new Line();
					lauxa.x=z*60;
					lauxa.y=h*40+(h+1)*20;
					lauxa.mx=z;
					lauxa.my=h;
					lauxa.orientation=1;
					relacionarV(lauxa);
					_lines.push(lauxa);
					
				}		
			}
			//lineas horizontales
			for(var a:int=0;a<7;a++){
				for(var b:int=0;b<7+1;b++){
					var lauxb:Line=new Line();
					lauxb.x=a*40+(a+1)*20;
					lauxb.y=b*60;
					lauxb.mx=a;
					lauxb.my=b;
					lauxb.orientation=2;
					relacionarH(lauxb);
					_lines.push(lauxb);
				}		
			}
			drawAll();
			
		}
		
		private function drawAll():void
		{
			for(var i:int=0;i<lines.length;i++){
				var l:Line=lines[i];
				med.mview.content.addChild(l);
				l.draw();
				l.addEventListener(MouseEvent.CLICK,CLICK_line);
				unlabeled.push(l);
				
			}
			
		}
		
		protected function CLICK_line(event:MouseEvent):void
		{
			var l:Line=(Line)(event.currentTarget);
			l.stamping(0x151862);
			var idx:int=unlabeled.indexOf(l);
			unlabeled.splice(idx,1);
			//trace(idx+" unlabe:"+unlabeled.length);
			labeled.push(l);
			if(!isPoint(l)){
				
				playPc();
				
			}
			
		}
		
		private function isPoint(l:Line):Boolean
		{
			for(var i:int=0;i<l.mSquare.length;i++){
				var sq:Square=(Square)(l.mSquare[i]);
				if(!sq.isMarked()&&sq.isFull()){
					//marcar
					return true;
				}
			}
			return false;
		}
		
		private function playPc():void
		{
			if(unlabeled.length>0){
				var idx:int=Math.random()*1000%unlabeled.length;
				var l:Line=(Line)(unlabeled[idx]);
				l.stamping(0x751562);
				unlabeled.splice(idx,1);
				//trace(idx+" unlabe:"+unlabeled.length);
				labeled.push(l);
			}
		}
		
		private function relacionarV(l:Line):void
		{
			var x:int=l.mx;
			var y:int=l.my;
			for(var i:int=0;i<this._mx.length;i++){
				var saux:Square=_mx[i];
				if(saux.xi==x&&saux.yi==y){
					saux.l4=l;
					l.mSquare.push(saux);
				}
				if(saux.xi==x-1&&saux.yi==y){
					saux.l2=l;
					l.mSquare.push(saux);
				}
			}
		}
		private function relacionarH(l:Line):void
		{
			var x:int=l.mx;
			var y:int=l.my;
			for(var i:int=0;i<this._mx.length;i++){
				var saux:Square=_mx[i];
				if(saux.xi==x&&saux.yi==y){
					saux.l1=l;
					l.mSquare.push(saux);
				}
				if(saux.xi==x&&saux.yi==y-1){
					saux.l3=l;
					l.mSquare.push(saux);
				}
			}
		}
		public function get lines():Array
		{
			return _lines;
		}

		public function set lines(value:Array):void
		{
			_lines = value;
		}

		public function get mx():Array
		{
			return _mx;
		}

		public function set mx(value:Array):void
		{
			_mx = value;
		}


	}
}