package com.buzz;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;
import android.content.Context;
import android.os.Vibrator;
import android.os.VibrationEffect;
import android.os.Build;
import android.util.Log;

@ReactModule(name = BuzzModule.NAME)
public class BuzzModule extends ReactContextBaseJavaModule {
    public static final String NAME = "Buzz";
    private Vibrator vibrator;

    public BuzzModule(ReactApplicationContext reactContext) {
        super(reactContext);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            vibrator = (Vibrator) reactContext.getSystemService(Context.VIBRATOR_SERVICE);
        }
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }

    @ReactMethod
    public void vibrateAtIntensity(double intensity) {
        if (vibrator != null) {
            if (Build.VERSION.SDK_INT >= 26) {
                int duration = (int) (100 * intensity);
                VibrationEffect vibrationEffect = VibrationEffect.createOneShot(duration, VibrationEffect.DEFAULT_AMPLITUDE);
                vibrator.vibrate(vibrationEffect);
            } else {
                vibrator.vibrate(100);
            }
        }
    }
    @ReactMethod
    public void vibrate() {
            long[] pattern = {0, 500}; 
            vibrator.vibrate(pattern, -1);
        }
}
