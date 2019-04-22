//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.


package  { 
	
	import GZ.Gfx.Attribute;
	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	
	/**
	 * @author Maeiky
	 */	
	
	public extension Clip extends Object {
		
		//public var aTimeline : Array;
		
		public function Clip( _oParent : Root, _nX: Float, _nY:Float):Void {
			Object(_oParent, _nX , _nY);
		}
	
		
		
		override public function fUpdate():Void {
			
			
		}
		

		override public function fDraw():Void {
			fDispatchRender();

		}
		
		
		override public function fContextResume():Void {
			fDispatchContextResume();
		}
		
		
		override public function fApplyTransform():Void {
			
		}
		
		
		
			
		override public function fAddSequence():Void {
			
		}
		
		
		
		override public function fCalculateChildBorder():Void {
			/*
			nLimTLx = _rPt.nX;
			nLimTLy = _rPt.nY;
			
			nLimTRx = _rPt.nX;
			nLimTRy  = _rPt.nY;

			nLimBLx = _rPt.nX;
			nLimBLy  = _rPt.nY;
	
			nLimBRx = _rPt.nX;
			nLimBRy  = _rPt.nY;
			*/
		}
		
		
	
	}
}