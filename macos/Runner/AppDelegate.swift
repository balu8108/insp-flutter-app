import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    override func applicationDidFinishLaunching(_ notification: Notification) {
        super.applicationDidFinishLaunching(notification)
        
        let controller = mainFlutterWindow?.contentViewController as! FlutterViewController
        let channel = FlutterMethodChannel(
            name: "com.example.macos/screenshot",
            binaryMessenger: controller.engine.binaryMessenger
        )
        
        channel.setMethodCallHandler { [weak self] (call, result) in
            switch call.method {
            case "disableScreenshot":
                self?.disableScreenshot(result: result)
            case "enableScreenshot":
                self?.enableScreenshot(result: result)
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }
    
    private func disableScreenshot(result: @escaping FlutterResult) {
        guard let mainWindow = NSApplication.shared.mainWindow else {
            result(FlutterError(code: "NO_WINDOW", message: "Main window not found", details: nil))
            return
        }
        
        mainWindow.sharingType = .none
        result(nil)
    }
    
    private func enableScreenshot(result: @escaping FlutterResult) {
        guard let mainWindow = NSApplication.shared.mainWindow else {
            result(FlutterError(code: "NO_WINDOW", message: "Main window not found", details: nil))
            return
        }
        
        mainWindow.sharingType = .readWrite
        result(nil)
    }
}
