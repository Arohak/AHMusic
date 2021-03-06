//
//  AlbumInteractorOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol AlbumInteractorOutput: class {

    func searchResultIsReady(items: Array<Album>)
    func getResultIsReady(album: Album)
}
