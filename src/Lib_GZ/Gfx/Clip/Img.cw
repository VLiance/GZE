//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.


package  {

	import GZ.Sys.Interface.Window;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Face;
	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	import GZ.Gfx.Triangle;
	import GZ.File.RcImg;
	import GZ.Base.PtA;
	import GZ.Base.Pt;
	import GZ.Base.Poly4;

	import GZ.Sys.Interface.Context;

	/**
	 * @author Maeiky
	 */
	public class Img extends Shape {

	///	use Shape.uPoint;
	//	use Triangle.uPoint3D;


		public var aFile : CArray<Int, 1>;

		//public var oImage : Image;
/*
		public var rPtTL : Mapped<uPoint3D>;
		public var rPtTR : Mapped<uPoint3D>;
		public var rPtBR : Mapped<uPoint3D>;
		public var rPtBL : Mapped<uPoint3D>;
*/
		
		public var nTest : Int;
		

		public var oPtTL : PtA;
		public var oPtTR : PtA;
		public var oPtBR : PtA;
		public var oPtBL : PtA;

		//public easeOut var nEase :Int;


		public function Img( _oParent : Root, _nX: Float, _nY:Float, _oRc : RcImg, _bCenter:Bool = true, _nCenterX:Float = 0, _nCenterY:Float = 0, _bSmoothBorder:Bool = true, _bDrawLine:Bool = false,  _oSrcRegion : Poly4 = 0, _nWidth:UInt = 0, _nHeight:UInt = 0, _oPts : Poly4 = 0):Void {
			Shape(_oParent, _nX , _nY, 4, _bSmoothBorder);
			//nEase = 5;
			//nEase.to(10);
			//nEase.speed(5);
			

			//oImage = new Image();
			//oImage.fOpen(_oRc);
			_oRc.fCpuLoad();

		//	Debug.fTrace("Finish");

			//oPng.fOpenFromMemory(aFile, 512000);
			//aPixelArray = oImage.fGetImage();
			aPixelArray = _oRc.aImg;

			
			nWidth = _oRc.nWidth;
			nHeight =  _oRc.nHeight;
			oRc = _oRc;
			
			
//Temp		
//_nX = 300;
//_nY = 300;
	
//_nWidth = 200;
//_nHeight = 200;

			if(_nWidth != 0){
				nWidth = _nWidth;
			}
			if(_nHeight != 0){
				nHeight = _nHeight;
			}

			//oGpuObj.fSetImg(aPixelArray[0], nWidth, nHeight);
			/* GPU load is mad manually now (We have atlas & co)
			if(Context.oItf.bGpuDraw){
				_oRc.fGpuLoad();
			}*/


			var _nBorder : Float = 0;
			if (_bSmoothBorder) {
				_nBorder = 1;
			}

			//oGpuObj.fSetImg(_oRc);
			if (_bCenter) {
				_nCenterX = nWidth / 2;
				_nCenterY = nHeight / 2;
			}
/*
			if(_oSrcRegion == 0){

				rPtTL = addPoint(0 - _nBorder, 0 -_nBorder,                _nCenterX, _nCenterY);
				rPtTR = addPoint(nWidth  +_nBorder, 0 -_nBorder,         _nCenterX, _nCenterY);
				rPtBR = addPoint(nWidth  +_nBorder, nHeight  +_nBorder, _nCenterX, _nCenterY);
				rPtBL = addPoint(0 -_nBorder, nHeight  +_nBorder,        _nCenterX, _nCenterY);
			}else{

				rPtTL = addPoint(_oSrcRegion.oPt1.nX, _oSrcRegion.oPt1.nY,                0, 0);
				rPtTR = addPoint(_oSrcRegion.oPt2.nX, _oSrcRegion.oPt2.nY,         0, 0);
				rPtBR = addPoint(_oSrcRegion.oPt3.nX, _oSrcRegion.oPt3.nY,     0, 0);
				rPtBL = addPoint(_oSrcRegion.oPt4.nX, _oSrcRegion.oPt4.nY,        0, 0);
			}
*/

			var _oCenter  : Pt<Float> = new Pt<Float>(_nCenterX, _nCenterY);
			
			
			oPtTL = new PtA(0 - _nBorder, 0 -_nBorder);
			oPtTR = new PtA(nWidth  +_nBorder, 0 -_nBorder);
			oPtBR = new PtA(nWidth  +_nBorder, nHeight  +_nBorder);
			oPtBL = new PtA(0 -_nBorder, nHeight  +_nBorder);
			 
			if(_oPts != 0){  //Ugly Todo
				
				oPtTL.vPt.nX = _oPts.oPt1.nX;
				oPtTL.vPt.nY = _oPts.oPt1.nY;
				
				oPtTR.vPt.nX = _oPts.oPt2.nX;
				oPtTR.vPt.nY = _oPts.oPt2.nY;
				
				oPtBR.vPt.nX = _oPts.oPt3.nX;
				oPtBR.vPt.nY = _oPts.oPt3.nY;
				
				oPtBL.vPt.nX = _oPts.oPt4.nX;
				oPtBL.vPt.nY = _oPts.oPt4.nY;
			}
			
			
			//	oPtTR.vPt.nX += 150;
			//	oPtTR.vPt.nY -= 150;
			

			fAddPt(oPtTL, _oCenter);
			fAddPt(oPtTR, _oCenter);
			fAddPt(oPtBR, _oCenter);
			fAddPt(oPtBL, _oCenter);
			
			var _oSrc : Poly4;
	
	
			var _nOff_X : Float = oRc.vOffset.nX; //TODO maybe calculate offset dynamicly after
			var _nOff_Y : Float = oRc.vOffset.nY; //TODO maybe calculate offset dynamicly after
			
		//	Debug.fWarning("_nOff_X: " + _nOff_X + "  _nOff_Y:"  +_nOff_Y );
			
			
			//_nOff_X = 30;
			//_nOff_Y = 0;
			
			if(_oSrcRegion == 0){
				var _oPtSrc1 : Pt<Float> = new Pt<Float>(_nOff_X + 0 - _nBorder     , _nOff_Y + 0 - _nBorder);
				var _oPtSrc2 : Pt<Float> = new Pt<Float>(_nOff_X + nWidth  +_nBorder, _nOff_Y + 0 -_nBorder);
				var _oPtSrc3 : Pt<Float> = new Pt<Float>(_nOff_X + nWidth  +_nBorder, _nOff_Y + nHeight +_nBorder);
				var _oPtSrc4 : Pt<Float> = new Pt<Float>(_nOff_X + 0 - _nBorder	    , _nOff_Y + nHeight  + _nBorder);								
								
				_oSrc  = new Poly4(_oPtSrc1, _oPtSrc2, _oPtSrc3, _oPtSrc4);

			}else{
				_oSrc = _oSrcRegion;
			}
			


			fCreateFace(_oRc, _oSrc);
			
			//fCreateLines();
			//fCreateFace(_oRc, rPtTL, rPtTR, rPtBR, rPtBL, 0 - _nBorder, 0 - _nBorder,   nWidth  +_nBorder, 0 -_nBorder,  nWidth  +_nBorder, nHeight +_nBorder,  0 - _nBorder, nHeight  + _nBorder );
			//fCreateFace(_oRc, rPtTL, rPtTR, rPtBR, rPtBL, 0 - _nBorder, 0 - _nBorder,   nWidth  +_nBorder, 0 -_nBorder,  nWidth  +_nBorder, nHeight +_nBorder,  0 - _nBorder, nHeight  + _nBorder );
			oFace.oGpuObj.fSetImg(_oRc);

		}


		override public function fUpdateChildToParent():Void {

			//fApplyPos();
		}
		
		/*
		//TODO Verify with tiles
		override public function  fApplyGlobalPos():Void {

	//vRot.nYaw = vRot.nYaw + 0.1;

			for( var i : UInt = 0; i < aNewPt3dOri.nSize; i++){
				var _oPt : PtA = aNewPt3dOri[i];
					
				_oPt.vTf.nX = _oPt.vPt.nX * vSize.nWidth ;
				_oPt.vTf.nY = _oPt.vPt.nY * vSize.nHeight;
				_oPt.vTf.nZ = _oPt.vPt.nZ * vSize.nLength;

				_oPt.vTf.fRotate(vQuaternion);

				_oPt.vTf.nX += vPos.nX ;
				_oPt.vTf.nY += vPos.nY ;
				_oPt.vTf.nZ += vPos.nZ ;
				
			}
		}*/




	}
}
