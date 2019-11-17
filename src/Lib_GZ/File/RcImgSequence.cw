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

	//	public var nTotal: UInt = 0;
		public var nTotalNumber: UInt = 0;
		public var nStartValue: UInt = 0;
		//public var aImg : CArray<RcImg>;
		public var aImg : Array<RcImg>;
		public var sFolder : String;
		public var sSeqName : String;

		
		public var aFile : Array<File>;
		

	//	public function RcImgSequence(_aImg : CArray<RcImg>, _nTotal : UInt ):Void {
		public function RcImgSequence(_sPath : String, _hLocation: eLocation = eLocation.Unknow):Void {
			Resource(_sPath);
			
			sFolder =  File.sFullRealDrive + File.sFolder + oFile.sFolder;
			
			
			Debug.fTrace("*************!!Load: " + oFile.sFullPath);
			//fIsSysFileExist
				Debug.fWarning(oFile.sName);
			
			var _sNum : String = "";
			//for(var i : Int = oFile.sName.nSize - 1; i >= 0; i--){
			for(var i : Int =0; i <=  oFile.sName.nSize; i++){
				var _nChar : UInt = oFile.sName[i];
				if(_nChar >= 48 && _nChar <= 57 ){ //It's a numbewr
					nTotalNumber++;
					_sNum  += _nChar;
				}else if(nTotalNumber > 0){
					<cpp>
					break;
					</cpp>
				}	
			}
			nStartValue = _sNum.fToUInt();
			sSeqName =  oFile.sName.fSubStr(0, nTotalNumber);
			/*
			Debug.fWarning("sSeqName: " +  sSeqName);
			Debug.fWarning("_sNum: " + _sNum);
			Debug.fWarning("nStartValue: " + nStartValue);
			Debug.fWarning("nTotalNumber: " + nTotalNumber);
			Debug.fWarning("Folder: " +  sFolder);
			*/
			var _nVal : Int = nStartValue;
			while(_nVal >= 0){
				var _sValNum : String = _nVal;
				_nVal++;
				
				var _sFullNum : String = _sValNum;
				for(var i : Int = _sValNum.nSize; i < nTotalNumber; i++){
					_sFullNum = "0" + _sFullNum;
				}
				
				var _sFullPath : String = sFolder + sSeqName + _sFullNum  + "." +  oFile.sExt;
				Debug.fWarning("FullNum: " + _sFullPath); 
				
				if(File.fIsSysFileExist(_sFullPath )){
				
					//var _oFile : File = new File(_sFullPath);
					var _oRessource : RcImg = new RcImg(_sFullPath);
					_oRessource.fCpuLoad();
					
					aImg.fPush(_oRessource);
					
					Debug.fWarning("EXIST!"); 
					//File.fLoadFileFromVDrive(_sFullPath);
				}else{
					_nVal = -1;
				}
			}
			
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
