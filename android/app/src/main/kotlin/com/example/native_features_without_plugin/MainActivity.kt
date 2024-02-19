package com.example.native_features_without_plugin
import android.content.Intent
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private val channel = "settings_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

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
