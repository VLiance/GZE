//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  { 
	

	import GZ.Gfx.Button;
	import GZ.Gfx.Object;
	import GZ.Gfx.Root;
	import GZ.Gfx.Clip.ButtonImg;
	import GZ.Gfx.Clip.Img;
	import GZ.Gfx.Clip;
	import GZ.Base.Math.Math;

	/**
	 * @author Maeiky
	 */	
	public class SliderV extends Clip {
		
		public var oSlider : ButtonImg;
		public var oBack : Img;
		public var oFill : Img;
		private var nDim : Int = 73p;
		private var nStart : Int = 3p;
		private var nMidle : Int;
		private var nBidirectional : Bool;
		private var nToR : Int;
		private var nToG : Int;
		private var nToB : Int;
		
		public var nR : Int;
		public var nG : Int;
		public var nB : Int;
		public var nPc : Int = 0;
		
		
		public function SliderV( _oParent : Root, _nX: Int, _nY:Int, _nBidirectional : Bool = false, _nR:UInt = 255, _nG:UInt = 255, _nB:UInt = 255):Void {
			Clip(_oParent : Root, _nX: Int, _nY:Int);
			
			nToR = _nR;
			nToG = _nG;
			nToB = _nB;
			
			nBidirectional = _nBidirectional;
			oSlider = new ButtonImg(this, 3p , nStart, "img/Slider/Slider.png");
			oSlider.fLimitDragAxis(false, true);
			oSlider.fSetOverPressBrightness(0,0,0,200,200,200, 10);
			oSlider.fSetBoundAxisY(nStart, nStart + nDim);
			nMidle = nStart + nDim / 2;
		
			if (nBidirectional) {
				oSlider.nClipX = nMidle;
				oFill = new Img(this, nMidle , 0p, "img/Slider/SliderFill.png", false, 0, 0);
				oBack = new Img(this, 0p , 0p, "img/Slider/SliderBackNP.png", false);
			}else {
				oFill = new Img(this, 1p ,  nDim + nStart + 2p, "img/Slider/SliderFill.png", false, 0, 0, false);
				oBack = new Img(this, 0p , 0p, "img/Slider/SliderBackP.png", false);
			}
			
			//oFill.nShapeWidth = 3p;
			//oFill.nShapeHeight = 5p;
		}
		
				

		
		override public function fUpdateChildToParent():Void {
			if (nBidirectional) {
				var _nVal : Int = oSlider.nClipY - nMidle;
				nPc =  _nVal * 255 / 45;
				nR =   _nVal* nToR / 45;
				nG =   _nVal * nToG / 45;
				nB =   _nVal * nToB / 45;
				oFill.nShapeWidth = (_nVal) ; // - 8p;
				//oFill.fToBrRGB( nR, nG, nB);
			}else {
				
				var _nVal : Int = nDim - ( oSlider.nClipY - nStart);
				
				
				nPc =  _nVal * 255 / 90;
				
				nR = _nVal * nToR / 90;
				nG = _nVal * nToG / 90;
				nB = _nVal * nToB / 90;
				oFill.nShapeHeight = _nVal * -1;
				//oFill.fToBrRGB( nR, nG, nB);
			}
			
		}

		
		
	
	}
}