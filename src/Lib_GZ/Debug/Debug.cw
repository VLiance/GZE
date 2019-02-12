

package { 

	public overclass Debug {

		//public static var oInst : Debug;
		
		/*
		public static var bPipe : Bool = false;
		public static var bPrefix : Bool = true;
		
		public static var sMsgFuncMissing: String = " not implemented";
		
		
		public function Debug():Void {
			Debug.oInst = this;
		}
		*/
	
	
		private function fConsole(_sValue:String):Void { //Pure function Cannot be overplaced
		
			<cpp>
				_sValue.fPrint();
			// printf("c:%s\n", (char*)_sValue.fToChar());
		   //  printf("%s\n",_sValue.fToChar());
			</cpp>
		}
		
		 function fTrace(_sValue:String):Void {
			fConsole(_sValue);
		}
		 function fPass(_sValue:String):Void {
			fConsole(_sValue);
		}
		 function fWarning(_sValue:String):Void {
			fConsole(_sValue);
		}
		 function fError(_sValue:String):Void {
			fConsole(_sValue);
		}
		 function fFatal(_sValue:String):Void {
			fConsole(_sValue);
		}
		
		
		
		/*
		public function Debug(_nWidth : Int, _nHeight : Int, _nPosX : Int = 0, _nPosY : Int = 0):Void{
			Debug.oInst = this;
		}*/
		
	
	
		/*
		macro function fConsole(_sValue:String):Void;
		macro function fTrace1(_sValue:String):Void; 
		macro function fTrace2(_sValue:String):Void;
		macro function fTrace3(_sValue:String):Void;
		macro function fError(_sValue:String):Void;
		*/
/*
		static function fTrace1(_sValue:String):Void {
		//	fConsole(_sValue);
		//	oInst.fTrace1(_sValue);
		}
		static function fTrace2(_sValue:String):Void {
			//oInst.fTrace2(_sValue);
		}
		static function fTrace3(_sValue:String):Void {
		//	oInst.fTrace3(_sValue);
		}
*/

		
	/*
		public function fTrace1(_sValue:String):Void;
		public function fTrace2(_sValue:String):Void;
		public function fTrace3(_sValue:String):Void;

		public function fWarning(_sValue:String):Void;
		public function fError(_sValue:String):Void;
		public function fPass(_sValue:String):Void;
		public function fFatal(_sValue:String):Void;

		*/
}

}
