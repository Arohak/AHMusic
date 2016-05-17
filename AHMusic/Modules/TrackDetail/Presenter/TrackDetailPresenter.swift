//
//  TrackDetailPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 17/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackDetailPresenter
class TrackDetailPresenter {

    var view: TrackDetailViewInput!
    var interactor: TrackDetailInteractorInput!
}

//MARK: - extension for TrackDetailModuleInput
extension TrackDetailPresenter: TrackDetailModuleInput {

}

//MARK: - extension for TrackDetailViewOutput
extension TrackDetailPresenter: TrackDetailViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for TrackDetailInteractorOutput
extension TrackDetailPresenter: TrackDetailInteractorOutput {
 
}