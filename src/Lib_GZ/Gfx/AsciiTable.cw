//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	

	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	import GZ.Gfx.PixelBuffer;
	import GZ.Gfx.Object;
	import GZ.Gfx.Clip;
	
	import GZ.Gfx.Attribute;
	
	/**
	 * @author Maeiky
	 */	
	public class AsciiTable extends Clip {
		

		public var oImg : PixelBuffer;		
		public var nCharWidth : Int = 10;
		public var nCharHeight : Int = 17;

		//Player 0 = CPU
		//Player 1 = ArrowKey move
		//Player 2 = WASD move
		
		public function AsciiTable( _oParent : Root, _nX: Int, _nY:Int):Void {
			Clip(_oParent : Root, _nX: Int, _nY:Int);
			
		
			oImg = new PixelBuffer(this, "img/AsciiTable.png");
			
	
		}
		
		override public function fUpdateParentToChild():Void {
			
		}
		

	}
}