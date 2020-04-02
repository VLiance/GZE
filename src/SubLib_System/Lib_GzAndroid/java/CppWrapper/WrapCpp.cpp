//This file is a part of GZE: https://github.com/VLiance/GZE

#include "WrapCpp.h"

extern "C" {

static Application* s_pApplication = 0;

JNIEXPORT jlong JNICALL Java_gz_GzCpp_OnInit( JNIEnv* env, jobject obj,  jint _nWidth, jint _nHeight ){

	if(!s_pApplication){
		s_pApplication = new Application(_nWidth, _nHeight);
		s_pApplication->OnContextCreated();
	}

	return (jlong)(s_pApplication);
}

JNIEXPORT jlong JNICALL Java_gz_GzCpp_OnRecreate( JNIEnv* env, jobject obj, jlong  _oThis ){
	if (_oThis ){
		((Application *)_oThis)->OnContextCreated();
	}
	return 0;
}

JNIEXPORT void JNICALL Java_gz_GzCpp_OnShutdown( JNIEnv* env, jobject obj, jlong  _oThis ){
	if (_oThis ){
		LOGV( "DESTROY");
		delete (Application *)_oThis;
	}
}

JNIEXPORT void JNICALL Java_gz_GzCpp_OnResize( JNIEnv* env, jobject obj,  jlong  _oThis, jint _nWidth, jint _nHeight ){
	if (_oThis ){
		((Application *)_oThis)->OnWindowResize(_nWidth, _nHeight );
	}
}

JNIEXPORT void JNICALL Java_gz_GzCpp_OnFrame( JNIEnv* env, jobject obj, jlong  _oThis  ){
	if (_oThis ){
		((Application *)_oThis)->Step();
	}
}


JNIEXPORT void JNICALL Java_gz_GzCpp_OnTouch( JNIEnv* env, jobject obj, jlong  _oThis, int _nPointerID, float _nPosX, float _nPosY, int _nAction ){
	if (_oThis ){
		((Application *)_oThis)->OnTouch( _nPointerID, _nPosX, _nPosY, _nAction );
	}
}

JNIEXPORT void JNICALL Java_gz_GzCpp_OnPause( JNIEnv* env, jobject obj, jlong  _oThis ){
	if (_oThis ){
		((Application *)_oThis)->OnPause();
	}
}

JNIEXPORT void JNICALL Java_gz_GzCpp_OnResume( JNIEnv* env, jobject obj, jlong  _oThis ){
	if (_oThis ){
		((Application *)_oThis)->OnResume();
	}
}

};
