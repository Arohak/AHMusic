//
//  StationPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class StationPresenter
class StationPresenter {

    var view: StationViewInput!
    var interactor: StationInteractorInput!
}

//MARK: - extension for StationModuleInput
extension StationPresenter: StationModuleInput {

}

//MARK: - extension for StationViewOutput
extension StationPresenter: StationViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for StationInteractorOutput
extension StationPresenter: StationInteractorOutput {
 
}