//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.


package  {

	import GZ.Gfx.Object;
	import GZ.Sys.Interface.Window;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Face;
	import GZ.Gfx.Root;
	import GZ.Gfx.Clip;
	import GZ.Base.Math.Math;
	import GZ.Gfx.Triangle;
	import GZ.File.RcImg;
	import GZ.Base.PtA;
	import GZ.Base.Pt;
	import GZ.Base.Poly4;

	import GZ.Sys.Interface.Context;
	import GZ.Gfx.Vector.Line;

	/**
	 * @author Maeiky
	 */
	public class VectorShape extends Clip {

		//public var nSize : Float;
		public var oShape : Shape;
		public var aLine : Array<Line>;

		
				public var oLine : Line;

		public function VectorShape( _oParent : Root,  _nSize : Float = 1, _oShape : Shape = null):Void {
			
			Clip(_oParent, 0 , 0);
			
			//var _oLine : Line = new Line(this, new PtA(0 ,0), new PtA(200 , 100));
			
			
			
			var _oCenter  : Pt<Float> = new Pt<Float>(0.5, 0.5);
			//var _oCenter  : Pt<Float> = new Pt<Float>(0, 0);
			
			oShape = _oShape;
			if(oShape == null){
				oShape = new Shape(this, 0,0,0,false);
			
				var _nWidth : Float = 300;
				var _nHeight : Float = 200;
				
				
				var _oPtTL : PtA = new PtA(0 , 0 );
				var _oPtTR : PtA = new PtA(_nWidth, 0 );
				var _oPtBR : PtA = new PtA(_nWidth , _nHeight );
				var _oPtBL : PtA = new PtA(0, _nHeight );
				
				oShape.fAddPt(_oPtTL, _oCenter);
				oShape.fAddPt(_oPtTR, _oCenter);
				oShape.fAddPt(_oPtBR, _oCenter);
				oShape.fAddPt(_oPtBL, _oCenter);
			}
			
			
			
			for(var i : Int = 0; i < oShape.aNewPt3dOri.nSize; i++){
				var _oPt1 : PtA = oShape.aNewPt3dOri[i];
				var _nNext : Int = i + 1;
				if(_nNext == oShape.aNewPt3dOri.nSize){
					_nNext = 0;
				}
				var _oPt2 : PtA = oShape.aNewPt3dOri[_nNext];
				
				//var _oLine : Line = new Line(this,  new PtA(0 ,0),  new PtA(_oPt1.vPt.nX + 10 ,_oPt1.vPt.nY), -5);
				var _oLine : Line = new Line(this, _oPt1, _oPt2, _nSize);
				aLine.fPush(_oLine);
				//Debug.fWarning("CreateLines[" + i + "] " + _oPt1.vPt.nX + " , "  + _oPt1.vPt.nY );
				//Debug.fWarning("CreateLines[|" + i + "|] " + _oPt2.vPt.nX + " , "  + _oPt2.vPt.nY );
			}
			
			fUpdateLines();
			
			
		}
		
		
		/*
		
		inline double getAbsoluteDiff2Angles(const double x, const double y, const double c)
{
    // c can be PI (for radians) or 180.0 (for degrees);
    return c - fabs(fmod(fabs(x - y), 2*c) - c);
}

*/

		override public function fUpdateLines():Void {
			//Connect Lines
			for(var i : Int = 0; i < aLine.nSize; i++){
			
	
			
				var _nNext : Int = i + 1;
				if(_nNext == aLine.nSize){
					_nNext = 0;
				}
				var _oLine1 : Line = aLine[i];
				var _oLine2 : Line = aLine[_nNext];
				
				var _nFirstAngle : Float = _oLine1.nAngle; 
				var _nNextAngle : Float = _oLine2.nAngle; 
				/*
				if(_nNext == 0){
					_nNextAngle += Math.nPI * 2;
				}
				if(_nFirstAngle <  0){
					_nFirstAngle += Math.nPI * 2;
				}	
				*/
				if(_nNextAngle <  0){
					_nNextAngle += Math.nPI * 2;
				}
			
			
				var _nResultAngle : Float = (_nNextAngle - _nFirstAngle)/2;
				///Debug.fPass("_nFirstAngle " + _nFirstAngle);
				//Debug.fPass("_nNextAngle " + _nNextAngle);
				//Debug.fPass("_nResultAngle " + _nResultAngle);
				
				_oLine1.fSetCapR(_nResultAngle);
				_oLine2.fSetCapL_Pos(_oLine1 );
				//_oLine2.fSetCapL(_nResultAngle  );
		
				
			}
		}	
			
		override public function fUpdateParentToChild():Void {
			fUpdateLines();
		}
	
		override public function fUpdateChildToParent():Void {

			//fApplyPos();
		}
		




	}
}
