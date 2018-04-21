package  { 

	import GZ.Sys.Context;
	import GZ.Thread;
	import GZ.Sys.ThreadObj;

	public extension ThreadItf extends Thread  {
		
		public var oWindow : Context;
		
		public function ThreadItf():Void{
			//Debug.fTrace1("---Thread Intd--"); Bug because debug was created after
		}
	}
}
