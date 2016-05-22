//
//  ProfilePresenter.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class ProfilePresenter -
class ProfilePresenter {

    var view: ProfileViewInput!
    var interactor: ProfileInteractorInput!
}

//MARK: - extension for ProfileModuleInput -
extension ProfilePresenter: ProfileModuleInput {

}

//MARK: - extension for ProfileViewOutput -
extension ProfilePresenter: ProfileViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for ProfileInteractorOutput -
extension ProfilePresenter: ProfileInteractorOutput {
 
}