//
//  AppDelegate.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/5/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootPresenter: LandingPresenter!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        startApplication()
        
        return true
    }
    
    private func startApplication() {
        
        rootPresenter = LandingPresenter()
        _ = LandingModuleInitializer(presentor: rootPresenter)
        let vc = rootPresenter.view as! UIViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.setNavigationBarHidden(true, animated: true)
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}

