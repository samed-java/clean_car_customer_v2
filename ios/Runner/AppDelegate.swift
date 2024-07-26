import UIKit
import Flutter
//import FBSDKSettings
//import FBSDKCoreKit
// import Firebase


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//      FBAdSettings.setAdvertiserTrackingEnabled(true)
//      Settings.shared.isAdvertiserTrackingEnabled = true
//     FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
