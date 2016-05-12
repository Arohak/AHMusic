//
//  LeftMenuPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class LeftMenuPresenter
class LeftMenuPresenter {

    var view: LeftMenuViewInput!
    var interactor: LeftMenuInteractorInput!
}

//MARK: - extension for LeftMenuModuleInput
extension LeftMenuPresenter: LeftMenuModuleInput {

}

//MARK: - extension for LeftMenuViewOutput
extension LeftMenuPresenter: LeftMenuViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for LeftMenuInteractorOutput
extension LeftMenuPresenter: LeftMenuInteractorOutput {
 
}