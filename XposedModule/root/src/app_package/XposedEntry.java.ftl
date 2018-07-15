package ${packageName};

import android.content.Context;
import android.util.Log;

import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.callbacks.XC_LoadPackage.LoadPackageParam;

import static de.robv.android.xposed.XposedHelpers.findAndHookMethod;


public class ${className} implements IXposedHookLoadPackage {
  private String packageName = "";
  private String processName = "";
  private Context applicationContext = null;

  private static final String TARGET_PACKAGE_NAME = "";
  
  public ${className}() {
    //
  }

  @Override
  public void handleLoadPackage(LoadPackageParam loadPackageParam)
      throws Throwable {

    packageName = loadPackageParam.packageName;
    processName = loadPackageParam.processName;

    if (!packageName.equals(TARGET_PACKAGE_NAME))
      return;

    findAndHookMethod("android.app.Application",
        loadPackageParam.classLoader,
        "attach",
        Context.class,
        new XC_MethodHook() {
          @Override
          protected void beforeHookedMethod(MethodHookParam param)
              throws Throwable {
            applicationContext = (Context) param.args[0];
          }

          @Override
          protected void afterHookedMethod(MethodHookParam param)
              throws Throwable {
          }
        });
  }
}
