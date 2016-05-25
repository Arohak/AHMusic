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

//MARK: - extension for WelcomeModuleInput -
extension WelcomePresenter: WelcomeModuleInput {

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
        let category = CategoryPresenter()
        _ = CategoryModuleInitializer(presentor: category)
        let main = category.view as! UIViewController
        
        //left
        let leftMenu = LeftMenuPresenter()
        _ = LeftMenuModuleInitializer(presentor: leftMenu)
        let left = leftMenu.view as! UIViewController
        let slide = SlideViewController(mainViewController: main, leftMenuViewController: left)
        
        let nav = UINavigationController(rootViewController: slide)
        UIView.transitionWithView(appDelegate.window!, duration: 0.4, options: .TransitionFlipFromLeft, animations: { _ in
            appDelegate.window!.rootViewController! = nav
            }, completion: nil)
    }
}

//MARK: - extension for WelcomeInteractorOutput -
extension WelcomePresenter: WelcomeInteractorOutput {
 
}