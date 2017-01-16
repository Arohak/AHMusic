//
//  ArtistInteractor.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class ArtistInteractor -
class ArtistInteractor {

    weak var output: ArtistInteractorOutput!
}

//MARK: - extension for ArtistInteractorInput -
extension ArtistInteractor: ArtistInteractorInput {
    
    func searchArtist(_ name: String) {
        _ = apiHelper.rx_SearchArtist(name: name)
            .subscribe(onNext: { result in
                var temp = Array<Artist>()
                for item in result["data"].arrayValue {
                    let artist = Artist(data: item)
                    temp.append(artist)
                }
                
                self.output.searchResultIsReady(temp)
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
                        
                        self.output.getResultIsReady(artist, tracks: tracks)
                    })
            })
    }
}
