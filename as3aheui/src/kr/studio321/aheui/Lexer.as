package kr.studio321.aheui
{
	public class Lexer
	{
		public static function tokenize( code:String ):Array
		{
			if( !code || code.length == 0 )
				return [];
			var codeLines:Array = code.replace( /\r\n|\r/g, "\n" ).split( "\n" );
			var code:String;
			var charCode:int;
			var tmpToken:Token;
			for( var i:int=0; i<codeLines.length; ++i )
				if( codeLines[ i ].length )
					codeLines[ i ] = codeLines[ i ].split( "" );
				else
					codeLines[ i ] = [];
			for each( var codeLine:Array in codeLines )
				for( var j:int=0; j<codeLine.length; ++j )
				{
					code = codeLine[ j ];
					codeLine[ j ] = tmpToken = new Token( code, true );
					charCode = code.charCodeAt()-44032;
					if( charCode>11171 || charCode<0 )
						continue;
					tmpToken.isNothing = false;
					tmpToken.initial = charCode/588;
					tmpToken.vowel = charCode%588/28;
					tmpToken.under = charCode%588%28;
				}
			return codeLines;
		}
		
	}
}