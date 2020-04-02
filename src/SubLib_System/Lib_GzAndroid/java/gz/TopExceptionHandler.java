//This file is a part of GZE: https://github.com/VLiance/GZE

package gz;
import android.app.Activity;
import java.util.logging.Logger;

public class TopExceptionHandler implements Thread.UncaughtExceptionHandler {
	
	public final static Logger LOGGER = Logger.getLogger(TopExceptionHandler.class.getName());
    private Thread.UncaughtExceptionHandler defaultUEH;
    private Activity app = null;

	
    public TopExceptionHandler(Activity app) {
        this.defaultUEH = Thread.getDefaultUncaughtExceptionHandler();
        this.app = app;
    }

    public void uncaughtException(Thread t, Throwable e) {
		
		
			LOGGER.severe("ERRROR ");
			
			
        StackTraceElement[] arr = e.getStackTrace();
        String report = e.toString()+"\n\n";

	//	LOGGER.setLevel(Level.SEVERE);
		
        report += "--------- Stack trace ---------\n\n";
        for (int i=0; i<arr.length; i++) {
            report += "    "+arr[i].toString()+"\n";
        }
        report += "-------------------------------\n\n";

        // If the exception was thrown in a background thread inside
        // AsyncTask, then the actual exception can be found with getCause

        report += "--------- Cause ---------\n\n";
        Throwable cause = e.getCause();
        if(cause != null) {
            report += cause.toString() + "\n\n";
            arr = cause.getStackTrace();
            for (int i=0; i<arr.length; i++) {
                report += "    "+arr[i].toString()+"\n";
            }
        }
        report += "-------------------------------\n\n";
		
		LOGGER.severe(report);
		/*
        try {
            FileOutputStream trace = app.openFileOutput("stack.trace", 
                                                        Context.MODE_PRIVATE);
            trace.write(report.getBytes());
            trace.close();
        } catch(IOException ioe) {
        // ...
        }*/

        defaultUEH.uncaughtException(t, e);
    }
}