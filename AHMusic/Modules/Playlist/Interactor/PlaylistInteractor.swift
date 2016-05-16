//
//  PlaylistInteractor.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class PlaylistInteractor
class PlaylistInteractor {

    weak var output: PlaylistInteractorOutput!
}

//MARK: - extension for PlaylistInteractorInput
extension PlaylistInteractor: PlaylistInteractorInput {
    
    func searchPlaylist(name: String) {
        _ = apiHelper.rx_SearchpPlaylist(name)
        .subscribeNext({ result in
            var temp = Array<Playlist>()
            for item in result["data"].arrayValue {
                let playlist = Playlist(data: item)
                temp.append(playlist)
            }
            
            self.output.searchResultIsReady(temp)
        })
    }
    
    func getPlaylist(id: String) {
        _ = apiHelper.rx_GetPlaylist(id)
        .subscribeNext({ result in
            let playlist = Playlist(data: result)
            
            self.output.getResultIsReady(playlist)
        })
    }
}