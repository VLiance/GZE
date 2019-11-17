//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.File.RcImg;
	import GZ.File.RcImgSequence;

	<cpp_h>
		#include "Lib_GZ/3rdparty/Image/stb_rect_pack.h"
	</cpp_h>
	
	
	<cpp_class>
		stbrp_context context;
	</cpp_class>
	
	
	
	/**
	 * @author Maeiky
	 */
	public class RcAtlas extends RcImg {
	
		public var aSubImg : Array<RcImg>; 

		public function RcAtlas():Void {
			RcImg("");
		}
		
		
	
		public function fAdd(_oImg : RcImg) : Bool {
			
			aSubImg.fPush(_oImg);
			
			
		}
		
		public function fAddSequence(_oImg : RcImgSequence) : Bool {
			for(var i : Int = 0; i < _oImg.aImg.nSize; i++){
				fAdd(_oImg.aImg[i]);
			}
		}
		
		
		public function fCreate(_nWidth:Int, _nHeight:Int) : Bool {
			<cpp>
			stbrp_init_target(&context, _nWidth, _nHeight,0 , aSubImg.GnSize() );
			</cpp>
		}
		
		
		public function fLoad() : Bool {
			
		
			Debug.fPass("RcAtlas Success");
			return true;
		}
		
		
	}

	
	
}
