//
//  AppDelegate.swift
//  Unspash
//
//  Created by Кирилл on 18.11.2022.
//

import UIKit
import FirebaseCore

@UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {

      var window: UIWindow?

      func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
                       [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
        return true
      }

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}
