//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Gfx.Root;
	import GZ.Gfx.GlobalData;
	import GZ.Sys.FrameRate;
	import GZ.Sys.Interface.Context;
	import GZ.Sys.Interface.Window;
	import GZ.Base.Math.Math;
	import GZ.Base.Thread.Thread;
	import GZ.Gfx.Clip.Rectangle;
	import GZ.Gpu.GpuObj.GpuBuffer;

	import GZ.Sys.System;
	import GZ.Sys.ThreadItf;
	import GZ.Input.Key;

	/**
	 * @author Maeiky
	 */
	public extension Interface extends FrameRate {

		use Window.eWinClick;
		use Window.eWinBorder;
		use Window.eWinState;

		public var nTotalFaces : UInt = 0;
		public var nTotalBuffers : UInt = 0;

		private var bSreenCreated :Bool = false;
		private var nWIntype : UInt = 20;
		private var sWindowName : String;
		private var oBackground : Rectangle;
		public var oContext : Context;
		public var nFrameWidth : Float;
		public var nFrameHeight : Float;
		public var nHalfFrameWidth : Float;
		public var nHalfFrameHeight : Float;
		
		public var oKey : Key; 

		private var bWIntransparent : Bool;
		private var nBgColor : Int;

		public wvar oThreadItf : ThreadItf;
		
		public var bGpuDraw : Bool = true;

		//public function Interface(_oThreadItf : ThreadItf, _sWindowName : String, _nWeakWidth : UInt, _nWeakHeight : UInt, _bTransparent : Bool = false, _nBgColor : Int = 0xFFFFFFFF, _hBorder : eWinBorder = eWinBorder.Normal,  _bMinimizeBox : Bool = true, _bMaximizeBox : Bool  = true, _bCloseBox : Bool = true, _bCpuOnly : Bool = false):Void {
		public function Interface(_oThreadItf : ThreadItf, _sWindowName : String, _nWeakWidth : UInt, _nWeakHeight : UInt, _bTransparent : Bool = false, _nBgColor : Int = 0xFFFFFFFF):Void {
		
			Debug.fTrace("IntefaceCreate");
			
		//, _hBorder : eWinBorder = eWinBorder.Normal,  _bMinimizeBox : Bool = true, _bMaximizeBox : Bool  = true, _bCloseBox : Bool = true, _bCpuOnly : Bool = false):Void {
				
			oItf = this;
			//oBackground = 0; //TODO auto ini 0
/*
			if (_bCpuOnly == false) {
				bGpuDraw = true;
			}else {
				bGpuDraw = false;
			}*/

			/*
			//Get forced resolution
			if (System.GbAnyResolutionAvailable() == 0) {
				_nWeakWidth = System.GnForceWidth();
				_nWeakHeight = System.GnForceHeight();
			}*/
			
			FrameRate(null, _nWeakWidth, _nWeakHeight);

			oThreadItf = _oThreadItf;

			oGpuObj = new GpuBuffer();

			sWindowName = _sWindowName;
			nBgColor = _nBgColor;

			var _sWindowNameTest : String = "abcde";
			oContext = new Context(this, _sWindowNameTest, _nWeakWidth, _nWeakHeight, _bTransparent, _nBgColor);
			//, _hBorder, _bMinimizeBox, _bMaximizeBox,_bCloseBox,_bCpuOnly,false);

			oThreadItf.oWindow = oContext; //Will destroy windws when thread finish (shared_ptr)
			bWIntransparent = _bTransparent;

			nFrameWidth = oContext.nFrameWidth;
			nFrameHeight = oContext.nFrameHeight;
			
			nFrameWidth = _nWeakWidth; //temp
			nFrameHeight = _nWeakHeight;//temp
			
			nHalfFrameWidth = nFrameWidth/2.0;
			nHalfFrameHeight = nFrameHeight/2.0;
			
			
			
		}

		public function fCreateInterface(_nPosX:Int = Window.nPosCenter, _nPosY:Int = Window.nPosCenter, _hWinState:eWinState = eWinState.Normal):Void {
			Debug.fTrace("---ToCreateWin--");
			oContext.fCreate(_nPosX, _nPosY, nFrameWidth, nFrameHeight, _hWinState, bGpuDraw, true);
			
			/*
			nLimT  = 0;
			nLimL  = 0;
			nLimR  =  (oWindow.nFrameWidth -1 )* Math.nPrec;
			nLimB  =  (oWindow.nFrameHeight -1) * Math.nPrec;
			*/
	//		bLimitLock = true;

			if (bWIntransparent == true) { //If transparent go to CPU draw
				oContext.bWinGPU = false;
			}
			

			//oWindow.fIniPixelZone();
		//	aPixelArray = oWindow.fGetPixelArray();
			//oWindow.update();
			bSreenCreated = true
			fStartProcess();

		}

		
		public function fRegistred():Void {
			oGpuObj.fIni(this);

			fWinStart();
			if (bWIntransparent != true) { //If transparent go to CPU draw
				oBackground = new Rectangle(this, 0p, 0p, oContext.nFrameWidth, oContext.nFrameHeight, nBgColor);
			}
		}

		override public function fNewFrame():Void {
				//	Debug.fTrace("fNewFrame");
//	Debug.fTrace("---Update1--");
			oContext.fFrameStart(); //Or checkMsg?
			
	//		
			
		//	if (bSreenCreated && oWindow.bBlitInProgress == false) {
			if (oContext.bIniDrawZone && bSreenCreated && oContext.bBlitInProgress == false) {

				aPixelArray = oContext.aDrawZone2D;  //Update pixel array after fliping (If change)

			//			Debug.fTrace("fUpdateChild");
				oContext.fGetMousePosition();
				oContext.fGetKey(oKey);
				oContext.fClear(); 
				fUpdateParentToChild();
				fUpdateChild(); 
				//fUpdateChildToParent(); //Is U sless??
				     
			//	Debug.fTrace("Render");
				//fDispatchLimit(this);  
				oContext.fIniRender();  
				//fDispatchAll(rAllDispacher.qa Render);
				
				if(oContext.bIniDrawZone ){ //Temp
					fDispatchRender(); 
				}
				
				       
				if (oBackground) { 
					oBackground.fDraw();
				//	Debug.fTrace("Draw Background")
				}
				
				if(oContext.bWinGPU ) {
					oGpuObj.fDraw(0, 0,  0, 0, 0);
				} 
				
				//oGpuObj.fFinishRender();
				oContext.fFrameEnd();
				//oWindow.update();
				fOnClose();
			}  
		}
		
 

		 public function fOnClose():Void {
			if (oContext.hWinClick ==  eWinClick.Close) {
				//Delete this; // tDelete();
				oThreadItf.bRun = false;
			}
		 }

	 	 public function fTerminate():Void {
			 oThreadItf.bRun = false;
		 }

		/*
			//Begin
			if (gzInt(oWindow->hWinClick) == GZ_Window_eWinClick_nClose){
				delete oWindow;
				fStop();
			}
		*/

		override public function fIsWindowReady():Bool {
			return oContext.fIsWindowReady();
		}


		override public function fIniProcess():Void {
			oContext.fIniProcess();
			//oGpuObj.fIniRectangle(0,0,nBuffWidth,nBuffHeight);
			/*
			oGpuObj.fIni(this);

			fWinStart();
			if (bWIntransparent != true) { //If transparent go to CPU draw
				oBackground = new Rectangle(this, 0p, 0p, oContext.nFrameWidth, oContext.nFrameHeight, nBgColor);
			}*/
		}

		
		override public function fCpuVSyncOnGpu():Void {
			oContext.fCpuVSyncOnGpu();
		}


		override public fIniProcess:Void {
			oContext.fIniProcess();
			Debug.fTrace("fIniProcess");
		}

		override public function fBlit():Void {
			oContext.fBlit();
	
		}


		public function fWinStart():Void {
		}


	}
}
