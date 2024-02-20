import 'dart:io';

import 'package:flutter/material.dart';
import 'package:native_features_without_plugin/Utilities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  DeviceLockingServices.lockDevice();
                },
                child: Text('Turn Phone off')),
            ElevatedButton(
                onPressed: () {
                  SettingsService.openSettingsPage();
                },
                child: Text('Open Settings page')),
            ElevatedButton(
                onPressed: () {
                  SettingsService.openWifiSettings(
                      Platform.isIOS ? context : null);
                },
                child: Text('Open wifi settings'))
          ],
        ),
      ),
    );
  }
}
