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
		}
	}
}