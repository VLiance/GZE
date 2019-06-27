package  { 

	
	import GZ.File.Font;
	import GZ.Sys.System;
	import GZ.File.Resource;
	import GZ.File.RcImg;
	import GZ.File.Font.CharData;


	/**
	 * @author Maeiky
	 */	

	public class RcFont extends RcImg { //extends Resource instead?
		
		use Font.uCharData;
		
	//	public var nGpuTexId : UInt32 = 0;
		//public var nDim : UInt = 0;
		public var nDefaultScale : UInt ;
		public var aFont : CArray<Int32>
		
		
		public function RcFont(_sPath : String, _nDefaultScale : Float = 12.0 ):Void {
			nDefaultScale = _nDefaultScale;
			RcImg(_sPath);
		}
		
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
		
		public function fGetCharRect(_nChar:UInt):CharData {
			//var _
			var _oCharData : CharData = new CharData(_nChar);
			 Font.fGetCharData(_oCharData);
			 return _oCharData;
		
		}	
		
		
		override public function fCpuLoad():Bool {
			if(bRcLoaded == false){
				bRcLoaded = true;
				fLoadFile();
				
				Font.fOpen(this);
			}
			return true;
		}
		/*
		override public function fGpuLoad():Bool {
			return true;
		}
		*/
		
		
		public function fGetKernAdvance( _nCh1 : Int, _nCh2 : Int):Int {

				
			
			
			return Font.fGetKernAdvance(this, _nCh1, _nCh2);
		}
		
		
		destructor {
			//Font.fDelete(this); //Bug?
		}

	}
}