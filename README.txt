// MIT 라이센스 하에 배포합니다.

// 사용 예
import kr.studio321.aheui.Lexer;
import kr.studio321.aheui.Machine;

var code:String = "밤밣따빠밣밟따뿌\n" +
"빠맣파빨받밤뚜뭏\n" +
"돋밬탕빠맣붏두붇\n" +
"볻뫃박발뚷투뭏붖\n" +
"뫃도뫃희멓뭏뭏붘\n" +
"뫃봌토범더벌뿌뚜\n" +
"뽑뽀멓멓더벓뻐뚠\n" +
"뽀덩벐멓뻐덕더벅\n";

var machine:Machine = new Machine;
machine.codeSpace = Lexer.tokenize( code );

while( machine.state )
{
	machine.step();
}

trace( machine.output ); //Hello, world!