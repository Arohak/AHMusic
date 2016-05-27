//
//  MiniPlayerProtocol.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/18/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol MiniPlayerProtocol {
    
    func stopPlayer(index: Int)
    func playPauseTrack(index: Int)
    func nextTrack(index: Int)
    func prevTrack(index: Int)
    func changeTrack(index: Int)
}

protocol MPPlayProtocol {

    func changeCorrectTrack(track: Track)
    func playCorrectTrack(track: Track)
    func pauseCorrectTrack(track: Track)
}
