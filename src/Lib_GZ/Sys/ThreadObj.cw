package  {


	import GZ.Base.Thread.Thread;
	import GZ.Base.Thread.ThreadExt;
	import GZ.Sys.Interface.Interface;
	
	public overclass ThreadObj  {
	
		public var bStarted : Bool;
		public var bCreated : Bool;

		//public static var aThreadList<Thread>;

		
		public wvar oThreadExt : ThreadExt;
		public var dCallBack : Delegate<fThreadCallBack>;
		
		public function ThreadObj(_oThreadEx : ThreadExt, _dCallBack : Delegate<fThreadCallBack>):Void{
			oThreadExt = _oThreadEx;
			dCallBack = _dCallBack;
		}
		public function fSetPriority(_nPriority : UInt):Void;	
		public function fThreadCallBack(_oThreadEx : ThreadExt):Void;
		public function fStart():Void{
			Debug.fWarning("fStart not implemented in ThreadObj");
		}
		public function fJoin():Void;
		public function fCancel():Void;
		public function fClose():Void;
		
	}
}
