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

//MARK: - extension for SignUpModuleInput -
extension SignUpPresenter: SignUpModuleInput {

}

//MARK: - extension for SignUpViewOutput -
extension SignUpPresenter: SignUpViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for SignUpInteractorOutput -
extension SignUpPresenter: SignUpInteractorOutput {
 
}