//
//  BaseInteratosOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol BaseInteratosOutput {
    
    func getAlbumResultIsReady(album: Album)
    func getArtistResultIsReady(artist: Artist, tracks: Array<Track>)
    func getTrackResultIsReady(track: Track, tracks: Array<Track>)
}