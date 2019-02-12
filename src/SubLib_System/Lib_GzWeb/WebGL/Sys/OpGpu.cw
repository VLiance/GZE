package  { 


	import GZ.Gpu.Gpu;

	<cpp>
		//#include <windows.h>
	</cpp>

	public class OpGpu overplace Gpu  {
		
		public function OpGpu():Void{
			Gpu();

			Debug.fTrace1("Gpu loaded");
		}
		
		public function fLoadImg(_aImg : CArray<Int, 1>, _nWidth : Int, _nHeight : Int):Void{
			Debug.fTrace1("Load Img");
		}
	
		
	}
}