//This file is a part of GZE: https://github.com/VLiance/GZE

package gz;

public class GzCpp {
    static {
        System.loadLibrary( "GZE" );
    }

    public static native long OnInit(int iWidth, int iHeight);
    public static native void OnResize(long _oThis, int iWidth, int iHeight);
    public static native long OnRecreate(long _oThis);
    public static native void OnFrame(long _oThis);
    public static native void OnShutdown(long _oThis);
    
    public static native void OnTouch(long _oThis, int iPointerID, float fPosX, float fPosY, int iAction );
    
    public static native void OnPause(long _oThis);
    public static native void OnResume(long _oThis);
}

