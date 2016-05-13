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
}