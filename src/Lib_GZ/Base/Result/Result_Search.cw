
package  {

	/**
	 * @author Maeiky
	 */
	//import GZ.Base.Result.Result_Index;
	
	public result Result_Search extends  Result_Index {
	
		public var nFrom : UIntX;
		public var nValEnd : UIntX;
		
		
		<cpp_class_h>

			inline cResult_Search(gzBool _bValid, gzUIntX _nVal, gzUIntX _nFrom, gzUIntX _nValEnd):Lib_GZ::Base::Result::cResult_Index(_bValid, _nVal), nFrom(_nFrom),  nValEnd(_nValEnd) {};
			
		</cpp_class_h>
		
		/*
		public function Result_Search(_nIndex:Int, _nFrom: Int, _nTo:Int ):Void {
		}
		*/
		
	}
}
