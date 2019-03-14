//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.Sys.Interface.Window;
	import GZ.Gfx.Clip;
	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Base.Math.Math;
	
	/**
	 * @author Maeiky
	 */	
	public extension Button extends Clip {
		
		public var bPress : Bool = false;
		public var bRelease : Bool = false;
		
		public var bMouseOver : Bool = false;
		public var bDrag : Bool = false;
		public var bUseX : Bool = true;
		public var bUseY : Bool = true;
		public var bLimitAxisX : Bool = false;
		public var bLimitAxisY : Bool = false;
		
		public var bBoundAxisX: Bool = false;
		public var nLeftBoundX : Int;
		public var nRightBoundX : Int;
		
		public var bBoundAxisY: Bool = false;
		public var nLeftBoundY : Int;
		public var nRightBoundY : Int;
		
		public var nDragX : Int = 0;
		public var nDragY : Int = 0;

		public var nLastMouseX : Int;
		public var nLastMouseY : Int;
		
		public var nDestX:Float;
		public var nDestY:Float;
		
		public static var oLastBottonFirstOver : Button;
	
		
		public function Button( _oParent : Root, _nX: Int, _nY:Int):Void {
			Clip(_oParent, _nX , _nY);
			nDestX = _nX;
			nDestY = _nY;
			bContainer = true;
		}
		
		//Overited
		override public function fUpdateParentToChild():Void {
			//oWindow.fGetMousePosition(); Maybe si upder entre temps or not
			bPress = false;
			bRelease = false;
			
			if (bDrag) {
				
				/*
				nDestX = oWindow.nMouseX  + nDragX + ( oWindow.nMouseX - oWindow.nLastMouseX)/1.5;
				nDestY = oWindow.nMouseY  + nDragY + ( oWindow.nMouseY - oWindow.nLastMouseY)/1.5;
				
				var _nDiffX : Float = (nDestX - nX) / 1.7;
				var _nDiffY : Float = (nDestY - nY) / 1.7;
				
				nX += _nDiffX;
				nY += _nDiffY;
				
				if (  Math.fAbs(_nDiffX)  < 0.5 ) {
					_nDiffX = 0;
					nX = oWindow.nMouseX + nDragX;
				}
				if (  Math.fAbs(_nDiffY)  < 0.5 ) {
					_nDiffY = 0;
					nY = oWindow.nMouseY + nDragY;
				}*/

				
				nX = oWindow.nMouseX + nDragX;
				nY = oWindow.nMouseY + nDragY;
				fApplyPosGlobalToLocal();
				
				//Only one axe
				if(bUseX == false){
				//	nClipX = nLastClipX;
				}
				if (bUseY == false) {
					nClipY = nLastClipY;
				}
				if (bBoundAxisX) {
					if (nClipX < nLeftBoundX) {
						nClipX = nLeftBoundX;
					}
					if (nClipX > nRightBoundX) {
						nClipX = nRightBoundX;
					}
				}
				if (bBoundAxisY) {
					if (nClipY < nLeftBoundY) {
						nClipY = nLeftBoundY;
					}
					if (nClipY > nRightBoundY) {
						nClipY = nRightBoundY;
					}
				}
				fApplyPos();
				fDrag(); //Overrited
				
			}else{
				//if (oWindow.nMouseX >=  nX + nLimL &&  oWindow.nMouseX <= nX + nLimR  && oWindow.nMouseY >= nY + nLimT  &&  oWindow.nMouseY <=  nY + nLimB) { //Over
				if(fIsPtOver(oWindow.nMouseX, oWindow.nMouseY)){
					if (oWindow.bFirstMouseOver == false) {
						oWindow.bFirstMouseOver = true;
						bMouseOver = true;
						if (oLastBottonFirstOver != null && oLastBottonFirstOver != this) {  //Remove multiple button over
							oLastBottonFirstOver.bMouseOver = false;
						}
						oLastBottonFirstOver = this;
					}
				}else {
					bMouseOver = false;
				}
			}
		
			
			fButtonUpdate();
		}
		
		
		//Overited in button img
		public function fIsPtOver(_nPtx :Float, _nPty :Float) : Bool {
			/*
			_nPtx -= nX;
			_nPty -= nY;
			if (_nPtx >=  nBorderL &&  _nPtx <= nBorderR  && _nPty >= nBorderT  &&  _nPty <=  nBorderB) { //Over
				return true;
			}
			*/
			return false;
		}
		

		
	
		override public function fUpdateChildToParent():Void {
			
		}
		
		
		public function fStartDrag():Void {
			if (bDrag == false && oWindow.bMouseDrag == false) {
				bDrag = true;
				bPress = true;
				oWindow.bMouseDrag = true;
				oWindow.fStartCaptureOutside();
				nDragX = nX - oWindow.nMouseX;
				nDragY = nY - oWindow.nMouseY;
			}
		}
		
		public function fStopDrag():Void {
			if(bDrag == true){
				bDrag = false;
				bRelease = true;
				oWindow.bMouseDrag = false;
				oWindow.fStopCaptureOutside();
				nX = oWindow.nMouseX  + nDragX;
				nY = oWindow.nMouseY  + nDragY;
				nDestX = nX;
				nDestY = nY;
			}
			
		}
		
		public function fLimitDragAxis(_bUseX:Bool = true, _bUseY:Bool = true):Void {
			bUseX = _bUseX;
			bUseY = _bUseY;
		}
		public function fSetBoundAxisX(_nLeftBound:Int, _nRightBound:Int, _bBoundAxisX:Bool = true):Void {
			bBoundAxisX = _bBoundAxisX;
			nLeftBoundX = _nLeftBound;
			nRightBoundX = _nRightBound;
			if (nClipX < nLeftBoundX) {
				nClipX = nLeftBoundX;
			}
			if (nClipX > nRightBoundX) {
				nClipX = nRightBoundX;
			}
		}
		public function fSetBoundAxisY(_nLeftBound:Int, _nRightBound:Int, _bBoundAxisY:Bool = true):Void {
			bBoundAxisY = _bBoundAxisY;
			nLeftBoundY = _nLeftBound;
			nRightBoundY = _nRightBound;
			if (nClipY < nLeftBoundY) {
				nClipY = nLeftBoundY;
			}
			if (nClipY > nRightBoundY) {
				nClipY = nRightBoundY;
			}
		}
		
		public function fDrag():Void {
		}
		
		
		//Overited
		public function fButtonUpdate():Void {
		}
	
	}
}