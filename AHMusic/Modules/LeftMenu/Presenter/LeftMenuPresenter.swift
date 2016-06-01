//
//  LeftMenuPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class LeftMenuPresenter -
class LeftMenuPresenter {

    weak var view: LeftMenuViewInput!
    var interactor: LeftMenuInteractorInput!
}

//MARK: - extension for LeftMenuViewOutput -
extension LeftMenuPresenter: LeftMenuViewOutput {
    
    func viewIsReady() {

    }
    
    func home() {
        let vc = CategoryViewController()
        _ = CategoryModuleInitializer(viewController: vc)
        
        if let slide = UIHelper.root().visibleViewController as? SlideViewController {
            slide.changeMainViewController(vc,  close: true)
            slide.title = "Home"
        }
    }
    
    func favorite() {        
        let vc = FavoriteViewController()
        _ = FavoriteModuleInitializer(viewController: vc)
        
        if let slide = UIHelper.root().visibleViewController as? SlideViewController {
            slide.changeMainViewController(vc,  close: true)
            slide.title = "Favorites"
        }
    }
    
    func download() {
        let vc = DownloadViewController()
        _ = DownloadModuleInitializer(viewController: vc)
        
        if let slide = UIHelper.root().visibleViewController as? SlideViewController {
            slide.changeMainViewController(vc,  close: true)
            slide.title = "Downloads"
        }
    }
    
    func settings() {
        let vc = SettingsViewController()
        _ = SettingsModuleInitializer(viewController: vc)
        
        if let slide = UIHelper.root().visibleViewController as? SlideViewController {
            slide.changeMainViewController(vc,  close: true)
            slide.title = "Settings"
        }
    }
    
    func logout() {
        UIHelper.closeMiniPlayer()
        
        let welcome = WelcomePresenter()
        _ = WelcomeModuleInitializer(presentor: welcome)
        let vc = welcome.view as! UIViewController
        let nav = UINavigationController(rootViewController: vc)
        
        UIView.transitionWithView(appDelegate.window!, duration: 0.4, options: .TransitionFlipFromRight, animations: { _ in
            appDelegate.window!.rootViewController! = nav
            }, completion: nil)
    }
}

//MARK: - extension for LeftMenuInteractorOutput -
extension LeftMenuPresenter: LeftMenuInteractorOutput {
 
}