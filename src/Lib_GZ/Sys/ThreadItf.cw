package  { 

	import GZ.Sys.Context;
	import GZ.Base.Thread.Thread;
	import GZ.Sys.ThreadObj;

	public class ThreadItf extends Thread  {
		
		public var oWindow : Context;
		
		public function ThreadItf():Void{
		
			Debug = new Debug();
			
			/*<cpp>
				printf("\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaan");
			</cpp>*/
			Debug.fTrace("---Thread Intd--"); //Bug because debug was created after
		
		}
	}
}
