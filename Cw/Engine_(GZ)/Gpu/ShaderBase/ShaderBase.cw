
#skipContent

package  { 

	
	public extension ShaderBase  {
		
		public var sSharder : String;
		public var nId : Val;
		public var bReady : Bool;
		public var nLineError : UInt;
		public var nSourceError : UInt;
		public var hGlsl_ES_Version : eGlsl_ES_Version;
		
		public var sLog : String;
		
		public var aLine : Array<String>;
		

		public enum eGlsl_ES_Version : UInt8 {
			Auto;
			Custom;
			ES2;
			ES3;
		}
		
		public enum eType : UInt8 {
			Vertex;
			Fragment;
			Geometry;
		}
		
		public var hType : eType;
		
		
		
		public function ShaderBase(_hGlsl_ES_Version : eGlsl_ES_Version = eGlsl_ES_Version.Auto):Void { 
			Debug.fTrace("--- BaseShader Created!! ---");
			hGlsl_ES_Version = _hGlsl_ES_Version;
		}
		
		public function fLoad():Void {
			
			var _sResult : String = "";
			for(var i : UInt = 0; i < aLine.nSize; i++){
				_sResult += aLine[i] + "\n";
			}

			fSendToGpu(_sResult);
		}
			
		public function fSendToGpu(_sShader : String):Bool {
		}
		
		public function fCompile():Bool { 
			//TODO sLog = "";
		}
				
		public function fGetLog():String {
		}
		
		
		public function fGetErrorLine():String {
			if(sLog.nSize == 0){
				fGetLog();
			}
			return  aLine[nLineError];
			
		}
		
		public function fAddLine(_sLine : String):Void {
			sSharder += _sLine + "\n";
			aLine.fPush(_sLine);
		}
			/*
		public function fAdd(_sText : String):Void {
			sSharder += _sText;
		}
		*/
		
	}
}