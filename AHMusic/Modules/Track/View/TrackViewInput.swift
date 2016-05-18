//
//  TrackViewInput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol TrackViewInput: class {

    func setupInitialState(items: Array<Track>)
    func stopPlayer(track: Track)
    func changeTrack(track: Track)
}
