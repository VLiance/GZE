//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Base.Math.Math;
	import GZ.Gfx.Pixel;
	import GZ.Gfx.Object;
	import GZ.Gfx.Buffer;
	import GZ.Gfx.Root;
	import GZ.Gfx.Face;
	import GZ.Gfx.Triangle;
	import GZ.File.RcImg;
	import GZ.Sys.Interface.Interface;
	import GZ.Base.PtA;
	import GZ.Base.Pt;
	import GZ.Base.Poly4;



	/**
	 * @author Maeiky
	 */
	public extension Shape extends Object {   //Not shape but square form

		public const var nBorder : UInt = 1; //Must be same ase png.h

		use Triangle.uPoint3D;
		//use Triangle.uPoint2D;

		public var aPt3dOri : CArray<Float, 1, 12>; //ToDO dynamique (only 4 point)
		public var aPoint3D : CArray<Float, 1, 12>; //ToDO dynamique (only 4 point)
		public var aPoint2D : CArray<Float, 1, 12>; //ToDO dynamique (only 4 point)
		public var aPtSource: CArray<Float, 1, 10>; //ToDO dynamique (only 4 point)

		public var aNewPt3dOri : Array<PtA>;



		public var nIndexPt : UInt = 0; // Todo find better way to save this var
		public var nIndexSrc : UInt = 0; // Todo find better way to save this var

		public  var oFace : Face;

		public var nNbPt : UInt = 0;
		public var nNbPt3 : UInt = 0;

		public var bSmoothBorder : Bool = true;

	//	public var oGpuObj : SysGpuShape;


		///////////////////////////////////////////////

		public unit uSPoint {
			nX : Float; //Must same as point
			nY : Float; //Must same as point
		}

		public unit uPoint {
			nX : Float;
			nY : Float;
			nZ : Float;


			rSPt : uSPoint;
			rPt2D: Mapped<uPoint3D>;
		}
//qePt : QElement<uPoint>;

		/////////////////////////////////////////////////


		public function Shape( _oParent : Root, _nX : Float, _nY:Float, _nNbPt : UInt = 4,	_bSmoothBorder:Bool = true):Void {
			Object(_oParent, _nX , _nY);
			
			nNbPt = _nNbPt;
			nNbPt3 = _nNbPt * 3;
			bSmoothBorder = _bSmoothBorder

		//	oGpuObj = new SysGpuShape();
			//aPoint3D = malloc ? _nNbPt TODO TODO
		}

/*
		public function addPoint(_nX:Float, _nY:Float, _nCenterX : Float = 0, _nCenterY : Float = 0, _nLineType : UInt = 0, _nLineWidth : Float = 1): Mapped<uPoint3D> {

			var _nIndexReal : UInt = nIndexPt * 3; //XYZ
			var _rPt3D : Mapped<uPoint3D> = aPt3dOri[_nIndexReal];

			_rPt3D.nX = (_nX - _nCenterX);
			_rPt3D.nY = (_nY - _nCenterY);
			_rPt3D.nZ = 0; //Z
			nIndexPt++;

			return _rPt3D;
		}
*/

		public function fAddPt( _oPt : PtA, _oCenter : Pt<Float> ):Void {

			_oPt.vPt.nX = _oPt.vPt.nX - _oCenter.nX;
			_oPt.vPt.nY = _oPt.vPt.nY - _oCenter.nY;
			_oPt.vPt.nZ =_oPt.vPt.nZ - _oCenter.nZ;
			_oPt.fCopyToTf();
			aNewPt3dOri.fPush(_oPt);
		}


		public function fCreateFace(_oRc : RcImg, _oSrc : Poly4):Void {
	
	//	public function fCreateFace(_oRc : RcImg, _rPt1 : Mapped<uPoint3D>, _rPt2: Mapped<uPoint3D>, _rPt3 : Mapped<uPoint3D>, _rPt4 : Mapped<uPoint3D>, _nPtS1x:Float, _nPtS1y:Float, _nPtS2x:Float, _nPtS2y:Float, _nPtS3x:Float, _nPtS3y:Float, _nPtS4x:Float, _nPtS4y:Float):Void {
			//oFace = new Face(this, _oRc,   aNewPt3dOri[0],  aNewPt3dOri[1], aNewPt3dOri[2], aNewPt3dOri[3],           aPoint2D,             _nPtS1x:Float, _nPtS1y:Float, _nPtS2x:Float, _nPtS2y:Float, _nPtS3x:Float, _nPtS3y:Float, _nPtS4x:Float, _nPtS4y:Float);
			oFace = new Face(this, _oRc,   aNewPt3dOri[0],  aNewPt3dOri[1], aNewPt3dOri[2], aNewPt3dOri[3],           aPoint2D,      _oSrc );
			//oFace.aPixelArray = aPixelArray;
			//oFace.oRc = _oRc;
			//_rPt2D.nX = (_nX + nBorder);
			//_rPt2D.nY = (_nY + nBorder);

		//	oGpuObj.fIni(this);
		}


/*
		public function addSourcePt(_nX:Float, _nY:Float, _nPt : uPoint):uSPoint {


			var _nIndexReal : UInt = (nIndexSrc ) * 2; //XYZ
			var _rPt2D : Mapped<uPoint2D> = aPtSource[_nIndexReal];

			_rPt2D.nX = (_nX + nBorder);
			_rPt2D.nY = (_nY + nBorder);
			nIndexSrc++;


			return 0;
		}
*/

		override public function fFinalUpdate():Void {

			//oBaseForm.fConvert3Dto2D( aPoint3D[0], aPoint3D[3], aPoint3D[6], aPoint3D[9] );
		}


		override public function fGpuDraw():Bool {
			oFace.fGpuDraw();
			return true;
		}

		public function fIsInside():Bool {
			
			var _nL : Float;
			var _nR : Float;
			var _nT : Float;
			var _nB : Float;

			if( aPoint2D[0] < aPoint2D[3]){
				 _nL  = aPoint2D[0];
				 _nR  = aPoint2D[3];
			}else{
				_nL  = aPoint2D[3];
				_nR  = aPoint2D[0];
			}
			if( aPoint2D[1] < aPoint2D[7]){
				_nT  = aPoint2D[1];
				_nB  = aPoint2D[7];
			}else{
				_nT  = aPoint2D[7];
				_nB  = aPoint2D[1];
			}


			var _nBuffL : Float = 0;
			var _nBuffR : Float = 1024;
			var _nBuffT : Float = 0;
			var _nBuffB : Float = 800;

			if (_nR < _nBuffL || _nL > _nBuffR || _nB < _nBuffT  || _nT > _nBuffB ) { //Test if it's outside
				return false;
			}else{
				return true;
			}
		}



		override public function fCpuDraw(_nPosX: Int, _nPosY:Int, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int):Bool {
		
			//Debug.fTrace("---------BeginDraw!");
/*
			if(	oGblPt.nZ < oItf.nHalfFrameHeight * -1){ //Todo find better way
				return false;
			}
*/


			fTransform();
			fConvertTo2d();

			//if(fIsInside() ){ //Temp comment

				var _nRsBrRed : Int =  (vGblColor.nRed ) * 255;
				var _nRsBrGreen : Int = (vGblColor.nGreen) * 255;
				var _nRsBrBlue : Int =  (vGblColor.nBlue ) * 255;
				var _nRsAlpha : Int =   (vGblColor.nAlpha * 255);
				if (_nRsAlpha > 256) {
					_nRsAlpha = 256;
				}
				if (_nRsAlpha < 0) {
					_nRsAlpha = 0;
				}

				
				/*
				var _nX_Start:Int = oDstBuff.nBuffPLimL;
				var _nX_End:Int = oDstBuff.nBuffPLimR;
				var _nY_Start:Int = oDstBuff.nBuffPLimT;
				var _nY_End:Int = oDstBuff.nBuffPLimB;
				
				
				 _nX_Start = oDstBuff.nBuffPLimL;
				 _nX_End = oDstBuff.nBuffPLimR;
				 _nY_Start = oDstBuff.nBuffPLimT;
				 _nY_End = oDstBuff.nBuffPLimB;
*/
				oFace.fCpuDraw( oDstBuff, Math.nHPrec, Math.nHPrec, _nX_Start, _nX_End, _nY_Start, _nY_End,  _nRsAlpha , _nRsBrRed , _nRsBrGreen , _nRsBrBlue , 256 , 256 , 256 , 0 , 0 ,0 );
			
			//Debug.fTrace("----------FinishDraw!");
				return true;

			//}else{
		//		return false;
		//	}
		
	
		}


		
		

		public function fTransform():Void {

			var _nRoll : Float = vGblRot.nRoll;
			var _nPitch : Float = vGblRot.nPitch;
			var _nYaw : Float = vGblRot.nYaw;

			//var _nFocal : Float = 1.0 / 270.0;

			for( var i : UInt = 0; i < aNewPt3dOri.nSize; i++){
				var _oPt : PtA = aNewPt3dOri[i];
				_oPt.fCopyToFinal();
				
				//var _vFinal : Pt = _oPt.vFinal;
				
				/*
				_oPt.vFinal.nX *= nGAttWidth;
				_oPt.vFinal.nY *= nGAttHeight;
				_oPt.vFinal.nZ *= nGAttLength;
				*/
				
				////// SCALE //////
				var x : Float = _oPt.vFinal.nX * vGblSize.nWidth;
				var y : Float = _oPt.vFinal.nY * vGblSize.nHeight;
				var z : Float = _oPt.vFinal.nZ * vGblSize.nLength;
				/*
				//////// Rotation /////////
				var _nTx : Float = (x * Math.fCos(_nYaw)) - (z * Math.fSin(_nYaw));
				var _nTz : Float = (x * Math.fSin(_nYaw)) + (z * Math.fCos(_nYaw));
				var _nTy : Float = (y * Math.fCos(_nPitch)) - (_nTz * Math.fSin(_nPitch));
				z = (y * Math.fSin(_nPitch) * -1) - (_nTz * Math.fCos(_nPitch));
				x = (_nTx * Math.fCos(_nRoll)) - (_nTy * Math.fSin(_nRoll));
				y = (_nTx * Math.fSin(_nRoll)) + (_nTy * Math.fCos(_nRoll));
				///////////////////////
				*/
				_oPt.vFinal.nX =x;
				_oPt.vFinal.nY =y;
				_oPt.vFinal.nZ =z;

				_oPt.vFinal.fRotate(vQuaternion);
				//Debug.fTrace("vQuaternion:[" + vQuaternion.nX + ", " + vQuaternion.nY + ", " + vQuaternion.nZ + ", " + vQuaternion.nW + "]");
				
				
			}
			
			
			
			
		}



		public function fConvertTo2d():Void {

		
			//Debug.fTrace("AAAA: " +oDstBuff.oPerspective.nFromX + ", " +oDstBuff.oPerspective.nFromY + ", " + oDstBuff.oPerspective.nValue + ", " + oDstBuff.oPerspective.nType )
			
		
			var _nFocal : Float = oDstBuff.oPerspective.nValue;
			
			var _nX : Float = oGblPt.vPt.nX + 0.25;
			var _nY : Float = oGblPt.vPt.nY - 0.25;
			
			if(oDstBuff.oPerspective.nType == 1){
				//Debug.fTrace("oDstBuff.oPerspective.nType 1");
				for( var i : UInt = 0; i < aNewPt3dOri.nSize; i++){
					var _oPt : PtA = aNewPt3dOri[i];
					var _nZ : Float = (_oPt.vFinal.nZ + oGblPt.vPt.nZ) * _nFocal + 1;
					_oPt.o2d.nX = _oPt.vFinal.nX / _nZ + _nX;
					_oPt.o2d.nY = _oPt.vFinal.nY / _nZ + _nY;
					_oPt.o2d.nZ = _nZ;
				}
				

			}else {
			//	Debug.fTrace("oDstBuff.oPerspective.nType else");
				var _nFromX : Float = oDstBuff.oPerspective.nFromX;
				var _nFromY : Float = oDstBuff.oPerspective.nFromY;

				for( var i : UInt = 0; i < aNewPt3dOri.nSize; i++){
					var _oPt : PtA = aNewPt3dOri[i];
					var _nZ : Float = (_oPt.vFinal.nZ + oGblPt.vPt.nZ) * _nFocal + 1;
					_oPt.o2d.nX = (_oPt.vFinal.nX + (_nX - _nFromX)) / _nZ - (_nX - _nFromX) + _nX;
					_oPt.o2d.nY = (_oPt.vFinal.nY + (_nY - _nFromY)) / _nZ - (_nY - _nFromY) + _nY;
					_oPt.o2d.nZ = _nZ;
				}
			
			}
			
			
			
			
		}


		public function fContextResume():Void {
		//	oGpuObj.fRecreate();
		}



	}
}
