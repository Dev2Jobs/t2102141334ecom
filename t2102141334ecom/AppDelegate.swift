//
//  AppDelegate.swift
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase


//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var Login1View: Login1View!
//    var baseView: BaseView!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        ZmFunc().dlog("AppDelegate - UIApplication.LaunchOptionsKey")
// [START default_firestore]
        FirebaseApp.configure()
//        let db = Firestore.firestore()
// [END default_firestore]
//        print(db) // silence warning

        window = UIWindow(frame: UIScreen.main.bounds)
        
//        baseView = BaseView(nibName: "BaseView", bundle: nil)
//        let navController = NavigationController(rootViewController: baseView)
        
        Login1View = t2102141334ecom.Login1View(nibName: "Login1View", bundle: nil)
        let navController = NavigationController(rootViewController: Login1View)
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        
        ZmFunc().dlog("AppDelegate - UIApplication.LaunchOptionsKey - 22")
        
        return true
    }
//=================================
    func applicationWillResignActive(_ application: UIApplication) {
        ZmFunc().dlog("AppDelegate - applicationWillResignActive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        ZmFunc().dlog("AppDelegate - applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        ZmFunc().dlog("AppDelegate - applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        ZmFunc().dlog("AppDelegate - applicationDidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        ZmFunc().dlog("AppDelegate - applicationWillTerminate")
    }
//=================================
    // MARK: UISceneSession Lifecycle
/*
    @available (iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available (iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
*/
}

