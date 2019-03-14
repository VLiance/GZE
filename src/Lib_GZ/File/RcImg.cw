

package  { 

	
	import GZ.File.Image;
	import GZ.Sys.System;
	import GZ.File.Resource;
	import GZ.Gpu.GpuObj.GpuObject;


	/**
	 * @author Maeiky
	 */	

	//public atomic RcImg extends Resource {
	public class RcImg extends Resource {	
	
		public var nGpuTexId : UInt32 = 0;
		public var nWidth : UInt = 0;
		public var nHeight : UInt = 0;
		public var aImg : CArray<Int32, 2>
		
		public function RcImg(_sPath : String ):Void {
	
			Resource(_sPath);
			
			// hLocation : eLocation = eLocation.Drive;
			 
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
		
		
			Debug.fTrace("LoadRessource");
			/*
			if(bRcLoaded == false){
				bRcLoaded = true;
				fLoadFile();
				
				Image.fOpen(this);
				Debug.fTrace("Finish");
			}*/
			return true;
		}
		
		override public function fGpuLoad():Bool {
			/*
			if(System.bHaveGpu){
				if(bGpuLoaded == false){
					bGpuLoaded = true;
					nGpuTexId = GpuObject.fLoadImg(aImg[0], nWidth, nHeight);
				}
			}
			*/
			return true;
		}
		
		destructor {
			Image.fDelete(this);
		}
		
		
		
	}
}