//
//  TrackInteractor.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackInteractor
class TrackInteractor {

    weak var output: TrackInteractorOutput!
}

//MARK: - extension for TrackInteractorInput
extension TrackInteractor: TrackInteractorInput {
    
    func searchTrack(name: String) {
        _ = apiHelper.rx_SearchpTrack(name)
            .subscribeNext({ result in
                var temp = Array<Track>()
                for item in result["data"].arrayValue {
                    let track = Track(data: item)
                    temp.append(track)
                }
                
                self.output.searchResultIsReady(temp)
            })
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
}