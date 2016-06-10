//
//  SignUpPresenter.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SignUpPresenter -
class SignUpPresenter {

    var view: SignUpViewInput!
    var interactor: SignUpInteractorInput!
}

//MARK: - extension for SignUpViewOutput -
extension SignUpPresenter: SignUpViewOutput {
    
    func viewIsReady() {

    }
    
    func signupButtonClicked(json: JSON) {
        interactor.signup(json)
    }
}

//MARK: - extension for SignUpInteractorOutput -
extension SignUpPresenter: SignUpInteractorOutput {
 
    func signupIsReady() {
        let signIn = SignInPresenter()
        _ = SignInModuleInitializer(presentor: signIn)
        let vc = signIn.view as! UIViewController
        
        UIHelper.root().pushViewController(vc, animated: true)
    }
}