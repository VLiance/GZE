//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Base.Math.Math;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Triangle;
	import GZ.Base.Pt;

	/**
	 * @author Maeiky
	 */
	public class Pixel  {

		use Triangle.uPoint3D;
		typedef tLS;


		
		
		public static function fTestShape(_oShape : Shape):Void  {
		//	_oShape.nTLx = 0
		}


		public pure function fCopyPixelToDest(_aDest : CArray<Int32, 2>, _nPixelClip : UInt, _nX : Int, _nY : Int ):Void  {

		
		//_aDest[_nY][_nX] = 0xFFFFFF
		
			var _nPixelFrame : UInt = 0;
			//var _nPixelClip : UInt = 0;
			var _nFrameAlpha : UInt = 0;
			var _nFrameRed : UInt = 0;
			var _nFrameBlue : UInt = 0;
			var _nFrameGreen : UInt = 0;
			var _nClipAlpha : UInt = 0;
			var _nClipRed : UInt = 0;
			var _nClipBlue : UInt = 0;
			var _nClipGreen : UInt = 0;

			/*
			if(_nGetY < nHeight && _nGetX < nWidth ){
				_nPixelClip = aPixelArray[_nGetY][_nGetX];
			}else {
				_nPixelClip = 0;
			}*/


			_nPixelFrame = _aDest[_nY][_nX];

			if(_nPixelFrame == 0){ //No pixel
				//_nPixelFrame = _nPixelClip;
				_aDest[_nY][_nX] = _nPixelClip;
			}else {

				//Test if it is with alpha
				_nFrameAlpha = ( _nPixelFrame >> 24 ) & 0xFF;
				if (_nFrameAlpha != 255) {

					/*
					_nClipAlpha = ( _nPixelClip >> 24 ) & 0xFF;
					if(_nClipAlpha != 0){ //Not transparent

						//Mix pixel
						_nFrameRed = ( _nPixelFrame >> 16 ) & 0xFF;
						_nFrameBlue = ( _nPixelFrame >> 8 ) & 0xFF;
						_nFrameGreen =  _nPixelFrame  & 0xFF;


						_nClipRed = ( _nPixelClip >> 16 ) & 0xFF;
						_nClipBlue = ( _nPixelClip >> 8 ) & 0xFF;
						_nClipGreen =  _nPixelClip  & 0xFF;

						_nClipRed = _nClipRed + (_nFrameRed - _nClipRed)* _nFrameAlpha / 255
						_nClipBlue = _nClipBlue +  (_nFrameBlue - _nClipBlue) * _nFrameAlpha / 255
						_nClipGreen = _nClipGreen + (_nFrameGreen - _nClipGreen ) * _nFrameAlpha / 255

						//_nFrameAlpha = _nFrameAlpha + (255-_nFrameAlpha) *  _nClipAlpha / 255 ;
						_nClipAlpha = _nClipAlpha + (255 - _nClipAlpha) *  _nFrameAlpha / 255 ;

						if (_nClipAlpha > 255) {
							_nClipAlpha = 255;
						}

						_aDest[_nY][_nX] = (_nClipAlpha << 24 ) | (_nClipRed << 16 ) | ( _nClipBlue << 8 ) | _nClipGreen

					}
					*/


					////////// Mix pixel with destination /////////////
					var _nRevAlphaDest :UInt = 255-(_nPixelFrame >> 24);
					if (_nRevAlphaDest != 255) {

						var _nResL : UInt = (_nPixelClip << 8) & 0xFF00FF00;
						var _nResH : UInt = _nPixelClip & 0xFF00FF00;

						var _nFramL : UInt =   (_nPixelFrame & 0x00FF00FF) << 8;
						var _nFramH : UInt =   _nPixelFrame  & 0xFF00FF00 ;

						_nResL = (_nFramL + (_nResL >> 8) * _nRevAlphaDest) & 0xFF00FF00;
						_nResH = (_nFramH + (_nResH >> 8) * _nRevAlphaDest) & 0xFF00FF00;

						/////////////////////////////////////////////////
						_aDest[_nY][_nX] =    _nResH | (_nResL >> 8);

					}
				}
			}
		}



		public pure function fGetSmoothPixel(_aSource : CArray<Int32, 2>, _nLx : UInt32, _nTy : UInt32, _aDest : CArray<Int32, 2>,  _nDestX : UInt32, _nDestY : UInt32, _nAlpha : UInt32, _nPcBrRed : UInt32,  _nPcBrGreen: UInt32, _nPcBrBlue: UInt32, _nPcRevRed : UInt32, _nPcRevBlue: UInt32, _nPcRevGreen: UInt32, _nOfRevRed:UInt32, _nOfRevBlue:UInt32, _nOfRevGreen:UInt32  ):Void  {
				//Debug.fConsole("_nDestY " + _nDestY);
				//Debug.fConsole("_nDestX " + _nDestX);
				_aDest[_nDestY][_nDestX] = 0x48FF00FF;
				return;
				
				
			var _nPixelFrame : UInt32 = _aDest[_nDestY][_nDestX];
			if(_nPixelFrame & 0xFF000000 != 0xFF000000){ //Not Already have full color pixel

				//var _nLx :UInt32  = _nX - Math.nPixHPrec + 128;
				//var _nTy :UInt32  = _nY - Math.nPixHPrec + 128;

				var _nRx :UInt32  = Math.fIPixFrac(_nLx + Math.nPixPrec ) ;
				var _nBy :UInt32  = Math.fIPixFrac(_nTy + Math.nPixPrec );

				var _nRAlphaTR : UInt32 =  (_nRx * (Math.nPixPrec - Math.fIPixFrac(_nTy))  + Math.nPixHPrec)  >> Math.nPixSP8;
				var _nRAlphaBR : UInt32 =  (_nRx * _nBy + (Math.nPixHPrec - 1)) >> Math.nPixSP8;
				var _nRAlphaBL : UInt32 = ((Math.nPixPrec - Math.fIPixFrac(_nLx)) * _nBy  + (Math.nPixHPrec - 1)) >> Math.nPixSP8;
				var _nRAlphaTL : UInt32 =  257  - (_nRAlphaBR + _nRAlphaTR + _nRAlphaBL); //Last doesnt need to be calculated again
				//var _nRAlphaTL : UInt =  ((Math.nPixPrec - Math.fIPixFrac(_nLx)) *  (Math.nPixPrec - Math.fIPixFrac(_nTy)) + Math.nPixHPrec) >> Math.nPixSP8;

				_nLx = _nLx >> Math.nPixSP;
				_nTy = _nTy >> Math.nPixSP;
				var _nPixTL : UInt32 = _aSource[_nTy][_nLx ];
				var _nPixTR : UInt32 = _aSource[_nTy][_nLx + 1];

				var _nPixBL : UInt32 = _aSource[_nTy + 1][_nLx];
				var _nPixBR : UInt32 = _aSource[_nTy + 1][_nLx + 1];

				// hi bits: mask, shift, multiply, mask
				var _nResH : UInt32 =   (((_nPixTL & 0xFF00FF00) >> 8) * _nRAlphaTL);
				_nResH +=  			(((_nPixTR & 0xFF00FF00) >> 8) * _nRAlphaTR);
				_nResH +=  			(((_nPixBL & 0xFF00FF00) >> 8) * _nRAlphaBL);
				_nResH +=  			(((_nPixBR & 0xFF00FF00) >> 8) * _nRAlphaBR);

				/*
				//If result is 0 alpha stop here
				if (_nResH & 0xFF000000 == 0) {
					return;
				}*/

				// lo bits: mask, multiply, mask, shift
				var _nResL : UInt32 =   (_nPixTL & 0x00FF00FF) * _nRAlphaTL);
				_nResL +=  			(_nPixTR & 0x00FF00FF) * _nRAlphaTR);
				_nResL += 			(_nPixBL & 0x00FF00FF) * _nRAlphaBL);
				_nResL += 			(_nPixBR & 0x00FF00FF) * _nRAlphaBR);


				//////// Alpha/TInt effect ///////////
				var _nResHH : UInt32 = _nResH >> 24;
				var _nResLL : UInt32 = _nResL >> 24;

				_nResH =_nResH >> 8 & 0x000000FF;
				_nResL =_nResL >> 8 & 0x000000FF;

				_nResLL = (((_nResHH - _nResLL ))*  Math.fMin(Math.fMax(_nPcBrRed + _nOfRevRed, 0), 256) +  (( _nResLL ) * _nPcRevRed) ) * _nAlpha * (Math.fMin(Math.fMax(_nPcBrRed + 256, 0), 256) );
				_nResH = (((_nResHH - _nResH))*  Math.fMin(Math.fMax(_nPcBrGreen + _nOfRevGreen , 0), 256)  +     ((_nResH  ) * _nPcRevGreen) ) * _nAlpha * (Math.fMin(Math.fMax(_nPcBrGreen + 256, 0), 256) );
				_nResL =  (((_nResHH - _nResL) ) *  Math.fMin(Math.fMax(_nPcBrBlue + _nOfRevBlue , 0), 256) +  ((_nResL) *  _nPcRevBlue)  ) * _nAlpha *  (Math.fMin(Math.fMax(_nPcBrBlue + 256, 0), 256) );

				/* _nPcBrRed -256 -> + 256
				 * _nPcLg = _nPcBrRed
				 * _nPcLg =  min 0, max 256

				  _nPcBrRed -256 -> + 256
				   _nPcDk =_nPcBrRed + 256
				 * _nPcDk =  min 0, max 256

				 ( (Alpha - Color) * _nPcLg + (Color)  ) * _nGlobAlpha * _nPcDk
				 _nResLL = (((_nResHH - _nResLL ))*_nPcLgRed +  (( _nResLL ) * _nPcRevRed) ) * _nAlpha * _nPcDkRed;
				_nResH = (((_nResHH - _nResH))*_nPcLgBlue +     ((_nResH  ) * _nPcRevBlue) ) * _nAlpha * _nPcDkGreen;
				_nResL =  (((_nResHH - _nResL) )*_nPcLgGreen +  ((_nResL) *  _nPcRevGreen)  ) * _nAlpha * _nPcDkBlue;
				*/

				_nResL = (_nResLL & 0xFF000000) | (_nResL >> 16);
				_nResH = (_nResHH * _nAlpha << 16) | (_nResH >> 16);
				////////////////////////////////////////

				//_nResL = _nResL & 0xFF00FF00; //Only if no color transform
				_nResH = _nResH & 0xFF00FF00;

				////////// Mix pixel with destination /////////////
				var _nRevAlphaDest :UInt32 = 255-(_nPixelFrame >> 24);
				if (_nRevAlphaDest != 255) {

					var _nFramL : UInt32 =   (_nPixelFrame & 0x00FF00FF) << 8;
					var _nFramH : UInt32 =   _nPixelFrame  & 0xFF00FF00 ;

					_nResL = (_nFramL + (_nResL >> 8) * _nRevAlphaDest) & 0xFF00FF00;
					_nResH = (_nFramH + (_nResH >> 8) * _nRevAlphaDest) & 0xFF00FF00;
				}
				/////////////////////////////////////////////////

				_aDest[_nDestY][_nDestX] =    _nResH | (_nResL >> 8);

			}
		}


	
	public pure function fDrawSegTri(_nDirX : Int,  _oPtT :  Pt,  _oPtL :  Pt, _rPtST :  Mapped<uPoint3D>,  _rPtSL :  Mapped<uPoint3D>, _oPtSegT :  Pt, _oPtSegL  : Pt,  _rPtSegST:  Mapped<uPoint3D>, _rPtSegSL :  Mapped<uPoint3D>, _aDest : CArray<Int32, 2>, _aSource : CArray<Int32, 2>, _nPosX : Int,  _nPosY : Int, _nX_Start : Int, _nX_End : Int, _nY_Start : Int, _nY_End : Int, _nLimW : UInt,  _nLimH : UInt, _nLast :Int, _nAlpha : UInt,  _nPcBrRed: UInt, _nPcBrGreen : UInt, _nPcBrBlue : UInt, _nPcRevRed : UInt, _nPcRevGreen: UInt , _nPcRevBlue: UInt, _nOfRevRed:UInt, _nOfRevBlue:UInt, _nOfRevGreen:UInt, _nFirst:Int, _bNothingRight:Bool = false):Void {



	
			if(_oPtSegT.nY + 1 > _oPtSegL.nY){ //Ignore segment triangle < 1px height
				return;
			}
			
			
			
			
				/*
		Debug.fConsole(" Math.nSP " +  (1 << Math.nSP) );
		Debug.fConsole("----------------------------");
		Debug.fConsole("--_oPtT: " +  _oPtT.nX + ", " +_oPtT.nY );
		Debug.fConsole("--_oPtL: " +  _oPtL.nX + ", " +_oPtL.nY );
			
		Debug.fConsole("--_oPtSegT: " +  _oPtSegT.nX + ", " +_oPtSegT.nY );
		Debug.fConsole("--_oPtSegL: " +  _oPtSegL.nX + ", " +_oPtSegL.nY );
		Debug.fConsole("---------------------");
		//Debug.fConsole("_oPtM: " +  _oPtM.nX + ", " +_oPtM.nY );

	
			Debug.fConsole("---fDrawSegTri--");
				Debug.fConsole("--_oPtSegT: " +  _oPtSegT.nX + ", " +_oPtSegT.nY );
				Debug.fConsole("--_oPtSegL: " +  _oPtSegT.nX + ", " +_oPtSegL.nY );
				Debug.fConsole("--_nDirX: " + _nDirX );
			*/
			
	
	/*
			if(Math.fAbs() ){
				
			}
	*/
	//Debug.fTrace("---fDrawSegTri--");
			var _nFloatPrec : Float =  Math.nPrec;
			//var _nDirX : Int = _oTri.nDrawDir;

			///////////////
			var _nFL1x:Int  = _oPtSegT.nX * Math.nPrec;
			var _nFL2x:Int = _oPtSegL.nX * Math.nPrec;

			var _nFTy:Int = _oPtSegT.nY* Math.nPrec;
			var _nFBy:Int = _oPtSegL.nY * Math.nPrec;

			var _nSL1x:Float = ( _rPtSegST.nX  * 256.0 + 64.0) / _oPtSegT.nZ;
			var _nSL1y:Float = ( _rPtSegST.nY * 256.0 - 64.0) / _oPtSegT.nZ;
			var _nSL1z:Float =  1 / _oPtSegT.nZ;

			var _nSL2x:Float = (_rPtSegSL.nX * 256.0 + 64.0) / _oPtSegL.nZ;
			var _nSL2y:Float = (_rPtSegSL.nY * 256.0 - 64.0) / _oPtSegL.nZ;
			var _nSL2z:Float =  1 / _oPtSegL.nZ;
			/////////////

			var _nSlopeTy : Int =  _oPtT.nY * Math.nPrec;
			var _nSlopeTx : Int   =  _oPtT.nX * Math.nPrec;
			var _nSlopeLy : Int   =  _oPtL.nY * Math.nPrec;
			var _nSlopeLx : Int    =  _oPtL.nX * Math.nPrec;


			
			
			var _nSlopeSTx: Float   =  (_rPtST.nX * 256.0 + 64.0) / _oPtT.nZ;
			var _nSlopeSTy : Float  =   (_rPtST.nY * 256.0 - 64.0) /_oPtT.nZ;
			var _nSlopeSTz: Float   = 1/ _oPtT.nZ;

			var _nSlopeSLx : Float  =  (_rPtSL.nX * 256.0 + 64.0) / _oPtL.nZ;
			var _nSlopeSLy : Float  =  (_rPtSL.nY * 256.0 - 64.0) / _oPtL.nZ;
			var _nSlopeSLz : Float  = 1/ _oPtL.nZ;


			var _nIPosX : Int =  _nPosX - Math.nPrec;
			var _nIPosY : Int =  _nPosY - Math.nPrec;
			//var _nIPosX : Int =  _nPosX - Math.nPrec + GZ::Math::nHPrec/2;
			//var _nIPosY : Int =  _nPosY - Math.nPrec - GZ::Math::nHPrec/2;
			/*
			<cpp>
			printf("\n_nPosX%d", _nIPosX);
			printf("\n_nPosY %d", _nIPosY);
	
			</cpp>
		*/
		
			var _nSLx : Float;  //Source from right to left
			var _nSLy : Float;  //Source from right to left
			var _nSLz : Float;  //Source from right to left
			var _nSRx : Float;  //Source from right to left
			var _nSRy : Float;  //Source from right to left
			var _nSRz : Float;  //Source from right to left


			var _nGetX : UInt = 0;
			var _nGetY : UInt = 0;
			///////////////////////////////////

			var _nX : Int = 0;
			var _nY : Int = 0;

			var _nPixelFrame : UInt = 0;

			var _nPixelClip : UInt = 0;



			var _nXStart : Int = 0;
			var _nXEnd : Int = 0;
			var _nXDist : Int = 0;


			var _nOffX : Int = 0;
			var _nOffY : Int = 0;

			var _nIntOffX : Int = Math.fITronc(_nIPosX + Math.nHPrec);
			var _nIntOffY : Int = Math.fITronc(_nIPosY + Math.nHPrec);
			/*
			var _nAjustLimitY : Int = 0;
			if (_nIntOffY < 0) {
				_nAjustLimitY = Math.nPrec;
			}*/

			var _nLimXTOffset : Int = (Math.nPrec + Math.nHPrec) - (_nIPosX + Math.nHPrec - _nIntOffX ) - Math.nPrec;

			//var _nFHeight : Int =  (_nFBy - _nFTy); //Int is important no *256
			var _nFHeight : Int =  (_nFBy - _nFTy)  + (1<< Math.nDivPrec); //+1 Seem to remove bug when value are too fit to check futer
			var _nFHeightSlope : Int =  (_nSlopeLy  - _nSlopeTy ) + (1<< Math.nDivPrec); //+1 Seem to remove bug when value are too fit to check futer

			//var _nFHeight : Int =  (_nFBy - _nFTy) + 1; //+1 Seem to remove bug when value are too fit to check futer
			//var _nFHeightSlope : Int =  (_nSlopeLy  - _nSlopeTy ) + 1; //+1 Seem to remove bug when value are too fit to check futer

			var _nDif_FLx:Int = (tLS(_nFL2x - _nFL1x) << Math.nDivPrec) / _nFHeight;
			var _nDif_FRx:Int = ((tLS(_nSlopeLx - _nSlopeTx)) << Math.nDivPrec) / _nFHeightSlope;

				/*
				Debug.fConsole("_nDiff_SlopeLy:   " + (_nSlopeLx - _nSlopeTx) );
				<cpp>
					printf("\ncpp_nSlopeLy: %d ", _nSlopeLx);
					printf("\ncpp_nSlopeTx: %d ", _nSlopeTx);
					printf("\ncpp_nFHeightSlope: %d ", _nFHeightSlope);
					printf("\ncpp__nDif_FRx: %d ", _nDif_FRx);
				</cpp>
				
				
				Debug.fConsole("_nSlopeLy:   " + _nSlopeLy );
				Debug.fConsole("_nSlopeTy:   " + _nSlopeTy );
								
				Debug.fConsole("_nFHeightSlopeOri:   " + _nFHeightSlope );
				*/
				var _nTestS2 : Int = _nFHeightSlope >> Math.nSP;
				
				
				//Debug.fConsole("_nFHeightSlope:   " + _nTestS2 );
				
				var _nTest2 : Int = _nDif_FRx >> Math.nSP;
				
				//Debug.fConsole("_nDif_FRx:   " + _nTest2 );
				//Debug.fConsole("_nDif_FRxOri:   " + _nDif_FRx );
				
			

			var _nFHeightFloat : Float = _nFHeight / _nFloatPrec;

			var _nDif_SLx:Float = ((_nSL2x - _nSL1x)) / _nFHeightFloat;
			var _nDif_SLy:Float = ((_nSL2y - _nSL1y) ) / _nFHeightFloat;
			var _nDif_SLz:Float = ((_nSL2z - _nSL1z) ) / _nFHeightFloat;

			var _nFHeightFloatSlope : Float = _nFHeightSlope / _nFloatPrec;

			var _nDif_SRx:Float = ((_nSlopeSLx - _nSlopeSTx)) / _nFHeightFloatSlope;
			var _nDif_SRy:Float = ((_nSlopeSLy - _nSlopeSTy)) / _nFHeightFloatSlope;
			var _nDif_SRz:Float = ((_nSlopeSLz - _nSlopeSTz)) / _nFHeightFloatSlope;


			var _nTopY : Int = _nIPosY + _nFTy; //Doit etre un Int

			var _nRealY : Int = Math.fMax( Math.fITronc(_nIPosY + _nFTy) + _nFirst,  _nIntOffY + _nY_Start );
			var _nRealYPix : Int = _nRealY >> Math.nSP;
			//var _nToY : Int = Math.fMin( Math.fITronc(_nIPosY + _nFBy)+ (_nLast*512) + 256 ,  _nIntOffY + _nY_End + _nAjustLimitY);
			var _nToY : Int = Math.fMin( Math.fITronc(_nIPosY + _nFBy) + Math.nPrec ,  _nIntOffY + _nY_End );

			var y:Int =  Math.fIFrac( _nIPosY + _nFTy ) * -1  - ( Math.fITronc(_nIPosY + _nFTy) - _nRealY);

			var _nYFloat:Float = y / _nFloatPrec;
			/////////
			var _nFTyFloat:Float = _nFTy / _nFloatPrec;
			var _nSlopeTyFloat:Float =  _nSlopeTy / _nFloatPrec;

			///////////////

		//	var _nstartY :Int = y;

			//var _nAliL : Int = Math.nHPrec/2 * _nDirX;
			//var _nAliR : Int = Math.nHPrec / 2 * _nDirX ;
			var _nAliL : Int = 0;
			var _nAliR : Int = 0;

			// Sub over pixels subsecent tri ///
			if(_nDirX < 0){
		//		_nAliL =   Math.nHPrec / -2 * _nDirX; Must be same as opposate dir bercause it will overlap en seme tranparent
			}else{
			//	_nAliR =  Math.nHPrec / -2 * _nDirX ;
			}
			/////////////////////////////////////


			var _nXAdd : Int =  Math.nPrec * _nDirX;
			var _nXAddFloat : Float =  _nDirX;

			var _nDirEndX : Int = _nAliR + Math.nPrec;
			var _nDirBegX : Int = Math.nPrec - _nAliL;
			if (_nDirX == -1) {
				_nDirEndX = _nAliR;
				_nDirBegX = 0 - _nAliL;
			}
			var _nIncY:Int;
			var x:Int;
			var _nXLimit : Int;

			_nLimW -= 128;
			_nLimH -= 128;
/*
			<cpp>
			printf("\nASSS %d", _nToY);
			printf("\nA_nRealY %d", _nRealY);
			</cpp>
			*/
			
			while (_nRealY < _nToY) {
			
	
				//_nTest = _nToY >> Math.nSP;
				////Debug.fConsole("_nTest:   " + _nTest );
				////////////////////////////////////////////////

				_nSLx = _nSL1x + (_nYFloat * _nDif_SLx); //X pos from source
				_nSLy = _nSL1y + (_nYFloat * _nDif_SLy);
				_nSLz = _nSL1z + (_nYFloat * _nDif_SLz);

				_nSRx = _nSlopeSTx + (( _nYFloat  + (_nFTyFloat - _nSlopeTyFloat)  ) * _nDif_SRx);
				_nSRy = _nSlopeSTy + (( _nYFloat  + (_nFTyFloat - _nSlopeTyFloat)  ) * _nDif_SRy);
				_nSRz = _nSlopeSTz + (( _nYFloat  + (_nFTyFloat - _nSlopeTyFloat)  ) * _nDif_SRz);


				_nXStart =  _nFL1x + (tLS(y) * _nDif_FLx) >> Math.nDivPrec;
				_nXEnd = 	_nSlopeTx + ((tLS((y +  (_nFTy -  _nSlopeTy )  ) ) * _nDif_FRx) >> Math.nDivPrec);
/*
				var _nTest : Int = _nXStart >> Math.nSP;
				Debug.fConsole("_nXStart:   " + _nTest );
				var _nTest3 : Int = _nXEnd >> Math.nSP;
				Debug.fConsole("_nXEnd:   " + _nTest3 );
		*/		
				
				

				if (_nDirX == 1) {
					_nXDist =  Math.fMax(_nXEnd -  _nXStart, 1); //Minim of 1, remove bug of 0 div -> not test with 1 pixel
					x = Math.fMax( _nDirBegX, _nX_Start - _nXStart + _nLimXTOffset);
					_nXLimit = Math.fMin(_nXDist + _nDirEndX, _nX_End - _nXStart + _nLimXTOffset + Math.nPrec );
				}else {
					_nXDist =  Math.fMin(_nXEnd -  _nXStart, -1 );//Maximum of 1, remove bug of 0 div
					 x = Math.fMin( _nDirBegX, _nX_End  -  _nXStart  + _nLimXTOffset );
					_nXLimit = Math.fMax(_nXDist + _nDirEndX,   _nX_Start - _nXStart + _nLimXTOffset - Math.nPrec);
				}
				
		

				
				
				
				
				var _nXDistFloat : Float = _nXDist /_nFloatPrec;
				var _nDif_SLRx:Float = ((_nSRx - _nSLx) ) / _nXDistFloat;
				var _nDif_SLRy:Float = ((_nSRy - _nSLy) ) / _nXDistFloat;
				var _nDif_SLRz:Float = ((_nSRz - _nSLz) ) / _nXDistFloat;

				
				//Debug.fConsole("_nXDistFloat:   " + _nXDistFloat );	
			
				

				var _nXFrac :Int =  Math.fIFrac(_nIPosX +  _nXStart+ x);
				//var _nXEndFrac :Int =  Math.fIFrac(_nIPosX +  _nXEnd+ x);
				x -= _nXFrac;

				_nX = _nIPosX +  _nXStart + _nXFrac;
				var _nRealXPix : Int = (_nX + x ) >> Math.nSP;

				var _nXFloat : Float = x / _nFloatPrec;
				//_nXLimit += _nXEndFrac;
				
				
			//var _nTest  : Int = (_nX + x ) >> Math.nSP;
			//Debug.fConsole("--_nXLimit:   " + (_nXLimit >> Math.nPrec ) );	
	//		Debug.fConsole("_nIPosY:   " + _nIPosY );	
		
				/*
			<cpp>
			printf("\n__nXLimit %d", (_nXLimit >> 1024));
			printf("\n__nDirX %d", _nDirX);
			printf("\nx %d", x);
			</cpp>
		*/
				_nXLimit = Math.fITronc(_nXLimit - x ) + x;
				if (_nDirX == 1 && x < _nXLimit || _nDirX == -1 && x > _nXLimit) {//Remove bug
				
		
	
					for (; x != _nXLimit; x += _nXAdd) {

						var _n1OnZ : Float = _nSLz + (_nXFloat * _nDif_SLRz );
						_nGetX = Math.fFloatToInt(  (_nSLx + (_nXFloat * _nDif_SLRx )) / (_n1OnZ)  ) ;
						_nGetY = Math.fFloatToInt(  (_nSLy + (_nXFloat * _nDif_SLRy )) / (_n1OnZ)  ) ;

						//////////////////////////
						//Rotation Z !!!!
						//_nGetY = (_nGetY - 56) /  (((56-_nGetX )/111 /2.4 ) + 1) + 56;
						//_nGetX =  m_getBezier(0, 35, 111, _nGetX/111);
						///////////////////

						//	Pixel.fCopyPixelToDest(_aDest,0xFFFF00FF, (_nX+x)/1024, _nRealY/1024);


						if (_nGetX > _nLimW  || _nGetY > _nLimH) { //Todo negate
							_nGetX = 0;
							_nGetY = 0;
						}

						//(_nX+x ) >> Math.nSP
						inline Pixel.fGetSmoothPixel(_aSource, _nGetX , _nGetY , _aDest, _nRealXPix,  _nRealYPix , _nAlpha, _nPcBrRed,_nPcBrGreen , _nPcBrBlue , _nPcRevRed, _nPcRevGreen, _nPcRevBlue, _nOfRevRed, _nOfRevBlue, _nOfRevGreen);

						//Pixel.fCopyPixelToDest(_aDest,_aSource[_nGetY/256][_nGetX/256], (_nX+x)/1024, _nRealY/1024);
/*
						<cpp>
						printf("\nASSS");
						</cpp>
						*/
						//Pixel. (_aDest,0xFFFFFF00, (_nX+x)/1024, _nRealY/1024);
						//Pixel.fCopyPixelToDest(_aDest,0xFF000000, (_nX+x)/1024, _nRealY/1024);


						_nRealXPix += _nDirX;
						_nXFloat += _nXAddFloat;
					}
				}
				_nYFloat += 1;
				y += Math.nPrec;
				_nRealY += Math.nPrec;
				_nRealYPix++;
			}
		}


		public static function fDrawClipSquare(_aDest : CArray<Int32, 2>, _aSource : CArray<Int32, 2>, _nPosX : Int,  _nPosY : Int,  _nX_Start:Int, _nX_End:Int, _nY_Start:Int, _nY_End:Int ):Void {

			var _nPixelClip : UInt = 0;
			var _nX : Int = 0;
			var _nY : Int = 0;

			for (var y:Int = _nY_Start; y <= _nY_End; y++) {

				_nY = y + _nPosY;

				for (var x:Int = _nX_Start; x <= _nX_End ; x++) {

					_nX = x + _nPosX;
					_nPixelClip = _aSource[y][x];
					Pixel.fCopyPixelToDest(_aDest, _nPixelClip, _nX, _nY);
				}
			}
			/*
			//Only test
			if(nCx != 0){
				//Top pic test point
				_aDest[nPosY + nTy][nPosX + nTx] = 0xFF0000FF;
				_aDest[nPosY + nBy][nPosX + nBx] = 0xFF0000FF;

				_aDest[nPosY + nTLy][nPosX + nTLx] = 0xFFFF0000;
				_aDest[nPosY + nBLy][nPosX + nBLx] = 0xFFFF0000;
				_aDest[nPosY + nTRy][nPosX + nTRx] = 0xFFFF0000;
				_aDest[nPosY + nBRy][nPosX + nBRx] = 0xFFFF0000;

				_aDest[nPosY][nPosX] = 0xFF00FF00;//center

			}*/
			/////////
		}

	}
}
