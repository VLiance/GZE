package  { 

	
	import GZ.File.Resource;
	
	<cpp_h>
	#include "Lib_GZ/Lib.h"
	</cpp_h>
	
	public overclass File  {
		
		public  function File():Void{
			Debug.fTrace1("New File!");
		}

		
		public static function fCreateDirectory(_sFolder : String):Int;
		public static function fIsFileExist(_sFile : String):Bool;
		public static function fLauch(_sFile : String, _sArguments : String):Void;
		
		overable static function fGetExePath() : String {
			Debug.fConsole("fGetExePath not impletmented");
		}
		

		
		public static function fGetFullPath(_sDrive:String, _sPath:String) : String{
			
			var _sRealDrive : String = _sDrive;
			Debug.fTrace1("fGetFullPath: " + _sPath);
			
			if(_sDrive == "Exe"){
			
			//	_sRealDrive = File.fGetExePath();
				
				<cpp>
				_sRealDrive = Lib_GZ::Lib::sDirExe;
				</cpp>
				
				Debug.fTrace1("_sRealDrivePath: " + _sRealDrive);
				
			}else{
				//Default drive
				_sRealDrive += ":/";
			}
			
			return _sRealDrive  + _sPath;
		}
		
		
		public static function fLoadFileFromVDrive(_oRc : Resource):Bool {
			Debug.fConsole("AfLoadFile not impletmented");
			//Get the path
			return File.fLoadFile(_oRc,	File.fGetFullPath(_oRc.sVDrive, _oRc.sPath));
		}
		
		overable static function fLoadFile(_oRc : Resource, _sFullPath:String):Bool{
				Debug.fConsole("AAAAAfLoadFile not impletmented");
		}
		
	}
}

