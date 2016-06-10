//
//  SignInPresenter.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SignInPresenter -
class SignInPresenter {

    var view: SignInViewInput!
    var interactor: SignInInteractorInput!
}

//MARK: - extension for SignInViewOutput -
extension SignInPresenter: SignInViewOutput {
    
    func viewIsReady() {

    }
    
    func signinButtonClicked(json: JSON) {
        interactor.signin(json)
    }
}

//MARK: - extension for SignInInteractorOutput -
extension SignInPresenter: SignInInteractorOutput {
 
    func signinIsReady() {
        let main = CategoryViewController()
        _ = CategoryModuleInitializer(viewController: main)
        
        //left
        let left = LeftMenuViewController()
        _ = LeftMenuModuleInitializer(viewController: left)
        let slide = SlideViewController(mainViewController: main, leftMenuViewController: left)
        
        let nav = UINavigationController(rootViewController: slide)
        UIView.transitionWithView(appDelegate.window!, duration: 0.4, options: .TransitionFlipFromLeft, animations: { _ in
            appDelegate.window!.rootViewController! = nav
            }, completion: nil)
    }
}