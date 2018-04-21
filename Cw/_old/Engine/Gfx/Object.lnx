//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	

	import GZ.Gfx.Root;
	import GZ.Gfx.Attribute;
	import GZ.Gfx.Buffer;
	import GZ.Math;
	import GZ.Gfx.Pixel;
	import GZ.Gfx.Interface;
	
	//import GZ.image.Png;
	
	/**
	 * @author Maeiky
	 */	
	public extension Object extends Attribute {

		
		public var nWidth : Float = 0;
		public var nHeight : Float = 0;
		
		public var bTri : Bool = false;

			
		public var nShapeWidth : Float = 0;
		public var nShapeHeight : Float = 0;
		public var nDirWidth : Float = 1;
		public var nDirHeight : Float = 1;
		public var nClockwise : Float = 1;
		public var nOriClockwise : Float = 1;
		

		//public var sPath : String;
		
		
		public var nScaleX : Float = 1;		
		public var nScaleY : Float = 1;
		
		public var aPixelArray : CArray<Int32, 2>;
		public var aSourcePixel : CArray<Int32, 2>;
		
		
		
		public function Object( _oParent : Root, _nX : Float, _nY:Float):Void {
			Attribute(_oParent);
			WnX(_nX);
			WnY(_nY);
			/*
			nClipX = _nX ;
			nClipY = _nY ;
			if(_oParent != null){
				//fApplyPos();
			}*/
		//	nLastPosX = nPosX;
		//	nLastPosY = nPosY;
		
			
		}
		
		
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////
		
		//public function draw(_oSource : Object):UInt {

		override public function fRender():Void {
			//Is Apox Inside?
			
			fDraw();
		}
		
		
		public function fDraw():Void {
			
			if (oItf.oContext.bWinGPU) {
				fGpuDraw();
			}else {
				
				/*
				var _nPosX : Int =  nGAttX * Math.nPrec + Math.nHPrec ;
				var _nPosY : Int =  nGAttY * Math.nPrec + Math.nHPrec ;
				_nPosX = 0;
				_nPosY = 0;
				
				var _nCastPosX : Int = Math.fITronc(_nPosX);
				var _nCastPosY : Int = Math.fITronc(_nPosY);
				*/
				/*
				var _nResT:Int = nLimT + _nPosY - Math.nHPrec;
				var _nResL:Int = nLimL + _nPosX - Math.nHPrec;
				var _nResR:Int = nLimR + _nPosX;
				var _nResB:Int = nLimB + _nPosY;
				
				if (_nResR < _nDrawL || _nResL > _nDrawR || _nResB < _nDrawT  || _nResT > _nDrawB ) { //Test if it's outside
					return; //Outside
				}
				*/
				//Inside
				/* Si plus petit
				if (_nResL < _nDrawL) {
					_nResL = _nDrawL;
				}
				if (_nResR > _nDrawR ) {
					_nResR = _nDrawR;
				}
				if (_nResT < _nDrawT) {
					_nResT = _nDrawT;
				}
				if (_nResB > _nDrawB ) {
					_nResB = _nDrawB;
				}
				*/
				
				var _nResL:Int = oDstBuff.nBuffPLimL;
				var _nResR:Int = oDstBuff.nBuffPLimR;
				var _nResT:Int = oDstBuff.nBuffPLimT;
				var _nResB:Int = oDstBuff.nBuffPLimB;
				
				//fCpuDraw(_nPosX, _nPosY, Math.fITronc(_nResL - _nCastPosX), Math.fITronc(_nResR - _nCastPosX), Math.fITronc(_nResT - _nCastPosY), Math.fITronc(_nResB - _nCastPosY) );
				fCpuDraw( Math.nHPrec,  Math.nHPrec, _nResL, _nResR, _nResT, _nResB );
			}
			
		}
		
		


		//overrided!!
		public function fGpuDraw():Bool {
		}
		//overrided!!
		public function fCpuDraw(nPosX: Int, _nPosY:Int, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Bool {
		}
		

		

		
		
		
		
		
		
		
		
		
		
	}
}