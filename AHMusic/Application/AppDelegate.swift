//
//  AppDelegate.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/5/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import HockeySDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var miniPlayerView: MiniPlayerViewRoot!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        startApplication()
        
        return true
    }
    
    private func startApplication() {
        //HockeyApp
        configHockeyApp()
        
        //Apperance
        UIHelper.configurateApplicationApperance()

        //main
        let main = CategoryViewController()
        _ = CategoryModuleInitializer(viewController: main)
        
        //left
        let left = LeftMenuViewController()
        _ = LeftMenuModuleInitializer(viewController: left)

        let rootController = SlideViewController(mainViewController: main, leftMenuViewController: left)
        let nav = UINavigationController(rootViewController: rootController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    private func configHockeyApp() {
        BITHockeyManager.shared().configure(withIdentifier: kHockeyApp)
        BITHockeyManager.shared().start()
        BITHockeyManager.shared().authenticator.authenticateInstallation()
    }
}

