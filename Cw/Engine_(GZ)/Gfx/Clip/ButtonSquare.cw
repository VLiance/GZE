//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.Sys.Window;
	import GZ.GFX.Button;
	import GZ.GFX.Object;
	import GZ.GFX.Root;
	import GZ.GFX.Clip.Rectangle;
	
	/**
	 * @author Maeiky
	 */	
	public class ButtonSquare extends Button {
		
		private var nColor1 : UInt;
		private var nColor2 : UInt;
					
		private var nC1Red : UInt;
		private var nC1Blue : UInt;
		private var nC1Green : UInt;

		private var nC2Red : UInt;
		private var nC2Blue : UInt;
		private var nC2Green : UInt;
		private var bSolid : Bool;
		
		private var oRectangle : Rectangle;
		
		public function ButtonSquare( _oParent : Root, _nX: Int, _nY:Int, _nW: Int, _nH:Int, _bSolid : Bool = false):Void {
			Button(_oParent, _nX , _nY);
			bSolid = _bSolid;
			nWidth = _nW;
			nHeight = _nH;
			//nColor1 = 0xFF364080;
			//nColor2 = 0xFF878BA6;
			
			//TODO
			//nLimT = 0;
			//nLimL = 0;
		//	nLimR = nWidth;
		//	nLimB = nHeight;
			
			
			oRectangle = new Rectangle(this, 0, 0, _nW, _nH, 0xFF004596);
			
		}
		
		//overrided!!
		override public function fDrawObject(_oSource : Object, _nX_Start:Int, _nX_End:Int, _nY_Start:Int, _nY_End:Int ):Void {

			//dispatchRender(_oSource, _nX_Start, _nX_End,  _nY_Start, _nY_End);
		}
		
		
		override public function fButtonUpdate():Void {
			
			nPosY += 1p;
			nPosX += 1p;
			var _nPosX:Int = nPosX;
			var _nPosY:Int = nPosY;
		
			if (bDrag) {
				if (oWindow.fKeyIsDown( 0x01 ) == 0) { //LEFT MOUSE LEAVE
					fStopDrag();
				}
			}else if (bMouseOver && oWindow.bMouseDrag == false) { //Over
				oRectangle.fSetColor1(0xFF775566);
				if (oWindow.fKeyIsDown( 0x01 ) ) { //LEFT MOUSE
					oRectangle.fSetColor1(0xFFFF5500);
					fStartDrag();
				}
			}else {
				oRectangle.fSetColor1(0xFF004596);
			}
			
		
			
			
			
			oRectangle.nParentX = nPosX;
			oRectangle.nParentY = nPosY;
			//oRectangle.nPosX = nPosX;
			//oRectangle.nPosY = nPosY;
		}
		
		
		override public function fMouseOver():Void {

			
		}
		
		
	
	}
}