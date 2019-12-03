
package  {

	/**
	 * @author Maeiky
	 */
	 
	 import GZ.File.File;
	 
	 

	public extension Resource  {
		
		public var sFile : String;
		//public var oFileHandle : File;
		public var oFile : File;
		
		public var aSrcMemData : CArray<UInt8>;
		public var sPath : String;
		public var sVDrive : String;
		//public var nLocType : UInt = 0;
		public var bReadOnly : Bool = true;
		
		public var bRcLoaded : Bool = false;
		public var bDynamiqueData : Bool = false;
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
			/*
			Debug.fTrace("AAAAAA Path string: " + _sPath);
			
			var _sMyString : String = "55:/**01/234:/*567";
			var _nTest : Int = _sMyString.fFind(":/**",3);
			Debug.fTrace("Find: " + _nTest );
			
			
			var _oResult : Result_Search = _sMyString.fFind(":/**");	
			
			Debug.fTrace("Val: " +  _oResult.nVal );
			
			var _aArray: Array<String> = _sMyString.fSplit("/");
			Debug.fTrace("TestArray[0] = "  + _aArray[0]  );
			Debug.fTrace("TestArray[1] = "  + _aArray[1]  );
			Debug.fTrace("TestArray[2] = "  + _aArray[2]  );
			Debug.fTrace("TestArray[3] = "  + _aArray[3]  );
				
			if(_sMyString.fFind(":/*")){
				Debug.fTrace("Pass");
			}else{
				Debug.fTrace("Fail"  );
			}
			*/
			
			if(_sPath.nSize > 0){
				oFile = new File(_sPath);
			}
			
			
			/*
			var _aPath : Array<String> = _sPath.fSplit(":/");
			
			sVDrive = _aPath[0];
			sPath = _aPath[1];
			
			Debug.fTrace("***sVDrive Path : " + sVDrive);
			Debug.fTrace("***sVDrive Path : " + sPath);
			*/
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
				//File.fLoadFileFromVDrive(this);
				oFile.fLoadFileFromVDrive(this);
			}
			
		}
		
		public function fSetDynamicMemData(_aSrcMemData : CArray<UInt8>, _nSize:UIntX):Void { //Will be auto freed 
			fFreeData();
			
			aSrcMemData = _aSrcMemData;
			nSize = _nSize;
			bDynamiqueData = true;
		}
		
		public function fSetStaticMemData(_aSrcMemData : CArray<UInt8>, _nSize:UIntX):Void { //Will not freed 
			fFreeData();
			bDynamiqueData = false;
			
			aSrcMemData = _aSrcMemData;
			nSize = _nSize;
		}
		
		
		public function fFreeData():Void {
			<cpp> 
				if(bDynamiqueData){
					GZ_fFree(aSrcMemData);
				}
			</cpp>
		}
		
		destructor{
			 fFreeData();
		}


	}
}
