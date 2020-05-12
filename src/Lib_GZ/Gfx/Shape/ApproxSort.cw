package  { 

	import GZ.Sys.Interface.Interface;  
	import GZ.Gfx.Object;
	import GZ.Gfx.Shape;

	public class ApproxSort  {
			
		public var aObj : Array<Shape>;
		public var aShorted : Array<Shape>;
		
		public var aSub : Array<ApproxSort>;
		
		
		public var nSort_Top :Float ;
		public var nSort_Near :Float ;
		public var nSort_Far :Float ;
		public var nTotalFac :Int ;
		public var nTotal :Int ;
		public var nFloatTotal :Float ;
		public var nRemaining :Int ;
		public var nPlacementFactor :Int = 2;
		
		public function fIni():Void {
			aObj.fClear();
			
			nSort_Near = -9999999999999.0; //-Inf?
			nSort_Far = 9999999999999.0; //-Inf?
		}
		
		
		public function fAdd(_oObj : Shape):Void {
		
			aObj.fPush(_oObj);
			if(_oObj.nZLayer < nSort_Far){
				nSort_Far = _oObj.nZLayer;
			}
			if(_oObj.nZLayer > nSort_Near){
				nSort_Near = _oObj.nZLayer;
			}
			
		}
		
		public function fBuild_Array():Void {
			nTotal = aObj.nSize;
			nTotalFac =  nTotal * nPlacementFactor;
			nFloatTotal = nTotalFac;
		
			Debug.fTrace("Total Obj to draw: " + aObj.nSize);
			//Debug.fTrace("nSort_Near: " + nSort_Near);
			//Debug.fTrace("nSort_Far: " + nSort_Far);

			nSort_Top = nSort_Near - nSort_Far;
		
			fSortElements();
		}
		
		
		public function fApproximateFill():Void {
			
			for(var i: Int = 0; i < nTotal; i++){
				var _oObj : Shape = aObj.fUnsafe_Get(i);
				var _nApprox : Float = (_oObj.nZLayer - nSort_Far) * nFloatTotal / nSort_Top;

				if(aShorted.fUnsafe_Get(_nApprox) == 0){
					aShorted.fUnsafe_Get(_nApprox) = _oObj;
				}else{
					aSub.fUnsafe_Get(_nApprox) = new ApproxSort();
					var _oApproxSort : ApproxSort = aSub.fUnsafe_Get(_nApprox);
					_oApproxSort.fAdd(_oObj);
				}
			}
			
			for(var i: Int = 0; i < nTotal; i++){
				if(aSub.fUnsafe_Get(i) != 0){
					var _oApproxSort : ApproxSort = aSub.fUnsafe_Get(_nApprox);
					_oApproxSort.fBuild_Array();
				}
			}
		}
		
		
		public function fSortElements():Void {
			aShorted.fClear();
			aShorted.fSetSize(nTotalFac);
			aSub.fClear();
			aSub.fSetSize(nTotalFac);
			fApproximateFill();
			//fPlaceRemaining();
		}
		
		

		
		
	}
}

