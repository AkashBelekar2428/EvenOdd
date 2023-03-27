//
//  AppDelegate.swift
//  EvenOddProject
//
//  Created by Akash Belekar on 14/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = NumberViewController.init()
        self.window?.makeKeyAndVisible()
        return true
    }


}

