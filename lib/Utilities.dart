import 'dart:io';

import 'package:flutter/material.dart';
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

  static Future<void> openWifiSettings(BuildContext? context) async {
    if (Platform.isAndroid) {
      await _channel.invokeMethod('openWifiSettings');
    } else if (Platform.isIOS) {
      // Handle for iOS (show instructions)
      showWifiSettingsInstructions(context!);
    } else {
      // Do nothing or handle for other platforms
    }
  }

  static void showWifiSettingsInstructions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("OOPS!!"),
          content: Text(
              "Sorry! you cannot directly navigate to the Wi-Fi settings page programmatically due to restrictions in iOS, there are some limitations even using platform Specific code."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
