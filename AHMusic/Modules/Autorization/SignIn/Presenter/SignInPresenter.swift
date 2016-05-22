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

//MARK: - extension for SignInModuleInput -
extension SignInPresenter: SignInModuleInput {

}

//MARK: - extension for SignInViewOutput -
extension SignInPresenter: SignInViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for SignInInteractorOutput -
extension SignInPresenter: SignInInteractorOutput {
 
}