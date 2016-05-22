//
//  TrackDetailViewOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 17/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol TrackDetailViewOutput: PlayerActionProtocol, RemoteControlReceivedProtocol, OpenActionSheetProtocol {

    func viewIsReady(items: Array<Track>)
    func shareTrack(sourceView: UIView, items: Array<Track>)
}
