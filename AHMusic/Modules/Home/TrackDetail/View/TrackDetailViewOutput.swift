//
//  TrackDetailViewOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 17/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol TrackDetailViewOutput: PlayerActionProtocol, RemoteControlReceivedProtocol, OpenActionSheetProtocol, FavoriteProtocol, DownloadProtocol {

    func viewIsReady(_ items: Array<Track>)
    func shareTrack(_ sourceView: UIView, items: Array<Track>)
}
