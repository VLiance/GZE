//This file is a part of GZE: https://github.com/VLiance/GZE

package main;

import gz.GzActivity;
import android.content.Intent;
import android.os.Bundle;

public class MainActivity extends GzActivity{

    @Override protected void onCreate( Bundle savedInstanceState ) {
    	 super.onCreate( savedInstanceState );
    	 
    	//Method #1 GZE is interfaced with "extends GzActivity" of the current Activity
    	 
    	//Method #2 to interface GZE -> "extends Activity" and Create new GzActivity in parallel with :
    	 //CreateGzActivityInParallel();
    }
    
    public void CreateGzActivityInParallel(){
    	Intent i = new Intent(MainActivity.this, GzActivity.class);
    	startActivity(i);
    }
}


