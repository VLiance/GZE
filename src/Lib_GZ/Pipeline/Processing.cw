package  { 

	import GZ.Sys.Interface.Interface;  
	import GZ.Gfx.Object;
	import GZ.Gfx.Shape;

	public class Processing  {
			
		public wvar oItf : Interface;
		public var aObj : Array<Shape>;
		public var aShorted : Array<Shape>;
		public var aRemaining : Array<Shape>;
		
		public var nSort_Top :Float ;
		public var nSort_Near :Float ;
		public var nSort_Far :Float ;
		public var nTotal :Int ;
		public var nFloatTotal :Float ;
		public var nRemaining :Float ;
		
			
		public function Processing(_oItf : Interface):Void {
			oItf = _oItf;
		}
		
		public function fIni():Void {
			aObj.fClear();
			
			
			
			nSort_Near = -9999999999999.0; //-Inf?
			nSort_Far = 9999999999999.0; //-Inf?
			
		//	Debug.fTrace("fBuild_Array!!");
			
		}
		
		
		public function fAdd(_oObj : Shape):Void {
		
			aObj.fPush(_oObj);
			if(_oObj.nZLayer < nSort_Far){
				nSort_Far = _oObj.nZLayer;
			}
			if(_oObj.nZLayer > nSort_Near){
				nSort_Near = _oObj.nZLayer;
			}
			
		//	Debug.fTrace("fBuild_Array!!");
		}
		
		public function fBuild_Array():Void {
			nTotal = aObj.nSize;
			nFloatTotal = nTotal;
		
			Debug.fTrace("Total Obj to draw: " + aObj.nSize);
			//Debug.fTrace("nSort_Near: " + nSort_Near);
			//Debug.fTrace("nSort_Far: " + nSort_Far);

			nSort_Top = nSort_Near - nSort_Far;
		
			fSortElements();
		}
		
		
		public function fMoveRight(_oObj : Shape, _nIndex:UInt):Void {
			while(_nIndex < nTotal){
				_nIndex++;
				if(aShorted.fUnsafe_Get(_nIndex) == 0){
					aShorted.fUnsafe_Get(_nIndex) = _oObj;
				}else{
					var _oGet : Shape =  aShorted.fUnsafe_Get(_nIndex);
					if(_oObj.nZLayer <  _oGet.nZLayer){
						
					}
				}
			}
		}
		
		public function fApproximateFill():Void {
			aRemaining.fClear();
			aRemaining.fSetSize(nTotal);
			nRemaining = 0;
			
			for(var i: Int = 0; i < nTotal; i++){
				var _oObj : Shape = aObj.fUnsafe_Get(i);
				var _nApprox : Float = (_oObj.nZLayer - nSort_Far) * nFloatTotal / nSort_Top;

				if(aShorted.fUnsafe_Get(_nApprox) == 0){
					aShorted.fUnsafe_Get(_nApprox) = _oObj;
				}else{
					aRemaining.fUnsafe_Get(nRemaining) = _oObj;
					nRemaining++;
				}
			}
		}
		
		
		public function fSortElements():Void {
			aShorted.fClear();
			aShorted.fSetSize(nTotal);
			
			fApproximateFill();
		}
		
		
		public function fGpuDraw():Bool {
			var i : Int =  nTotal;
			while(i > 0){
				i--;
				var _oObj : Shape = aShorted.fUnsafe_Get(i);
				if(_oObj != 0){
					_oObj.oFace.fGpuDraw();
				}
			}
		}
		
		
		public function fLauch(_sFile : String, _sParam : String):Bool;

		
		
	}
}

