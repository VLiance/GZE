//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	
	import GZ.Gfx.Attribute;
	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Gfx.Clip;
	import GZ.Base.Math.Math;
	import GZ.File.RcImgSequence;
	import GZ.Gfx.Clip.Img;
	
	/**
	 * @author Maeiky
	 */	
	
	public extension MovieClip extends Clip {
		
		//public var aTimeline : Array;
		
		public var oImg2 : Img;
		public var aTest : Array<Img>;
		
		public var nCurrInTimeline : Float = 0;
		 
		//public var aTimeline : Array< QArray<Root> >;
		public var aTimeline : Array< Clip >;
		public var nLimit : Float;
		
		public var nAnimSpeed : Float = 0.5;
		
		public var aOwnTest : Array<Root>;
		

		//public var qaTest : QArray<Root>;
		
		
		
		public function MovieClip( _oParent : Root, _nX: Float, _nY:Float):Void {
			Clip(_oParent, _nX , _nY);
			//aOwnTest = aChild;
		}
	
				
		public function fUpdateSequence():Void {
			nCurrInTimeline += nAnimSpeed;
			if(nCurrInTimeline < 0){
				nCurrInTimeline += nLimit;
			}
			if(nCurrInTimeline > nLimit){
				nCurrInTimeline -= nLimit;
			}
			var _nIntIndex : UInt = Math.fAbs(nCurrInTimeline);

			
			if(aTimeline.nSize != 0){
				var _oClip : Clip =  aTimeline[_nIntIndex % aTimeline.nSize];
				 aChild.fClear();
				 aChild.fPush(_oClip);
			}
			
		}
		
		
		
		override public function fUpdateParentToChild():Void {
			fUpdateSequence();
		}
		
		
		override public function fAddSequence( _oRc : RcImgSequence, _nX: Float = 0, _nY:Float = 0, _bCenter:Bool = true, _nCenterX:Int = 0, _nCenterY:Int = 0):Void {

			for (var i : UInt = 0; i < _oRc.aImg.nSize; i++) {
				var _oClip : Clip = new Clip(this, 0 , 0);
				aTimeline[i] = _oClip;
				aTest[i] = new Img(_oClip, _nX, _nY, _oRc.aImg[i], _bCenter, _nCenterX, _nCenterY);
				Debug.fWarning("ADD Sequences");
			}
			
			nLimit = aTimeline.nSize;
		}
		
		
		
	
		
		
	}
}