package  {


	import GZ.Wrap.Image;
	import GZ.Sys.System;
	import GZ.File.Resource;
	import GZ.File.RcImg;
	


	/**
	 * @author Maeiky
	 */

	public class RcImgSequence extends Resource {



		public var nTotal: UInt = 0;
		public var aImg : CArray<RcImg>;


	//	public function RcImgSequence(_aImg : CArray<RcImg>, _nTotal : UInt ):Void {
		public function RcImgSequence(_sPath : String, _hLocation: eLocation = eLocation.Unknow):Void {
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
