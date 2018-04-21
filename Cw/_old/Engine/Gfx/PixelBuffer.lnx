//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.Sys.Window;
	import GZ.GFX.Shape;
	import GZ.GFX.Root;
	import GZ.GFX.Object;
	import GZ.File.Image;
	import GZ.Math;
	
	
	/**
	 * @author Maeiky
	 */	
	public class PixelBuffer  extends  Object  {
		

		
		public var oImage : Image;
		
		public function PixelBuffer( _oParent : Root, _sPath:String):Void {
	
			oImage = new Image();
			oImage.fOpen(_sPath);
			
			aPixelArray = oImage.fGetImage();
			nWidth = oImage.fGetWidth();
			nHeight = oImage.fGetHeight();
			sPath = _sPath;

		}
		
		

	}
}