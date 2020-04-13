//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Base.Math.Math;
	import GZ.Base.Vec4;
	import GZ.Base.Mat4x4;
	import GZ.Gfx.Buffer;

	/**
	 * @author Maeiky
	 */
	public class Perspective  {

	//	public evar mProj : Mat4x4;
		
/*
		public var nRatio : Float;
		public var nNear : Float;
		public var nFar : Float;
		public var nRange: Float;
		public var nFov: Float = 90;
		public var nTanHalfFov: Float;
		*/
		
		public var nFocal : Float;
		public var nValue : Float;
		public var nValueInv : Float;
		public var nFromX : Float;
		public var nFromY : Float;
		public var nType : Int;
		
		public wvar oBuffer : Buffer;
		
		

		public function Perspective( _oBuffer : Buffer, _nFocalPc : Float = -450.0, _bSelf : Bool = false):Void  {
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

		public function fSetFocal(_nPosZ : Float):Void { //Must be negative value
		
			
			
			
		//horizontal field of view = 2 atan(0.5 width / focallength) 
		//vertical field of view = 2 atan(0.5 height / focallength) 
		//height / tan(vfov/2) = width / tan(hfov/2) 
		//hfov = 2 atan[ width tan(vfov/2) / height] 
		//vfov = 2 atan[ height tan(hfov/2) / width] 
		
			
			nValue = 1/(_nPosZ) * -1;
			
			
			
		//	_nPcVal = -450;
		//	_nPcVal= 1/ _nPcVal;
			//Debug.fWarning("Test: " + _nPcVal );
			
		
		/*
		FOV of 60 degrees might be:
		camera {
		   location <200,3600,4000>
		   up y
		   right -width*x/height
		   angle 60*1.25293
		   sky <0,1,0>
		   look_at <200+10000*cos(-clock),3600+2500,4000+10000*sin(-clock)>
		}
		*/
		
		//-450
		
		
		
		/*
			if (_nPcVal > 400) {
				_nPcVal = 400;
			}
			if (_nPcVal < 0) {
				_nPcVal = 0;
			}
			nFocal = _nPcVal;
			_nPcVal += 10;
			nValue = 8.0 / (_nPcVal * _nPcVal);
			nValueInv = 1 / nValue;
		
			Debug.fWarning("nFromX: " +  nFromX);
			Debug.fWarning("nFromY: " +  nFromY);
			Debug.fWarning("FOV: Z: " + nFocal );
			Debug.fWarning("nValue: " + nValue );
			
		*/
		
		/*
			<cpp>
			printf("\n nValue %f", nValue);
			</cpp>
			////Test value
			
			
			_nPcVal = -450;
			_nPcVal= 1/ _nPcVal;
			Debug.fWarning("Test: " + _nPcVal );
			
			<cpp>
			printf("\n ValTest %f", _nPcVal);
			</cpp>
			*/
			
		//float nZx = ((_pos.z + _vObjPos.z) * vPersp.z) + 1.0;
		}
		
		/*
		
		public var nFocal : Float;
		public var nValue : Float;
		public var nFromX : Float;
		public var nFromY : Float;
		public var nType : Int;

		public wvar oBuffer : Buffer;


		public function Perspective( _oBuffer : Buffer, _nFocalPc : Float = 50.0, _bSelf : Bool = false):void {
			oBuffer = _oBuffer;
			if (_bSelf) {
				fSetFromSelf();
			}else {
				fSetFromBufferCenter();
			}
			fSetFocal(_nFocalPc);
		}

		public function fSetFromPosition(_nFromX:Float, _nFromY:Float):void {

			nFromX = _nFromX;
			nFromY = _nFromY;
			nType = 0;
		}

		public function fSetFromSelf():void {
			nType = 1;
		}

		public function fSetFromBuffer():void {
			nType = 2;
			nFromX = oBuffer.nX;
			nFromY = oBuffer.nY;
		}
		public function fSetFromBufferCenter():void {
			nType = 2;
			nFromX = oBuffer.nX + oBuffer.nBuffWidth / 2;
			nFromY = oBuffer.nY + oBuffer.nBuffHeight /2;
		}

		public function fSetFocal(_nPcVal : Float):void {
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
		*/
		
		
			/*
			nRatio = nWidth / nHeight;
			nNear = 1;
			nFar = 1000;
			nRange = nNear - nFar;
			
			nTanHalfFov= Math.fTan(Math.fToRadian(nFov / 2.0));
			

			mProj.v0 = new Vec4(1.0 / (nTanHalfFov * nRatio), 0.0, 0.0, 0.0);
			mProj.v1 = new Vec4(0.0, 1.0 / nTanHalfFov, 0.0, 0.0);
			mProj.v2 = new Vec4(0.0, 0.0, (nNear * -1 - nFar) / nRange,  2 * nFar * nNear / nRange);
			mProj.v3 = new Vec4(0.0, 0.0, 1.0, 0.0);
			*/

			
	
		
	
		
	}
}
