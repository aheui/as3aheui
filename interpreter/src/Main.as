package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	public class Main extends Sprite
	{
		private var title:TextField;
		private var input_tf:TextField;
		private var output_tf:TextField;
		private var initial_bt:TextField;
		private var start_bt:TextField;
		private var stop_bt:TextField;
		
		public function Main()
		{
			title = addChild( new TextField ) as TextField;
			input_tf = addChild( new TextField ) as TextField;
			output_tf = addChild( new TextField ) as TextField;
			initial_bt = addChild( new TextField ) as TextField;
			start_bt = addChild( new TextField ) as TextField;
			stop_bt = addChild( new TextField ) as TextField;
			
			with( title )
			{
				defaultTextFormat = new TextFormat( null, 25, 0, true );
				autoSize = TextFieldAutoSize.LEFT;
				text = "액션스크립트로 된 아희 처리기";
				selectable = false;
				x = y = 10;
			}
			with( input_tf )
			{
				defaultTextFormat = new TextFormat( "_typewriter", 13 );
				width = height = 100;
				type = TextFieldType.INPUT;
				multiline = true;
				border = true;
				x = 10;
				y = title.y+title.height+10;
			}
		}
	}
}