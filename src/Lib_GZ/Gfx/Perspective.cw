//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

#skipContent

package  {


	import GZ.Gfx.Root;
	import GZ.Gfx.Attribute;
	import GZ.Base.Math.Math;
	import GZ.Gfx.Buffer;
	import GZ.Gfx.Object;
	import GZ.Gfx.Interface;
	import GZ.Gpu.GpuObj.GpuBuffer;

	/**
	 * @author Maeiky
	 */
	public class Perspective {


		public var nFocal : Float;
		public var nValue : Float;
		public var nFromX : Float;
		public var nFromY : Float;
		public var nType : Int;

		public wvar oBuffer : Buffer;


		public function Perspective( _oBuffer : Buffer, _nFocalPc : Float = 50.0, _bSelf : Bool = false):Void {
			oBuffer = _oBuffer;
			if (_bSelf) {
				fSetFromSelf();
			}else {
				fSetFromBufferCenter();
			}
			fSetFocal(_nFocalPc);
		}

		public function fSetFromPosition(_nFromX:Float, _nFromY:Float):Void {

			nFromX = _nFromX;
			nFromY = _nFromY;
			nType = 0;
		}

		public function fSetFromSelf():Void {
			nType = 1;
		}

		public function fSetFromBuffer():Void {
			nType = 2;
			nFromX = oBuffer.nX;
			nFromY = oBuffer.nY;
		}
		public function fSetFromBufferCenter():Void {
			nType = 2;
			nFromX = oBuffer.nX + oBuffer.nBuffWidth / 2;
			nFromY = oBuffer.nY + oBuffer.nBuffHeight /2;
		}

		public function fSetFocal(_nPcVal : Float):Void {
			if (_nPcVal > 400) {
				_nPcVal = 400;
			}
			if (_nPcVal < 0) {
				_nPcVal = 0;
			}
			nFocal = _nPcVal;
			_nPcVal += 10;
			nValue = 8.0 / (_nPcVal * _nPcVal);
		}

	}
}
