//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.


package  {

	import GZ.Base.Math.Math;
	import GZ.Base.Quaternion;
	import GZ.Base.Vec2;
	
	/**
	 * @author Maeiky
	 */
	public class Vec3 extends Vec2 {


		public var nZ : Float;

		public function Vec3(_nX : Float = 0, _nY : Float = 0, _nZ : Float = 0):Void  {
			Vec2(_nX, _nY);
			nZ = _nZ;
		}
		
		//! Cross product
		public function  fCross(_oOther : Vec3):Void {
			
			var _nTempX : Float = (nZ * _oOther.nY ) - (nY * _oOther.nZ);
			var _nTempY : Float = (nX * _oOther.nZ ) - (nZ * _oOther.nX);
			nZ = 				  (nY * _oOther.nX ) - (nX * _oOther.nY);
			nX = _nTempX;
			nY = _nTempY;
		}	
		
		public function  fRevCross(_oOther : Vec3):Void {
			
			var _nTempX : Float = (_oOther.nZ * nY ) - (_oOther.nY * nZ);
			var _nTempY : Float = (_oOther.nX * nZ ) - (_oOther.nZ * nX);
			nZ = 				  (_oOther.nY * nX ) - (_oOther.nX * nY);
			nX = _nTempX;
			nY = _nTempY;
		}
		
		public function fRotate(_oQuat : Quaternion ):Void{
			// return pt + 2.0*cross(rot.xyz, cross(rot.xyz,pt) + rot.w*pt);
			var _nTempX : Float = nX;
			var _nTempY : Float = nY;
			var _nTempZ : Float = nZ;
			
			/*
			evar _oTemp : Vec3;
			_oTemp = this;
			_oTemp.fRevCross(_oQuat);
			_oTemp.nX += _oQuat.nW * _oTemp.nX;
			_oTemp.nY += _oQuat.nW * _oTemp.nY;
			_oTemp.nZ += _oQuat.nW * _oTemp.nZ;
			*/

			fCross(_oQuat)
			nX += _nTempX * _oQuat.nW;
			nY += _nTempY * _oQuat.nW;
			nZ += _nTempZ * _oQuat.nW;
			
			fCross(_oQuat);
			nX = 2 * nX + _nTempX;
			nY = 2 * nY + _nTempY;
			nZ = 2 * nZ + _nTempZ;
		}
		
	}
}