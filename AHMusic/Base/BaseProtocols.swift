//
//  BaseProtocols.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol BaseViewOutput {
    
    func viewIsReady()
}

protocol OpenDetailFromAlbumProtocol {
    
    func openDetail(album: Album)
}

protocol OpenDetailFromArtistProtocol {
    
    func openDetail(artist: Artist)
}

protocol GetAlbumProtocol {
    
    func getAlbum(id: String)
}

protocol GetArtistProtocol {
    
    func getArtist(id: String)
}