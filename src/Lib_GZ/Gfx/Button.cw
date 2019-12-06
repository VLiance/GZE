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
	
	/**
	 * @author Maeiky
	 */	
	public class Button extends Clip {
		
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
		
	
	public var nClipX : Float = 0; //TODO Better place
	public var nClipY : Float = 0;
public var nLastClipX : Float = 0; //TODO Better place
public var nLastClipY : Float = 0;
	
		
		public function Button( _oParent : Root, _nX: Int, _nY:Int):Void {
			Clip(_oParent, _nX , _nY);
			nDestX = _nX;
			nDestY = _nY;
			bContainer = true;
		}
		
		//Overited
		override public function fUpdateParentToChild():Void {
			//Context.fGetMousePosition(); //Maybe si upder entre temps or not
			
			bPress = false;
			bRelease = false;
			
			if (bDrag) {
				
				/*
				nDestX = Context.nMouseX  + nDragX + ( Context.nMouseX - Context.nLastMouseX)/1.5;
				nDestY = Context.nMouseY  + nDragY + ( Context.nMouseY - Context.nLastMouseY)/1.5;
				
				var _nDiffX : Float = (nDestX - nX) / 1.7;
				var _nDiffY : Float = (nDestY - nY) / 1.7;
				
				nX += _nDiffX;
				nY += _nDiffY;
				
				if (  Math.fAbs(_nDiffX)  < 0.5 ) {
					_nDiffX = 0;
					nX = Context.nMouseX + nDragX;
				}
				if (  Math.fAbs(_nDiffY)  < 0.5 ) {
					_nDiffY = 0;
					nY = Context.nMouseY + nDragY;
				}*/

				
				vPos.nX = Context.nMouseX + nDragX;
				vPos.nY = Context.nMouseY + nDragY;
		//		fApplyPosGlobalToLocal();
				
				//Only one axe
				if(bUseX == false){
					nClipX = nLastClipX;
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
				//if (Context.nMouseX >=  nX + nLimL &&  Context.nMouseX <= nX + nLimR  && Context.nMouseY >= nY + nLimT  &&  Context.nMouseY <=  nY + nLimB) { //Over
				if(fIsPtOver(Context.nMouseX, Context.nMouseY)){
					if (Context.bFirstMouseOver == false) {
						Context.bFirstMouseOver = true;
						bMouseOver = true;
						/*
						if (Button.oLastBottonFirstOver != null && oLastBottonFirstOver != this) {  //Remove multiple button over
							Button.oLastBottonFirstOver.bMouseOver = false;
						}
						Button.oLastBottonFirstOver = this;
						*/
						
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
			if (bDrag == false && Context.bMouseDrag == false) {
				bDrag = true;
				bPress = true;
				Context.bMouseDrag = true;
				Context.fStartCaptureOutside();
				nDragX = vPos.nX - Context.nMouseX;
				nDragY = vPos.nY - Context.nMouseY;
			}
		}
		
		public function fStopDrag():Void {
			if(bDrag == true){
				bDrag = false;
				bRelease = true;
				Context.bMouseDrag = false;
				Context.fStopCaptureOutside();
				vPos.nX = Context.nMouseX  + nDragX;
				vPos.nY = Context.nMouseY  + nDragY;
				nDestX = vPos.nX;
				nDestY = vPos.nY;
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