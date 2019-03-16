
package  {

	/**
	 * @author Maeiky
	 */

	public result Result_Index  {
	
		public var nVal : IntX = -1;
		
		<cpp_class_h>

			inline cResult_Index(gzBool _bValid, gzUInt _nVal):cResult(_bValid), nVal(_nVal) {};
			inline cResult_Index(gzUInt _nVal):cResult(true), nVal(_nVal) {};
			inline operator gzIntX(){
				if(bValid == false){
					return -1;
				}
				return nVal;
		    }
			
			inline operator gzUIntX(){
				if(bValid == false){
					return 0;
				}
				return nVal;
		    }
		</cpp_class_h>
		
		
		public function Result_Index():Void {
			
			
		}
	}
}
