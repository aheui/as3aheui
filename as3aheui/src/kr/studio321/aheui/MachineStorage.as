package kr.studio321.aheui
{
	public class MachineStorage
	{
		private var storage:Array;
		
		public function MachineStorage()
		{
			storage = [];
			for( var i:int=0; i<28; ++i )
				storage[ i ] = [];
		}
		
		public function clear():void
		{
			for( var i:int=0; i<28; ++i )
				storage[ i ].length = 0;
		}
		
		public function pop( id:int ):int
		{
			return (
				( id == 21 )?
				storage[ id ].shift() : storage[ id ].pop()
			) as int;
		}
		
		public function push( id:int, value:int ):void
		{
			// TODO : 구현
		}
		
		public function duplicate( id:int ):void
		{
			// TODO : 구현
		}
		
		public function swap( id:int ):void
		{
			// TODO : 구현
		}
		
	}
}