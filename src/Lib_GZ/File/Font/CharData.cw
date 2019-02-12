package 
{
	
	/**
	 * ...
	 * @author Maeiky
	 */
	public class CharData  {
		
	
		
		public var nChar : UInt;
		public var nX : Int16;
		public var nY : Int16;
		public var nW : Int16;
		public var nH : Int16;
		//public var rRect : uRectPack;
		public var nHoriAdvance : Float;
        public var nHoriBeringX : Float; //Int16?
        public var nHoriBeringY : Float;
		
		
		public function CharData(_nChar:Int):Void{
			nChar = _nChar;
		}
		
	}
	
}