//
//  FavoriteViewOutput.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol FavoriteViewOutput: OpenDetailFromAlbumProtocol, OpenDetailFromArtistProtocol, OpenTrackDetailProtocol {

    func viewIsReady()
    func playTrack(index: Int, tracks: Array<Track>)
    func openLink(track: Track)
}
