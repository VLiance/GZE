#ifndef DEFMAIN_mainMacro
#define DEFMAIN_mainMacro

//static char c_Buffer[255]; //TODO int length
//char32_t s_StringPtr; //TODO int length
//static ArrayArray* a_TempArray;

//#define IntToString(_sString, _nEntier)   sprintf( c_Buffer, "%d", _nEntier); _sString += c_Buffer;
//#define IntToString(_sString, _nEntier)  sprintf( c_Buffer, "%d", _nEntier); _sString = c_Buffer;
//#define UIntToString(_sString, _nEntier)  sprintf( c_Buffer, "%u", _nEntier); _sString += c_Buffer;

//#define m_IntToString(sStruc, _nEntier, sPrefix); c_add_Int_ToString(sStruc, _nEntier);
//#define dm_IntToString(sStruc, _nEntier, sPrefix) sPrefix ## m_iniStructure(sStruc, gzStr); intToString(sStruc, _nEntier);
//#define m_UIntToString(sStruc, _nEntier, sPrefix) add_UInt_ToString(sStruc, _nEntier);

///////////////////
//  Array macro  //
///////////////////

#define GZ_mNewStructure(sStruc, sType) sType* sStruc = (sType*)GZ_fMalloc(1, sizeof(sType))
#define GZ_mIniStructureV(sStruc, sType) sType* sStruc = (sType*)GZ_fMalloc(1, sizeof(sType)) //Same as new but automated with prefix
#define GZ_mIniStructure(sStruc, sType) sStruc = (sType*)GZ_fMalloc(1, sizeof(sType))
#define GZ_mIniStructureN(sStruc, sType) sStruc = (sType*)GZ_fCalloc(1, sizeof(sType))
#define GZ_mIniStructureNV(sStruc, sType) sType* sStruc = (sType*)GZ_fCalloc(1, sizeof(sType))

#define GZ_mArray_NewVoid(sStruc, nLength) GZ_mIniStructure(sStruc, void*); ((ArrayPtr*)sStruc)->array = (void**)GZ_calloc( nLength, sizeof(void*)); ((ArrayArray*)sStruc)->size = nLength
#define GZ_mArray_New(sStruc, nLength) GZ_mIniStructure(sStruc, ArrayPtr); sStruc->array = (ArrayPtr**)GZ_fCalloc( nLength, sizeof(void*)); sStruc->size = nLength
#define GZ_mArray_NewInt(sStruc, nLength) GZ_mIniStructure(sStruc, ArrayInt); sStruc->array = (int*)GZ_fCalloc( nLength, sizeof(int*)); sStruc->size = nLength
#define GZ_mArray_NewFunc(sStruc, nLength) GZ_mIniStructure(sStruc, ArrayFunc); sStruc->array = (CallFunc*)GZ_fCalloc( nLength, sizeof(CallFunc*)); sStruc->size = nLength


//#define GZ_mArray_NewString(sStruc, nLength) GZ_mIniStructure(sStruc, gzStr); sStruc->array = (unsigned int*)GZ_calloc( nLength, sizeof(unsigned int*)); sStruc->size = nLength

//////Définir le type des strings////////
#ifdef USE_STR32
#define GZ_mArray_NewString(sStruc, nLength, sString, sPrefix) sPrefix ## GZ_mIniStructure(sStruc, gzStr); sStruc->array = (TSTR*)XStr(U ## sString); sStruc->size = nLength
#endif
#ifdef USE_STR16
//#defineGZ_mArray_NewString(sStruc, nLength, sString, sPrefix) sPrefix ## GZ_mIniStructure(sStruc, gzStr); sStruc->array = (TSTR*)XStr(L ## sString); sStruc->size = nLength
#endif
#define GZ_mArray_NewStringE(sStruc) GZ_mIniStructure(sStruc, gzStr); sStruc->array = 0; sStruc->size = 0;  sStruc->nNbIns = 0;
#define GZ_mArray_NewStringVE(sStruc) GZ_mIniStructureV(sStruc, gzStr); sStruc->array = 0; sStruc->size = 0; sStruc->nNbIns = 0;


