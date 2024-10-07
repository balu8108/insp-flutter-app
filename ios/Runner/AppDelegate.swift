import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
    var field = UITextField()

    private let CHANNEL = "com.example/deviceStatus"

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        // Set up the MethodChannel
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let deviceStatusChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)

        // Define the method call handler
        deviceStatusChannel.setMethodCallHandler { (call, result) in
            switch call.method {
            case "isDeviceJailbroken":
                result(self.isDeviceJailbroken())
            default:
                result(FlutterMethodNotImplemented)
            }
        }
        
        addSecuredView()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    override func applicationWillResignActive(_ application: UIApplication) {
        field.isSecureTextEntry = false
    }

    override func applicationDidBecomeActive(
      _ application: UIApplication
    ) {
        field.isSecureTextEntry = true
    }

    private func addSecuredView() {
        if (!window!.subviews.contains(field)) {
            window!.addSubview(field)
            field.centerYAnchor.constraint(equalTo: window!.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: window!.centerXAnchor).isActive = true
            window!.layer.superlayer?.addSublayer(field.layer)
            if #available(iOS 17.0, *) {
                field.layer.sublayers?.last?.addSublayer(window!.layer)
            } else {
                field.layer.sublayers?.first?.addSublayer(window!.layer)
            }
        }
    }

    // Function to check if the device is jailbroken
    private func isDeviceJailbroken() -> Bool {
        let fileManager = FileManager.default
        
        // Check for common jailbreak files
        let paths = [
            "/Applications/Cydia.app",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt"
        ]
        
        for path in paths {
            if fileManager.fileExists(atPath: path) {
                return true
            }
        }
        
        // Also check if we can write outside the app's container
        do {
            let testPath = "/private/jailbreak_test.txt"
            try "test".write(toFile: testPath, atomically: true, encoding: .utf8)
            try fileManager.removeItem(atPath: testPath)
            return true
        } catch {
            return false
        }
    }
}
