

package  { 

	
	import GZ.File.Image;
	import GZ.Sys.System;
	import GZ.File.Resource;
	import GZ.Gpu.GpuObj.GpuObject;


	/**
	 * @author Maeiky
	 */	

	public class RcText extends Resource {	
	
		public var nLine : UInt = 0;
		public var aText : CArray<Int32>
		
		public var sText : String = "TEsting";
		
		public var aLines : Array<String>;
		
		
		public function RcText(_sPath : String ):Void {
	
			Resource(_sPath);
			
			// hLocation : eLocation = eLocation.Drive;
		}
		
		
		
		

		override public function fCpuLoad():Bool {
		
			Debug.fTrace("LoadRessource");
			
			if(bRcLoaded == false){
				bRcLoaded = true;
				fLoadFile();
				
				fLoadLines();
				//Image.fOpen(this);
				Debug.fTrace("Finish loading text file ");
			}
			return true;
		}
		
		
		
		public function fLoadLines():Void {
			Debug.fTrace("Load lines ");
			//sText = aSrcMemData;//Todo optimise
			sText = aSrcMemData.fToStr(nSize);
			aLines = sText.fSplit("\n");
			
			/*
			for(var i : Int = 0; i < aLines.nSize; i++){
				Debug.fTrace("Lines: " + aLines[i]);
				var _sLine : String =   aLines[i];
				//Debug.fTrace("Size: " + aLines[i].nSize);
				Debug.fTrace("Size: " + _sLine.nSize);
			}*/
			
		}
		
		
		
		
		
		override public function fGpuLoad():Bool {
		/*
			if(bGpuLoaded == false){
				bGpuLoaded = true;
				nGpuTexId = GpuObject.fLoadImg(aImg[0], nWidth, nHeight);
			}
		*/
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

		}
		

	}
}