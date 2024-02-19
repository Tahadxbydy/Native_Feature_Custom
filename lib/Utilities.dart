import 'package:flutter/services.dart';

class SettingsService {
  static const MethodChannel _channel = MethodChannel('settings_channel');

  static Future<void> openSettingsPage() async {
    try {
      await _channel.invokeMethod('openSettingsPage');
    } on PlatformException catch (e) {
      print("Failed to open settings page: '${e.message}'.");
    }
  }
}
