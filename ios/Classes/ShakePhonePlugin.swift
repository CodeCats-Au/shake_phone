import Flutter
import UIKit

public class ShakePhonePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "shake_phone", binaryMessenger: registrar.messenger())
    let instance = ShakePhonePlugin()
    ShakePhonePlugin.channel = channel
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
  
  static var channel: FlutterMethodChannel?

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
          ShakePhonePlugin.channel?.invokeMethod("onShake", arguments: nil)
        }
    }
}