//#define GZ_mArray_NewStringV(sStruc, nLength, sString) GZ_mIniStructureV(sStruc, gzStr); sStruc->array = XStr(U ## sString); sStruc->size = nLength
//#define GZ_mArray_New(sStruc, nLength) GZ_mIniStructure(sStruc, ArrayArray); sStruc->array = (void**)GZ_malloc( nLength * sizeof(void*)); sStruc->size = nLength
//#define GZ_mArray_NewInt(sStruc, nLength) GZ_mIniStructure(sStruc, ArrayInt); sStruc->array = (int*)GZ_malloc( nLength * sizeof(int*)); sStruc->size = nLength

#define GZ_mArray_NewEmpty(sStruc)  GZ_mIniStructure(sStruc, ArrayPtr); sStruc->array = NULL; sStruc->size = 0
#define GZ_mArray_NewIntEmpty(sStruc) GZ_mIniStructure(sStruc, ArrayInt); sStruc->array = NULL; sStruc->size = 0
#define GZ_mArray_NewFuncEmpty(sStruc) GZ_mIniStructure(sStruc, ArrayFunc); sStruc->array = NULL; sStruc->size = 0
//#define GZ_mArray_NewStringEmpty(sStruc) GZ_mIniStructure(sStruc, gzStr); sStruc->array = NULL; sStruc->size = 0




#define GZ_mArray_GetArray(aArray, nIndex, nMaxSize, sInType, sReturnStruc) sInType *sReturnStruc; if(i < nMaxSize){ sReturnStruc = (sInType*)aArray[nIndex]; }else{ sReturnStruc = NULL;}
#define GZ_mArray_GetArrayTemp(aArray, nIndex, nMaxSize) if(i < nMaxSize){ g_sTempArray = (ArrayPtr*)aArray[nIndex]; }else{ g_sTempArray = NULL;}
#define GZ_mArray_GetArrayTempInt(aArray, nIndex, nMaxSize) if(i < nMaxSize){ g_sTempIntArray = (ArrayInt*)aArray[nIndex]; }else{ g_sTempIntArray = NULL;}


#define GZ_mArray_SetIntArray(aArray, nIndex, nMaxSize, setData) if(nIndex < nMaxSize){ setData = aArray[nIndex]; }else{ setData= NULL; }

#define GZ_mArray_ExtractArray(sArray, sInType, aReturnArray, nReturnSize) sInType **aReturnArray = (sInType**)sArray->array; unsigned int nReturnSize = sArray->size;
#define GZ_mArray_ExtractIntArray(sArray, aReturnArray, nReturnSize) int *aReturnArray = sArray->array; unsigned int nReturnSize = sArray->size



#define GZ_mArray_WriteIntArray(aArray, nIndex, setData) \
            if(nIndex > aArray->size){\
                            \
            }else{\
              aArray->array[nIndex] = setData;\
            }

#define GZ_mArray_WriteArray(aArray, nIndex, setData) \
            if(nIndex > aArray->size){\
                            \
            }else{\
              aArray->array[nIndex] = setData;\
            }


