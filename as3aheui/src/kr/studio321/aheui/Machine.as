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
			cursor.setTo( 0, 0 );
		}
		
		public function step():void
		{
			// TODO : 구현
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