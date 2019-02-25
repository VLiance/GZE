package  {

import Unit.MainInterface;
import Unit.Test;

	import GZ.Base.Thread.ThreadExt;

	import GZ.EntryPoint;


	
	public class MainEntry extends EntryPoint {
	
		public var oTest: Test;
		
		public var oThread: ThreadExt;

	//	private var aInt1d : Array<Int, 1, 50>;
	//	private var aInt2d : Array<Int, 2>;
	

		private var qaShort : QArray<Int, 1>;
		private var dComapre : Delegate<fQueueDelegate> = fQueueDelegate;
		private var dTest : Delegate<fTestDelegate> = fTestDelegate;
		public var oInterface : MainInterface;
		
		
			

		override public function fMain():Void {
			var _oGz : GZ = new GZ();
			Debug.fTrace("Global lib " + _oGz.nTest);
	
	
		//	dTest = fTestDelegate;
			//C~ 
			oTest = new Test();
			Debug.fTrace("4444----------- ");

			Debug.fTrace(" - Test QueueArray / Delegates -");
			qaShort.fPush(70);
			qaShort.fPush(50);
			qaShort.fPush(99);
			qaShort.fPush(2);
			qaShort.fPush(17);
			qaShort.fPush(13);
			
			forEach(var _nVal : Int  in  qaShort){
				Debug.fTrace("Val : "  + _nVal );
			}
			
			
			qaShort.fShort(dComapre);
			
			forEach(var _nVal : Int  in  qaShort){
				Debug.fTrace("SortVal : "  + _nVal );
			}
			
			
						

			
			//!TODO[Create a new Windows with GZE demos]
			oThread = new MainInterface();
			
			Debug.fTrace("*******************");
			dTest(5.0,5.0);
			Debug.fTrace("*******************");
		}
		
/*
		public function fTestArray(_aTest : Array<Int, 1> ):Void {
			_aTest[6] = 666;
		}
*/
		public function fTestDelegate(_nF1: Float, _nF2: Float):Int {

			Debug.fTrace("\nfTestDelegate");
			return 33;
		}

		public function fQueueDelegate(_qT1: QElement<Int>, _qT2: QElement<Int>):Bool {
			if (_qT1 < _qT2) { 
				return true;
			}else {
				return false;
			}
		}


	}
}
