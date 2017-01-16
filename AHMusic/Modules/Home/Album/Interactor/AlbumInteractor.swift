//
//  AlbumInteractor.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class AlbumInteractor -
class AlbumInteractor {

    weak var output: AlbumInteractorOutput!
}

//MARK: - extension for AlbumInteractorInput -
extension AlbumInteractor: AlbumInteractorInput {
    
    func searchAlbum(_ name: String) {
        _ = apiHelper.rx_SearchAlbum(name: name)
            .subscribe(onNext: { result in
            var temp = Array<Album>()
            for item in result["data"].arrayValue {
                let album = Album(data: item)
                temp.append(album)
            }
            
            self.output.searchResultIsReady(temp)
        })
    }
    
    func getAlbum(_ id: String) {
        _ = apiHelper.rx_GetAlbum(id: id)
            .subscribe(onNext: { result in
                let album = Album(data: result)
                
                self.output.getResultIsReady(album)
            })
    }
}
