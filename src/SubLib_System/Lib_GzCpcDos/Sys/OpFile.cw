package  { 

	import GZ.Sys.File;
	import GZ.File.Resource;
	import GzCpcDos.Sys.OpContextHandle;
	/*
	<cpp_h>
		#include "Lib_GZ/SysUtils/CpcDosHeader.h"
	</cpp_h>
	*/
	
	public class OpFile overplace File {
		
		
		public  static function fGetExePath() : String { //Return the full path with exe name
			<cpp>
			///TEmp////
			static gzBool _bSet = false;
			if(_bSet == false){
						printf("\n --- Set called-----");
				_bSet = true;
				oCpcdos = gzSp<CpcdosOSx_CPintiCore>(new CpcdosOSx_CPintiCore); 
			}
			</cpp>
			
			

			Debug.fConsole("fGetExePath called");
			
			var  _sPath : String;
			
			<cpp>
			_sPath = gzStrC(oCpcdos->Get_Path(0));
			
			 _sPath.fReplaceAll(gzU8("\\"), gzU8("/"));
			_sPath.fBegin();
			
			</cpp>
			Debug.fTrace("-------------fGetExePath: " + _sPath);
			
			return _sPath;
		}
		
		
		
		public static function fLoadFile(_oRc : Resource, _sFullPath:String):Bool{

			
			<cpp>
				_sFullPath.fBegin();
				 _sFullPath.fReplaceAll(gzU8("/"), gzU8("\\")); //todo  _sFullPath = _sFullPath.fReplaceAll
			
			</cpp>	
			
			Debug.fConsole("Oki fLoadFile: " + _sFullPath);
			
			
			<cpp>	 
				gzUInt _nExist = oCpcdos->File_exist((char*) _sFullPath.fcStr());
				if(_nExist > 0){
					</cpp>
					Debug.fTrace("File Exist: " + _sFullPath);
					<cpp>
					
					
					gzUIntX _nSize =  oCpcdos->File_size( (char*) _sFullPath.fcStr()); 
					
				
					printf("\n \n ------ ************ File Size: %d \n \n", _nSize);
				
					
					//gzUInt8* _aData = new gzUInt8[_nSize]; //TODO may be 0 sized
					gzUInt8* _aData = (gzUInt8*)GZ_fMalloc(_nSize, sizeof(gzUInt8)); //TODO may be 0 sized
					
					
					
					// Recuperer TOUT le contenu
					oCpcdos->File_read_all((char*)_sFullPath.fcStr(), (char*)"RB", (char*)_aData);
				
					_oRc->fSetDynamicMemData(_aData, _nSize); //Will be auto free 
					
				}else{
					</cpp>
					Debug.fError("File not found: " + _sFullPath);
					return false;
					<cpp>
				}
				
			</cpp>
			
			
			
			Debug.fConsole("Loaded " + _sFullPath);
			return true;
			
		}
	}
}

