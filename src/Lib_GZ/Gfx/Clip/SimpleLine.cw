//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.Base.Math.Math;
	import GZ.Gfx.Root;
	import GZ.Gfx.Shape;
	import GZ.Gfx.Clip.ButtonSquare;
	
	
	/**
	 * @author Maeiky
	 */	
	public class SimpleLine extends Shape {
		
		use Shape.uPoint;
		
		public var oBtn1 : ButtonSquare;
		public var oBtn2 : ButtonSquare;
		
		private var rPt1 : uPoint;
		private var rPt2 : uPoint;	
		
		

		public function SimpleLine( _oParent : Root, _oBtn1: ButtonSquare, _oBtn2:ButtonSquare):Void {
			Shape(_oParent, 0 , 0, true);
			oBtn1 = _oBtn1;
			oBtn2 = _oBtn2;
			
			rPt1 = addPoint(50, 50,       0, 0, 1);
			rPt2 = addPoint(150, 150,     0, 0, 1);
			//fCreateLines();
			
			Debug.fTrace3("SimpleLine created");
		}
		
		
		override public function fUpdate():Void {
			
			
			rPt1.nX = oBtn1.nPosX;
			rPt1.nY = oBtn1.nPosY;
			
			rPt2.nX = oBtn2.nPosX;
			rPt2.nY = oBtn2.nPosY;
		//	fUpdateShape();
			
			/*
			nHeight = Math.fAbs(nPt1y - nPt2y);
			nWidth  = Math.fAbs(nPt2x - nPt1x);
			
			nLimT = 0;
			nLimL = 0;
			nLimR = nWidth;
			nLimB = nHeight;
			*/

		}
		
		
		
	}
}