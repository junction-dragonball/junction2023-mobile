import UIKit
import Flutter
import FamilyControls

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let screenTimeChannel = FlutterMethodChannel(name: "screenTime", binaryMessenger: controller.binaryMessenger)
        
        screenTimeChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard call.method == "getScreenTimeAccess" else {
                result(FlutterMethodNotImplemented)
                return
            }
            self.requestScreenTimeAccess(result: result)
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func requestScreenTimeAccess(result: @escaping FlutterResult) {
        Task {
            do {
                try await AuthorizationCenter.shared.requestAuthorization(for: FamilyControlsMember.individual)
                result(true)
            } catch {
                result(false)
            }
        }
        
    }
}
