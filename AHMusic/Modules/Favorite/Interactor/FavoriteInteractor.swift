//
//  FavoriteInteractor.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class FavoriteInteractor -
class FavoriteInteractor {

    var output: FavoriteInteractorOutput!
}

//MARK: - extension for FavoriteInteractorInput -
extension FavoriteInteractor: FavoriteInteractorInput {
    
    func getTrackDB() {
        let tracks = dbHelper.getFavoriteTracks()
        output.getDBResultIsReady(Array(tracks))
    }
    
    func getAlbum(id: String) {
        _ = apiHelper.rx_GetAlbum(id)
            .subscribeNext({ result in
                let album = Album(data: result)
                
                self.output.getAlbumResultIsReady(album)
            })
    }
    
    func getArtist(id: String) {
        _ = apiHelper.rx_GetArtist(id)
            .subscribeNext({ result in
                let artist = Artist(data: result)
                
                _ = apiHelper.rx_GetArtistTracks(id, limit: "20")
                    .subscribeNext({ result in
                        var tracks = Array<Track>()
                        for item in result["data"].arrayValue {
                            let track = Track(data: item)
                            tracks.append(track)
                        }
                        
                        self.output.getArtistResultIsReady(artist, tracks: tracks)
                    })
            })
    }
    
    func getTrack(id: String, tracks: Array<Track>) {
        _ = apiHelper.rx_GetTrack(id)
            .subscribeNext({ result in
                let track = Track(data: result)
                
                self.output.getTrackResultIsReady(track, tracks: tracks)
            })
    }
}