package kr.studio321.aheui
{
	import flash.geom.Point;

	public class Machine
	{	
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
	}
}