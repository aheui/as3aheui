package kr.studio321.aheui
{
	public class MachineStorage
	{
		private var storages:Array;
		private var id:int;
		
		public function MachineStorage()
		{
			id = 0;
			storages = [];
			for( var i:int=0; i<28; ++i )
				storages[ i ] = [];
		}
		
		public function clear():void
		{
			id = 0;
			for( var i:int=0; i<28; ++i )
				storages[ i ].length = 0;
		}
		
		public function pop():int
		{
			return (
				( id == 21 )?
				storages[ id ].shift() : storages[ id ].pop()
			) as int;
		}
		
		public function push( value:int ):void
		{
			storages[ id ].push( value );
		}
		
		public function duplicate():void
		{
			var storage:Array = storages[ id ];
			if( id == 21 || id == 27 )
				storage.unshift( storage[ 0 ] );
			else
				storage.push( storage[ storage.length-1 ] );
		}
		
		public function swap():void
		{
			// TODO : 구현
		}
		
	}
}