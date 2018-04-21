//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.GFX.Shape;
	import GZ.GFX.Root;
	import GZ.GFX.AsciiTable;
	import GZ.File.Image;
	import GZ.Math;
	
	
	
	/**
	 * @author Maeiky
	 */	
	public class Text extends Shape {
		
		use Shape.uSPoint;
		use Shape.uPoint
		
		
		public var aFile : CArray<Int, 1);
		
		public var oPng : Image;
		
		public var rPtTL : uPoint;
		public var rPtTR : uPoint;	
		public var rPtBR : uPoint;		
		public var rPtBL : uPoint;
		
		public var rPtSTL : uSPoint;
		public var rPtSTR : uSPoint;	
		public var rPtSBR : uSPoint;		
		public var rPtSBL : uSPoint;
		
		
		public var nTest : Int;
		public var oTable : AsciiTable;
		
		
	//	public var sPath : String;
		
		//public easeOut var nEase :Int;
		
		
		public function Text( _oParent : Root, _nX: Int, _nY:Int, _oTable:AsciiTable, _bCenter:Bool = true, _nCenterX:Int = 0, _nCenterY:Int = 0, _bSmoothBorder:Bool = true, _bDrawLine:Bool = false):Void {
			Shape(_oParent, _nX , _nY, _bSmoothBorder, _bDrawLine);

			oTable = _oTable;
			
			//aPixelArray = oTable.oImg.aPixelArray;
			
			nHeight = 30;
			nWidth = 130;
			aPixelArray = Image.fNewEmpty( nHeight, nWidth);
	
			//Alerady extruded todo made fonction for this
			// 4 points
			rPtTL = addPoint(0, 0);
			rPtTR = addPoint(nWidth -1, 0);
			rPtBR = addPoint(nWidth -1, nHeight -1);
			rPtBL = addPoint(0, nHeight -1);
		
			
			 //4 source associate point
			rPtSTL = addSourcePt(0, 0, rPtTL);
			rPtSTR = addSourcePt(nWidth - 1, 0, rPtTR);
			rPtSBR = addSourcePt(nWidth - 1, nHeight - 1, rPtBR);
			rPtSBL = addSourcePt( 0, nHeight - 1, rPtBL);
			
			fCreateLines();
			//fApplyPos();
		}
		
		public function fSetText(_sText:String, _bAutoResize:Bool = false):Void {
			if(_bAutoResize){
				Image.fDelete(aPixelArray, nHeight);
				
				nHeight = 30;
				nWidth = 130;
				aPixelArray = Image.fNewEmpty( nHeight, nWidth);
			}else {
				Image.fClear(aPixelArray, nHeight, nWidth);
			}
			
			var _i : Int = _sText.nSize;
			for (var i : Int = 0; i < _i; i++ ) {
				var _nChar : Int = _sText.charAt(i);
				if(_nChar > 32 && _nChar < 127){
					fCopyChar(_nChar, i * (oTable.nCharWidth - 1 ) + 1 )
					
				}
			}
			
		}
		
		
		
		
		public function fCopyChar(_nChar:Int, _nPosX:Int):Int {
			 
			var _nSelX : Int = ( _nChar - 33) * 10 + 3;
			var _aSource : CArray<Int, 2) = oTable.oImg.aPixelArray;
				
			var _x : Int = oTable.nCharWidth;
			var _y : Int = oTable.nCharHeight;
			for (var y : Int = 0; y < _y; y++ ) {
				for (var x : Int = 0; x < _x; x++ ) {
					if (x + _nPosX < nWidth) {
						aPixelArray[y][x + _nPosX] =  _aSource[y][x + _nSelX];
					}
				}
			}
			
			return 1;
		}
		
		
		
		
		override public function fUpdateChildToParent():Void {
			
			//fApplyPos();
			
		}
		
		
		
		
	}
}