//
//  DetailViewOutput.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol DetailViewOutput: OpenTrackDetailProtocol, FavoriteProtocol, DownloadProtocol {

    func viewIsReady()
    func openLink(track: Track)
    func playTrack(index: Int, tracks: Array<Track>)
}
