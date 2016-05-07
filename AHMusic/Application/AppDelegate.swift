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
    var rootController: SlideViewController!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        startApplication()
        
        return true
    }
    
    private func startApplication() {
        UIHelper.configurateApplicationApperance()

        //main
        let category = CategoryPresenter()
        _ = CategoryModuleInitializer(presentor: category)
        let main = category.view as! UIViewController
        
        //left
        let leftMenu = LeftMenuPresenter()
        _ = LeftMenuModuleInitializer(presentor: leftMenu)
        let left = leftMenu.view as! UIViewController

        rootController = SlideViewController(mainViewController: main, leftMenuViewController: left)
        _ = LandingModuleInitializer(controller: rootController)
        let nav = UINavigationController(rootViewController: rootController)
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}

