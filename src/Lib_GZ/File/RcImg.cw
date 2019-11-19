

package  { 

	import GZ.Sys.Interface.Context;
	import GZ.File.Image;
	import GZ.Sys.System;
	import GZ.File.Resource;
	//import GZ.Gpu.GpuObj.GpuObject;
	import GZ.Gpu.GpuObj.GpuRcImg;
	import GZ.Gpu.Base.Texture;
	import GZ.Base.Vec2;

	/**
	 * @author Maeiky
	 */	

	//public atomic RcImg extends Resource {
	public class RcImg extends Resource {	
	
		public var oGpuTexLayer : Texture;
		
		
		public var oGpuTexId : Val = 0;
		
		public var vOffset : Vec2<Float>;
		
		public var nWidth : UInt = 0;
		public var nHeight : UInt = 0;
		public var aImg : CArray<Int32, 2>
		public var oGpuRcImg : GpuRcImg;
		
		
		
		public function RcImg(_sPath : String ):Void {
	
			Resource(_sPath);
			
			oGpuRcImg = new GpuRcImg();
			
			// hLocation : eLocation = eLocation.Drive;
		}
		
		public function fSetGpuTexLayer(_oGpuTexLayer : Texture):Void {
			oGpuTexLayer = _oGpuTexLayer;
		}
		
		
		//Embed
		
		/*
		
			RcImg( _sPath : String) {
				
				//Image.fTestShape();
				//	aImg = 0; //Todo always
			
					printf("\nNew RcTestImg");

				//Debug.fConsole("RcImg");
			}
		*/
		
			<cpp_class_h>
			
				cRcImg(gzBool _bStartRc = false):cResource(0) {
					
					//Image.fTestShape();
					//	aImg = 0; //Todo always
				
						printf("\n RcImg");
				
					
					//Debug.fConsole("RcImg");
				}
			</cpp_class_h>
			
		/*
		override public function fLoadFromDrive(_sRoot:String, _sSubPath:String):Void {
			
			sPath = _sPath;
			sRootFolder = _sRootFolder;
			nLocType = 0;
		}
		override public function fLoadFromMemory32(_aData : CArray<Int32),_nSize: UInt):Void {
			aData = _aData;
			nSize = _nSize;
			nLocType = 1;
		}
		*/
		
		override public function fCpuLoad():Bool {
		
		//	Debug.fTrace("LoadRessource");
			
			if(bRcLoaded == false){
				bRcLoaded = true;
				fLoadFile();
						Debug.fTrace("Image.fOpen");
				Image.fOpen(this); //Set aImg
				Debug.fTrace("Finish TODO");
			}
			return true;
		}
		
		override public function fGpuLoad():Bool {
			
			//if(System.bHaveGpu){
				if(Context.oItf.bGpuDraw && bGpuLoaded == false){
					bGpuLoaded = true;
					if(aImg != null){
						oGpuTexId = oGpuRcImg.fLoadImg(aImg[0], nWidth, nHeight, oGpuTexLayer);
					}
					
					return true;
				}
			//}
			
			return false;
		}
		
		destructor {
			Image.fDelete(this);
		}
		
		
		
	}
}