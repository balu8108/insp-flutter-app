import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    // private func restrictScreenRecording() {
    //     guard let window = mainFlutterWindow else { return }
    //     window.level = NSWindow.Level(CGShieldingWindowLevel())
    //     window.sharingType = .none
    // }

    override func applicationDidFinishLaunching(_ aNotification: Notification) {
        let controller: FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
        let screenshotBlockerChannel = FlutterMethodChannel(name: "screenshot_blocker", binaryMessenger: controller.engine.binaryMessenger)

        screenshotBlockerChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "disableScreenshots" {
                self.disableScreenshots(result: result)
                // self.restrictScreenRecording()
            } else if call.method == "enableScreenshots" {
                self.enableScreenshots(result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        super.applicationDidFinishLaunching(aNotification)
    }
    
     // Disable Screenshots Logic
    private func disableScreenshots(result: FlutterResult) {
        if let window = mainFlutterWindow {
        // Setting the security level for the window
        window.sharingType = .none  // Disable window sharing (prevents some forms of screen capture)
        result(true)
        } else {
        result(FlutterError(code: "UNAVAILABLE", message: "Window not available", details: nil))
        }
    }

    // Enable Screenshots Logic (restore default behavior)
    private func enableScreenshots(result: FlutterResult) {
        if let window = mainFlutterWindow {
        // Restore window sharing behavior
        window.sharingType = .readWrite
        result(true)
        } else {
        result(FlutterError(code: "UNAVAILABLE", message: "Window not available", details: nil))
        }
    }
}
