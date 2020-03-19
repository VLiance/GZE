//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.Sys.Interface.Window;
	import GZ.Gfx.Button;
	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Gfx.Clip.Img;
	import GZ.Base.Math.Math;
	import GZ.File.RcImg;
	import GZ.Sys.Interface.Context;
	import GZ.Input.Key;
	import GZ.Base.PtA;
	import GZ.Base.Pt;

	/**
	 * @author Maeiky
	 */	
	public class ButtonImg  extends Button {
		
		public var oImg : Img;
		
		public var nSpeed : Int = 10;
		
		public var nOverR : Int = 128;
		public var nOverG : Int = 128;
		public var nOverB : Int = 128;
	
		public var nPressR : Int = -128;
		public var nPressG : Int = -128;
		public var nPressB : Int = -128;
		
	
		public function ButtonImg( _oParent : Root, _nX: Int, _nY:Int, _oRc:RcImg, _bDrawLine:Bool = false):Void {
			Button(_oParent, _nX , _nY);
			//Clip(_oParent, _nX , _nY);
			
			oImg = new Img(this, 0, 0, _oRc, true, 0, 0, true, _bDrawLine);
			
			//oImg.nEase.to(15);
			
			nWidth = oImg.nWidth;
			nHeight = oImg.nHeight;

			
			//Debug.fTrace("Btn width : " + nWidth );
			//Debug.fTrace("Btn height : " + nHeight);
			
			//TODO
			//nLimT = 0;
			//nLimL = 0;
			//nLimR = nWidth + _nX;
			//nLimB = nHeight + _nY;
		}
		
		public function fSetOverPressBrightness(_nOverR:Int, _nOverG:Int, _nOverB:Int, _nPressR:Int, _nPressG:Int, _nPressB:Int, _nSpeed:Int):Void {
			nOverR = _nOverR;
			nOverG = _nOverG;
			nOverB = _nOverB;
			
			nPressR = _nPressR;
			nPressG = _nPressG;
			nPressB = _nPressB;
			
			nSpeed = _nSpeed;
		}
			
			
		
		
		//overrided!!
		public function fDrawObject(_oSource : Object, _nX_Start:Int, _nX_End:Int, _nY_Start:Int, _nY_End:Int ):Void {
			

				
				
			//dispatchRender(_oSource, _nX_Start + nPosX, _nX_End  + nPosX,  _nY_Start + nPosY, _nY_End+ nPosY);
			
			//dispatchRender(_oSource, 2*M.nPrec,330*M.nPrec,2*M.nPrec,180*M.nPrec);
		}
		
		/*
		override public function fUpdateChildToParent():Void {
			nClipX += 40;
			nClipY += 40;
			fApplyPos();
		}
		*/
		
		//http://alienryderflex.com/polygon/
		override public function fIsPtOver(_nX :Float, _nY :Float) : Bool {
			
			//Debug.fPass("Test!! " + _nX + ": "  + _nY );
			//TODO need to calculate parents?
			oImg.fTransform();
			oImg.fConvertTo2d();
			
			
			var _vPt : Pt<Float> = new Pt<Float>(_nX, _nY );
		//	_vPt = oImg.fReversePtTransform(_vPt);
			_nX = _vPt.nX;
			_nY = _vPt.nY;
			
			
			//Debug.fPass("PTMouse: " + _nX + " : " +  _nY);
		
			
			
			
			var _aPoint : Array<PtA> =	oImg.aNewPt3dOri;
			var _bOddNodes : Bool = false;
			var j : Int = _aPoint.nSize - 1;
			
			
			//Debug.fPass("0!! " + _aPoint[0].o2d.nX + ": "  + _aPoint[0].o2d.nY );
			//Debug.fPass("1!! " + _aPoint[1].o2d.nX + ": "  + _aPoint[1].o2d.nY );
			
			for(var i : Int = 0; i <  _aPoint.nSize; i++){
				/*
				var _nPolyX_i : Float = _aPoint[i].vPt.nX;
				var _nPolyX_j : Float = _aPoint[j].vPt.nX;
				
				var _nPolyY_i : Float = _aPoint[i].vPt.nY;
				var _nPolyY_j : Float = _aPoint[j].vPt.nY;
				*/
			//	Debug.fPass("Shape[" + i + "]" + _nPolyX_i + " : " +  _nPolyY_i);
				
				
				var _nPolyX_i : Float = _aPoint[i].o2d.nX;
				var _nPolyX_j : Float = _aPoint[j].o2d.nX;
				
				var _nPolyY_i : Float = _aPoint[i].o2d.nY;
				var _nPolyY_j : Float = _aPoint[j].o2d.nY;
				
				
				
				if (_nPolyY_i < _nY && _nPolyY_j >= _nY ||  _nPolyY_j < _nY && _nPolyY_i >= _nY) {
					if (_nPolyX_i <= _nX || _nPolyX_j <= _nX) {
					
						if ( _nPolyX_i+(_nY - _nPolyY_i)/(_nPolyY_j -_nPolyY_i)*(_nPolyX_j-_nPolyX_i) < _nX) {
							//_bOddNodes = !_bOddNodes;
							if(_bOddNodes == false){
								_bOddNodes = true;
							}else{
								_bOddNodes = false;
							}
							
						}
					}
				}
				j = i;
			}
			
			
			return 	_bOddNodes;
		}
			
			
			/* TODO
			_nPtx -= nX;
			_nPty -= nY;
			
			if (_nPtx >=  nBorderL &&  _nPtx <= nBorderR  && _nPty >= nBorderT  &&  _nPty <=  nBorderB) { //Over
				if (oImg.nParRotation == 0 && oImg.nSkewX == 0 && oImg.nSkewY == 0 && oImg.nNBPt == 4 ) { //Already a rectangle
					return true;
				}else {
					return oImg.isPtOverShape(_nPtx, _nPty);
				}
			}
			*/
			return false;
		}
		
		
		
		
		
		
		override function fDrag(_nX :Float, _nY :Float):Void {
			
			
			var _vPt : Pt<Float> = new Pt<Float>(_nX, _nY );
			_vPt = oImg.fReversePtTransform(_vPt);
			_nX = _vPt.nX;
			_nY = _vPt.nY;
			
			
			oImg.vPos.nX = _nX;
			oImg.vPos.nY = _nY;
				
			
				
		}
		
		
		override public function fButtonUpdate():Void {
			
			oImg.vColor.fSetSpeed(3);
			 if (bMouseOver ){
				oImg.vColor.nAlpha.fTo(0.8);
				oImg.vColor.nRed.fTo(1.0);
				oImg.vColor.nBlue.fTo(1.0);
				oImg.vColor.nGreen.fTo(1.0);
				
			 }else{
			 	oImg.vColor.nAlpha.fTo(1.0);
				oImg.vColor.nRed.fTo(0.0);
				oImg.vColor.nBlue.fTo(0.0);
				oImg.vColor.nGreen.fTo(0.0);
			 }
			 
			//oImg.nSkewY += 0.001;
			
			//nPosY += 0.01p;
			//nPosX += 0.01p;
			//var _nPosX:Int = nPosX;
			//var _nPosY:Int = nPosY;
		
			if (bDrag) {
			
				oImg.vColor.nRed.fTo(1.0);
				oImg.vColor.nBlue.fTo(0.0);
				oImg.vColor.nGreen.fTo(0.0);
			
			
				if (Key.fIsDown( 0x01 ) == 0) { //LEFT MOUSE LEAVE
					fStopDrag();
				}
			}else if (bMouseOver && Context.bMouseDrag == false) { //Over
			
			
			
				/*
				oImg.nAlpha.to(50);
				oImg.nDkBlue.to(256);
				oImg.nDkGreen.to(256);
				oImg.nDkRed.to(256)
				
				oImg.nLgBlue.to(80)
				oImg.nLgGreen.to(80)
				oImg.nLgRed.to(80)*/
				
				//oImg.fToBrRGB(nOverR, nOverG, nOverB, nSpeed);
				
				//oRectangle.fSetColor1(0xFF775566);
				//nClipX += 1p;
				
				if (Key.fIsDown( 0x01 ) ) { //LEFT MOUSE
					
					//oImg.fToBrRGB(nPressR, nPressG, nPressB, nSpeed);
					
					/*
					oImg.nLgBlue.to(0)
					oImg.nLgGreen.to(0)
					oImg.nLgRed.to(0)
					
					oImg.nDkBlue.to(80)
					oImg.nDkGreen.to(80)
					oImg.nDkRed.to(80)
					*/

					//oRectangle.fSetColor1(0xFFFF5500);
					fStartDrag();
				}
			}else {
				
			//	oImg.fToBrRGB(0, 0, 0, nSpeed);
				
				/*
				//oImg.nEase.to(15);
				oImg.nAlpha.to(256);
				oImg.nLgBlue.to(0)
				oImg.nLgGreen.to(0)
				oImg.nLgRed.to(0)
				//oRectangle.fSetColor1(0xFF004596);
				*/
				
				
			}
			
			/*
			oImg.nAlpha.step();
			oImg.nLgRed.step();
			oImg.nLgBlue.step();
			oImg.nLgGreen.step();
	
			oImg.nDkBlue.step();
			oImg.nDkGreen.step();
			oImg.nDkRed.step();
			*/
			
			//fApplyPos();
			
			//oImg.nParentX = nPosX;
			//oImg.nParentY = nPosY;
			//oRectangle.nPosX = nPosX;
			//oRectangle.nPosY = nPosY;
		}
		
		
		public function fMouseOver():Void {

			
		}
		
		
	
	}
}