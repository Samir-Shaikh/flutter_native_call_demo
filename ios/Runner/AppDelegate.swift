import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let nativeChannel = FlutterMethodChannel(name: "MyNativeChannel",
                                                  binaryMessenger: controller.binaryMessenger)
        
        nativeChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            
            // Note: this method is invoked on the UI thread.
            guard call.method == "getData" else {
                result(FlutterMethodNotImplemented)
                return
            }
            //result(self?.getData())
            self?.showAlert(controller: controller)
            return
        })
        
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
//    func getData() -> String{
//
//        return "Message from iOS"
//    }
    
    func showAlert(controller:FlutterViewController){
        
        let alert = UIAlertController(title: "Alert", message: "Native iOS Alert", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
