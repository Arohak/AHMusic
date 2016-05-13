//
//  ArtistInteractor.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class ArtistInteractor
class ArtistInteractor {

    weak var output: ArtistInteractorOutput!
}

//MARK: - extension for ArtistInteractorInput
extension ArtistInteractor: ArtistInteractorInput {
    
    func searchArtist(name: String) {
        _ = apiHelper.rx_SearchArtist(name)
            .subscribeNext({ result in
                var temp = Array<Artist>()
                for item in result["data"].arrayValue {
                    let artist = Artist(data: item)
                    temp.append(artist)
                }
                
                self.output.searchResultIsReady(temp)
            })
    }
}