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
    var miniPlayerView: MiniPlayerViewRoot!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        startApplication()
        
        return true
    }
    
    private func startApplication() {
        UIHelper.configurateApplicationApperance()

        //main
//        let main = TabViewController()
        let main = CategoryViewController()
        _ = CategoryModuleInitializer(viewController: main)
        
        //left
        let left = LeftMenuViewController()
        _ = LeftMenuModuleInitializer(viewController: left)

//        let rootController = SlideViewController(mainViewController: main, leftMenuViewController: left)
//        let nav = UINavigationController(rootViewController: rootController)
        
//        let vc = ParallaxViewController(items: ["A", "B", "C", "D", "E", "F", "G", "H", "K", "L"], title: "Test", imageStr: "img_ca_rock")
//        let nav = UINavigationController(rootViewController: vc)
        
//        let signIn = SignInPresenter()
//        _ = SignInModuleInitializer(presentor: signIn)
//        let nav = signIn.view as! UIViewController
//        let nav = UINavigationController(rootViewController: vc)

        let welcome = WelcomePresenter()
        _ = WelcomeModuleInitializer(presentor: welcome)
        let vc = welcome.view as! UIViewController
        let nav = UINavigationController(rootViewController: vc)
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}

