//
//  BaseInteratosOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol BaseInteratosOutput {
    
    func getAlbumResultIsReady(_ album: Album)
    func getArtistResultIsReady(_ artist: Artist, tracks: Array<Track>)
    func getTrackResultIsReady(_ track: Track, tracks: Array<Track>)
}
