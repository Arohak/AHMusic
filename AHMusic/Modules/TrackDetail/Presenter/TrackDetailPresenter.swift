//
//  TrackDetailPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 17/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackDetailPresenter -
class TrackDetailPresenter {

    var view: TrackDetailViewInput!
    var interactor: TrackDetailInteractorInput!

    var player: AHPlayer!
}

//MARK: - extension for TrackDetailModuleInput -
extension TrackDetailPresenter: TrackDetailModuleInput {

}

//MARK: - extension for TrackDetailViewOutput -
extension TrackDetailPresenter: TrackDetailViewOutput {
    
    func viewIsReady(items: Array<Track>) {
        player = AHPlayer(items: items, playerOutput: view)
    }
}

//MARK: - extension for TrackDetailInteractorOutput -
extension TrackDetailPresenter: TrackDetailInteractorOutput {
 
}