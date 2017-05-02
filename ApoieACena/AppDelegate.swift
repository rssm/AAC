//
//  AppDelegate.swift
//  ApoieACena
//
//  Created by Felipe Montenegro on 3/29/17.
//  Copyright © 2017 Felipe Montenegro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().barTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        return true
    }
    
    
}
