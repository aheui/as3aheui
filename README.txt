// »ç¿ë ¿¹


import kr.studio321.aheui.Lexer;
import kr.studio321.aheui.Machine;

var code:String = "¹ã“Pµûºü“P¹âµû»Ñ\n" +
"ºü¸ÄÆÄ»¡¹Þ¹ã¶Ñ¹¸\n" +
"µ¸“UÅÁºü¸Ä”ÆµÎºÑ\n" +
"“ý‘§¹Ú¹ßŒóÅõ¹¸”É\n" +
"‘§µµ‘§Èñ¸Ý¹¸¹¸”Ë\n" +
"‘§”KÅä¹ü´õ¹ú»Ñ¶Ñ\n" +
"»Ì»Ç¸Ý¸Ý´õ“³»µ¶Ó\n" +
"»Çµ¢“°¸Ý»µ´ö´õ¹÷\n";

var machine:Machine = new Machine;
machine.codeSpace = Lexer.tokenize( code );

while( machine.state )
{
	machine.step();
}

trace( machine.output );