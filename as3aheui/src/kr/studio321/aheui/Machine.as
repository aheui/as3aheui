package kr.studio321.aheui
{
	import flash.geom.Point;

	public class Machine
	{	
		private static var strokeCounts:Array = [
			0, 2, 4, 4, 2,
			5, 5, 3, 5, 7,
			9, 9, 7, 9, 9,
			8, 4, 4, 6, 2,
			4, 1, 3, 4, 3,
			4, 4, 3
		];
		
		public var input:String;
		public var output:String;
		public var state:int;
		
		private var codeSpace:Array;
		private var storage:MachineStorage;
		private var direction:Boolean;
		private var speed:int;
		private var cursor:Point;
		
		public function Machine( codeSpace:Array )
		{
			this.codeSpace = codeSpace;
			storage = new MachineStorage;
			cursor = new Point;
			init();
		}
		
		public function init():void
		{
			input = output = "";
			state = MachineState.RUNNING;
			storage.clear();
			direction = MachineDirection.VERTICAL;
			speed = 1;
			cursor.x = cursor.y = 0;
		}
		
		public function step():void
		{
			switch( state )
			{
				case MachineState.STOPPED :
					return;
				case MachineState.WAITING_NUMBER :
					storage.push( parseFloat( input ) );
					break;
				case MachineState.WAITING_CHAR :
					storage.push( input.charCodeAt() );
					break;
			}
			state = MachineState.RUNNING;
			input = "";
			var token:Token = codeSpace[ cursor.y ][ cursor.x ];
			if( token )if( !token.isNothing )
			{
				switch( token.vowel )
				{
					case 0 :
						direction = MachineDirection.HORIZONTAL;
						speed = 1;
						break;
					case 2 :
						direction = MachineDirection.HORIZONTAL;
						speed = 2;
						break;
					case 4 :
						direction = MachineDirection.HORIZONTAL;
						speed = -1;
						break;
					case 6 :
						direction = MachineDirection.HORIZONTAL;
						speed = -2;
						break;
					case 8 :
						direction = MachineDirection.VERTICAL;
						speed = -1;
						break;
					case 12 :
						direction = MachineDirection.VERTICAL;
						speed = -2;
						break;
					case 13 :
						direction = MachineDirection.VERTICAL;
						speed = 1;
						break;
					case 17 :
						direction = MachineDirection.VERTICAL;
						speed = 2;
						break;
					case 18 :
						if( direction == MachineDirection.VERTICAL )
							speed = -speed;
						break;
					case 19 :
						speed = -speed;
						break;
					case 20 :
						if( direction == MachineDirection.HORIZONTAL )
							speed = -speed;
						break;
				}
				var a:int, b:int;
				switch( token.initial )
				{
					// "ㅇ" group
					case 18 :
						state = MachineState.STOPPED;
						return;
						// "ㄷ" group
					case 3 :
						a = storage.pop();
						b = storage.pop();
						storage.push( b+a );
						break;
					case 4 :
						a = storage.pop();
						b = storage.pop();
						storage.push( b*a );
						break;
					case 16 :
						a = storage.pop();
						b = storage.pop();
						storage.push( b-a );
						break;
					case 2 :
						a = storage.pop();
						b = storage.pop();
						storage.push( b/a );
						break;
					case 5 :
						a = storage.pop();
						b = storage.pop();
						storage.push( b%a );
						break;
					// "ㅁ" group
					case 6 :
						switch( token.under )
						{
							case 21 :
								output += String( storage.pop() );
								break;
							case 27 :
								output += String.fromCharCode( storage.pop() );
								break;
							default :
								storage.pop();
								break;
						}
						break;
					case 7 :
						switch( token.under )
						{
							case 21 :
								state = MachineState.WAITING_NUMBER;
								moveCursor();
								return;
							case 27 :
								state = MachineState.WAITING_CHAR;
								moveCursor();
								return;
							default :
								storage.push( Machine.strokeCounts[ token.under ] );
								break;
						}
						break;
					case 8 :
						storage.duplicate();
						break;
					case 17 :
						storage.swap();
						break;
					// "ㅅ" group
					case 9 :
						storage.select( token.under );
						break;
					case 10 :
						storage.move( token.under );
						break;
					case 12 :
						a = storage.pop();
						b = storage.pop();
						storage.push( ( b>=a )? 1 : 0 );
						break;
					case 14 :
						if( storage.pop() == 0 )
							speed = -speed;
						break;
				}
			}
			moveCursor();
		}
		
		private function moveCursor():void
		{
			if( direction == MachineDirection.HORIZONTAL )
			{
				cursor.x += speed;
				if( cursor.x < 0 )
					cursor.x = codeSpace[ cursor.y ].length-1;
				else if( cursor.x >= codeSpace[ cursor.y ].length )
					cursor.x = 0;
				return;
			} else {
				cursor.y += speed;
				if( cursor.y < 0 )
					cursor.y = codeSpace.length-1;
				else if( cursor.y >= codeSpace.length )
					cursor.y = 0;
			}
		}
		
	}
}