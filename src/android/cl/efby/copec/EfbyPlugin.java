/**
 */
package cl.efby.copec;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import android.util.Log;

import java.util.Date;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.PackageManager;

public class EfbyPlugin extends CordovaPlugin {
  private static final String TAG = "EfbyPlugin";

  public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    super.initialize(cordova, webView);

    Log.d(TAG, "Inicializando EfbyPlugin");
  }

  public boolean execute(String action, JSONArray arguments, final CallbackContext callbackContext)
      throws JSONException {
    try {
      if (action.equals("getVersionNumber")) {
        PackageManager packageManager = this.cordova.getActivity().getPackageManager();
        callbackContext
            .success(packageManager.getPackageInfo(this.cordova.getActivity().getPackageName(), 0).versionName);
        return true;
      } else if (action.equals("getAppName")) {
        PackageManager packageManager = this.cordova.getActivity().getPackageManager();
        ApplicationInfo app = packageManager.getApplicationInfo(this.cordova.getActivity().getPackageName(), 0);
        callbackContext.success((String) packageManager.getApplicationLabel(app));
        return true;

      } else if (action.equals("getVersionCode")) {
        PackageManager packageManager = this.cordova.getActivity().getPackageManager();
        callbackContext
            .success(packageManager.getPackageInfo(this.cordova.getActivity().getPackageName(), 0).versionCode);
        return true;
      } else if (action.equals("getInfoApp")) {
        PackageManager packageManager = this.cordova.getActivity().getPackageManager();
        ApplicationInfo app = packageManager.getApplicationInfo(this.cordova.getActivity().getPackageName(), 0);
        JSONObject json = new JSONObject();

        json.put("VersionCode",packageManager.getPackageInfo(this.cordova.getActivity().getPackageName(), 0).versionCode);
        json.put("AppName",(String) packageManager.getApplicationLabel(app));
        json.put("VersionNumber",packageManager.getPackageInfo(this.cordova.getActivity().getPackageName(), 0).versionName);
        

        callbackContext.success(json);
        return true;
      } else {
        callbackContext.success("N/A");
        return true;
      }
    } catch (Exception e) {
      callbackContext.error(e.getMessage());
      return false;
    }

  }

}
