//
//  LeftMenuPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class LeftMenuPresenter -
class LeftMenuPresenter {

    var view: LeftMenuViewInput!
    var interactor: LeftMenuInteractorInput!
}

//MARK: - extension for LeftMenuModuleInput -
extension LeftMenuPresenter: LeftMenuModuleInput {

}

//MARK: - extension for LeftMenuViewOutput -
extension LeftMenuPresenter: LeftMenuViewOutput {
    
    func viewIsReady() {

    }
    
    func home() {
        
    }
    
    func favorite() {
        
    }
    
    func download() {
        
    }
    
    func settings() {
        
    }
    
    func logout() {
        let welcome = WelcomePresenter()
        _ = WelcomeModuleInitializer(presentor: welcome)
        let vc = welcome.view as! UIViewController
        let nav = UINavigationController(rootViewController: vc)
        
        UIView.transitionWithView(appDelegate.window!, duration: 0.5, options: .TransitionFlipFromRight, animations: { _ in
            appDelegate.window!.rootViewController! = nav
            }, completion: nil)
    }
}

//MARK: - extension for LeftMenuInteractorOutput -
extension LeftMenuPresenter: LeftMenuInteractorOutput {
 
}