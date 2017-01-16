//
//  MiniPlayerProtocol.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/18/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol MiniPlayerProtocol {
    
    func stopPlayer(_ index: Int)
    func playPauseTrack(_ index: Int)
    func nextTrack(_ index: Int)
    func prevTrack(_ index: Int)
    func changeTrack(_ index: Int)
}

protocol MPPlayProtocol {

    func changeCorrectTrack(_ track: Track)
    func playCorrectTrack(_ track: Track)
    func pauseCorrectTrack(_ track: Track)
}
