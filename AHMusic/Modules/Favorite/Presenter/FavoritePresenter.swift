//
//  FavoritePresenter.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class FavoritePresenter -
class FavoritePresenter {

    var view: FavoriteViewInput!
    var interactor: FavoriteInteractorInput!
}

//MARK: - extension for FavoriteModuleInput -
extension FavoritePresenter: FavoriteModuleInput {

}

//MARK: - extension for FavoriteViewOutput -
extension FavoritePresenter: FavoriteViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for FavoriteInteractorOutput -
extension FavoritePresenter: FavoriteInteractorOutput {
 
}