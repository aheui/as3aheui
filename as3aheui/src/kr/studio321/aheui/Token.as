package kr.studio321.aheui
{
	public class Token
	{
		public static var INITIALS:Array = [
			"ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ",
			"ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ",
			"ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ",
			"ㅋ", "ㅌ", "ㅍ", "ㅎ"
		];
		public static var VOWELS:Array = [
			"ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ",
			"ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ",
			"ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ",
			"ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ",
			"ㅣ"
		];
		public static var UNDERS:Array = [
			"　","ㄱ", "ㄲ", "ㄳ", "ㄴ",
			'ㄵ', 'ㄶ', 'ㄷ', "ㄹ", "ㄺ",
			'ㄻ', 'ㄼ', 'ㄽ', "ㄾ", "ㄿ",
			'ㅀ', 'ㅁ', 'ㅂ', "ㅄ", "ㅅ",
			'ㅆ', 'ㅇ', 'ㅈ', "ㅊ", "ㅋ",
			'ㅌ', 'ㅍ', 'ㅎ'
		];
		
		public var code:String;
		public var isNothing:Boolean;
		public var initial:int;
		public var vowel:int;
		public var under:int;
		
		public function Token(
			code:String = "",
			isNothing:Boolean = true,
			initial:int=0,
			vowel:int=0,
			under:int=0
		)
		{
			this.code = code;
			this.isNothing = isNothing;
			this.initial = initial;
			this.vowel = vowel;
			this.under = under;
		}
		
		public function toString():String
		{
			if( this.isNothing )
				return "[ 주석 ]";
			return "[ " + Token.INITIALS[ initial ] +
				", " + Token.VOWELS[ vowel ] +
				", " + Token.UNDERS[ under ] + " ]";
		}
	}
}