//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Gfx.Shape;
	import GZ.Gfx.Face;
	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	import GZ.Gfx.Triangle;
	import GZ.File.RcFont;
	import GZ.File.Font;
	import GZ.Base.PtA;
	import GZ.Base.Pt;
	import GZ.Base.Poly4;
	import GZ.File.Font.CharData;

	/**
	 * @author Maeiky
	 */
	public class Letter extends Shape {

	//	use Shape.uPoint;
	//	use Triangle.uPoint3D;
		use Font.uCharData;
		use Font.uRectPack;

		public var aFile : CArray<Int, 1>;

		//public var oImage : Image;
/*
		public var rPtTL : Mapped<uPoint3D>;
		public var rPtTR : Mapped<uPoint3D>;
		public var rPtBR : Mapped<uPoint3D>;
		public var rPtBL : Mapped<uPoint3D>;*/
		public var nTest : Int;
		public var oRc : RcFont;
		public var nAdvance : Float;



		public var oPtTL : PtA;
		public var oPtTR : PtA;
		public var oPtBR : PtA;
		public var oPtBL : PtA;


		//public easeOut var nEase :Int;


		public function Letter( _oParent : Root, _oRc : RcFont, _nX: Float, _nY:Float, _nChar : UInt):Void {
	
			Shape(_oParent, _nX, _nY, 4, true);
			
			hType = Root.eType.Font;
			
			
			//nEase = 5;
			//nEase.to(10);
			//nEase.speed(5);


			//oImage = new Image();
			//oImage.fOpen(_oRc);
			_oRc.fCpuLoad();
			if(oItf.bGpuDraw){
				_oRc.fGpuLoad();
			}

			//oPng.fOpenFromMemory(aFile, 512000);
			//aPixelArray = oImage.fGetImage();
			aPixelArray = _oRc.aImg;

			nWidth = _oRc.nWidth;
			nHeight =  _oRc.nHeight;
			oRc = _oRc;

			//oGpuObj.fSetImg(aPixelArray[0], nWidth, nHeight);
			

			//oGpuObj.fSetImg(_oRc);


			//Embed.fCreateImg(this);
			
			var _oChar : CharData = _oRc.fGetCharRect(_nChar); 
			

			
			//	Debug.fInfo("Value X :" + _oChar.nX);
			//Debug.fInfo("Value Y :" + _oChar.nY);

			//var _nCenterX  : Float =  _oChar.nHoriBeringX / -64.0;
			//var _nCenterY  : Float =  _oChar.nHoriBeringX / -64.0;
	
			/*
					
			

			var _oChar : uCharData = _oRc.fGetCharRect(_nChar);
			var _rRect : uRectPack = _oChar.rRect;
*/
		///	Debug.fTrace("Value X0 :" + _oChar.nX0);
		//	Debug.fTrace2("Value Y0 :" + _oChar.nY0);

       //    var _nCenterX  : Float = nWidth / 2;
       //   var  _nCenterY  : Float = nHeight / 2;
	   
	   
	//		var _nCenterX  : Float =  _oChar.nHoriBeringX / -64.0;
	//		var _nCenterY  : Float =  _oChar.nHoriBeringY / 64.0;
			
	
		//	var _nCenterX  : Float =  _oChar.nHoriBeringX / (-64.0 * 2.0);
		//	var _nCenterY  : Float =  _oChar.nHoriBeringY / (64.0 * 2.0);
			
			var _nCenterX  : Float =  _oChar.nHoriBeringX;
			var _nCenterY  : Float =  _oChar.nHoriBeringY;
			///var _nCenterX  : Float =  0;
			//var _nCenterY  : Float =  0;	
			
		//	var _nCenterX  : Float =  _oChar.nX;
		//	var _nCenterY  : Float =  _oChar.nY;		
		
			//nAdvance = _oChar.nHoriAdvance/ (64.0 * 2.0);
			nAdvance = _oChar.nHoriAdvance;
			
			

		//	nAdvance = 10;
		
		


			var	_nBorder : Float = 1;
	//	var _nRectX : UInt = _oChar.nX ;
	///		var _nRectY : UInt = _oChar.nY ;

			nWidth =  _oChar.nW - 2;
			nHeight =  _oChar.nH - 2;

		 
		 
//			rPtTL = addPoint(0 - _nBorder, 0 -_nBorder,               _nCenterX, _nCenterY);
//			rPtTR = addPoint(nWidth  +_nBorder, 0 -_nBorder,         _nCenterX, _nCenterY);
//			rPtBR = addPoint(nWidth  +_nBorder, nHeight  +_nBorder, _nCenterX, _nCenterY);
//			rPtBL = addPoint(0 -_nBorder, nHeight  +_nBorder,        _nCenterX, _nCenterY);


			var _oCenter  : Pt<Float> = new Pt<Float>(_nCenterX, _nCenterY );

			oPtTL = new PtA(0 - _nBorder, 0 -_nBorder);
			oPtTR = new PtA(nWidth  +_nBorder, 0 -_nBorder);
			oPtBR = new PtA(nWidth  +_nBorder, nHeight  +_nBorder);
			oPtBL = new PtA(0 -_nBorder, nHeight  +_nBorder);

			fAddPt(oPtTL, _oCenter);
			fAddPt(oPtTR, _oCenter);
			fAddPt(oPtBR, _oCenter);
			fAddPt(oPtBL, _oCenter);
			
			
			
	        var _nSrcX  : Float = _oChar.nX + _nBorder;
			var  _nSrcY  : Float = _oChar.nY + _nBorder;
			
			var _oPtSrc1 : Pt<Float> = new Pt<Float>(_nSrcX + 0 - _nBorder, _nSrcY + 0 - _nBorder);
			var _oPtSrc2 : Pt<Float> = new Pt<Float>(_nSrcX + nWidth  +_nBorder, _nSrcY +  0 -_nBorder);
			var _oPtSrc3 : Pt<Float> = new Pt<Float>(_nSrcX + nWidth  +_nBorder, _nSrcY +  nHeight +_nBorder);
			var _oPtSrc4 : Pt<Float> = new Pt<Float>(_nSrcX + 0 - _nBorder, _nSrcY +  nHeight  + _nBorder);
			var _oSrc : Poly4 = new Poly4(_oPtSrc1, _oPtSrc2,  _oPtSrc3, _oPtSrc4);

			fCreateFace(_oRc, _oSrc);
			

			//fCreateLines();
			//fCreateFace(_oRc, rPtTL, rPtTR, rPtBR, rPtBL, _nRectX - _nBorder, _nRectY - _nBorder,  _nRectX + nWidth  +_nBorder, _nRectY -_nBorder, _nRectX + nWidth  +_nBorder, _nRectY + nHeight +_nBorder,  _nRectX - _nBorder,  _nRectY + nHeight  + _nBorder );

			//fCreateFace(_oRc, rPtTL, rPtTR, rPtBR, rPtBL, _nRectX , _rRect.nY,  _nRectX + nWidth, _rRect.nY, _nRectX +  nWidth, _rRect.nY + nHeight ,  _nRectX, _rRect.nY + nHeight );
			oFace.oGpuObj.fSetImg(_oRc);
			
		}


		override public function fUpdateChildToParent():Void {
			
			//fApplyPos();
		}




	}
}
