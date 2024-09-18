package com.example.insp

import android.os.Bundle
import android.view.WindowManager.LayoutParams
import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Add FLAG_SECURE to prevent screenshots and screen recording
        window.addFlags(LayoutParams.FLAG_SECURE)
    }
}
