package kr.studio321.aheui
{
	public class Lexer
	{
		public static function tokenize( code:String ):Array
		{
			var codeLines:Array = code.replace( "\r\n", "\n" ).split( "\n" );
			var code:String;
			var charCode:int;
			var token:Token;
			var initial:int, vowel:int, under:int;
			var initialChar:String, vowelChar:String;
			for( var i:int=0; i<codeLines.length; ++i )
				if( codeLines[ i ].length )
					codeLines[ i ] = codeLines[ i ].split( "" );
				else
					codeLines[ i ] = [];
			for each( var codeLine:Array in codeLines )
				for( var j:int=0; j<codeLine.length; ++j )
				{
					code = codeLine[ j ];
					charCode = code.charCodeAt()-44032;
					if( charCode>11171 || charCode<0 )
					{
						codeLine[ j ] = new Token( code, true );
						continue;
					}
					initial = int( charCode/588 );
					vowel = int( charCode%588/28 );
					under = charCode%588%28;
					initialChar = String.fromCharCode( 4352+initial );
					vowelChar = String.fromCharCode( 44032 + initial*588 + vowel*28 );
					if( initialChar == vowelChar )
					{
						codeLine[ j ] = new Token( code, true );
						continue;
					}
					codeLine[ j ] = new Token( code, false, initial, vowel, under );
					continue;
				}
			return codeLines;
		}
		
	}
}