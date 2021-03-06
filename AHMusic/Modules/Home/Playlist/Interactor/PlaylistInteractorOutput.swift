//
//  PlaylistInteractorOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol PlaylistInteractorOutput: class {
    
    func searchResultIsReady(items: Array<Playlist>)
    func getResultIsReady(playlist: Playlist)
}
