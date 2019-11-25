//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.File.RcImg;
	import GZ.File.RcImgSequence;

	<cpp_h>
		#include "Lib_GZ/3rdparty/Image/stb_rect_pack.h"
	</cpp_h>
	
	<cpp_class_h>
		stbrp_context context;
	</cpp_class_h>
	

	
	/**
	 * @author Maeiky
	 */
	public class RcAtlas extends RcImg {
	
		public var aSubImg : Array<RcImg>; 
		public const var nBorder : Int = 1; 
		
		<cpp_class_h>
		gzArray<stbrp_rect> aStbRect;
		stbrp_node* nodes;
		</cpp_class_h>
			
			
		public function RcAtlas(_nSize:Int = 0):Void {
			<cpp>
			nodes = 0;
			</cpp>
			RcImg("");
			if(_nSize != 0){
				fCreate(_nSize, _nSize);
			}
		}
		

		public function fCreate(_nWidth:Int, _nHeight:Int) : Bool {
		
			nWidth = _nWidth;
			nHeight = _nHeight;
		//	vFullSize.nX = nWidth;
		//	vFullSize.nY = nHeight;
			
	//	var _nW : Int;
	//	var _nH : Int;
			<cpp>
			if(nodes != 0){
				GZ_fFree(nodes);
				GZ_fFree(aImg);
			}
			gzUInt _nTotalNode = _nWidth*2; //2 is a random value just to be safe
			nodes = (stbrp_node*)GZ_fMalloc(_nTotalNode, sizeof(stbrp_node));
			//nodes = GZ_fSafeMalloc( _nTotalNode, stbrp_node); //TODO free
			stbrp_init_target(&context, _nWidth, _nHeight, nodes, _nTotalNode);
			
			

			gzUInt nExtWidth = _nWidth + nBorder*2;
			gzUInt nExtHeight = _nHeight + nBorder*2;

			
			///// Alloc ////////
			gzUInt _nSizeOfPtr = nExtHeight * sizeof(void*);
			gzInt32* _a1dArray = (gzInt32*)GZ_fCalloc((nExtWidth * nExtHeight) + _nSizeOfPtr, sizeof(gzInt32)); //TODO _nSizeOfPtr is too large
			gzUIntX _n2dIndex = nExtWidth * nExtHeight;
		//	aImg = (gzInt32**)&_a1dArray[_n2dIndex];
			aImg = (gzInt32**)_a1dArray + _n2dIndex;
			//aImg = (gzInt32**) GZ_fCalloc((nExtHeight)  , sizeof(gzInt32*));
		//	Debug.fTrace("nExtHeight " + nExtHeight);
			for(gzUInt i = 0; i < nExtHeight; i++){
				//aImg[i] = _a1dArray +  _nWidth * i;
				aImg[i] = &_a1dArray[i * nExtWidth]; 
			}
	
			///////////////////
			
			
		//	&p1DArray[ nExtWidth * (image_height + nBORDER)];
			
			</cpp>
			/*
			Debug.fTrace("Border: " + RcAtlas.nBorder);
			Debug.fTrace("nExtWidth: " + _nW);
			Debug.fTrace("nExtHeight: " + _nH);
			*/
		}
	
	
		public function fAdd(_oImg : RcImg) : Bool {
			_oImg.fCpuLoad();
				
			<cpp>
			stbrp_rect _rect;
			_rect.id = aStbRect.GnSize();
			_rect.w = _oImg->nWidth + nBorder*2;
			_rect.h = _oImg->nHeight + nBorder*2;
			_rect.x = 0;
			_rect.y = 0;
			
			aStbRect.fPush(_rect);
			</cpp>
			
			aSubImg.fPush(_oImg);
		}
		
		public function fAddSequence(_oImg : RcImgSequence) : Bool {
			for(var i : Int = 0; i < _oImg.aImg.nSize; i++){
				fAdd(_oImg.aImg[i]);
			}
		}
		
		public function fPack() : Bool {	
			/*
			<cpp>
			//stbrp_pack_rects(&context, (stbrp_rect*)aStbRect.m.array(), aStbRect.GnSize());
			</cpp>
			*/
			return fCpuLoad();
		}
	
		override public function fCpuLoad():Bool {
			if(bRcLoaded == false){
				bRcLoaded = true;
		
			
				<cpp>
				stbrp_pack_rects(&context, (stbrp_rect*)aStbRect.m.array(), aStbRect.GnSize());
				</cpp>
				
				for(var i : UInt = 0; i < aSubImg.nSize; i++){
					var _nX : Int;
					var _nY : Int;
					var  _bIsPack : Bool;
					<cpp>
						stbrp_rect* _rect = &aStbRect[i];
						//printf("\n _rect->x %d : %d", _rect->x, _rect->y );
						_nX = _rect->x;
						_nY = _rect->y;
						_bIsPack = _rect->was_packed;
					</cpp>
					if(_bIsPack){
						fCopy(aSubImg[i], _nX, _nY);
					}
				}
			}
		}
		
		public function fCopy(_oImg: RcImg, _nX: UInt, _nY: UInt) : Bool {
		
			//TODO don't copy border? --> done
			Debug.fTrace("COPY  :" + _nX + " :  " +  _nY);
			Debug.fTrace("_oImg.nHeight :" + _oImg.nHeight );
			Debug.fTrace("_oImg.nWidth :" + _oImg.nWidth );
			Debug.fTrace("nHeight :" + nHeight );
			Debug.fTrace("nWidth :" + nWidth );
			for(var y : UInt = 1; y < _oImg.nHeight + RcAtlas.nBorder; y++){
				//Debug.fTrace("---Y:" + RcAtlas.nBorder + _nY + y);
				for(var x : UInt = 1; x < _oImg.nWidth + RcAtlas.nBorder; x++){
			
					aImg[RcAtlas.nBorder + _nY + y][RcAtlas.nBorder + _nX + x] = _oImg.aImg[y][x];
					//aImg[RcAtlas.nBorder + _nY + y][RcAtlas.nBorder + _nX + x] = 0;
				}
			}
		}
		
		public function fLoad() : Bool {
			
			Debug.fPass("RcAtlas Success");
			return true;
		}
		
		
		public function fTransposeAll() : Void {
			for(var i : UInt = 0; i < aSubImg.nSize; i++){
				var _oImg : RcImg = aSubImg[i];
				_oImg.aImg = aImg; //TODO delete original?
			
				var _nOff_X : Int = 0;
				var _nOff_Y : Int = 0;
				<cpp>
					stbrp_rect* _rect = &aStbRect[i];
					_nOff_X = _rect->x;
					_nOff_Y = _rect->y;
				</cpp>
				_oImg.vOffset.nX = _nOff_X;
				_oImg.vOffset.nY = _nOff_Y;
				
				//_oImg.vFullSize.nX = nWidth; //TODO nW or w ?
				//_oImg.vFullSize.nY = nHeight; //TODO nH or height ?
				
				_oImg.oLinkRc = this;
				Debug.fWarning("--------SEt: " + _nOff_X );
			}
		}
		
		destructor {
			<cpp>
				if(nodes != 0){
					GZ_fFree(nodes);
					//GZ_fFree(aImg);
					GZ_fFree(aImg[0]);
					
				}
			</cpp>
		}
		
		
	}
}
