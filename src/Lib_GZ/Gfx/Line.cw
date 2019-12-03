//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	
	/**
	 * @author Maeiky
	 */	
	public extension Line extends Object {
		
		public var nPt1x : Float = 0;
		public var nPt1y : Float = 0;
		public var nPt2x : Float = 0;
		public var nPt2y : Float = 0;
		
		public function Line( _oParent : Root, _nX: Int, _nY:Int):Void {
			Object(_oParent, _nX , _nY);
			
			
		}
	
		override public function fDrawObject(_oSource : Object, _nX_Start:Int, _nX_End:Int, _nY_Start:Int, _nY_End:Int ):Void {
			
			Debug.fTrace3("Draw line");
			
			aSourcePixel = _oSource.aPixelArray;
			
			var _nX : UInt;
			var _nY : UInt;
			
			var _nHeight : Int = nPt2y - nPt1y;
			var _nWidth : Int = nPt2x - nPt1x;
			
			for (var y:Int = 0; y <= nHeight; y++) {
				
			
				_nX =  nPt1x +  (y * nWidth / nHeight);
				_nY = y + nPt1y;
				
				aSourcePixel[_nY][_nX] = 0xFF000000; //Noir
			
			}
		}
		
		
		
	
	}
}