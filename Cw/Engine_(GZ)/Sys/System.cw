package  { 

	public overclass System  {

		public static var oInst : System;
		public static var nInstance : UIntX;
		public static var bHaveGpu : Bool;
		public static var sCmdLineArguments : String;
		
		
		public function System():Void{
			System.oInst = this;
		}
		
		static function fSleep(_nMilliseconds : UInt = 1):Void {
			if(oInst ) {
			}else{
				oInst = new System();
			}

			oInst.fSleep(_nMilliseconds);
		}

		
		static function fIni(_nInstance:UIntX, _sCommandLine:String, _nShowCmd : UInt):Void{
			
			Debug.fTrace1("nInstance-: " + _nInstance);
			Debug.fTrace1("Tread-: " + thread);
			nInstance = _nInstance;
		}
		

		static public function fDetectGpu():Bool;

		public function fSleep(_nMilliseconds : UInt = 1):Void;

		static function fExit():Void;
		
		static function GbAnyResolutionAvailable():Bool;
		static function GnForceWidth():UInt;
		static function GnForceHeight():UInt;
		
	}
}

