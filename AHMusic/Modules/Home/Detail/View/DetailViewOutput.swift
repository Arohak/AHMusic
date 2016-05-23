//
//  DetailViewOutput.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol DetailViewOutput: FavoriteProtocol, DownloadProtocol {

    func viewIsReady()
    func openLink(track: Track)
    func openTrackDetail(track: Track, items: Array<Track>)
    func playTrack(index: Int, tracks: Array<Track>)
}
