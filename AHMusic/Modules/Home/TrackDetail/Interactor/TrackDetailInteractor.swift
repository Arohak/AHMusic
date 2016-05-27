//
//  TrackDetailInteractor.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 17/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackDetailInteractor -
class TrackDetailInteractor {

    weak var output: TrackDetailInteractorOutput!
}

//MARK: - extension for TrackDetailInteractorInput -
extension TrackDetailInteractor: TrackDetailInteractorInput {
    
    func addOrDeleteFavoriteTrack(state: Bool, track: Track) {
        dbHelper.addOrDeleteFavoriteTrack(state, track: track)
    }
    
    func addOrDeleteDownloadTrack(state: Bool, track: Track) {
        dbHelper.addOrDeleteDownloadTrack(state, track: track)
    }
}