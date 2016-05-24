//
//  FavoriteViewOutput.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol FavoriteViewOutput: OpenTrackDetailProtocol, FavoriteProtocol, DownloadProtocol, MiniPlayerPlayProtocol {

    func viewIsReady()
    func openLink(track: Track)
}
