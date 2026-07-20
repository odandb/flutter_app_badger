import FlutterMacOS
import AppKit

public class FlutterAppBadgerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "g123k/flutter_app_badger", binaryMessenger: registrar.messenger)
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
            NSApp.dockTile.badgeLabel = String(count)
            result(nil)
        case "removeBadge":
            NSApp.dockTile.badgeLabel = nil
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
