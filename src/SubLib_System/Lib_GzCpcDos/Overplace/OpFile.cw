
package  { 

	import GZ.File.File;
	import GZ.File.Resource;
	
	
		
	
	public class OpFile overplace File {
		
		public  function OpFile(_sFile : String):Void{
			Debug.fTrace("New  OpFile!: " + _sFile);
		}
		

		
		
		public static function fIsSysFileExist(_sFile : String):Bool {
			<cpp>
			gzUInt _nExist = CpcDos->File_exist((char*) _sFile.fToCStr().get());
			if(_nExist > 0){
				return true;
			}else{
				return false;
			}
			</cpp>
		}

		
		
		public override  function fGetSystemExePath() : String { //Return the full path with exe name
			//var _sFullExe : String;
			var  _sPath : String;
			<cpp>
	
			_sPath = gzStrC(CpcDos->Get_Path(0));
			
			// sFullExePath = GetMainModulePath().fReplaceAll(gzU8("\\"), gzU8("/"));
			return _sPath.fReplaceAll(gzU8("\\"), gzU8("/"));
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
		
		public override   function fLoadFile(_oRc : Resource):Bool {
			//Error, can't open file
			
		//	sFullPath = "C:/Test.txt"
		//	Debug.fTrace("!!Overcplace fLoadFile not impletmented!!");
			Debug.fTrace("fLoadFile ! : " + sFullPath);
			
			<cpp>
				var _sFPath = sFullPath.fReplaceAll(gzU8("/"), gzU8("\\"));

				gzUInt _nExist = CpcDos->File_exist((char*) _sFile.fToCStr().get());
				if(_nExist > 0){
				
					gzUIntX _nSize =  CpcDos->File_size( (char*) _sFile.fToCStr().get() ); 
					
				
					printf("\n \n ------ ************ File Size: %d \n \n", _nSize);
				
					
					//gzUInt8* _aData = new gzUInt8[_nSize]; //TODO may be 0 sized
					gzUInt8* _aData = (gzUInt8*)GZ_fMalloc(_nSize, sizeof(gzUInt8)); //TODO may be 0 sized
					
					
					
					// Recuperer TOUT le contenu
					CpcDos->File_read_all((char*)_sFullPath.fcStr(), (char*)"RB", (char*)_aData);
				
					_oRc->fSetDynamicMemData(_aData, _nSize); //Will be auto free 
					
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

