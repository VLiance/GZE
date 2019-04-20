//This file is part of "GZE - GroundZero Engine"

//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

//Though not required by the license agreement, please consider the following will be greatly appreciated:
//- We would like to hear about projects where GZE is used.
//- Include an attribution statement somewhere in your project.
//- If you want to see GZE evolve please help us with a donation.


 gzUIntX GnSize() const {
	 return gzp_Size / GzS;
}



	
/////////////////////////////////////////////////////////////////////////////////////
 gzResult_Search fDataFind(const gzp_Type& _pFind, gzUIntX _nFromIndex = 0) const {
	_nFromIndex = _nFromIndex * GzS;
	
	//printf("%.*s", gzp_DataSize, gzp_DataArray);
	if(_pFind.gzp_Size == 0 || gzp_Size < _pFind.gzp_Size){return gzResult_Search(false, ( gzp_Size)/GzS, GZ_fMin(_nFromIndex,gzp_Size)/GzS,0);}
	
	gzUIntX _nTo =  gzp_Size -  (_pFind.gzp_Size - 1);
	for(gzUIntX i = _nFromIndex; i < _nTo; i++){
		if(gzp_Array[i] == _pFind.gzp_Array[0]){
			if( fSubFind(&gzp_Array[i], &_pFind.gzp_Array[0],  _pFind.gzp_Size )){
				return gzResult_Search(true, (i)/GzS, ( _nFromIndex)/GzS,  (i + _pFind.gzp_Size)/GzS );
			}
		}
	}
	return gzResult_Search(false, (gzp_Size)/GzS, GZ_fMin(_nFromIndex,gzp_Size)/GzS,0);
}

gzResult_Search fDataRevFind(const gzp_Type& _pFind, gzUIntX _nFromIndex = ((gzUIntX)-1)/GzS ) const {
	_nFromIndex = _nFromIndex * GzS;
	if(_nFromIndex > gzp_Size-_pFind.gzp_Size){_nFromIndex = gzp_Size-_pFind.gzp_Size;}
	if(_pFind.gzp_Size == 0){return gzResult_Search(false, ( gzp_Size)/GzS, (_nFromIndex)/GzS,0);}
		
		
	gzUIntX i = _nFromIndex;
	do{
		if(gzp_Array[i] == _pFind.gzp_Array[0]){
			if( fSubFind(&gzp_Array[i], &_pFind.gzp_Array[0],  _pFind.gzp_Size )){
				return gzResult_Search(true, (i)/GzS, ( _nFromIndex)/GzS,  (i + _pFind.gzp_Size)/GzS );
			}
		}
		i--;
	}while(i > 0);
	
	return gzResult_Search(false, (gzp_Size)/GzS, (_nFromIndex)/GzS,0);
}

 gzResult_Search fFind(const gzp_Type& _pFind, gzUIntX _nFromIndex = 0) const {
	 return fDataFind( _pFind, _nFromIndex);
 }
 
  gzResult_Search fRevFind(const gzp_Type& _pFind, gzUIntX _nFromIndex = ((gzUIntX)-1)/GzS  ) const {
	 return fDataRevFind( _pFind, _nFromIndex);
 }

 
  inline gzBool operator==(const gzp_Type& _oOther) const {
  	//	gzUIntX _nTO = GZ_fMax(gzp_Size,_oOther.gzp_Size);
		if(gzp_Size != _oOther.gzp_Size){
			return false;
		}
		for(gzUIntX i = 0; i < gzp_Size; i++){
			if(gzp_Array[i] != _oOther.gzp_Array[i]){
				return false;
			}
		}
		return true;
   }
	

/*
	gzp_DataType& operator=(const gzp_DataType& _oOther) {
		
	
		fAssign(_oOther.gzp_Data);
		gzp_Additional_fAssignType
	   return *gzDtThis;
	}
*/
