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
			init();
		}
		
		public function init():void
		{
			// TODO : 구현
		}
		
		public function step():void
		{
			// TODO : 구현
		}
	}
}