import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let shareDrawerChannel = FlutterMethodChannel(name: "flutter/ShareDrawerMethodChannel", binaryMessenger: controller.binaryMessenger)
    
    shareDrawerChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      if call.method == "saveToUserDefaults" {
        let dict = call.arguments as! [String: Int]
        let counter = dict["counter"]
        self?.saveToUserSuite(counter: counter!)
      }
    })
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func saveToUserSuite(counter: Int) {
    let appSuite = UserDefaults(suiteName: "group.com.ex.flutterApp101")
    print("Stored to UserDefaults using method channel")
    appSuite?.set(counter, forKey: "counter")
    let c = appSuite?.integer(forKey: "counter")
    print("getin: \(String(describing: c))")
  }
}
