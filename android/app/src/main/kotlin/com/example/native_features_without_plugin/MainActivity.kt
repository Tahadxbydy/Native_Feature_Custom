package com.example.native_features_without_plugin

import android.app.admin.DevicePolicyManager
import android.content.ComponentName


import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.app.admin.DeviceAdminReceiver
import android.content.Context
import android.content.Intent
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private val channel = "settings_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.plugins.add(DeviceLockPlugin())

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            if (call.method == "openSettingsPage") {
                openSettingsPage()
                result.success(null)
            } else if (call.method == "openWifiSettings"){
                openWifiSettings()
                result.success(null)
            }else {
                result.notImplemented()
            }
        }
    }

    private fun openSettingsPage() {
        val intent = Intent(Settings.ACTION_SETTINGS)
        startActivity(intent)
    }
    private fun openWifiSettings() {
   val  intent = Intent(Settings.ACTION_WIFI_SETTINGS);
    startActivity(intent);
    }

}

 class DeviceAdminReceiver : DeviceAdminReceiver() {
    override fun onEnabled(context: Context, intent: Intent) {
        super.onEnabled(context, intent)
    }

    override fun onDisabled(context: Context, intent: Intent) {
        super.onDisabled(context, intent)
    }
}





