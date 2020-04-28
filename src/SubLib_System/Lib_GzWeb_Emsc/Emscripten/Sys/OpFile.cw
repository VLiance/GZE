
package  { 

	import GZ.File.File;
	import GZ.File.Resource;
	
	
	<cpp>
	#include "Lib_GzWeb_Emsc/Emscripten/EmscHeader.h"
	#include <stdio.h>
	#include <string.h>
	
	#include <sys/stat.h>   // stat

	</cpp>

	<cpp_namespace>
		FILE *file;
	</cpp_namespace>
	
	
	public class OpFile overplace File {
		
		public  function OpFile(_sFile : String):Void{
			Debug.fTrace("New  OpFile!: " + _sFile);
		}
		
		public override  function fGetSystemExePath() : String { //Return the full path with exe name
			
			return "/"; //MEMFS, This is the default file system mounted at / when the runtime is initialized. All files exist strictly in-memory, and any data written to them is lost when the page is reloaded.
		}

		
		override static function fIsSysFileExist(_sFile : String):Bool {
			<cpp>
			 struct stat   buffer;   
			return (stat((char*)_sFile.fToCStr().get(), &buffer) == 0);
			</cpp>
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
		
		public override   function fLoadFile(_oRc : Resource):Bool {

			Debug.fTrace("fLoadFile ! : " + sFullPath);
			
			var _nSize : UIntX = 0;
			
			<cpp>
				gzStr8 _sFile = sFullPath.fToCStr();
				 file = fopen( (char*)_sFile.get(), "rb");
				// file = fopen( "Rc/Tf.png", "rb");
				 if (file != NULL){
					gzUIntX size;
					//unsigned char* buffer = get_resx_content(&game_state->resx_mngr,"/base_data/save.db",&size,NULL);
						fseek (file, 0, SEEK_END);
						_nSize=ftell(file);
						fseek(file, 0, SEEK_SET);
						
						gzUInt8* _aData = (gzUInt8*)GZ_fMalloc(_nSize, sizeof(gzUInt8)); //TODO may be 0 sized
						fread(_aData, 1, _nSize, file);
						_oRc->fSetDynamicMemData(_aData, _nSize); //Will be auto free
					</cpp>
						Debug.fPass("File open: " + sFullPath + " size: " + _nSize);
					<cpp>
					 fclose(file);
					 return true;
				 }else{
					</cpp>
						Debug.fError("Error, can't open file : " + sFullPath);
						 return false;
					<cpp>
					
				}
				 fclose(file);	
				 return false;
			</cpp>
		
		}
	}
}

