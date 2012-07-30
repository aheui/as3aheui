package kr.studio321.aheui
{
	public class Token
	{
		public var code:String;
		public var isNothing:Boolean;
		public var initial:int;
		public var vowel:int;
		public var under:int;
		
		public function Token( initial:int, vowel:int, under:int )
		{
			this.initial = initial;
			this.vowel = vowel;
			this.under = under;
		}
	}
}