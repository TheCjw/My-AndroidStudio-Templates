package ${packageName};

import android.annotation.SuppressLint;
import android.util.Log;

import org.jetbrains.annotations.NotNull;

import timber.log.Timber;

@SuppressLint({
    "LogNotTimber"
})
public final class ${className} extends Timber.DebugTree {

  private final static String TAG = "${tagName}";

  private static final int MAX_LOG_LENGTH = 4000;

  @Override
  protected void log(int priority, String tag, @NotNull String message, Throwable t) {
    if (message.length() < MAX_LOG_LENGTH) {
      if (priority == Log.ASSERT) {
        Log.wtf(TAG, message);
      } else {
        Log.println(priority, TAG, message);
      }
      return;
    }

    // Split by line, then ensure each line can fit into Log's maximum length.
    for (int i = 0, length = message.length(); i < length; i++) {
      int newline = message.indexOf('\n', i);
      newline = newline != -1 ? newline : length;
      do {
        int end = Math.min(newline, i + MAX_LOG_LENGTH);
        String part = message.substring(i, end);
        if (priority == Log.ASSERT) {
          Log.wtf(tag, part);
        } else {
          Log.println(priority, TAG, part);
        }
        i = end;
      } while (i < newline);
    }
  }
}
