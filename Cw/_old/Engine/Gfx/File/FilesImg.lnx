//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.File.FileBin;
	import GZ.GFX.Object;
	import GZ.GFX.Clip.Img;
	
	
	/**
	 * @author Maeiky
	 */	
	public class FilesImg  {
		

		//public var oFileBin : FileBin;
		//private var aFA1D : CArray<Int, 1);
	
	
		//private var aImgList : Img = [];
	
		private var qaImgList : QArray<Object, 1>;
		
		
		public function FilesImg():Void {
			/*
			var _sFile : String = "Generate/Img.bin";
			oFileBin = new FileBin;
			oFileBin.fOpen(_sFile, false, true);
			
			aFA1D =  [50];
			aFA1D[0] = 10;
			aFA1D[1] = 11;
			aFA1D[2] = 12;
			oFileBin.fWriteArrayInt(aFA1D, 0, 2);
			var _sText : String = "Lalalala";
			oFileBin.fWriteString(_sText);
			oFileBin.fClose();
			*/
			
			
		}
		
		
		public function fAddImgToList(_oImg : Object):Void {
			qaImgList.fPush(_oImg);
		}
		
		public function fWriteImgList(_sFilePath:String):Void {
			var _oFile : FileBin = new FileBin;
			_oFile.fOpen(_sFilePath, false, true);
			_oFile.fWriteString("GZ_List_");
		
			//Nb of files
			_oFile.fWriteInt(qaImgList.nTotal);
			var _nBitCount : UInt = 16;
				
			//Dir Size
			for (var _qeInc : QElement<Object> = qaImgList.qeFirst; _qeInc != null; _qeInc = _qeInc.qeNext ) {
				
				var _oImg : Object = _qeInc;
				_nBitCount += _oImg.sPath.nSize + 1;
			}
			
			//Align
			var _nPlus : UInt = 0;
			var  _nMissAlign : UInt = 4 - (_nBitCount % 4);
			if(_nMissAlign == 4){
				_nMissAlign = 0;
			}
			var _nTest : UInt = _nMissAlign;
			while (_nTest != 0) {
				_nTest--;
				_nPlus++;
			}
			
			_oFile.fWriteInt(_nBitCount + _nPlus); //DirSize
			
			//Dir name
			for (var _qeInc : QElement<Object> = qaImgList.qeFirst; _qeInc != null; _qeInc = _qeInc.qeNext ) {
				
				var _oImg : Object = _qeInc;
				_oFile.fWriteString(_oImg.sPath);
				_oFile.fWriteChar(0);
				//_nBitCount += _oImg.sPath.nSize + 1;
			}
			//Align
			while (_nMissAlign != 0) {
				_oFile.fWriteChar(0);
				_nMissAlign--;	
			}
			
			//ADRESSES
			_nBitCount += qaImgList.nTotal * 4 + _nPlus; //Adr itself size
			for (var _qeInc : QElement<Object> = qaImgList.qeFirst; _qeInc != null; _qeInc = _qeInc.qeNext ) {
				var _oImg : Object = _qeInc;
				_oFile.fWriteInt(_nBitCount);
				_nBitCount += FilesImg.fGetSize(_oImg);
			}
			
			//FILES
			for (var _qeInc : QElement<Object> = qaImgList.qeFirst; _qeInc != null; _qeInc = _qeInc.qeNext ) {
				
				var _oImg : Object = _qeInc;
				FilesImg.fWriteImg(_oFile, _oImg);			
			}
			
			_oFile.fWriteString("ELi_");
			_oFile.fClose();
		}
		
		
		public static function fWriteImg(_oFile : FileBin, _oImg : Object):Void {
			_oFile.fWriteString("GZ_UImg_");
			_oFile.fWriteInt((_oImg.nWidth + 4) * (_oImg.nHeight+4-3) * 4  + 22); //Nb octet
			_oFile.fWriteInt(_oImg.nHeight);
			_oFile.fWriteInt(_oImg.nWidth);
			
			for (var y : UInt = 1; y < _oImg.nHeight+4-2; y++){ //Keep only 1 empty line border
			
				_oFile.fWriteArrayInt(_oImg.aPixelArray[y], 0, _oImg.nWidth - 1 + 4);
			}
			_oFile.fWriteString("EUI_");
		}
		
		
		public static function fWritePixelArray(_oImg : Object, _sFilePath:String):Void {
			if (_oImg.aPixelArray != null) {
				var _oFile : FileBin = new FileBin;
				_oFile.fOpen(_sFilePath, false, true);
				
				_oFile.fWriteString("GZ_UImg_");
				_oFile.fWriteInt((_oImg.nWidth + 4) * (_oImg.nHeight+4-3) * 4  + 22); //Nb octet
				_oFile.fWriteInt(_oImg.nHeight);
				_oFile.fWriteInt(_oImg.nWidth);
				
				for (var y : UInt = 1; y < _oImg.nHeight+4-2; y++){ //Keep only 1 empty line border
				
					_oFile.fWriteArrayInt(_oImg.aPixelArray[y], 0, _oImg.nWidth - 1 + 4);
				}
				_oFile.fWriteString("EUI_");
				_oFile.fClose();
				//Delete?
			}else {
				Debug.fError("Pixel Array is null in fWritePixelArray");
			}
		}
		
		public static function fGetSize( _oImg : Object):UInt {
			return (_oImg.nWidth + 4) * (_oImg.nHeight + 4 - 3) * 4  + 24;
		}
		

	}
}