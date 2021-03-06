//
//  DetailInteractor.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DetailInteractor -
class DetailInteractor {

    weak var output: DetailInteractorOutput!
}

//MARK: - extension for DetailInteractorInput -
extension DetailInteractor: DetailInteractorInput {
    
    func getTrack(id: String, tracks: Array<Track>) {
        _ = apiHelper.rx_GetTrack(id)
            .subscribeNext({ result in
                let track = Track(data: result)
                
                self.output.getTrackResultIsReady(track, tracks: tracks)
            })
    }
    
    func addOrDeleteFavoriteTrack(state: Bool, track: Track) {
        dbHelper.addOrDeleteFavoriteTrack(state, track: track)
    }
    
    func addOrDeleteDownloadTrack(state: Bool, track: Track) {
        dbHelper.addOrDeleteDownloadTrack(state, track: track)
    }
}