package  { 

	import GZ.Sys.Interface.Interface;  
	import GZ.Gfx.Object;
	import GZ.Gfx.Shape;
	
	import GZ.Pipeline.Raytracer.TileView;
	

	public class Processing  {
			
		public wvar oItf : Interface;
		public var aObj : Array<Shape>;
		public var aShorted : Array<Shape>;
		public var aRemaining : Array<Shape>;
		
		public var nSort_Top :Float ;
		public var nSort_Near :Float ;
		public var nSort_Far :Float ;
		public var nTotalFac :Int ;
		public var nTotal :Int ;
		public var nFloatTotal :Float ;
		public var nRemaining :Int ;
		public var nPlacementFactor :Int = 4;
		
		
		public var bHaveRaytracing :Bool = true;
		public var oTileView :TileView;
		
		
			
		public function Processing(_oItf : Interface):Void {
			oItf = _oItf;
		}
		
		
		public function fIni():Void {
			if(bHaveRaytracing){
				oTileView = new TileView(oItf, oItf.oGzShModel);
			}
		}
		
		public function fFrameIni():Void {
			if(oTileView != null){
				oTileView.fIni();
			}
		
		
			aObj.fClear();
			

			nSort_Near = -9999999999999.0; //-Inf?
			nSort_Far = 9999999999999.0; //-Inf?
			
		//	Debug.fTrace("fBuild_Array!!");
			
		}
		
		
		public function fAdd(_oObj : Shape):Void {
			//Reject all obj otside screen
			//Screen Size:
			var _nWidth : Float = 800;
			var _nHeight : Float = 600;
			
			if(_oObj.nX_Max >= 0 && _oObj.nY_Max >= 0  && _oObj.nX_Min < _nWidth && _oObj.nY_Min <=_nHeight ){
			
				aObj.fPush(_oObj);
				if(_oObj.nZLayer < nSort_Far){
					nSort_Far = _oObj.nZLayer;
				}
				if(_oObj.nZLayer > nSort_Near){
					nSort_Near = _oObj.nZLayer;
				}
			}
		//	Debug.fTrace("fBuild_Array!!");
		}
		
		public function fBuild_Array():Void {
		
		
		
			nTotal = aObj.nSize;
			nTotalFac =  nTotal * nPlacementFactor;
			nFloatTotal = nTotalFac;
		
			Debug.fDebug("Total Obj to draw: " + aObj.nSize);
			//Debug.fTrace("nSort_Near: " + nSort_Near);
			//Debug.fTrace("nSort_Far: " + nSort_Far);

			if(oTileView != null){
				oTileView.fBuild_Array(aObj);
			}
			
			//nSort_Top = nSort_Near - nSort_Far;
			//fSortElements();
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
		
		public function fPlaceRemaining():Void {
			Debug.fDebug("nRemaining " + nRemaining);
			for(var i: Int = 0; i < nRemaining; i++){
				var _oObj : Shape = aRemaining.fUnsafe_Get(i);
				var _nApprox : Float = (_oObj.nZLayer - nSort_Far) * nFloatTotal / nSort_Top;
				var _nIndex : Int = _nApprox;
				/*
				if(aShorted.fUnsafe_Get(_nIndex) == 0){
				
				}else{
					if(){
						fMoveRight(_oObj, _nIndex);
						fMoveRight(_oObj, _nIndex);
					}else{
					
					}
				}*/
			
				/*
				if(aShorted.fUnsafe_Get(_nApprox) == 0){
					aShorted.fUnsafe_Get(_nApprox) = _oObj;
				}else{
					aRemaining.fUnsafe_Get(nRemaining) = _oObj;
					nRemaining++;
				}*/
				
			}
		}
		
		
		public function fMoveRight(_oObj : Shape, _nIndex:UInt):Void {
			while(_nIndex < nTotalFac){
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
		
		public function fSortElements():Void {
			aShorted.fClear();
			aShorted.fSetSize(nTotalFac);
			fApproximateFill();
			fPlaceRemaining();
		}
		
		
		public function fGpuDraw():Bool {
		
			////////// Temp disable Sort
			for(var i: Int = 0; i < nTotal; i++){
				var _oObj : Shape = aObj.fUnsafe_Get(i);
				_oObj.oFace.fGpuDraw();
			}
			
			if(oTileView != null){
				oTileView.fGpuDraw();
			}
			
			
			return false;
			//////////////////////////////////
		
		
			var _nTotalDraw :Int= 0;

			var i : Int =  nTotalFac;
			while(i > 0){
				i--;
				var _oObj : Shape = aShorted.fUnsafe_Get(i);
				if(_oObj != null){
					_oObj.oFace.fGpuDraw();
					_nTotalDraw++;
				}
			}
			Debug.fDebug("_nTotalDraw " + _nTotalDraw);
		}
		
		
		public function fLauch(_sFile : String, _sParam : String):Bool;

		
		
	}
}

