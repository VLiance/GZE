//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.



/////////////////////////////////////////////////////////////////////////////////////
 gzResult_Search fDataFind(const gzp_Type& _pFind, gzUIntX _nFromIndex = 0, gzUInt8 _nStride = 1 ) const {
	_nFromIndex = _nFromIndex * _nStride;
	
	//printf("%.*s", gzp_DataSize, gzp_DataArray);
	if(_pFind.gzp_Size == 0){return gzResult_Search(false, ( gzp_Size)/_nStride, (_nFromIndex)/_nStride,0);}
	gzUIntX _nTo =  gzp_Size -  (_pFind.gzp_Size - 1);
	for(gzUIntX i = _nFromIndex; i < _nTo; i++){
		if(gzp_Array[i] == _pFind.gzp_Array[0]){
			if( fSubFind(&gzp_Array[i], &_pFind.gzp_Array[0],  _pFind.gzp_Size )){
				return gzResult_Search(true, (i)/_nStride, ( _nFromIndex)/_nStride,  (i + _pFind.gzp_Size)/_nStride );
			}
		}
	}
	return gzResult_Search(false, (gzp_Size)/_nStride, (_nFromIndex)/_nStride,0);
}
	

 gzResult_Search fFind(const gzp_Type& _pFind, gzUIntX _nFromIndex = 0, gzUInt8 _nStride = 1 ) const {
	 return fDataFind( _pFind, _nFromIndex, GzS);
 }

	



