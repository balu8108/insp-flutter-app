import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
    var overlayWindow: NSWindow? // Declare overlayWindow to manage its state

    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    override func applicationDidFinishLaunching(_ notification: Notification) {
        let controller = mainFlutterWindow?.contentViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "com.example.macos/screenshot",
                                           binaryMessenger: controller.engine.binaryMessenger)

        channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "disableScreenshot" {
                self.disableScreenRecording()
                result(nil)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        super.applicationDidFinishLaunching(notification)
    }

    func disableScreenRecording() {
        // Create an overlay window to prevent screenshots and screen recording
        let screen = NSScreen.main
        let screenFrame = screen?.frame ?? NSRect.zero

        if overlayWindow == nil {
            overlayWindow = NSWindow(contentRect: screenFrame,
                                     styleMask: .borderless,
                                     backing: .buffered,
                                     defer: false)
            overlayWindow?.isOpaque = false
            overlayWindow?.level = .screenSaver
            overlayWindow?.alphaValue = 0.01 // Set almost transparent to block screenshot
            overlayWindow?.backgroundColor = NSColor.black.withAlphaComponent(0.01)
        }

        overlayWindow?.makeKeyAndOrderFront(nil) // Show the overlay window
    }
}
