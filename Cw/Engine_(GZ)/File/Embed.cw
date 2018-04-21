package  { 
	
	import GZ.File.FileBin;
	import GZ.Sys.FileGetter;
	import GZ.Sys.File;
	import GZ.GFX.Object;
	import GZ.GFX.Clip.Img;
	import GZ.Global;

	/**
	 * @author Maeiky
	 */	
	public class Embed  {
		

		//public var oFileBin : FileBin;
		//private var aFA1D : CArray<Int, 1>;
	
	
		//private var aImgList : Img = [];
	
		private var qaFileList : QArray<String, 1>;
		
		private var oFileListHeader : FileBin;
		private var oFileListCpp : FileBin;
		
		public function Embed(_sToPath:String):Void {
			//var _sTest : String = Global.sDirRcFiles;
			//fDoDirectory("Resource", "../../_Src/_Embed" );
			//fDoDirectory( Global.sDirRcEmbed ,  );
			var _sRelative : String = Global.sDirExe.fPathGetRelative(_sToPath);
			Debug.fTrace2("Convert EmbedRc to : " + _sRelative );
			fDoDirectory( Global.sDirRcEmbed , _sRelative );
		}
		
		public function fDoDirectory(_sSourcePath:String, _sToPath:String, _sPath:String = ""):Void {
			
			var _oFileGetter : FileGetter = new FileGetter(_sSourcePath + _sPath);
			var _sPackStr : String;
			var _sPackStrH : String;
			var _sPackStrSize : String;
			var _sPackCount : UInt = 0;
	
			if (_sPath.nSize > 0) {
				_sPath += "/";
			}
			
			var _bPacked : Bool = false;
			if (File.fIsFileExist(_sSourcePath + _sPath + "_Pack.txt") ) {
				_bPacked = true;
			}

			var _sString : String =  "S";
			while (_sString.nSize > 0) {
				_sString = _oFileGetter.fGetNextFile();
				if(_sString.nSize > 0){ //TODO make break or do while
					if (_oFileGetter.fIsDirectory()) {
						File.fCreateDirectory(_sToPath + _sPath  + _sString);
						var _bToPack : Bool = false;
						fDoDirectory(_sSourcePath, _sToPath, _sPath  + _sString);
						
					}else {
						if(_sString.fFind(".png")){
							if (_bPacked) {
								_sPackStr += fDoPacked(_sSourcePath + _sPath + _sString, _sToPath + _sPath , _sString ,  _sPath, _sPackCount, _sPackStrSize);
								_sPackStrH += fDoPackedH(_sSourcePath + _sPath + _sString, _sToPath + _sPath , _sString ,  _sPath, _sPackCount);
								_sPackCount++;
							}else{
								fDoFile(_sSourcePath + _sPath  + _sString, _sToPath + _sPath , _sString ,  _sPath);
							}
						}
						
					}
				}
			}
			if (_bPacked) {
				fCreatePacked(_sPackStr, _sPackStrH, _sSourcePath + _sPath + _sString, _sToPath + _sPath , _sString ,  _sPath, _sPackCount, _sPackStrSize);
			}
		}
		
			
		public function fDoPacked( _sSourcePath:String , _sToPath:String , _sFile:String, _sRelativePath:String, _sPackCount : UInt, _sPackStrSize : String):String {
		
			var _oFileRead : FileBin = new FileBin();
			var _sReturn : String;
		
			_oFileRead.fOpen(_sSourcePath, true, false);
			_oFileRead.fReadFullFile();
			var _nSize : Int = _oFileRead.nSize32;
			
			var _sFileName : String = _sRelativePath + _sFile;
			_sFileName.fReplaceAll("/", "_");
			_sFileName.fReplaceAll(".", "_");
			
			//_sReturn += "gzSp<cRcImg> _o" + _sFileName +  " = RcImg::New(true);";
			//_sReturn += "cRcImg* "+  _sFileName + "=_o" + _sFileName + ".get();"
			
			//_sReturn += "cResource* _oRc" + _sPackCount + "=_o" + _sFileName + ";"
			//_sReturn += "static gzUInt32 nSize"  + _sPackCount  + " = " +  _oFileRead.nSize + "; "
			//_sReturn += "static gzUInt32 aFile" + _sPackCount + "[" + _oFileRead.nSize32 + "] = {");
			
			/*if(_sPackCount == 0){
				_sReturn += " {"
			}else {
				_sReturn += ",{"
			}*/
			
			//_sReturn += "static gzUInt32 aFile" + _sPackCount + "[" + _oFileRead.nSize32 + "] = {");
			//_sReturn += "static gzUInt32 aFile" + _sPackCount + "[" + _oFileRead.nSize32 + "] = {");
			_sReturn += "\nstatic gzUInt32 F" + _sPackCount + "[" + _oFileRead.nSize32 + "] = {");
			
			if(_sPackCount == 0){
				_sPackStrSize +=  _oFileRead.nSize;
			}else {
				_sPackStrSize += "," +  _oFileRead.nSize;
			}
			
			_sReturn += "0x" + _oFileRead.aFile32[0].hex;
			for (var i : Int = 1; i < _nSize; i++ ) {
				_sReturn += ",0x" + _oFileRead.aFile32[i].hex;
			}
			_sReturn += "};";
			_oFileRead.fClose();
			return _sReturn;
		}
		
		public function fDoPackedH( _sSourcePath:String , _sToPath:String , _sFile:String, _sRelativePath:String, _sPackCount : UInt):String {
			var _sFileName : String = _sRelativePath + _sFile;
			_sFileName.fReplaceAll("/", "_");
			_sFileName.fReplaceAll(".", "_");
			
			var _sRet : String =  "extern GZ::cRcImg* " + _sFileName + ";";
			return _sRet;
			//return "extern cRcImg* " + _sFileName + ");"; //Bug see ; before
		}
		
		
		public function fCreatePacked(_sPackStr :String, _sPackStrH :String, _sSourcePath:String , _sToPath:String , _sFile:String, _sRelativePath:String, _sPackCount : UInt, _sPackStrSize:String):Void {
			
			_sRelativePath.fEnd();
			_sRelativePath.fPrev();
			var _sSubFileName : String  = _sRelativePath.fPathGetCurrFolder();
			var _sFileName : String = _sRelativePath.fRevSubStr();
			
			
			//var _sFileName : String = _sRelativePath + _sFile;
			_sFileName.fReplaceAll("/", "_");
			_sFileName.fReplaceAll(".", "_");
			
			_sSubFileName.fEnd();
			_sSubFileName.fPrev();
			_sSubFileName = _sSubFileName.fRevSubStr();
			
			var _oFileWriteCpp   : FileBin = new FileBin();
			
			_oFileWriteCpp.fOpen(_sToPath + _sSubFileName + ".cpp", false, true);
			_oFileWriteCpp.fWriteString("//GZE embed resource file, automatically generated\n");
			
			_oFileWriteCpp.fWriteString("\n#include \"" + _sSubFileName  + ".h\""); 
			//_oFileWriteCpp.fWriteString("\n#ifdef GZ_tEmbed" );
			_oFileWriteCpp.fWriteString("\n#ifndef GZ_tEmbed_TODO" );
			_oFileWriteCpp.fWriteString("\nnamespace Rc{" );
			
			_oFileWriteCpp.fWriteString("\ngzSp<GZ::cRcImg> a" + _sFileName + "[" + _sPackCount + "] = {};");
			_oFileWriteCpp.fWriteString("\ngzSp<GZ::cRcImgSequence> _o" + _sFileName + " = GZ::RcImgSequence::New(a" +  _sFileName + ", "+ _sPackCount + ");\n");
			_oFileWriteCpp.fWriteString("\nGZ::cRcImgSequence* " + _sFileName + " =  _o" + _sFileName + ".get();");
			
			_oFileWriteCpp.fWriteString("\nnamespace Rc_" + _sFileName + "{" );
			_oFileWriteCpp.fWriteString(_sPackStr );
				
			var _sListFile : String = "F0";
			for (var i : UInt = 1; i < _sPackCount; i++ ) {
				_sListFile += ",F" + i;
			}
			
			_oFileWriteCpp.fWriteString("\nstatic gzUInt32* aFile[" + _sPackCount + "] = {" + _sListFile + "};");
			_oFileWriteCpp.fWriteString("\nstatic gzUInt32 aSize[" + _sPackCount + "] = {" + _sPackStrSize + "};");
			
	
			
		
			_oFileWriteCpp.fWriteString("\nstruct Ini{ Ini(){\n");
				
			_oFileWriteCpp.fWriteString("for(gzUInt i=0;i<" + _sPackCount + ";i++){");
		
			_oFileWriteCpp.fWriteString("\nRc::a" +  _sFileName  + "[i] = GZ::RcImg::New(true);");
			_oFileWriteCpp.fWriteString("\nRc::a" +  _sFileName  + "[i]->fLoadFromMemory((gzInt8*)aFile[i], aSize[i]);");
			
			_oFileWriteCpp.fWriteString("\n}");
		
			
			_oFileWriteCpp.fWriteString("\n}};static Ini callIni;");

			_oFileWriteCpp.fWriteString("\n}}");
			
			_oFileWriteCpp.fWriteString("\n#else");
			_oFileWriteCpp.fWriteString("\n#include \"GZ/Global.h\"");
			
			_oFileWriteCpp.fWriteString("\nnamespace Rc{" );
			_oFileWriteCpp.fWriteString("\n}");

			_oFileWriteCpp.fWriteString("\n#endif" );
			
			
			
			_oFileWriteCpp.fClose();
			
			///////////Header //////////
			var _oFileWriteH   : FileBin = new FileBin();
			_oFileWriteH.fOpen(_sToPath + _sSubFileName + ".h", false, true);
			
			_oFileWriteH.fWriteString("#ifndef DEF_GZ_Rc_" + _sFileName );
			_oFileWriteH.fWriteString("\n#define DEF_GZ_Rc_" + _sFileName );
			_oFileWriteH.fWriteString("\n#include \"GZ/File/RcImg.h\"");
			_oFileWriteH.fWriteString("\n#include \"GZ/File/RcImgSequence.h\"");
			_oFileWriteH.fWriteString("\nnamespace Rc {");
			//_oFileWriteH.fWriteString("\nconst gzUInt nSize_" + _sFileName + " = " + _sPackCount + ";");
			//_oFileWriteH.fWriteString("\nextern gzSp<cResource> a" + _sFileName + "[nSize_" + _sFileName + "];");

			_oFileWriteH.fWriteString("\nextern GZ::cRcImgSequence* " + _sFileName + ";");
			
			//_oFileWriteCpp.fWriteString(_sPackStrH);
			
			_oFileWriteH.fWriteString("\n}");
			_oFileWriteH.fWriteString("\n#endif");
			
			_oFileWriteH.fClose();
			
		}
		
		public function fDoFile( _sSourcePath:String , _sToPath:String , _sFile:String, _sRelativePath:String):Void {
		

			//Get extention
			var _oFileRead : FileBin = new FileBin();
			var _oFileWriteHeader : FileBin = new FileBin();
			var _oFileWriteCpp   : FileBin = new FileBin();
			
			_oFileRead.fOpen(_sSourcePath, true, false);
			_oFileRead.fReadFullFile();
			
			var _sFileName : String = _sRelativePath + _sFile;
			_sFileName.fReplaceAll("/", "_");
			_sFileName.fReplaceAll(".", "_");
			
			var _sSubFileName : String = _sFile ; //To force copy TODO 
			_sSubFileName.fReplaceAll(".", "_");
			
			_oFileWriteCpp.fOpen(_sToPath + _sSubFileName + ".cpp", false, true);
			var _nSize : Int = _oFileRead.nSize32;

			///////////CPP////////////
			_oFileWriteCpp.fWriteString("//GZE embed ressource file, automatically generated");
			_oFileWriteCpp.fWriteString("\n#include \"" + _sSubFileName  + ".h\""); 
			_oFileWriteCpp.fWriteString("\n#ifdef GZ_tEmbed" );
			_oFileWriteCpp.fWriteString("\nnamespace Rc{" );
			
			_oFileWriteCpp.fWriteString("\nstatic gzUInt32 aFile[" + _oFileRead.nSize32 + "] = {");
			_oFileWriteCpp.fWriteString("0x" + _oFileRead.aFile32[0].hex);
			for (var i : Int = 1; i < _nSize; i++ ) {
				_oFileWriteCpp.fWriteString(",0x" + _oFileRead.aFile32[i].hex);
			}
			_oFileWriteCpp.fWriteString("};");
			
			//_oFileWriteCpp.fWriteString("\nstatic gzInt32* aPtr = (gzInt32*)aFile;");
			
			_oFileWriteCpp.fWriteString("\ngzSp<GZ::cRcImg> _o"  + _sFileName + " = GZ::RcImg::New(true);");
			_oFileWriteCpp.fWriteString("\nGZ::cRcImg* " + _sFileName + "= _o" + _sFileName + ".get();");
		
			_oFileWriteCpp.fWriteString("\nstruct SRc" + _sFileName + "{ SRc" + _sFileName + "(){");
			_oFileWriteCpp.fWriteString( _sFileName + "->fLoadFromMemory((gzInt8*)aFile, " + _oFileRead.nSize + ");");
			_oFileWriteCpp.fWriteString("\n}};static SRc" + _sFileName + " callIni;");
			_oFileWriteCpp.fWriteString("\n}");
			

			_oFileWriteCpp.fWriteString("\n#else");
			_oFileWriteCpp.fWriteString("\n#include \"GZ/Global.h\"");
			
			_oFileWriteCpp.fWriteString("\nnamespace Rc{" );
			_oFileWriteCpp.fWriteString("\nGZ::cResource* fRc" + _sFileName + "();");
			_oFileWriteCpp.fWriteString("\ngzSp<GZ::cRcImg> _o" + _sFileName + " = GZ::RcImg::New(GZ::Global::fAddLoadRc(fRc" + _sFileName + "));");
			_oFileWriteCpp.fWriteString("\nGZ::cRcImg* " + _sFileName  + " = _o" + _sFileName + ".get();");
			_oFileWriteCpp.fWriteString("\nGZ::cResource* fRc" + _sFileName + "(){");
			_oFileWriteCpp.fWriteString("\n  " + _sFileName + "->fLoadFromDrive( GZ::Global::sDirRcEmbed, gzStrL(\""+ _sRelativePath + _sFile +"\"));");
			_oFileWriteCpp.fWriteString("\n   return Rc::" +_sFileName + ";");
			_oFileWriteCpp.fWriteString("\n}");
			_oFileWriteCpp.fWriteString("\n}");
	
			_oFileWriteCpp.fWriteString("\n#endif" );


			_oFileWriteCpp.fClose();
			_oFileRead.fClose();
			
			///////////HEADER////////////
			_oFileWriteHeader.fOpen(_sToPath + _sSubFileName + ".h", false, true);
			_oFileWriteHeader.fWriteString("#ifndef DEF_GZ_Rc_" + _sFileName );
			_oFileWriteHeader.fWriteString("\n#define DEF_GZ_Rc_" + _sFileName );
			_oFileWriteHeader.fWriteString("\n#include \"GZ/File/RcImg.h\"");
			_oFileWriteHeader.fWriteString("\nnamespace Rc {");
			_oFileWriteHeader.fWriteString("\nextern GZ::cRcImg* " + _sFileName + ";");
			_oFileWriteHeader.fWriteString("\n}");
			_oFileWriteHeader.fWriteString("\n#endif");

			
			_oFileWriteHeader.fClose();
			
			Debug.fTrace1("Sucess : " + _sSourcePath );
		}
		
		
		/*
		public static function fCreateImg( _oImg : Object):Void {
			var _oFile : FileBin = new FileBin();
			_oFile.fOpen("Resource/" + _oImg.sPath, false, true);
			_oFile.fWriteString("static const Int aTest[");
			var _nLength : Int =  (_oImg.nWidth + 4) * (_oImg.nHeight + 4 - 3) ;
			_oFile.fWriteString(_nLength + "] = {"); //Nb Int
			
		//	_oFile.fWriteString("//" + _oImg.sPath);
			
		
			var _nPixel : UInt = _oImg.aPixelArray[1][0];
			for (var y : UInt = 1; y < _oImg.nHeight+4-2; y++){
				
				for (var x : UInt = 2; x < _oImg.nWidth+4-2; x++){
				
					_oFile.fWriteString(_nPixel + ", ");
					_nPixel = _oImg.aPixelArray[y][x];
				}
			}
			_oFile.fWriteString(_nPixel );
			_oFile.fWriteString("};");
			
		
			_oFile.fClose();
		}
		
		*/
	
		

	}
}.