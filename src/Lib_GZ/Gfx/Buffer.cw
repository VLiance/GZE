//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	

	import GZ.Gfx.Root;
	import GZ.Gfx.Attribute;
	import GZ.Base.Math.Math;
	import GZ.Gfx.Pixel;
	import GZ.Gfx.Object;
	import GZ.Base.Perspective;
	import GZ.Sys.Interface.Interface;
	import GZ.Gpu.GpuObj.GpuBuffer;

	/**
	 * @author Maeiky
	 */	
	public extension Buffer extends Object {
		
		
		public enum eBufferType : Int {
			Permanent;
			Temporary;
			Direct;
		}

		
		public var nBuffWidth : UInt = 0;
		public var nBuffHeight : UInt = 0;
		
		public var  oPerspective  : Perspective;
		
		public var  nX  : Int;
		public var  nY  : Int;
		
		public var  nBuffPLimT  : Int;
		public var  nBuffPLimL  : Int;
		public var  nBuffPLimR  : Int;
		public var  nBuffPLimB  : Int;
		
		public var  nBuffLimT  : Int;
		public var  nBuffLimL  : Int;
		public var  nBuffLimR  : Int;
		public var  nBuffLimB  : Int;
		
		public var oGpuObj : GpuBuffer;

		//public var aBufferArray : CArray<Int32, 2>; //aPixelarray?
		
		
		public function Buffer( _oParent : Root, _nWidth : UInt, _nHeight : UInt, _bNewPerspective : Bool = false):Void {
			//oItf = _oParent;
			Object(_oParent, 0, 0);
			oItf.nTotalBuffers++;
			
			oDstBuff = this;
			nBuffWidth = _nWidth;
			nBuffHeight = _nHeight;
			
			if (_bNewPerspective) {
				Debug.fTrace("New Percepective");
				oPerspective = new Perspective(this);
			}else {
				
			}
			
			fSetLimit(0, 0, _nWidth - 1, _nHeight - 1);
			
		}
		
		public function fSetLimit(_nLimL : Int, _nLimR : Int, _nLimT : Int, _nLimB : Int):Void {
			nBuffLimT = _nLimL;
			nBuffLimL = _nLimR;
			nBuffLimR = _nLimT;
			nBuffLimB = _nLimB;
			
			nBuffPLimT = _nLimL* Math.nPrec;
			nBuffPLimL = _nLimR* Math.nPrec;
			nBuffPLimR = _nLimT* Math.nPrec;
			nBuffPLimB = _nLimB* Math.nPrec;
		}
		
		
		destructor {
			oItf.nTotalBuffers--;
		}
		
	
	}
}