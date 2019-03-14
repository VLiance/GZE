
package  {

	/**
	 * @author Maeiky
	 */
	 
	 import GZ.Sys.File;
	 
	 

	public extension Resource  {
		
		public var sFile : String;
		//public var oFileHandle : File;
		
		public var aSrcMemData : CArray<UInt8>;
		public var sPath : String;
		public var sVDrive : String;
		//public var nLocType : UInt = 0;
		public var bReadOnly : Bool = true;
		
		public var bRcLoaded : Bool = false;
		public var bGpuLoaded : Bool = false;
		//public var oInterface : Interface = 0;
		
		public enum eLocation : Int {
			Unknow;
			Drive;
			Memory;
		}
		
		public var hLocation : eLocation = eLocation.Unknow;
		public var nSize :UInt;


		<cpp_class_h>
			cResource* fSet(const gzRcFolder* _oFolder, gzStr _sFile, const gzUInt8* _aSrcMemData, gzUInt _nSize){
				aSrcMemData = (gzUInt8*)_aSrcMemData;
				sFile = _sFile;
				nSize = _nSize;
				hLocation = Lib_GZ::File::Resource::eLocation::Memory;
				return this;
			}
		</cpp_class_h>
		
		
		
		public function Resource(_sPath : String, _hLocation: eLocation = eLocation.Unknow):Void {
			hLocation = _hLocation;
			//oFileHandle = new File();
			
			Debug.fTrace("AAAAAA Path string: " + _sPath);
			
			var _sMyString : String = "5:/**01234567";
			var _nTest : Int = _sMyString.fFind(":/**");
			Debug.fTrace("Find: " + _nTest );
			if(_sMyString.fFind(":/*")){
				Debug.fTrace("Pass");
			}else{
				Debug.fTrace("Fail"  );
			}
			
		//	var _aPath : Array<String> = _sPath.fSplit(":/");
			
			/*
			//var _aPath : Array<String> = _sPath.fSplit(":/"); //Notwork
			sVDrive = _aPath[0];
			sPath = _aPath[1];
			
			sPath.fNext(); //Remove first slash drive
			sPath.fNext(); //Remove first slash drive
			sPath = sPath.fSubStr();
			
			Debug.fTrace("***sVDrive Path : " + sVDrive);
			Debug.fTrace("***sVDrive Path : " + sPath);
			*/
		//	sVDrive = ""; //Temp
	
			
		}

		/*
		public function fLink(_oInterface:Interface):Void {
			 oInterface = _oInterface;
		}
		*/
		
		public function fLoadFile():Void {
			
			//if( hLocation == eLocation.Drive){
			if( hLocation == eLocation.Unknow ||  hLocation == eLocation.Drive){ //TODO check for virtual path (Embed Drive)
				//aSrcMemData = oFileHandle.fLoadFileFromVDrive(sVDrive, sPath);
				File.fLoadFileFromVDrive(this);
			}
			
		}
		
		public function fSetDynamicMemData(_aSrcMemData : CArray<UInt8>, _nSize:UIntX):Void {
			aSrcMemData = _aSrcMemData;
			nSize = _nSize;
		}
		
		public function fSetStaticMemData(_aSrcMemData : CArray<UInt8>, _nSize:UIntX):Void {
			aSrcMemData = _aSrcMemData;
			nSize = _nSize;
		}
		
		
		


	}
}
