//
//  WelcomePresenter.swift
//  AHMusic
//
//  Created by AroHak on 23/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class WelcomePresenter -
class WelcomePresenter {

    var view: WelcomeViewInput!
    var interactor: WelcomeInteractorInput!
}

//MARK: - extension for WelcomeViewOutput -
extension WelcomePresenter: WelcomeViewOutput {
    
    func viewIsReady() {

    }
    
    func signIn() {
        let signIn = SignInPresenter()
        _ = SignInModuleInitializer(presentor: signIn)
        let vc = signIn.view as! UIViewController
        
        UIHelper.root().pushViewController(vc, animated: true)
    }
    
    func signUp() {
        let signUp = SignUpPresenter()
        _ = SignUpModuleInitializer(presentor: signUp)
        let vc = signUp.view as! UIViewController
        
        UIHelper.root().pushViewController(vc, animated: true)
    }
    
    func guest() {
        //main
        let main = CategoryViewController()
        _ = CategoryModuleInitializer(viewController: main)
        
        //left
        let left = LeftMenuViewController()
        _ = LeftMenuModuleInitializer(viewController: left)
        let slide = SlideViewController(mainViewController: main, leftMenuViewController: left)
        
        let nav = UINavigationController(rootViewController: slide)
        UIView.transition(with: appDelegate.window!, duration: 0.4, options: .transitionFlipFromLeft, animations: { _ in
            appDelegate.window!.rootViewController! = nav
            }, completion: nil)
    }
}

//MARK: - extension for WelcomeInteractorOutput -
extension WelcomePresenter: WelcomeInteractorOutput {
 
}
