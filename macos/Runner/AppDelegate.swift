import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
  override func applicationDidFinishLaunching(_ notification: Notification) {
    let controller = mainFlutterWindow?.contentViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example.macos/screenshot",
                                        binaryMessenger: controller.engine.binaryMessenger)

    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        if call.method == "disableScreenshot" {
            disableScreenRecording()  // Function to disable screen recording
            result(nil)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    super.applicationDidFinishLaunching(notification)
  }
}

func disableScreenRecording() {
    // Prevent screen recording and screenshots
    let screen = NSScreen.main
    let screenFrame = screen?.frame ?? NSRect.zero
    let overlayWindow = NSWindow(contentRect: screenFrame,
                                 styleMask: .borderless,
                                 backing: .buffered,
                                 defer: false)
    overlayWindow.isOpaque = false
    overlayWindow.level = .screenSaver
    overlayWindow.alphaValue = 0.01  // Almost transparent window to block screenshot
    overlayWindow.backgroundColor = NSColor.black.withAlphaComponent(0.01)
    overlayWindow.makeKeyAndOrderFront(nil)
}