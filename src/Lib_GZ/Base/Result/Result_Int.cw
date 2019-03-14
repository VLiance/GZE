
package  {

	/**
	 * @author Maeiky
	 */

	public result Result_Int  {
	
		public var nVal : IntX = -1;
		
		<cpp_class_h>

			inline cResult_Int(gzUInt _nVal):cResult(true), nVal(_nVal) {};
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
		
		
		public function Result_Int():Void {
			
			
		}
	}
}
