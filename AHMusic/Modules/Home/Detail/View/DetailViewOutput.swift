//
//  DetailViewOutput.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol DetailViewOutput: OpenTrackDetailProtocol, FavoriteProtocol, DownloadProtocol, MiniPlayerPlayProtocol {

    func viewIsReady()
    func openLink(track: Track)
}