#define GZ_mArray_checkBounds(sName, aArray, nIndex, nLine) \
            if(nIndex > aArray->size){ \
                GZ_Debug::s_arrayOutBounds(XStr(U ## sName), nLine, aArray->size, nIndex); \
            }
#define GZ_mArray_checkNull(sName, aArray, nIndex, nLine) \
            if(aArray->array[nIndex] == 0){ \
                GZ_Debug::s_arrayNull(XStr(U ## sName), nLine, aArray->size, nIndex); \
            }
#define GZ_mArray_checkNullBounds(sName, aArray, nIndex, nLine) \
            if(nIndex > aArray->size){ \
                GZ_Debug::s_arrayOutBounds(XStr(U ## sName), nLine, aArray->size, nIndex); \
            }\
            if(aArray->array[nIndex] == 0){ \
                GZ_Debug::s_arrayNull(XStr(U ## sName), nLine, aArray->size, nIndex); \
            }




//////INTELLY PTR//////////
#define GZ_mIPtrCondU(_sVar, _sUnit)  if(  int(((_sUnit *)(_sVar))->nNbIns) == 0){ \
                                  tDel_ ## _sUnit(_sVar); }else{ \
                                  ((_sUnit *)(_sVar))->nNbIns--;}

#define GZ_mIPtrU(_sVar, _sUnit)  GZ_mIPtrCondU(_sVar, _sUnit) _sVar

#define GZ_mIPtrAdd(_sVar, _sType) ((_sType *)(_sVar))->nNbIns++
#define GZ_mIPtrSub(_sVar, _sType) ((_sType *)(_sVar))->nNbIns--
///////////////////////////////

/*
#define GZ_mIniDelagate(_cfDelegate, _oClass, _cfFunction, sType) GZ_mIniStructureN(_cfDelegate,_dStr##sType); \
                                                                ((_dStr##sType*)_cfDelegate)->oClass = _oClass; \
                                                                ((_dStr##sType*)_cfDelegate)->fCall = (_dFp##sType)&_cfFunction;

#define GZ_mIniDelagateDirect(_cfDelegate, _cfFunction, sType) GZ_mIniStructureN(_cfDelegate,_dStrD##sType); \
                                                                ((_dStrD##sType*)_cfDelegate)->oClass = 0; \
                                                                ((_dStrD##sType*)_cfDelegate)->fCall = (_dFpD##sType)&_cfFunction;

*/
/*
#define GZ_mIniDelagate(_cfDelegate, _oClass, _cfFunction, sType) GZ_mIniStructureN(_cfDelegate,_dStr##sType); \
                                                                ((_dStr##sType*)_cfDelegate)->oClass = this; \
                                                                ((_dStr##sType*)_cfDelegate)->fCall = (_dFp##sType)&_cfFunction;
*/


//#define GZ_mArray_checkBounds(sName, nMaxSize, nIndex, nLine)
//if(nIndex > nMaxSize){
//  GZ_Debug::s_arrayOutBounds(sName, nLine, nMaxSize, nIndex);
//}

//#define GZ_mArray_checkBounds( sName , nLine , nIndex, nMaxSize) if(nIndex < nMaxSize){ setData = aArray[nIndex]; }



//Lnx thread creation

//public var oThread: ThreadExt;  //ThreadExt is the thread use see outside the created thread
//oThread = new MainInterface(); //Created as thread

//MainInterface.lnx
//ThreadItf extend Thread, its a choosen class to be initialised before and realeas after the selected thread class

//public thread<ThreadItf> MainInterface extends Interface {
//public function MainInterface( _oThreadItf : ThreadItf):void {




//Prototype of different creation, with or without thread, New or NewThread
#define GZ_mNewThreadH() \
    void New(); \
    void Thread_Start(GZ_FuncWrapD, gzPtr _pThread); \
    gzSp<Lib_GZ::Base::Thread::cThreadExt> NewThread(Lib_GZ::Base::cClass* _parent); \

//A new thread create (threadExt), we send a callback to call when the thread start to this class
//When the thread was created, it create a initialiser (Extend as Thread) class to be created before and released after
//Then we set the current thread to the initialiser (Extend as Thread)
//Then current class was created and we send it the initialiser (Extend as Thread)
//Then with lopp indefinitly while bRun was true

#ifndef GZ_D_Monothread
	#define CallThreadEnd 	_oInitialiser->ThreadEnd();
#else
	#define CallThreadEnd  _oInitialiser->AddInst();_oTemp->AddInst();  //TODO //Call when ending manually and SubInst of these gzSP
#endif

 //TODO Delete thread mannually in monothread

#define GZ_mNewThreadCpp(_sLib, _sClass, _namespace , _class) \
gzSp<Lib_GZ::Base::Thread::cThreadExt> _sLib::_sClass::NewThread(Lib_GZ::Base::cClass* _parent){   \
    Lib_GZ::Dlg_r_void_p_gzPtr::Dlg _dTCall(&_sLib::_sClass::Thread_Start); \
    return Lib_GZ::Base::Thread::ThreadExt::New(_parent, _dTCall); \
} \
void _sLib::_sClass::Thread_Start(GZ_FuncWrapD, gzPtr _pThread){  \
	printf("\nNEWWW Thread lib: " #_sLib);\
    gzSp<_namespace::c##_class> _oInitialiser = _namespace::_class::Get( ((Lib_GZ::Base::Thread::cThreadExt*)_pThread)->thread  )->New(0);\
   printf("\n_oInitialiser %p ", _oInitialiser.get());\
   _oInitialiser->fLinkThreadExt((Lib_GZ::Base::Thread::cThreadExt*)_pThread); \
	gzSp<_sLib::c##_sClass>_oTemp(new _sLib::c##_sClass(_oInitialiser.get())); \
	_oTemp->Constructor((_namespace::c##_class*)_oInitialiser.get());   \
	_oInitialiser->fStart(_oTemp.get()); \
	printf("\nEND Thread class: " #_sClass);\
	CallThreadEnd\
}
	//_oTemp->Ini_c##_sClass((_namespace::c##_class*)_oInitialiser.get());   \
	
//Temp 0000 L172  L174

/*
void _sLib::_sClass::Thread_Start(GZ_FuncWrapD, gzPtr _pThread){  \
    _clThreadIni _oInitialiser;\
    _oInitialiser.fLinkThreadExt((cThreadExt*)_pThread); \
	gzSp<_sLib::c##_sClass>_oTemp = gzSp<_sLib::c##_sClass>(new _sLib::c##_sClass()); \
	_oTemp->Ini_c##_sClass(0, (_clThreadIni*)&_oInitialiser);   \
}
*/

#define GZ_mDlgIni(_tReturn, ...)\
        class Dlg;typedef const Dlg& DlgP;\
        typedef _tReturn(* FpM)(gzDlgWrapM* _w __VA_ARGS__);\
		typedef _tReturn(* FpD)(gzDlgWrapD* _w __VA_ARGS__);\
		typedef _tReturn(* FpP)(void* _oInst __VA_ARGS__);\
		inline  _tReturn fDlgEmptyFunction(void* _oInst __VA_ARGS__)

#define GZ_Dlg_ConstFpD \
((_dStD*)&cfDlg)->oClass = 0;\
((_dStD*)&cfDlg)->fCall = (FpD)_Func;

#define GZ_Dlg_ConstFpM \
((_dStD*)&cfDlg)->oClass = _opClass;\
((_dStM*)&cfDlg)->fCall = (FpM)_Func;


#define GZ_mDlgCall(...) (*((_dStP*)&cfDlg)->fCall)(((gzComp*)&cfDlg)->oClass __VA_ARGS__ )



#define GZ_mIComp(_Name) \
struct gzComp##_Name {void* oClass; gzPtrFunc fCall; };


#define GZ_mDlg_fIsSet \
return true;

#define GZ_mDlg_fReset \
((_dStD*)&cfDlg)->oClass = 0;\
((_dStD*)&cfDlg)->fCall = (FpD)&fDlgEmptyFunction;\


#define GZ_mDlgClass(_Compatible)\
struct _dStD{void* oClass; FpD fCall; };\
struct _dStM{void* oClass; FpM fCall; };\
struct _dStP{void* oClass; FpP fCall; };\
private:\
Lib_GZ::gzComp##_Compatible cfDlg;\
public:\
inline Dlg(){\
    ((_dStD*)&cfDlg)->oClass = 0;\
    ((_dStD*)&cfDlg)->fCall = (FpD)&fDlgEmptyFunction;\
}\
inline Dlg(Lib_GZ::gzComp##_Compatible _cfDelegate){\
    cfDlg = _cfDelegate;\
}\
inline Dlg& operator=(Lib_GZ::gzComp##_Compatible _cfDelegate){\
    cfDlg = _cfDelegate;\
    return *this;\
}\
inline Lib_GZ::gzComp##_Compatible get() const {return cfDlg;} \
inline gzBool fIsSet(){GZ_mDlg_fIsSet}\
inline Dlg(FpD _Func){GZ_Dlg_ConstFpD}\
inline Dlg(void* _opClass, FpM _Func){GZ_Dlg_ConstFpM} \
inline void fReset(){GZ_mDlg_fReset}

/*
#define GZ_mEndStaticClass(_Class) GZ_mEndStaticClassOp(_Class, Lib_GZ::cStThread)
/////////////////////////////////////
////////////// Static class /////////////
#define GZ_mEndStaticClassOp(_Class, _Op)\
	public:\
		inline cs##_Class(Lib_GZ::Base::cClass* _parent): Op(_parent){};\
		inline ~cs##_Class(){};\
};\
GZ_mStaticClassThread(_Class,_Op)
*/

/*
	Lib_GZ::uLib zpLib = NewLib();\
	}*/
    //Lib_GZ::uLib zpLib = {Lib_GZ::fSetLib(&zpLib), gzU8(#_LibName), &rLastClass }; \
//////////////////


/* Use Ugly Static initialiser
#define    GZ_mCppClass( _Class)      \
	namespace _Class{\
		Lib_GZ::uOverplace zDefault = AddClass(); \
	}
	*/
	
#define    GZ_mCppClass( _Class)      \
	namespace _Class{\
		Lib_GZ::uOverplace zDefault; \
	}	
	
//TODO zID in zDefault?

		//gzUInt zId;\


/*
#define    GZ_mCppClass(_LibNameSpace, _Class)        GZ_mCppClassExtSuite(_LibNameSpace, _Class,  0, 0)
#define GZ_mCppClassExt(_LibNameSpace, _Class, _Op)  GZ_mCppClassExtSuite(_LibNameSpace, _Class, &_Op::Create, &_Op::Adr )

#define GZ_mCppClassExtSuite(_LibNameSpace, _Class, _OpCreate, _OpAdr )\
	namespace _Class{\
		gzUInt zId;\
		Lib_GZ::uOverplace zDefault = NewClass(); \
	}
		//Lib_GZ::uOverplace zDefault = {Lib::SetClass(&zDefault), &zId, &Create,  &Create, _OpCreate, _OpAdr};\
	//}

*/
///////////////////////
  //  extern gzUInt _nId;\


#define GZ_mStaticClass(_Class)  GZ_mStaticClassThread(_Class, &_Class::Ini_Class, 0)}
#define GZ_mStaticClassOp(_Class, _Op)  GZ_mStaticClassThread(_Class, &_Class::Ini_Class, &_Op::Adr)}


//#define GZ_mStaticClassOp(_Class, _Op)  GZ_mStaticClassThread(_Class, &_Op::Create, &_Op::Adr)}

//    struct uOverplace {uOverplace* rPrec; gzUInt nId; gzPtrFuncRPAny cfOri; gzPtrFuncRPAny cfOver; gzPtrFuncRPAny cfExt;  gzPtrFuncRAny cfExtAdr; gzStr8 sName;};
 
/*
   printf("\n ------PTR_Aft: %p", _oCurrThread->st[zDefault.nId]); \
   _oCurrThread->st.fSet(zDefault.nId, (Lib_GZ::Base::csClass*)_ptr);\
	  printf("\n ------PTR_Aft: %p", _oCurrThread->st[zDefault.nId]); \
	    printf("\n ------CREATENEWCALSSS!! %p , %p , %p  , %d , %d : "#_Class, _oCurrThread, _oCurrThread->st[zDefault.nId] , _oCurrThread->st(zDefault.nId), zDefault.nId, _oCurrThread->nId); \

*/
 
#define GZ_mStaticClassThread(_Class, _pIniClass, _OpAdr)\
namespace _Class{\
	gzConst_U8(sClassName, #_Class);\
    extern Lib_GZ::uOverplace zDefault;\
    extern gzPtrFuncRPAny cfDefault;\
    extern void Ini_Class();\
    inline void* Create(void* _oCurrThread){\
		cs##_Class* _ptr = new cs##_Class((Lib_GZ::Base::Thread::cThread*)_oCurrThread);			\
		return _ptr;\
    }\
    inline void* Adr(){\
        return &zDefault;\
    }\
    inline Lib_GZ::uOverplace AddClass(){ zDefault = {Lib::SetClass(&zDefault), 0, &Create,  &Create, _pIniClass, _OpAdr, (gzDataRC* )&sClassName}; return zDefault;}\
    \
	/* TODO Check if a shared ptr is required */ \
    inline cs##_Class* Get(Lib_GZ::Base::Thread::cThread* _oCurrThread){\
        if(_oCurrThread->st(zDefault.nId) == 0){\
		cs##_Class* _ptr =   (cs##_Class*)zDefault.cfOver(_oCurrThread); \
	      _oCurrThread->st[zDefault.nId] = (cs##_Class*)_ptr; /* cfOver=Create() create new static class */ \
	}else{\
		}\
        return static_cast<cs##_Class*>( _oCurrThread->st(zDefault.nId));\
    }\
	inline gzSp<c##_Class> GetInst(Lib_GZ::Base::Thread::cThread* _oCurrThread){\
		GzAssert( Get(_oCurrThread)->zInst != 0, "Singleton must be created first, use C~: "#_Class" = new "#_Class"(...);")		\
        return  gzSCast<c##_Class>( Get(_oCurrThread)->zInst );\
    }\
	inline gzSp<c##_Class> GetInst2(Lib_GZ::Base::Thread::cThread* _oCurrThread){\
		GzAssert( _oCurrThread->st(zDefault.nId) != 0 , "Singleton must be created first, use C~: "#_Class" = new "#_Class"(...);")		\
		GzAssert( ((cs##_Class*) _oCurrThread->st(zDefault.nId))->zInst != 0 , "Singleton must be created first, use C~: "#_Class" = new "#_Class"(...);")		\
		return  gzSCast<c##_Class>( ((cs##_Class*) _oCurrThread->st(zDefault.nId))->zInst );\
    }\
	inline gzSp<Lib_GZ::Base::cClass>& SetInst(Lib_GZ::Base::Thread::cThread* _oCurrThread){\
        return  Get(_oCurrThread)->zInst;\
    }
	
	   //  return  gzSCast<c##_Class>( ((cs##_Class*) _oCurrThread->st(zDefault.nId))->zInst );\
	   
	   
	/*
		inline gzSp<c##_Class> GetInst(Lib_GZ::Base::Thread::cThread* _oCurrThread){\
		GzAssert( Get(_oCurrThread)->zInst != 0, "Singleton must be created first, use C~: "#_Class" = new "#_Class"(...);")		\
        return  gzSCast<c##_Class>( Get(_oCurrThread)->zInst );\
    }\*/
	
	// _oCurrThread->st[zDefault.nId] = (cs##_Class*)zDefault.cfOver(_oCurrThread); /* cfOver=Create() create new static class */ \
				
	/*
	    inline gzSp<cs##_Class> Get(Lib_GZ::Base::Thread::cThread* _oCurrThread){\
        if(_oCurrThread->st(zDefault.nId) == 0){\
               _oCurrThread->st[zDefault.nId] = (cs##_Class*)zDefault.cfOver(_oCurrThread);
        }
        return gzSCastSelf<cs##_Class>(_oCurrThread->st(zDefault.nId));
    }
	*/
	
	/*\
	inline void CreateSingleton(Lib_GZ::Base::Thread::cThread* _oCurrThread){\
		Get(_oCurrThread)->zInst = Get(_oCurrThread)->New(_oCurrThread); \
    }*/
	

	//  _oCurrThread->st[zDefault.nId] = gzSp<Lib_GZ::cStThread>((cs##_Class*)zDefault.cfOver(_oCurrThread) ); /* cfOver=Create() create new static class */ \
	
	//*/
	  //return gzSCastSelf<cs##_Class>( gzSp<Lib_GZ::cStThread>((cs##_Class*)zDefault.cfOver(_oCurrThread) ) ); /* create new static class */ \
   // }

		/*
        if(_oCurrThread->st(zDefault.nId) == 0){\
            if(_oCurrThread->func(zDefault.nId) != 0){\
                gzPtrFuncRPAny cfCall = *_oCurrThread->func(zDefault.nId);\
               _oCurrThread->st[zDefault.nId] = gzSp<Lib_GZ::cStThread>((cs##_Class*)cfCall(_oCurrThread) );\
            }else{\
                _oCurrThread->st[zDefault.nId] = gzSp<Lib_GZ::cStThread>((cs##_Class*)zDefault.cfOver(_oCurrThread) );\
            }\
        }\
        return gzSCastSelf<cs##_Class>((_oCurrThread->st(zDefault.nId)->get()));\
    }
	*/
	

		 //cfOver(void* _oCurrThread) == Create function
	 
	 //  inline Lib_GZ::uOverplace NewClass(){ zDefault = {0, 0, &Create,  &Create, _OpCreate, _OpAdr}; Ini_Class(); return zDefault;}\
	// inline Lib_GZ::uOverplace NewClass(){ zDefault = {Lib::SetClass(&zDefault), 0, &Create,  &Create, _OpCreate, _OpAdr}; Ini_Class(); return zDefault;}\
    
	
           //     _oCurrThread->st[_nId] = gzSp<Lib_GZ::cStThread>((cs##_Class*)cfDefault(_oCurrThread) );\


#define GZ_mOverDefault(_Over, _Class)\
namespace _Class{\
    gzPtrFuncRPAny cfDefault = (gzPtrFuncRPAny)&_Over::Create;\
}


//, gzStringize(_Class)
/*
#define GZ_mCppClass(_LibNameSpace, _Class)\
namespace _Class{\
    gzUInt zId;\
    Lib_GZ::uOverplace zDefault = {_LibNameSpace::fSetClass(&zDefault), &zId, &Create, &Create, 0, 0};\
}
#define GZ_mCppClassExt(_LibNameSpace, _Class, _Ext)\
namespace _Class{\
    gzUInt zId;\
    Lib_GZ::uOverplace zDefault = {_LibNameSpace::fSetClass(&zDefault), &zId, &Create, &Create, &_Ext::Create, &_Ext::Adr};\
}
*/

#define GZ_mCppLib(_LibName)\
GZ_mCppLibVar(_LibName)


//    struct uLib { Lib_GZ::uLib* rPrec; gzStr8 sName; uOverplace** _rLastClass; gzPtrFuncRAny dIni; };
#define GZ_mCppLibVar(_LibName)\
namespace _LibName{\
	gzConst_U8(sLibName, #_LibName);\
    Lib_GZ::uOverplace* rLastClass = 0; \
	Lib_GZ::uLib zpLib = {0};\
}


//inline void SetLibVar(){zpLib.rPrec = Lib_GZ::fSetLib(&zpLib);  zpLib.sName = sLibName; zpLib._rLastClass =  &rLastClass; } \
	//inline void SetLibVar(){Lib_GZ::uLib zpLib1 =  {Lib_GZ::fSetLib(&zpLib), sLibName, &rLastClass, 0 };  } \
	
//inline void SetLibVar(){Lib_GZ::uLib zpLib1 =  {Lib_GZ::fSetLib(&zpLib), sLibName, &rLastClass, &IniLib_##_LibName };  } \
//Lib_GZ::uLib zpLib =  {0, sLibName, &rLastClass, 0 };\


#define GZ_mCppSetLib(_LibName)\
		_LibName::zpLib.rPrec = Lib_GZ::fSetLib(&_LibName::zpLib);  _LibName::zpLib.sName = (gzDataRC*)&_LibName::sLibName; _LibName::zpLib._rLastClass =  &_LibName::rLastClass; 
		
		
//Lib_GZ::uLib zpLib =  {Lib_GZ::fSetLib(&zpLib), _LibName##::sLibName, &rLastClass, &IniLib_##_LibName }


//Lib_GZ::uLib zpLib =  {Lib_GZ::fSetLib(&zpLib), sLibName, &rLastClass, 0 };\
//Lib_GZ::uLib zpLib =  {Lib_GZ::fSetLib(&zpLib), sLibName, &rLastClass, &IniLib_##_LibName };\


//#ifndef GZ_tAutoIni
     //zero-initialization -> before dynamic -> ini order ok
	//#define GZ_mCppLib(_LibName)\
	//GZ_mCppLibVar(_LibName)

/*
#else

    #define GZ_mCppLib(_LibName)\
        GZ_mCppLibVar(_LibName)\
    extern "C" int IniLib_##_LibName();\
    static char Ini =  IniLib_##_LibName();

#endif
*/


	//inline  Lib_GZ::uLib  NewLib(){return {Lib_GZ::fSetLib(&zpLib), gzU8(#_LibName), &rLastClass };} \
    //Lib_GZ::uLib zpLib = {Lib_GZ::fSetLib(&zpLib), gzU8(#_LibName), &rLastClass }; \
//}

#define GZ_mHLib(_LibName)\
extern "C" Lib_GZ::uLib* IniLib_##_LibName();\
namespace _LibName{ \
    void fIniLib();\
    extern Lib_GZ::uLib zpLib;\
    extern Lib_GZ::uOverplace* rLastClass;\
	namespace Lib{ \
    inline  Lib_GZ::uOverplace* SetClass(Lib_GZ::uOverplace* _rClass){\
       Lib_GZ::uOverplace* rTemp =  rLastClass;\
       rLastClass = _rClass;\
       return rTemp;\
    }\
	}\
}

#ifdef GZ_tDebug
	#define GZ_mIsImplemented(_sMsg)\
		static gzBool bTraced = false;\
		if(!bTraced){\
		bTraced = true;\
		Lib_GZ::Debug::Debug::GetInst(thread)->fWarning( gzU8("Func unimplemented: ") + gzU8(_sMsg) + gzU8(" "  __FILE__ ": "  )  );\
		}
#else
	#define GZ_mIsImplemented(_sMsg)
#endif



///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////

#endif
