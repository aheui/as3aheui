package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
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
				defaultTextFormat = new TextFormat( "_typewriter", 12 );
				type = TextFieldType.INPUT;
				multiline = true;
				border = true;
				x = 10;
				y = title.y+title.height+10;
			}
			with( initial_bt )
			{
				defaultTextFormat = new TextFormat( "_typewriter", 12, 0, null, null, null, null, null, TextFormatAlign.CENTER );
				autoSize = TextFieldAutoSize.LEFT;
				text = "초기화";
				border = true;
				background = true;
				backgroundColor = 0xEEEEEE;
				selectable = false;
				x = 10;
				y = input_tf.y+input_tf.height+10;
			}
			with( start_bt )
			{
				defaultTextFormat = new TextFormat( "_typewriter", 12, 0, null, null, null, null, null, TextFormatAlign.CENTER );
				autoSize = TextFieldAutoSize.LEFT;
				text = "실행";
				border = true;
				background = true;
				backgroundColor = 0xEEEEEE;
				selectable = false;
				x = initial_bt.x+initial_bt.width+10;
				y = initial_bt.y;
			}
			with( stop_bt )
			{
				defaultTextFormat = new TextFormat( "_typewriter", 12, 0, null, null, null, null, null, TextFormatAlign.CENTER );
				autoSize = TextFieldAutoSize.LEFT;
				text = "멈춤";
				border = true;
				background = true;
				backgroundColor = 0xEEEEEE;
				selectable = false;
				x = start_bt.x+start_bt.width+10;
				y = initial_bt.y;
			}
			with( output_tf )
			{
				defaultTextFormat = new TextFormat( "_typewriter", 12 );
				type = TextFieldType.INPUT;
				multiline = true;
				border = true;
				selectable = false;
				x = 10;
				y = initial_bt.y+initial_bt.height+10;
			}
		}
	}
}