//
//  TrackInteractor.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackInteractor
class TrackInteractor {

    var output: TrackInteractorOutput!
}

//MARK: - extension for TrackInteractorInput -
extension TrackInteractor: TrackInteractorInput {
    
    func searchTrack(_ name: String) {
        _ = apiHelper.rx_SearchpTrack(name: name)
            .subscribe(onNext: { result in
                var temp = Array<Track>()
                for item in result["data"].arrayValue {
                    let track = Track(data: item)
                    temp.append(track)
                }
                
                self.output.searchResultIsReady(temp)
            })
    }
    
    func getAlbum(_ id: String) {
        _ = apiHelper.rx_GetAlbum(id: id)
            .subscribe(onNext: { result in
                let album = Album(data: result)
                
                self.output.getAlbumResultIsReady(album)
            })
    }
    
    func getArtist(_ id: String) {
        _ = apiHelper.rx_GetArtist(id: id)
            .subscribe(onNext: { result in
                let artist = Artist(data: result)
                
                _ = apiHelper.rx_GetArtistTracks(id: id, limit: "20")
                    .subscribe(onNext: { result in
                        var tracks = Array<Track>()
                        for item in result["data"].arrayValue {
                            let track = Track(data: item)
                            tracks.append(track)
                        }
                        
                        self.output.getArtistResultIsReady(artist, tracks: tracks)
                    })
            })
    }
    
    func getTrack(_ id: String, tracks: Array<Track>) {
        _ = apiHelper.rx_GetTrack(id: id)
            .subscribe(onNext: { result in
                let track = Track(data: result)
                
                self.output.getTrackResultIsReady(track, tracks: tracks)
            })
    }
}
