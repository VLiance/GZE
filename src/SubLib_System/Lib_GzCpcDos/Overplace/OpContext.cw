package  { 

	import GZ.Gpu.Gpu;
	import GZ.Sys.Interface.Interface;
	import GZ.Input.Key;
	import GZ.Sys.Interface.Context;
	import GZ.Sys.Interface.Window;
	import GZ.Sys.System;
	//import GzWindows.Sys.Message.OpContextLink;
	
	
		
	public class OpContext overplace Context {
		

		public var sIcon : String;

		//public var bCloseBox : Bool = true;

		
	//	private static var qaShort : QArray<Int, 1>;

	
		public var hWinClickNew : eWinClick = eWinClick.None;
		//public var hWinClickNew : eWinClick;
		
		public function OpContext(_oInterface : Interface, _sWindowName : String, _nFrameWidth : UInt, _nFrameHeight : UInt, _bTransparent : Bool = false, _nBgColor : Int = 0xFFFFFFFF  ) : Void{
			Debug.fTrace("--Okays--");
			Debug.fTrace("---New OpWindows--");
			
			Context(_oInterface, _sWindowName, _nFrameWidth, _nFrameHeight, _bTransparent, _nBgColor);
		//	fCreateForm
		}
		 
		
		override public function fIniPixelDrawZone(): CArray<Int32>{
			
			Debug.fTrace("fIniPixelDrawZone: " + nHandleId);
			
			<cpp>
				return (gzInt32*) CpcDos->Init_Get_Context_PTR(nHandleId);
			</cpp>
			
			
			<cpp>//lite?
			//aPixels = new gzInt[nFrameWidth * nFrameHeight];
			//return aPixels;
			</cpp>
			
			<cpp>//Cpcdos
			// Retourner le pointeur du contexte depuis Cpcdos
			//return (gzInt32*) oCpcdos->Init_Get_Context_PTR(nIdContextGZE);
			</cpp>
		}
		
		
		override public function fBlit():UIntX {
			Debug.fTrace("Blit!!: " + nHandleId);
			
			if(nHandleId){
				<cpp>
					CpcDos->Blitting(nHandleId); 
				</cpp>
			 }
		
			return 0;
		}
		
		
	
		
		override function fMove( _nPosX : Int, _nPosY : Int):Void;
        override function fMoveAndSize(_nPosX : Int, _nPosY : Int, _nWidth : Int, _nHeight: Int):Void;
        override function fShow(_bActive : Bool = true):Void;
        override function fHide():Void;
		override function fIniProcess():Void;
        override function fMinimize():Void;
        override function fMaximize():Void;
        override function fRestore():Void;
        override function fDisable():Void;
		
	
		
		//public function fSendData(_nOtherWinId : UInt):Void;
		//private function fReceiveMessage( _sMessage : String):Void; //Dummy for dInterProcessMessage

        override function drawPixel():Void;
        override function fKeyIsDown(_nKeyVal : Int):Void;

        override function fCpuVSyncOnGpu():Void;
		
		
		override function fIsWindowReady():Bool;
	

		override function fGetMousePosition():Void{
		}
		
		
		override function fStartCaptureOutside():Void;
		override function fStopCaptureOutside():Void;
		//public function fFrameStart():Void;
		override function fFrameEnd():Void;
		override function fGetPixelArray():CArray<Int, 2>;
		
		/*
			gzInt** cSysWindow::fGetPixelArray() {
				return p2DArray;
			}
		*/
		
		override function  fGetKey(_oKey : Key):Void;
		

		
		
		
	}
}