package  { 

	import GZ.Sys.Interface.Interface;  
	import GZ.Gfx.Object;
	import GZ.Gfx.Shape;
	import GZ.File.RcImg;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Pipeline.Raytracer.Layer;
	import GZ.Gpu.ShaderBase.ProgramShader;
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
		
		public var oLay1 : Layer;
		public var oLay2 : Layer;
		public var oLay3 : Layer;
	
		
		public wvar oProgram : ProgramShader;
		
		
		public function TileView(_oItf : Interface, _oGzShModel : GzShModel):Void {
			oItf = _oItf;
			oProgram = _oGzShModel.oProgram;
			

			
			nXTotalCase = nSceneResW / nCaseSize  + 1; //TODO (+1  to simulate ceil and keep fraction)
			nYTotalCase = nSceneResH / nCaseSize + 1; //TODO (+1  to simulate ceil and keep fraction)
			nArraySize = nYTotalCase * nXTotalCase;
			
			oImg = new RcImg("");
			oImg.nWidth =  nXTotalCase;
			oImg.nHeight = nYTotalCase;	
		
			//First Layer
			oLay1 = new Layer(this, 1, nCaseSize,  nXTotalCase, nYTotalCase);
			
			//Positionned at bottom of Lay1
			//1:0
			//2:X
			oLay2 = new Layer(this, 2, nCaseSize*2,  oLay1.nWidth / 2, oLay1.nHeight / 2 + 1, nCaseSize);
			oLay2.fSetOffset(0, oLay1.nHeight );
			
			//Lay3 Positionned at right of Lay2
			//1:OO
			//2:Ox
			oLay3 = new Layer(this, 3, nCaseSize*4,  oLay2.nWidth / 2, oLay2.nHeight / 2);
			oLay3.fSetOffset(oLay2.nWidth, oLay1.nHeight);

			
			oImg.nHeight += oLay2.nHeight;
			
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
			
			for(var i:Int = 0; i < nFullArraySize; i++;){
				aArray[i] = 0;
				//aArray[i] = 0xFFFFFFFF;
			}
			
			for(var i: Int = 0; i < _aObj.nSize; i++){
				var _oObj : Shape = _aObj.fUnsafe_Get(i);

				if( fAddCase(_oObj, oLay1.nCaseSize, oLay1.nOffsetCase, oLay1.nOff_X, oLay1.nOff_Y) == false ) {
				if( fAddCase(_oObj, oLay2.nCaseSize, oLay2.nOffsetCase, oLay2.nOff_X, oLay2.nOff_Y) == false ) {
				if( fAddCase(_oObj, oLay3.nCaseSize, oLay3.nOffsetCase, oLay3.nOff_X, oLay3.nOff_Y) == false ) {
				
				}
				}
				}
			}
			
			Debug.fTrace("Total: " + _aObj.nSize + " Placed: " + nPlaced);
		
			
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

