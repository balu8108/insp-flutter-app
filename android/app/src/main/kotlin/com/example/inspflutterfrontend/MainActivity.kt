package com.insp

import android.os.Bundle
import android.provider.Settings
import android.view.WindowManager.LayoutParams
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.plugin.common.MethodChannel
import androidx.annotation.NonNull
import java.io.File
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterFragmentActivity() {

    // Define a method channel name (same as the one you will use on the Dart side)
    private val CHANNEL = "com.example/deviceStatus"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Add FLAG_SECURE to prevent screenshots and screen recording
        window.addFlags(LayoutParams.FLAG_SECURE)
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Set up method channel to handle communication from Flutter to native Android
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "isAdbEnabled" -> result.success(isAdbEnabled())  // Check if ADB is enabled
                "isDeviceRooted" -> result.success(isDeviceRooted())  // Check if the device is rooted
                else -> result.notImplemented()
            }
        }
    }

    // Function to check if ADB (Developer Mode) is enabled
    private fun isAdbEnabled(): Boolean {
        return Settings.Secure.getInt(
            contentResolver,
            Settings.Global.ADB_ENABLED, 0
        ) > 0
    }

    // Function to check if the device is rooted by checking common root paths
    private fun isDeviceRooted(): Boolean {
        val paths = arrayOf(
            "/system/app/Superuser.apk",
            "/system/xbin/su",
            "/system/bin/su"
        )
        for (path in paths) {
            if (File(path).exists()) return true
        }
        return false
    }
}
