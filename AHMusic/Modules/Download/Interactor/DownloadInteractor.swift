//
//  DownloadInteractor.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DownloadInteractor -
class DownloadInteractor {

    weak var output: DownloadInteractorOutput!
}

//MARK: - extension for DownloadInteractorInput -
extension DownloadInteractor: DownloadInteractorInput {
    
    func getTrackDB() {
        let tracks = dbHelper.getDownloadedTracks()
        output.dbResultIsReady(Array(tracks))
    }
    
    func searchTrackDB(keyword: String) {
        let tracks = dbHelper.searchDownloadTracks(keyword)
        output.dbResultIsReady(Array(tracks))
    }
    
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