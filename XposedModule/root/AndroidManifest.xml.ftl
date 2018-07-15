<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="${packageName}">
    <application>
    <meta-data
      android:name="xposedmodule"
      android:value="true" />
    <meta-data
      android:name="xposeddescription"
      android:value="@string/xposed_description" />
    <meta-data
      android:name="xposedminversion"
      android:value="52+" />
    </application>
</manifest>
