//
//  TrackPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackPresenter
class TrackPresenter {

    var view: TrackViewInput!
    var interactor: TrackInteractorInput!
}

//MARK: - extension for TrackModuleInput
extension TrackPresenter: TrackModuleInput {

}

//MARK: - extension for TrackViewOutput
extension TrackPresenter: TrackViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for TrackInteractorOutput
extension TrackPresenter: TrackInteractorOutput {
 
}