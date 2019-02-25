package  {

	import GZ.EntryPoint;
	import Demo.Test;

	<cpp>
		#include <iostream>
		using namespace std;
	</cpp>
	
	public class MainEntry extends EntryPoint {
		
		public var sTest : String;
		public var sTest3 : String;
		
		public var oTest : Test;
		
		public function fTestStr(_sTest:String):Void{
				Debug.fTrace("TESTSET:" + sTest);
		}
		
		
		
		override public function fMain():Void {

			oTest = new Test();
			oTest.sName =  "TestClass";
			sTest = "Teest";
		
			Debug.fTrace("C~: Hello, World!" + sTest);
			
			fTestStr("aaaa");
					sTest3 = "TEst2" + oTest.sName ;
					sTest = sTest3;
					
					
			Debug.fTrace("#: Hello, World!" + oTest.sName );
			Debug.fTrace("1: Hello, World!" + sTest);
			
			<cpp>
				cout << endl << "Cpp: Hello, World!" << endl;
			</cpp>
			
		}
	}
}
