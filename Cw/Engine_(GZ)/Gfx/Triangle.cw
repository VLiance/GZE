//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

#skipContent

package  {

	import GZ.Math;
	import GZ.Gfx.Pixel;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Object;
	import GZ.Base.Pt;



	/**
	 * @author Maeiky
	 */
	public class Triangle  {


		public unit uPoint3D {
			nX : Float;
			nY : Float;
			nZ : Float;
		}
		public unit uPoint2D {
			nX : Float;
			nY : Float;
		}



		public var nLimitSourceWidth : Int = 0;
		public var nLimitSourceHeight : Int = 0;

		public var nDrawDir : Int = 1;
/*
		public var aPtA : CArray<Float, 1>;
		public var aPtB : CArray<Float, 1>;
		public var aPtC : CArray<Float, 1>;

		public var aPtT : CArray<Float, 1>;
		public var aPtM : CArray<Float, 1>;
		public var aPtL : CArray<Float, 1>;

		public var aPtSA : CArray<Float, 1>;
		public var aPtSB : CArray<Float, 1>;
		public var aPtSC : CArray<Float, 1>;

		public var aPtST : CArray<Float, 1>;
		public var aPtSM : CArray<Float, 1>;
		public var aPtSL : CArray<Float, 1>;
*/



		public var oPtA : Pt;
		public var oPtB : Pt;
		public var oPtC : Pt;

		public var oPtT : Pt;
		public var oPtM : Pt;
		public var oPtL : Pt;



		public var bOneSeg :Bool = false;

		public function Triangle(_oPtA : CArray<Float, 1>, _oPtB : CArray<Float, 1>, _oPtC : CArray<Float, 1>,  _aPtSA : CArray<Float, 1>, _aPtSB : CArray<Float, 1>, _aPtSC : CArray<Float, 1>   ):Void  {
		/*
			aPtA = _oPtA;
			aPtB = _oPtB;
			aPtC = _oPtC;

			aPtSA = _aPtSA;
			aPtSB = _aPtSB;
			aPtSC = _aPtSC;*/
		}

		/*
		public function fUpdateSegment():Void {
			bOneSeg = false;

			if (aPtA[1] <= aPtB[1]  && aPtA[1] < aPtC[1]) { //A is Top
				aPtT = aPtA;
				aPtST = aPtSA;

				if (aPtB[1] < aPtC[1]) {  //B is Middle
					aPtM = aPtB;
					aPtL = aPtC;
					aPtSM = aPtSB;
					aPtSL = aPtSC;

				}else {          //C is Middle
					aPtM = aPtC;
					aPtL = aPtB;
					aPtSM = aPtSC;
					aPtSL = aPtSB;
				}

			}else if (aPtB[1] < aPtA[1]  && aPtB[1] < aPtC[1]) { //B is Top
					aPtT = aPtB;
					aPtST = aPtSB;

					if (aPtA[1] < aPtC[1]) {  //A is Middle
						aPtM = aPtA;
						aPtL = aPtC;
						aPtSM = aPtSA;
						aPtSL = aPtSC;

					}else {          //C is Middle
						aPtM = aPtC;
						aPtL = aPtA;
						aPtSM = aPtSC;
						aPtSL = aPtSA;
					}


			}else { //C is Top
				aPtT = aPtC;
				aPtST = aPtSC;

				if (aPtA[1] < aPtB[1]) {  //A is Middle
						aPtM = aPtA;
						aPtL = aPtB;
						aPtSM = aPtSA;
						aPtSL = aPtSB;

				}else {          //B is Middle
						aPtM = aPtB;
						aPtL = aPtA;
						aPtSM = aPtSB;
						aPtSL = aPtSA;
				}
			}

			var _nCutLineX : Float  = Triangle.fFindXFromLinePt(aPtT, aPtL, aPtM[1]);
			if (_nCutLineX  < aPtM[0]) {
				nDrawDir = -1;
			}else {
				nDrawDir = 1;
			}

		}*/


		public static function fFindXFromLinePt( _oPt1 : Pt, _oPt2 : Pt,  _nY:Float):Float {
			var _nRelY : Float = _oPt1.nY - _nY;
			return _oPt1.nX - _nRelY / Math.fTan(    Triangle.fFindAngle(_oPt1, _oPt2)  ); //Bottom square triangle end lenght
		}

		public static function fFindAngle( _oPt1 : Pt, _oPt2 : Pt):Float {
			return Math.fATan2(_oPt1.nY - _oPt2.nY, _oPt1.nX - _oPt2.nX);
		}




	//	public static function fDraw(_oPtA:Mapped<uPoint3D>,_oPtB:Mapped<uPoint3D>,_oPtC:Mapped<uPoint3D>,  _aPtSA:Mapped<uPoint3D>,_aPtSB:Mapped<uPoint3D>,_aPtSC:Mapped<uPoint3D>,   _nPosX : Int, _nPosY : Int, _aPixelArray : CArray<Int32, 2>,  _nSWidth : UInt,  _nSHeight : UInt, _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int,  _nRsAlpha: UInt , _nRsBrRed: UInt , _nRsBrGreen: UInt   , _nRsBrBlue: UInt , _nRsRevRed: UInt , _nRsRevBlue: UInt , _nRsRevGreen: UInt , _nOfRevRed: UInt , _nOfRevBlue: UInt , _nOfRevGreen: UInt, _bNothingRight : Bool = false ):Void  {
		public static function fDraw(_oPtA:Pt,_oPtB:Pt,_oPtC:Pt,  _aPtSA:Mapped<uPoint3D>,_aPtSB:Mapped<uPoint3D>,_aPtSC:Mapped<uPoint3D>,   _nPosX : Int, _nPosY : Int, _aPixelArray : CArray<Int32, 2>,  _nSWidth : UInt,  _nSHeight : UInt, _oSource : Object, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int,  _nRsAlpha: UInt , _nRsBrRed: UInt , _nRsBrGreen: UInt   , _nRsBrBlue: UInt , _nRsRevRed: UInt , _nRsRevBlue: UInt , _nRsRevGreen: UInt , _nOfRevRed: UInt , _nOfRevBlue: UInt , _nOfRevGreen: UInt, _bNothingRight : Bool = false ):Void  {
/*

			 var _oPtT :Pt;
			 var _oPtM :Pt;
			 var _oPtL :Pt;

			 var _aPtST :Mapped<uPoint3D>;
			 var _aPtSM :Mapped<uPoint3D>;
			 var _aPtSL :Mapped<uPoint3D>;


			if (_oPtA.nY <= _oPtB.nY  && _oPtA.nY < _oPtC.nY) { //A is Top
				_oPtT = _oPtA;
				_aPtST = _aPtSA;

				if (_oPtB.nY < _oPtC.nY) {  //B is Middle
					_oPtM = _oPtB;
					_oPtL = _oPtC;
					_aPtSM = _aPtSB;
					_aPtSL = _aPtSC;

				}else {          //C is Middle
					_oPtM = _oPtC;
					_oPtL = _oPtB;
					_aPtSM = _aPtSC;
					_aPtSL = _aPtSB;
				}

			}else if (_oPtB.nY < _oPtA.nY  && _oPtB.nY < _oPtC.nY) { //B is Top
					_oPtT = _oPtB;
					_aPtST = _aPtSB;

					if (_oPtA.nY < _oPtC.nY) {  //A is Middle
						_oPtM = _oPtA;
						_oPtL = _oPtC;
						_aPtSM = _aPtSA;
						_aPtSL = _aPtSC;

					}else {          //C is Middle
						_oPtM = _oPtC;
						_oPtL = _oPtA;
						_aPtSM = _aPtSC;
						_aPtSL = _aPtSA;
					}


			}else { //C is Top
				_oPtT = _oPtC;
				_aPtST = _aPtSC;

				if (_oPtA.nY < _oPtB.nY) {  //A is Middle
						_oPtM = _oPtA;
						_oPtL = _oPtB;
						_aPtSM = _aPtSA;
						_aPtSL = _aPtSB;

				}else {          //B is Middle
						_oPtM = _oPtB;
						_oPtL = _oPtA;
						_aPtSM = _aPtSB;
						_aPtSL = _aPtSA;
				}
			}


			var _nDrawDir : Int = 1;
			var _nCutLineX : Float  = Triangle.fFindXFromLinePt(_oPtT, _oPtL, _oPtM.nY);
			if (_nCutLineX  < _oPtM.nX) {
				_nDrawDir = -1;
			}else {
				_nDrawDir = 1;
			}


			_nSWidth = (_nSWidth + (2 * 1.0))  * 256.0  - 129;  //*256
			_nSHeight = (_nSHeight + (2 * 1.0))  * 256.0  - 129;
			var _nFirst : Int = 0;
			Pixel.fDrawSegTri(_nDrawDir,  _oPtT, _oPtL,  _aPtST, _aPtSL,  _oPtT,_oPtM,_aPtST,_aPtSM, _oSource.aPixelArray, _aPixelArray, _nPosX, _nPosY, _nX_Start, _nX_End, _nY_Start, _nY_End, _nSWidth , _nSHeight,0, _nRsAlpha, _nRsBrRed, _nRsBrGreen  , _nRsBrBlue, _nRsRevRed, _nRsRevBlue, _nRsRevGreen, _nOfRevRed, _nOfRevBlue, _nOfRevGreen, _nFirst, _bNothingRight);
			_nFirst = Math.nPrec;
			Pixel.fDrawSegTri(_nDrawDir,  _oPtT, _oPtL,  _aPtST, _aPtSL,  _oPtM,_oPtL,_aPtSM,_aPtSL, _oSource.aPixelArray, _aPixelArray, _nPosX, _nPosY, _nX_Start, _nX_End, _nY_Start, _nY_End, _nSWidth , _nSHeight,0, _nRsAlpha, _nRsBrRed, _nRsBrGreen  , _nRsBrBlue, _nRsRevRed, _nRsRevBlue, _nRsRevGreen, _nOfRevRed, _nOfRevBlue, _nOfRevGreen, _nFirst, _bNothingRight);
		*/}









}
