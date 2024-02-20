// AppDelegate.swift
import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let settingsChannel = FlutterMethodChannel(name: "settings_channel", binaryMessenger: controller.binaryMessenger)
        settingsChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard call.method == "openSettingsPage" else {
                result(FlutterMethodNotImplemented)
                return
            }
            self?.openSettingsPage()
            result(nil)
        })
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func openSettingsPage() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}



class ViewController: UIViewController {

    @IBAction func lockDevice(_ sender: Any) {
        let alertController = UIAlertController(title: "Guided Access", message: "Please enable Guided Access in Settings", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

