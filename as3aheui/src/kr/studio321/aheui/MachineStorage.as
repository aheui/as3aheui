package kr.studio321.aheui
{
	public class MachineStorage
	{
		private var storages:Array;
		
		public function MachineStorage()
		{
			storages = [];
			for( var i:int=0; i<28; ++i )
				storages[ i ] = [];
		}
		
		public function clear():void
		{
			for( var i:int=0; i<28; ++i )
				storages[ i ].length = 0;
		}
		
		public function pop( id:int ):int
		{
			return (
				( id == 21 )?
				storages[ id ].shift() : storages[ id ].pop()
			) as int;
		}
		
		public function push( id:int, value:int ):void
		{
			storages[ id ].push( value );
		}
		
		public function duplicate( id:int ):void
		{
			var storage:Array = storages[ id ];
			if( id == 21 || id == 27 )
				storage.unshift( storage[ 0 ] );
			else
				storage.push( storage[ storage.length-1 ] );
		}
		
		public function swap( id:int ):void
		{
			// TODO : 구현
		}
		
	}
}