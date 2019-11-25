
package  { 

	
	import GZ.File.Resource;
	
	<cpp_h>
	#include "Lib_GZ/Lib.h"
	</cpp_h>
	
	public overclass File  {
		
	
		public var sFullExePath : String;
		public var sExeFullName : String;
		public var sExeName : String;
		public var sExeExt : String;
		public var sExeFolder : String;
		
		
		public var sFullPath : String;

		public var sFullName : String;
		public var sName : String;
		public var sExt : String;
		public var sFolder : String;
		public var sVDrive : String;
		public var sRealDrive : String;
		public var sFullRealDrive : String;
		
		
		public var bProcessAllPathDone : Bool = false;
		
		
		public  function File(_sFile : String):Void{
			if(_sFile.nSize > 0){
				Debug.fTrace("New File!: " + _sFile);
				if(_sFile == "Sys|CurrentModule"){

					Debug.fTrace("Requiere systeme module");
				//	fExtractPath("Sys|" + fGetSystemExePath());
					fExtractPath("Sys|" + fGetSystemExePath());
				}else{
					fExtractPath(_sFile);
				}
			}
			
		}
	
		overable static function fGetSystemExePath() : String {
			Debug.fTrace("fGetExePath not impletmented");
		}
		
		
		public static function fCreateDirectory(_sFolder : String):Int;
		public static function fIsSysFileExist(_sFile : String):Bool;
		
		
		public static function fIsFileExist(_sPath : String):Bool{
			var _oFile : File = new File(_sPath);
			Debug.fTrace("TestExist: " + _oFile.sFullPath);
			return fIsSysFileExist(_oFile.sFullPath);
		}

		
		public static function fLauch(_sFile : String, _sArguments : String):Void;
		
		
		
		public static function fExtractPath(_sPath : String) : Void {
			sFullPath = _sPath;
			
			//Debug.fTrace("****fExtractPath " + _sPath);
			
			var _aSplitArg : Array<String> = _sPath.fSplit("|");
			if(_aSplitArg.nSize > 1){
				sVDrive = _aSplitArg[0];
				_sPath = _aSplitArg[1];
			}else{
				sVDrive = "";
				_sPath = _aSplitArg[0];
			}
			
			
			var _aPath : Array<String> = _sPath.fSplit(":/");
			if(_aPath.nSize > 1){
				sRealDrive = _aPath[0];
				_sPath = _aPath[1];
				sFullRealDrive = sRealDrive + ":/";
			}else{
				sRealDrive = "";
				sFullRealDrive = "";
				_sPath = _aPath[0];
			}
			var _oResult : Result_Search = _sPath.fRevFind("/");
			sFullName =  _sPath.fSubStr(_oResult.nValEnd );
			sFolder =  _sPath.fSubStr(0, _oResult.nValEnd );
			
			_oResult = sFullName.fFind(".");
			sName =  sFullName.fSubStr(0, _oResult.nVal);
			sExt =  sFullName.fSubStr(_oResult.nValEnd );
			
			//	Debug.fTrace("****sVDrive " + sVDrive);
			if(sVDrive == "Exe"){
				//	Debug.fTrace("****Have EXE " );
				sFullPath = File.sFullRealDrive + File.sFolder + sFolder + sFullName;
			}
			/*
				Debug.fTrace("--- " );
				Debug.fTrace("sFullPath: " + sFullPath);
				Debug.fTrace("sFullName: " + sFullName);
				Debug.fTrace("sFolder: " + sFolder);
				Debug.fTrace("sName: " +  sName);
				Debug.fTrace("sExt: " +  sExt);
				Debug.fTrace("sVDrive: " +  sVDrive);*/
		}
		

		
		public static function fGetFullPath(_sDrive:String, _sPath:String) : String{
			
			//fProcessAllPath();
			
			var _sRealDrive : String = _sDrive;
			Debug.fTrace("fGetFullPath: " + _sPath);
			
			if(_sDrive == "Exe"){
				Debug.fTrace("Now fGetExePath: " + _sPath);
				//_sRealDrive = File.fGetExePath();
				/*
				<cpp>
				_sRealDrive = Lib_GZ::Lib::sDirExe;
				</cpp>
				*/
				
			//	Debug.fTrace("_sRealDrivePath: " + sFullExePath);
				
			}else{
				//Default drive
				_sRealDrive += ":/";
			}
			
			return _sRealDrive  + _sPath;
		}
		
		
		public static function fLoadFileFromVDrive(_oRc : Resource):Bool {
			Debug.fTrace("AfLoadFile not impletmented");
			//Get the path
			return fLoadFile(_oRc);
			//return File.fLoadFile(_oRc);
		}
		
		overable static function fLoadFile(_oRc : Resource):Bool{
				Debug.fTrace("AAAAAfLoadFile not impletmented");
		}
		
	}
}

