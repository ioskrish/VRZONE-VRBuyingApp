//
//  AppDelegate.swift
//  VRZONE
//
//  Created by TryCatch Classes on 07/10/1944 Saka.
//

import UIKit
import Kingfisher
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let googleClientId = "---Copy from Google API Console---"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GIDSignIn.sharedInstance().clientID = "1017804302421-1ko02k99p017mci8tuhqvni9olv5qkup.apps.googleusercontent.com"
         GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        return true
    }
    
    func application(_ app: UIApplication,
                         open url: URL,
                         options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      
            return GIDSignIn.sharedInstance().handle(url)
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

