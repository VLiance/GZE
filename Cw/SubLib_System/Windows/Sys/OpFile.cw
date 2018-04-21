package  { 

	import GZ.Sys.File;
	import GZ.File.Resource;
	
	<cpp_h>
		#include "Lib_GZ/SysUtils/WindowsHeader.h"
				
	//	extern "C" char*getenv(const char *name);
	</cpp_h>
	
	public class OpFile overplace File {
		
		
		public  static function fGetExePath() : String { //Return the full path with exe name
			
			<cpp>
			#define MAX_PATH 260
			wchar_t result[ MAX_PATH ];

			GetModuleFileNameW( NULL, result, MAX_PATH ); //MinReq:  WinXp
			//Get length
			gzInt _nLength = 0;
			for(gzInt i  = 0; i < MAX_PATH; i++){
				if(result[i] == 0){
					break;
				}
				_nLength++;
			}
			///////
			gzStr _sPath((gzUInt16*)result);
			_sPath.fReplaceAll(gzStrL("\\"), gzStrL("/"));
			_sPath.fBegin();
			return _sPath;  //Call GZ_fUnSet(_sVal);
			//return "E:/FlashDev/_MyProject/Simacode/LDK/LinxDemo/_out/_MainDemo/Windows/Debug/bin/";
			</cpp>
			
		}
		

		
		public static function fLoadFile(_oRc : Resource, _sFullPath:String):Bool {
			
			Debug.fConsole("Overcplace fLoadFile not impletmented");
			<cpp>
			
				//char *win = getenv("windir");if (win == NULL) win = getenv("SystemRoot");
			
				 gzUTF16 _wcFile(_sFullPath);
					
				 FILE*  f = _wfopen((wchar_t*)(gzUInt16*)_wcFile, L"rb+");
				 unsigned char *result;
					

				if (f != NULL){
					
					WIN32_FILE_ATTRIBUTE_DATA fa;
					if (!GetFileAttributesExW((LP)(gzUInt16*)_wcFile, GetFileExInfoStandard, &fa)){
					// error handling
					}
					
					gzUIntX _nSize =   ((gzUInt64)fa.nFileSizeHigh << 32) | fa.nFileSizeLow;
				//	gzUInt8* _aData = new gzUInt8[_nSize];
					gzUInt8* _aData = (gzUInt8*)GZ_fMalloc(_nSize, sizeof(gzUInt8)); //TODO may be 0 sized
					
					
					printf("\n \n ------ ************ File Size: %d \n \n", _nSize);
					fread(_aData, 1, _nSize, f);
					
					
					_oRc->fSetDynamicMemData(_aData, _nSize); //Will be auto free
					
					Lib_GZ::Sys::pDebug::fConsole(gzStrL("---File Open!-- ") + _sFullPath);
					 return true;
					 
				}else{

					Lib_GZ::Sys::pDebug::fConsole(gzStrL("Error, can't open file : ") + _sFullPath);
				}

				 fclose(f);
				 return false;
			</cpp>
		}
	}
}

