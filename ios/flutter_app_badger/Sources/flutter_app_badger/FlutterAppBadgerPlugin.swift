import Flutter
import UIKit
import UserNotifications

public class FlutterAppBadgerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "g123k/flutter_app_badger", binaryMessenger: registrar.messenger())
        let instance = FlutterAppBadgerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "updateBadgeCount":
            guard let args = call.arguments as? [String: Any], let count = args["count"] as? Int else {
                result(FlutterError(code: "INVALID_ARGS", message: "Missing count argument", details: nil))
                return
            }
            if #available(iOS 16.0, *) {
                UNUserNotificationCenter.current().setBadgeCount(count) { _ in }
            } else {
                UIApplication.shared.applicationIconBadgeNumber = count
            }
            result(nil)
        case "removeBadge":
            if #available(iOS 16.0, *) {
                UNUserNotificationCenter.current().setBadgeCount(0) { _ in }
            } else {
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
