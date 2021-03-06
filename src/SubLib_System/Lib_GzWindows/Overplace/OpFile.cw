﻿
package  { 

	import GZ.File.File;
	import GZ.File.Resource;
	
	
	<cpp_h>
		#include "Lib_GzWindows/MainHeader.h"
			//	extern "C" char*getenv(const char *name);
	</cpp_h>
	
	<cpp>
	//	#include "Lib_GzWindows/Sys/SysFile.cpp"
	</cpp>

	<cpp_namespace>
	gzStr GetMainModulePath(){
	
		//Debug.fTrace("GetMainModulePath");
				
		TCHAR* buf    = NULL;
		DWORD  bufLen = 256;
		DWORD  retLen;
		while (32768 >= bufLen){
			if (!(buf = (TCHAR*)malloc(sizeof(TCHAR) * (size_t)bufLen))){
				/* Insufficient memory */
				return gzStr();
			}
			if (!(retLen = GetModuleFileName(NULL, buf, bufLen))){
				/* GetModuleFileName failed */
				free(buf);
				return gzStr();
			}else if (bufLen > retLen){
				/* Success */
			//	wprintf(L"%s" ,buf );
				//LPCTSTR result = _tcsdup(buf); /* Caller should free returned pointer */
				gzStr _sPath(gzU16_Sized(buf, retLen).fToUTF8());
				free(buf);
				return _sPath;
			}
			
			free(buf);
			bufLen <<= 1;
		}
		/* Path too long */
		return gzStr();
	}	
	</cpp>
		
		
	
	public class OpFile overplace File {
		
		public  function OpFile(_sFile : String):Void{
			Debug.fTrace("Windows  OpFile!: " + _sFile);
		}
		

		
		override static function fIsSysFileExist(_sFile : String):Bool {
			
			<cpp>
			gzStr16 _sUtf16File(_sFile.fToUTF16());
			DWORD attr = GetFileAttributes((LPCWSTR)(gzUInt16*)_sUtf16File.get());
			if(attr == INVALID_FILE_ATTRIBUTES){ //It's a directory it must finish with a slash
				
				return false;   //  not a file
			}else{
				if(attr & FILE_ATTRIBUTE_DIRECTORY ){
					if( _sFile(_sFile.GnSize()-1) == '/'){
						return true;
					}else{
						return false;
					}
				}
			
			
			
				return true;
			}
			</cpp>
		}
	
		
		
		override  function fGetSystemExePath() : String { //Return the full path with exe name
			//var _sFullExe : String;
			Debug.fTrace("\nfGetSystemExePath\n");
			<cpp>
			// sFullExePath = GetMainModulePath().fReplaceAll(gzU8("\\"), gzU8("/"));
			return GetMainModulePath().fReplaceAll(gzU8("\\"), gzU8("/"));
			</cpp>
			
			
			//
			/*
			if(sFullExePath.fRevFind("/")){
				
			}*/
			
			//return sFullExePath;
		}
		

		
		
		//"r" 	Opens for reading. If the file does not exist or cannot be found, the fopen call fails.
		//"w" 	Opens an empty file for writing. If the given file exists, its contents are destroyed.
		//"a" 	Opens for writing at the end of the file (appending) without removing the end-of-file (EOF) marker before new data is written to the file. Creates the file if it does not exist.
		//"r+" 	Opens for both reading and writing. The file must exist.
		//"w+" 	Opens an empty file for both reading and writing. If the file exists, its contents are destroyed.
		//"a+" 	Opens for reading and appending. The appending operation includes the removal of the EOF marker before new data is written to the file. The EOF marker is not restored after writing is completed. Creates the file if it does not exist.
		
		//Modifier
		//t 	Open in text (translated) mode.
		//b 	Open in binary (untranslated) mode; translations involving carriage-return and linefeed characters are suppressed.
		//If t or b is not given in mode, the default translation mode is defined by the global variable _fmode. If t or b is prefixed to the argument, the function fails and returns NULL.
		
		override   function fLoadFile(_oRc : Resource):Bool {
			//Error, can't open file
			
		//	sFullPath = "C:/Test.txt"
		//	Debug.fTrace("!!Overcplace fLoadFile not impletmented!!");
			Debug.fTrace("fLoadFile ! : " + sFullPath);
			
			
			<cpp>
				gzStr16 _sWFile = sFullPath.fToWStr();
				
				 //FILE*  f = _wfopen(GZ_WStr(sFullPath.fReplaceAll(gzU8("/"), gzU8("\\"))), L"rb");
				 FILE*  f = _wfopen(_sWFile.get(), L"rb");
				 unsigned char *result;
				
				if (f != NULL){
					
					WIN32_FILE_ATTRIBUTE_DATA fa;
					if (!GetFileAttributesExW(_sWFile.get(), GetFileExInfoStandard, &fa)){
					// error handling
					}
					
					gzUIntX _nSize =   ((gzUInt64)fa.nFileSizeHigh << 32) | fa.nFileSizeLow;
				//	gzUInt8* _aData = new gzUInt8[_nSize];
					gzUInt8* _aData = (gzUInt8*)GZ_fMalloc(_nSize, sizeof(gzUInt8)); //TODO may be 0 sized
					
					
					GZ_printf("\n \n ------ ************ File Size: %d \n \n", _nSize);
					fread(_aData, 1, _nSize, f);
					
					
					_oRc->fSetDynamicMemData(_aData, _nSize); //Will be auto free
					
					</cpp>
						Debug.fTrace("File opened! : " + sFullPath);
					<cpp>
					 fclose(f);
					 return true;
					 
				}else{
					</cpp>
						Debug.fError("Error, can't open file : " + sFullPath);
					<cpp>
					
				//	Lib_GZ::Sys::pDebug::fConsole(gzU8("Error, can't open file : ") + _sFullPath);
				
				
				}

				 //fclose(f);
				 return false;
			</cpp>
		}
	}
}

