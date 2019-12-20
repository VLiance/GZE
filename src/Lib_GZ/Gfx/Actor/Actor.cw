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
	public extension Actor extends Object {
		
	
	
		public function Actor( _oParent : Root, _nX: Int, _nY:Int):Void {
			Object(_oParent, _nX , _nY);
		}
		
		
	
		override public function fDrawObject(_oSource : Object, _nX_Start:Int, _nX_End:Int, _nY_Start:Int, _nY_End:Int ):Void {
			
		
		}
		
		
		
	
	
	
	
	
	}
}