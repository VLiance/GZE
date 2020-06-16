package  { 

	import GZ.Sys.Interface.Interface;  
	import GZ.Gfx.Object;
	import GZ.Gfx.Shape;
	import GZ.File.RcImg;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	
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
		
		
		public var nLay1_W : Float;
		public var nLay1_H : Float;
		
		public var nLay2_W : Float;
		public var nLay2_H : Float;
		public var nL2_ArraySize : Int;
		public var nMax_L2_ArraySize : Int;
		
		
		public function TileView(_oItf : Interface):Void {
			nXTotalCase = nSceneResW / nCaseSize  + 1; //TODO (+1  to simulate ceil and keep fraction)
			nYTotalCase = nSceneResH / nCaseSize + 1; //TODO (+1  to simulate ceil and keep fraction)
			nArraySize = nYTotalCase * nXTotalCase;
			
		
			oItf = _oItf;
		
			oImg = new RcImg("");
			
			//TODO autocast
			//oImg.aImg1D = aArray;
			
			
			
			
			oImg.hPixFormat = GpuRcImg.ePixFormat.R16UI;
		//	oImg.hPixFormat = GpuRcImg.ePixFormat.R8UI;
			//oImg.hPixFormat = GpuRcImg.ePixFormat.Default;
			oImg.nWidth =  nXTotalCase;
			oImg.nHeight = nYTotalCase;
			
			
			nLay1_W = nXTotalCase ;
			nLay1_H = nYTotalCase ;
			
			
			nLay2_W = nLay1_W / 2;
			nLay2_H = nLay1_H / 2;
			nL2_ArraySize = nLay2_W * nLay2_H;
			
			oImg.nHeight += nLay2_H;
			
			nMax_L2_ArraySize =  oImg.nWidth *  oImg.nHeight ;
			
			
			nFullArraySize = oImg.nWidth *  oImg.nHeight ;
			
			<cpp>
				aArray = (gzInt16*)GZ_fCalloc(nFullArraySize, sizeof(gzInt16));
				oImg->aImg1D = (gzInt32 *)(/*|LineArray|*/aArray);
			</cpp>	
		
			oImg.bBorder = false;
			

			<cpp>
			//oImg->aImg1D = (gzInt32 *)(/*|LineArray|*/aArray);
			</cpp>		
			
				/*
			for(var i:Int = 0; i < nArraySize; i++;){
				aArray[i] = i;
				//aArray[i] = 0xFFFFFFFF;
			}
			*/
			
			//if(bLoaded == false){
			//	bLoaded = true;
	
			
		}
		
		public function fIni():Void {
			//oImg.fSetGpuTexLayer(Attribute_Quad.oTexture);
			oImg.fSetGpuTexLayer(Attribute_Quad.oITexID);
			//	public var aKeyRelease : CArray<Bool, 1, 256>

		}

		
		
		
		
		public function fBuild_Array(_aObj :  Array<Shape>):Void {
		
			var _bOne : Bool = false;
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
			var _nL2_Offset : Int = nArraySize;
		
			/*
			Debug.fTrace("_nL2_Offset "    +  _nL2_Offset );
			Debug.fTrace("nL2_ArraySize "    +  nL2_ArraySize );
			Debug.fTrace("_nL2_Offset + (nL2_ArraySize*2) "    +  (_nL2_Offset + (nLay2_H * nLay1_W)) );
			Debug.fTrace("oImg.nWidth "    + oImg.nWidth );
			Debug.fTrace("oImg.nHeight"    +  oImg.nHeight  );
			Debug.fTrace("nFullArraySize "    + nFullArraySize );
			*/
			
		//	Debug.fTrace("nMax_L2_ArraySize "    + nMax_L2_ArraySize );
			
			for(var i: Int = 0; i < _aObj.nSize; i++){
				var _oObj : Shape = _aObj.fUnsafe_Get(i);
				//////////
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
				
				///////////
				var _nL2_XCaseNo : Int = (_nXCaseNo)/2;
				var _nL2_YCaseNo : Int = (_nYCaseNo)/2;
			//	var _nL2_XCaseNo : Int = (_oObj.nX_Min-nCaseSize) / _nL2_CaseSize;
			//	var _nL2_YCaseNo : Int = (_oObj.nY_Min-nCaseSize) / _nL2_CaseSize;
				//			if( (_oObj.nX_Max - nCaseSize )  < _nL2_XCaseNo * _nL2_CaseSize + _nL2_CaseSize){
				//	if( (_oObj.nY_Max - nCaseSize )  < _nL2_YCaseNo * _nL2_CaseSize + _nL2_CaseSize){
				
				if( (_oObj.nX_Max  )  < _nL2_XCaseNo * _nL2_CaseSize + _nL2_CaseSize){
					if( (_oObj.nY_Max  )  < _nL2_YCaseNo * _nL2_CaseSize + _nL2_CaseSize){
						//var _nCase : UInt = (_nL2_YCaseNo + nLay1_H ) * oImg.nWidth  + _nL2_XCaseNo; 
						//var _nCase : UInt = (_nL2_YCaseNo + nLay1_H ) * oImg.nWidth  + _nL2_XCaseNo; 
						var _nCase : UInt = (_nL2_YCaseNo + nLay1_H  ) * oImg.nWidth + _nL2_XCaseNo  ; 
						
						/*
						if(_bOne == false){
							_bOne = true;
							Debug.fTrace("_nL2_YCaseNo: " + _nL2_YCaseNo);
							Debug.fTrace("nLay1_H: " + nLay1_H);
							Debug.fTrace(" oImg.nWidth: " +  oImg.nWidth);
							Debug.fTrace("_nCase: " + _nCase);
						}*/
						
						
						
						if(_nCase <  nMax_L2_ArraySize  ){
							aArray[ _nCase] += 0x00FF;
						}
					}
				}
				
				///////////
			}
			/*
			for(var i: Int = 0; i < oImg.nHeight ; i++){
				var _nCase : UInt = (i ) * oImg.nWidth  ; 
				aArray[ _nCase] += 0x00FF;
				
			}*/
			
		}
		
		public function fGpuDraw():Bool {
			oImg.fGpuLoad(true);
		}
		
		
	}
}

