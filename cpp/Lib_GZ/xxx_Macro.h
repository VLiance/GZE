
#define gzPStr _gzStr8

#define gzPData(_type) void*  //TODOOOOO

/*
#ifdef GZ_tDebug
	#define GZ_mIsImplemented(_sMsg)\
		static gzBool bTraced = false;\
		if(!bTraced){\
		bTraced = true;\
		Lib_GZ::Sys::Debug::Get(thread)->fWarning( gzU8("Func unimplemented: ") + gzU8(_sMsg));\
		}
#else*/
	#define GZ_mIsImplemented(_sMsg)
//#endif



/////Create a class with unique ID and set overplacable function
#define    GZ_mCppClass( _Class)        GZ_mCppClassExtSuite( _Class,  0, 0)
#define GZ_mCppClassExt( _Class, _Op)  GZ_mCppClassExtSuite( _Class, &_Op::Create, &_Op::Adr )

#define GZ_mCppClassExtSuite( _Class, _OpCreate, _OpAdr )\
namespace _Class{\
		Lib_GZ::uOverplace zDefault = {Lib::SetClass(&zDefault), Lib_GZ::Lib::nClass++, &Create,  &Create, _OpCreate, _OpAdr, gzData8(#_Class) };\
}
//gzUInt zId;\
///////////////////////////////////////////////////////////////////////////////////


	
	






#define gzU8 gzU8

//#define GZ_mStaticClass(a) 

#define GZ_mStaticClass(_Class)  GZ_mStaticClassThreaded(_Class,  0, 0)}
#define GZ_mStaticClassOp(_Class, _Op)  GZ_mStaticClassThreaded(_Class, &_Op::Create, &_Op::Adr)}



#define GZ_mStaticClassThreaded(_Class, _OpCreate, _OpAdr)\
namespace _Class{\
 inline cs##_Class* Get(Lib_GZ::cThread* _oCurrThread){\
	  return (cs##_Class*)oMainOGL;\
}\
inline void* Create(void* _oCurrThread){\
	return new cs##_Class((Lib_GZ::cClass*)_oCurrThread);\
}
/*
inline void* Adr(){return &zDefault;}\
inline Lib_GZ::uOverplace NewClass(){ zDefault = {Lib::SetClass(&zDefault), 0, &Create,  &Create, _OpCreate, _OpAdr}; Ini_Class(); return zDefault;} //Manual ini
 */
  
//Create() is a overplacable function to create higher level object



/*
#define GZ_mStaticClassThread(_Class, _OpCreate, _OpAdr)\
namespace _Class{\
    extern Lib_GZ::uOverplace zDefault;\
    extern gzPtrFuncRPAny cfDefault;\
    extern void Ini_Class();\
    inline void* Create(void* _oCurrThread){\
        return new cs##_Class((Lib_GZ::cThread*)_oCurrThread);\
    }\
    inline void* Adr(){\
        return &zDefault;\
    }\
    inline Lib_GZ::uOverplace NewClass(){ zDefault = {Lib::SetClass(&zDefault), 0, &Create,  &Create, _OpCreate, _OpAdr}; Ini_Class(); return zDefault;}\
    \
    inline gzSp<cs##_Class> Get(Lib_GZ::cThread* _oCurrThread){\
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






#define GZ_mHLib(_LibName)\
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

//////////////////////////////////////////////////////////
//#ifndef GZ_tAutoIni
     //zero-initialization -> before dynamic -> ini order ok
	#define GZ_mCppLib(_LibName)\
	GZ_mCppLibVar(_LibName)
/*
#else
    #define GZ_mCppLib(_LibName)\
        GZ_mCppLibVar(_LibName)\
    extern "C" int IniLib_##_LibName();\
    static char Ini =  IniLib_##_LibName();
#endif
*/
#define GZ_mCppLibVar(_LibName)\
namespace _LibName{\
    Lib_GZ::uOverplace* rLastClass = 0; \
    Lib_GZ::uLib zpLib =  {Lib_GZ::fSetLib(&zpLib), gzData8(#_LibName), &rLastClass, &IniLib_##_LibName };\
}
//////////////////////////////////////////////////////////

/*
#define GZ_mStaticClass(_Class)  GZ_mStaticClassThread(_Class,  0, 0)}
#define GZ_mStaticClassOp(_Class, _Op)  GZ_mStaticClassThread(_Class, &_Op::Create, &_Op::Adr)}

#define GZ_mStaticClassThread(_Class, _OpCreate, _OpAdr)\
namespace _Class{\
    extern Lib_GZ::uOverplace zDefault;\
    extern gzPtrFuncRPAny cfDefault;\
    extern void Ini_Class();\
    inline void* Create(void* _oCurrThread){\
        return new cs##_Class((Lib_GZ::cThread*)_oCurrThread);\
    }\
    inline void* Adr(){\
        return &zDefault;\
    }\
    inline Lib_GZ::uOverplace NewClass(){ zDefault = {Lib::SetClass(&zDefault), 0, &Create,  &Create, _OpCreate, _OpAdr}; Ini_Class(); return zDefault;}\
    \
    inline gzSp<cs##_Class> Get(Lib_GZ::cThread* _oCurrThread){\
	  return gzSCastSelf<cs##_Class>( gzSp<Lib_GZ::cStThread>((cs##_Class*)zDefault.cfOver(_oCurrThread) ));\
    }*/
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
