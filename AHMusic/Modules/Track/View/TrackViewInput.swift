//
//  TrackViewInput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol TrackViewInput: class {

    func setupInitialState(items: Array<Track>)
    func stopPlayer(index: Int)
    func playPauseTrack(index: Int)
    func nextTrack(index: Int)
    func prevTrack(index: Int)
}
