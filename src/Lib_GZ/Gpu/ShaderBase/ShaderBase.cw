
package  { 

	import GZ.Gpu.ShaderBase.ProgramShader;
	import GzOpenGL.OpenGL;
	
	public extension ShaderBase  {
		
		public var sSharder : String;
		public var nId : Val;
		public var bReady : Bool;
		public var nLineError : UInt;
		public var nSourceError : UInt;
		public var hGlsl_ES_Version : eGlsl_ES_Version;
		
		public var sLog : String;
		
		public var aLine : Array<String>;
		
		public wvar aAttachedProgram : Array<ProgramShader>;
		

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
			//Debug.fTrace("--- BaseShader Created!! ---");
			hGlsl_ES_Version = _hGlsl_ES_Version;
		}
		
		public function fDetach():String {
			for( var i : UInt = 0; i < aAttachedProgram.nSize; i++){
				OpenGL.fDetachShader(aAttachedProgram[i].nId, nId);
			}
			aAttachedProgram.fClear();
		}
		
		public function fGetString():String {
			
			var _sResult : String = "";
			for(var i : UInt = 0; i < aLine.nSize; i++){
				_sResult += "[" + i + "]" + aLine[i] + "\n";
			}

			return _sResult;
		}
		
		
		public function fUpdateShader(_sSrc : String):Bool {
			fReset();
			fAddSrc(_sSrc);
			fAddMain();//Temp?
			fLoad();
			if(fCompile() == false){
				Debug.fError("Update Shader Error:" );
				Debug.fTrace("-->" + fGetLog());
				Debug.fTrace("-----------------");
				Debug.fTrace(fGetString());
				Debug.fTrace("-----------------");
				return false;
				
			}else{
				Debug.fPass("Update Shader Success");
				return true;
			}
		}
		
		
		
		public function fReset():Void {
			aLine.fClear();
			fDetach();
			fAddHeader();
		}
		
		
		public function fAddHeader():Void {
		}
		public function fAddMain():Void {
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
		
		public function fAddSrc(_sSrc : String):Void {
				//gzCR_8
			<cpp>
			gzArray<gzStr> _aSplit = (_sSrc.fSplit(gzCR_8));//gzCR_8
			for(gzUInt i = 0; i < _aSplit.GnSize(); i++){
				aLine.fPush((_aSplit(gzUInt(i))));
			}
			</cpp>
			/* Same as ... just for gzCR_8
			var _aSplit : Array<String> = _sSrc.fSplit("\n");
			for( var i : UInt = 0; i < _aSplit.nSize; i++){
				aLine.fPush(_aSplit[i]);
			}*/
		} 
		
		/*
		public function fAdd(_sText : String):Void {
			sSharder += _sText;
		}
		*/
		
	}
}