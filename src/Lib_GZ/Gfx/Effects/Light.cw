//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.Sys.Interface.Window;
	import GZ.Gfx.Clip;
	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	import GZ.Sys.Interface.Context;
	import GZ.Gfx.Vector.Box;
	
	/**
	 * @author Maeiky
	 */	
	public class Light extends Clip {

	
		public var oBox : Box;
		
		public function Light( _nX: Float, _nY:Float, _nZ:Float):Void {
			Clip(parent, _nX , _nY);
			vPos.nZ = _nZ;
			
			oBox = new Box( 0,0,  50,50,   3);
		}
		
		//Overited
		override public function fUpdateParentToChild():Void {
			//Context.fGetMousePosition(); //Maybe si upder entre temps or not
			
		}
		
		
	
	
	}
}