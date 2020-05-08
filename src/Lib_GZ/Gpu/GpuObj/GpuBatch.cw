package  { 

	import GZ.Gfx.Face;
	import GZ.Gfx.Buffer;
	import GZ.File.RcImg;
	import GZ.Gpu.ShaderModel.GzModel.GzShModel;
	import GZ.Gpu.GpuObj.GpuBuffer;
	import GZ.Sys.Interface.Context;
	
	
	public overclass GpuBatch  {
	
	
		public enum eBlendMode : Int {	
			None;
			Alpha;
			Add;
			Substract;
			Multiply;
		}

		public var hBlendMode : eBlendMode = eBlendMode.Alpha;
		public var oFBO_Destination : GpuBuffer;
		
	
		public wvar oShModel : GzShModel;
		
		public function GpuBatch( _oShModel : GzShModel ):Void{
			oShModel = _oShModel
			
			fSetDestination(null);
			//		oContext.bSemiTransparent
		}


		public function fSetDestination(_oFBO_Destination : GpuBuffer):Void {
			oFBO_Destination = _oFBO_Destination;
			hBlendMode =  eBlendMode.Alpha;
			/*
			if(oFBO_Destination == null && Context.bSemiTransparent == false){
				hBlendMode =  eBlendMode.None;
			}else{
				hBlendMode =  eBlendMode.Alpha;
			}*/
		}
		public function fDraw():Void {
		}
		
	}
}