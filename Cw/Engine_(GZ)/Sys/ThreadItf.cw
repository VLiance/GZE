package  { 

	import GZ.Sys.Context;
	import GZ.Thread;
	import GZ.Sys.ThreadObj;

	public extension ThreadItf extends Thread  {
		
		public var oWindow : Context;
		
		public function ThreadItf():Void{
			<cpp>
				printf("\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaan");
			</cpp>
				Debug.fTrace("---Thread Intd--"); //Bug because debug was created after
		
		}
	}
}
