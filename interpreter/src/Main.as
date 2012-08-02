package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import kr.studio321.aheui.Lexer;
	import kr.studio321.aheui.Machine;
	import kr.studio321.aheui.MachineState;
	
	public class Main extends Sprite
	{
		private var title:TextField;
		private var code_tf:TextField;
		private var input_tf:TextField;
		private var output_tf:TextField;
		private var initial_bt:TextField;
		private var start_bt:TextField;
		private var stop_bt:TextField;
		
		private var machine:Machine;
		
		public function Main()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener( Event.RESIZE, setAlign );
			
			machine = new Machine;
			
			title = addChild( new TextField ) as TextField;
			code_tf = addChild( new TextField ) as TextField;
			input_tf = addChild( new TextField ) as TextField;
			output_tf = addChild( new TextField ) as TextField;
			initial_bt = addChild( new TextField ) as TextField;
			start_bt = addChild( new TextField ) as TextField;
			stop_bt = addChild( new TextField ) as TextField;
			
			initial_bt.addEventListener( MouseEvent.MOUSE_OVER, MOUSE_OVER_initial_bt );
			initial_bt.addEventListener( MouseEvent.MOUSE_OUT, MOUSE_OUT_initial_bt );
			initial_bt.addEventListener( MouseEvent.MOUSE_DOWN, MOUSE_DOWN_initial_bt );
			start_bt.addEventListener( MouseEvent.MOUSE_OVER, MOUSE_OVER_start_bt );
			start_bt.addEventListener( MouseEvent.MOUSE_OUT, MOUSE_OUT_start_bt );
			start_bt.addEventListener( MouseEvent.MOUSE_DOWN, MOUSE_DOWN_start_bt );
			stop_bt.addEventListener( MouseEvent.MOUSE_OVER, MOUSE_OVER_stop_bt );
			stop_bt.addEventListener( MouseEvent.MOUSE_OUT, MOUSE_OUT_stop_bt );
			stop_bt.addEventListener( MouseEvent.MOUSE_DOWN, MOUSE_DOWN_stop_bt );
			
			with( title )
			{
				defaultTextFormat = new TextFormat( null, 25, 0, true );
				autoSize = TextFieldAutoSize.LEFT;
				text = "액션스크립트로 된 아희 처리기";
				selectable = false;
			}
			with( code_tf )
			{
				defaultTextFormat = new TextFormat( "_typewriter", 12 );
				type = TextFieldType.INPUT;
				multiline = true;
				border = true;
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
			}
			with( input_tf )
			{
				defaultTextFormat = new TextFormat( "_typewriter", 12 );
				type = TextFieldType.INPUT;
				border = true;
			}
			with( output_tf )
			{
				defaultTextFormat = new TextFormat( "_typewriter", 12 );
				multiline = true;
				border = true;
			}
			setAlign();
			setAlign();
		}
		
		private function MOUSE_OVER_initial_bt( e:MouseEvent ):void
		{
			initial_bt.backgroundColor = 0xAAAAAA;
		}
		private function MOUSE_OUT_initial_bt( e:MouseEvent ):void
		{
			initial_bt.backgroundColor = 0xEEEEEE;
		}
		private function MOUSE_DOWN_initial_bt( e:MouseEvent ):void
		{
			machine.init();
			output_tf.text = "";
		}
		
		private function MOUSE_OVER_start_bt( e:MouseEvent ):void
		{
			start_bt.backgroundColor = 0xAAAAAA;
		}
		private function MOUSE_OUT_start_bt( e:MouseEvent ):void
		{
			start_bt.backgroundColor = 0xEEEEEE;
		}
		private function MOUSE_DOWN_start_bt( e:MouseEvent ):void
		{
			machine.codeSpace = Lexer.tokenize( code_tf.text );
			machine.input = input_tf.text;
			if( !hasEventListener( Event.ENTER_FRAME ) )
				addEventListener( Event.ENTER_FRAME, ENTER_FRAME );
		}
		
		private function MOUSE_OVER_stop_bt( e:MouseEvent ):void
		{
			stop_bt.backgroundColor = 0xAAAAAA;
		}
		private function MOUSE_OUT_stop_bt( e:MouseEvent ):void
		{
			stop_bt.backgroundColor = 0xEEEEEE;
		}
		private function MOUSE_DOWN_stop_bt( e:MouseEvent ):void
		{
			if( hasEventListener( Event.ENTER_FRAME ) )
			{
				removeEventListener( Event.ENTER_FRAME, ENTER_FRAME );
				output_tf.appendText( "--일시정지됨--\n" );
			}
		}
		
		private function ENTER_FRAME( e:Event ):void
		{
			for( var i:int=0; i<1000; ++i )
			{
				if( machine.state )
				{
					machine.step();
					output_tf.text = machine.output;
					output_tf.appendText( "--실행중--\n" );
					if( machine.state == MachineState.WAITING_NUMBER )
					{
						output_tf.appendText( "--숫자입력대기중--\n" );
						input_tf.text = "이 곳에 숫자를 입력하신 후 실행 버튼을 눌러주세요";
						removeEventListener( Event.ENTER_FRAME, ENTER_FRAME );
						break;
					}
					if( machine.state == MachineState.WAITING_CHAR )
					{
						output_tf.appendText( "--글자입력대기중--\n" );
						input_tf.text = "이 곳에 글자를 입력하신 후 실행 버튼을 눌러주세요";
						removeEventListener( Event.ENTER_FRAME, ENTER_FRAME );
						break;
					}
				} else {
					removeEventListener( Event.ENTER_FRAME, ENTER_FRAME );
					output_tf.text = machine.output;
					output_tf.appendText( "--코드실행완료--\n" );
					break;
				}
			}
		}
		
		private function setAlign( e:Event = null ):void
		{
			var sw:int, sh:int;
			sw = stage.stageWidth;
			sh = stage.stageHeight;
			with( title )
				x = y = 10;
			with( code_tf )
			{
				x = 10;
				y = title.y+title.height+10;
				width = sw-20;
				height = ( sh-y )/2;
			}
			with( initial_bt )
			{
				x = 10;
				y = code_tf.y+code_tf.height+10;
			}
			with( start_bt )
			{
				x = initial_bt.x+initial_bt.width+10;
				y = initial_bt.y;
			}
			with( stop_bt )
			{
				x = start_bt.x+start_bt.width+10;
				y = initial_bt.y;
			}
			with( input_tf )
			{
				autoSize = TextFieldAutoSize.LEFT;
				width = sw-x-10;
				autoSize = TextFieldAutoSize.NONE;
				x = stop_bt.x+stop_bt.width+10;
				y = initial_bt.y;
			}
			with( output_tf )
			{
				x = 10;
				y = initial_bt.y+initial_bt.height+10;
				width = code_tf.width;
				height = sh-y-10;
			}
		}
		
	}
}