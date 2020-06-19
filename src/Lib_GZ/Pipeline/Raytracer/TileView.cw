package  { 

	import GZ.Sys.Interface.Interface;  
	import GZ.Gfx.Object;
	import GZ.Gfx.Shape;
	import GZ.File.RcImg;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GZ.Gpu.Base.UnVec2;
		
	import GZ.Gpu.GpuObj.GpuRcImg;
		
	public class TileView  {
			
		public wvar oItf : Interface;
		public var oImg : RcImg;
		public var nWidth : UInt;
		public var nHeight : UInt;
		//public var aArray : CArray<Int32, 1, 320000>;//800x800
	//	public var aArray : CArray<Int16, 1, 625>;//800x800 => (25x25 / 32x32) = 
	//	public var aArray : CArray<Int16, 1, 625>;//800x800 => (25x25 / 32x32) = 
		public var aArray : CArray<Int16>;//800x800 => (25x25 / 32x32) = 
		public var bLoaded : Bool = false;
		public var nOffset : Int;
		public var nSceneResW : Float = 800;
		public var nSceneResH : Float = 600;
		//public var nCaseSize : Int = 32;
		public var nCaseSize : Float = 32;
		public var nXTotalCase : Int;
		public var nYTotalCase : Int;
		public var nArraySize : Int;
		public var nFullArraySize : Int;
		
		
				
		//public var nL2_ArraySize : Int;
		//public var nMax_L2_ArraySize : Int;
		
		
		public var oUvScreen_L1: UnVec2;
		public var nLay1_W : Float;
		public var nLay1_H : Float;
		
		public var oUvScreen_L2: UnVec2;
		public var oUvOffset_L2: UnVec2;
		public var nLay2_W : Float;
		public var nLay2_H : Float;
		
		public var oUvScreen_L3: UnVec2;
		public var oUvOffset_L3: UnVec2;
		public var nLay3_W : Float;
		public var nLay3_H : Float;
		public var nPlaced : Int;
	
		
		
		public function TileView(_oItf : Interface, _oGzShModel : GzShModel):Void {
			oItf = _oItf;
			
			oUvScreen_L1 = new UnVec2(_oGzShModel.oProgram, "vScreen_L1");
			oUvScreen_L1.vVal.nX = nSceneResW / nCaseSize;
			oUvScreen_L1.vVal.nY = nSceneResH / nCaseSize;
			oUvScreen_L1.fSend();
			
			oUvScreen_L2 = new UnVec2(_oGzShModel.oProgram, "vScreen_L2");
			oUvOffset_L2 = new UnVec2(_oGzShModel.oProgram, "vOffset_L2");
			oUvScreen_L2.vVal.nX = nSceneResW / (nCaseSize*2);
			oUvScreen_L2.vVal.nY = nSceneResH / (nCaseSize*2);
			oUvScreen_L2.fSend();
			
			oUvScreen_L3 = new UnVec2(_oGzShModel.oProgram, "vScreen_L3");
			oUvOffset_L3 = new UnVec2(_oGzShModel.oProgram, "vOffset_L3");
			oUvScreen_L3.vVal.nX = nSceneResW / (nCaseSize*4);
			oUvScreen_L3.vVal.nY = nSceneResH / (nCaseSize*4);
			oUvScreen_L3.fSend();
			
			
			nXTotalCase = nSceneResW / nCaseSize  + 1; //TODO (+1  to simulate ceil and keep fraction)
			nYTotalCase = nSceneResH / nCaseSize + 1; //TODO (+1  to simulate ceil and keep fraction)
			nArraySize = nYTotalCase * nXTotalCase;
			
			oImg = new RcImg("");
			oImg.nWidth =  nXTotalCase;
			oImg.nHeight = nYTotalCase;	
			
			
			nLay1_W = nXTotalCase ;
			nLay1_H = nYTotalCase ;
			
			//Positionned at bottom of Lay1
			//1:0
			//2:X
			nLay2_W = nLay1_W / 2;
			nLay2_H = nLay1_H / 2 + 1; //+ 1 to get the bottom one
			oUvOffset_L2.vVal.nX = 0.5;			//+ 0.5offset to interlace
			oUvOffset_L2.vVal.nY = nLay1_H + 0.5; //+ 0.5 offset to interlace
			oUvOffset_L2.fSend();
			
			//Positionned at right of Lay2
			//1:OO
			//2:Ox
			nLay3_W = nLay2_W / 2;
			nLay3_H = nLay2_H / 2;
			oUvOffset_L3.vVal.nX = nLay2_W;
			oUvOffset_L3.vVal.nY = nLay1_H;
			oUvOffset_L3.fSend();
			
			//nL2_ArraySize = nLay2_W * nLay2_H;
			//nMax_L2_ArraySize =  oImg.nWidth *  oImg.nHeight ;
			
			
			oImg.nHeight += nLay2_H;
			
			//Img setup
			nFullArraySize = oImg.nWidth *  oImg.nHeight ;
			//TODO autocast
			//oImg.aImg1D = aArray;
			<cpp>
				aArray = (gzInt16*)GZ_fCalloc(nFullArraySize, sizeof(gzInt16));
				oImg->aImg1D = (gzInt32 *)(/*|LineArray|*/aArray);
			</cpp>	
			oImg.bBorder = false;
			oImg.hPixFormat = GpuRcImg.ePixFormat.R16UI;
		//	oImg.hPixFormat = GpuRcImg.ePixFormat.R8UI;
			//oImg.hPixFormat = GpuRcImg.ePixFormat.Default;

		}
		
		public function fIni():Void {
			//oImg.fSetGpuTexLayer(Attribute_Quad.oTexture);
			oImg.fSetGpuTexLayer(Attribute_Quad.oITexID);
			//	public var aKeyRelease : CArray<Bool, 1, 256>

		}

		
		
		
		
		public function fBuild_Array(_aObj :  Array<Shape>):Void {
		
			var _bOne : Bool = false;
			nPlaced = 0;
			//nOffset += 1;
			for(var i:Int = 0; i < nFullArraySize; i++;){
				//aArray[i] = i  + nOffset;
				aArray[i] = 0;
				//aArray[i] = 0xFFFFFFFF;
			}
			//if(nOffset > nArraySize){
			//	nOffset = 0;
		//}
			
			var _nL2_CaseSize : Int = nCaseSize*2;
			var _nL3_CaseSize : Int = _nL2_CaseSize*2;
			
		
			
			for(var i: Int = 0; i < _aObj.nSize; i++){
				var _oObj : Shape = _aObj.fUnsafe_Get(i);
				/*
				var _nXCaseNo : Int = _oObj.nX_Min / nCaseSize;
				var _nYCaseNo : Int = _oObj.nY_Min / nCaseSize;
				if(_oObj.nX_Max  < _nXCaseNo * nCaseSize + nCaseSize){
					if(_oObj.nY_Max  < _nYCaseNo * nCaseSize + nCaseSize){
						var _nCase : UInt = _nYCaseNo * oImg.nWidth  + _nXCaseNo;
						if(_nCase < nArraySize){
							aArray[_nCase] += 0x00FF;
						}
					}
				}
				*/
				
				///////////
				if( fAddCase(_oObj, nCaseSize, 0, 0, 0) == false ) {
				if( fAddCase(_oObj, _nL2_CaseSize, nCaseSize, 0, nLay1_H) == false ) {
				if( fAddCase(_oObj, _nL3_CaseSize, 0, nLay2_W, nLay1_H) == false ) {
				
				}
				}
				}
			
			}
			
			Debug.fTrace("Total: " + _aObj.nSize + " Placed: " + nPlaced);
			
			/*
			for(var i: Int = 0; i < oImg.nHeight ; i++){
				var _nCase : UInt = (i ) * oImg.nWidth  ; 
				aArray[ _nCase] += 0x00FF;
				
			}*/
			
		}
		
		public function fAddCase( _oObj : Shape, _nCaseSize: Float, _nOffsetCase: Float, _nOffsetX: Float, _nOffsetY: Float):Bool {
			var _nXCaseNo : Int = (_oObj.nX_Min+_nOffsetCase) / _nCaseSize;
			var _nYCaseNo : Int = (_oObj.nY_Min+_nOffsetCase) / _nCaseSize;
				
			if( (_oObj.nX_Max + _nOffsetCase )  < _nXCaseNo * _nCaseSize + _nCaseSize){
				if( (_oObj.nY_Max + _nOffsetCase )  < _nYCaseNo * _nCaseSize + _nCaseSize){
					var _nCase : UInt = (_nYCaseNo + _nOffsetY  ) * oImg.nWidth + _nXCaseNo + _nOffsetX; 
					//if(_nCase <  nMax_L2_ArraySize  ){
					if(_nCase <  nFullArraySize  ){ //Temp?
						aArray[ _nCase] += 0x00FF;
						nPlaced++;
						return true;
					}
				}
			}
			return false;
		}
		
		
		
		public function fGpuDraw():Bool {
			oImg.fGpuLoad(true);
		}
		
		
	}
}

