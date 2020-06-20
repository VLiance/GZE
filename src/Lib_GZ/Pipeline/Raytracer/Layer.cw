package  { 

	import GZ.Sys.Interface.Interface;  
	import GZ.Gfx.Object;
	import GZ.Gfx.Shape;
	import GZ.File.RcImg;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GZ.Gpu.Base.UnVec2;
	import GZ.Gpu.ShaderBase.ProgramShader;	
	import GZ.Gpu.GpuObj.GpuRcImg;
	import GZ.Pipeline.Raytracer.TileView;
		
	public class Layer  {
			
		
		public var oUvScreen: UnVec2;
		public var oUvOffset: UnVec2;
		public var nWidth : Float;
		public var nHeight: Float;
		
		public var nOff_X : Float;
		public var nOff_Y: Float;

		public var nLayer : Int;
		public var nOffsetCase : Float;
		public var nCaseSize : Float;
	
		
		
		public function Layer(_oTileView : TileView, _nLayer:Int, _nCaseSize:Float, _nWidth: Float, _nHeight : Float, _nOffsetCase:Float = 0):Void {
			nLayer =  _nLayer;
			nWidth = _nWidth;
			nHeight = _nHeight;
			nCaseSize = _nCaseSize;
			nOffsetCase = _nOffsetCase;
			
			oUvScreen = new UnVec2(_oTileView.oProgram, "vScreen_L" + _nLayer);
			oUvOffset = new UnVec2(_oTileView.oProgram, "vOffset_L" + _nLayer);
			
			oUvScreen.vVal.nX = _oTileView.nSceneResW / (_nCaseSize);
			oUvScreen.vVal.nY = _oTileView.nSceneResH / (_nCaseSize);
			oUvScreen.fSend();

		}
		
	
		
		public function fSetOffset(_nX:Float, _nY:Float):Void{
		
			var _nCaseOff : Float = nOffsetCase/nCaseSize;
			
			
			var _nScale : Float = nCaseSize / 32;
			var _nX_IntOff : Int = _nX /  _nScale;
			var _nY_IntOff : Int = _nY /  _nScale;
			
			var _nIntXComp : Int = _nX;
			var _nIntYComp : Int = _nY;
			
			if(_nX_IntOff *  _nScale !=  _nIntXComp){
				_nX_IntOff++;
			}
			if(_nY_IntOff *  _nScale !=  _nIntYComp){
				_nY_IntOff++;
			}
			
			 nOff_X = _nX_IntOff *  _nScale;
			 nOff_Y = _nY_IntOff *  _nScale;
			
			
			//nOff_X = _nX;
			//nOff_Y = _nY;
			
			oUvOffset.vVal.nX = nOff_X + _nCaseOff;
			oUvOffset.vVal.nY = nOff_Y + _nCaseOff;
			oUvOffset.fSend();
		}
		

		
		
		
		
	}
}

