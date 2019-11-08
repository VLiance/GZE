package  {


	import GZ.Wrap.Image;
	import GZ.Sys.System;
	import GZ.File.Resource;
	import GZ.File.RcImg;
	
	 import GZ.File.File;

	/**
	 * @author Maeiky
	 */

	public class RcImgSequence extends Resource {



		public var nTotal: UInt = 0;
		public var nTotalNumber: UInt = 0;
		public var aImg : CArray<RcImg>;

		
		public var aFile : Array<File>;
		

	//	public function RcImgSequence(_aImg : CArray<RcImg>, _nTotal : UInt ):Void {
		public function RcImgSequence(_sPath : String, _hLocation: eLocation = eLocation.Unknow):Void {
			Resource(_sPath);
			Debug.fTrace("*************!!Load: " + oFile.sFullPath);
			//fIsSysFileExist
				Debug.fWarning(oFile.sName);
			
			var _sNum : String = "";
			for(var i : Int = oFile.sName.nSize - 1; i >= 0; i--){
				var _nChar : UInt = oFile.sName[i];
				if(_nChar >= 48 && _nChar <= 57 ){ //It's a numbewr
					nTotalNumber++;
				}
				_sNum  += _nChar;
				//Debug.fWarning(oFile.sName[i]);
			}
			
			
			
			Debug.fWarning("nTotalNumber: " + nTotalNumber);
			//aImg = _aImg;
			//nTotal = _nTotal;
		}

/*
		override public function fCpuLoad():Bool {
			//Image.fOpen(this);
			for (var i : UInt  = 0; i < nTotal; i++) {
				//aImg[i].fCpuLoad();
				var _oImg : RcImg = aImg[i];
				_oImg.fCpuLoad();
			}
			return true;
		}

		override public function fGpuLoad():Bool {
			//if (System.bHaveGpu) {
				for (var i : UInt  = 0; i < nTotal; i++) {
					var _oImg : RcImg = aImg[i];
					_oImg.fGpuLoad();
				}
			//}
			return true;
		}

		destructor {
			//Image.fDelete(this);
		}
*/


	}
}
