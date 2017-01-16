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
    
    func getTrack(_ id: String, tracks: Array<Track>) {
        _ = apiHelper.rx_GetTrack(id: id)
            .subscribe(onNext: { result in
                let track = Track(data: result)
                
                self.output.getTrackResultIsReady(track, tracks: tracks)
            })
    }
    
    func addOrDeleteFavoriteTrack(_ state: Bool, track: Track) {
        dbHelper.addOrDeleteFavoriteTrack(state, track: track)
    }
    
    func addOrDeleteDownloadTrack(_ state: Bool, track: Track) {
        dbHelper.addOrDeleteDownloadTrack(state, track: track)
    }
}
