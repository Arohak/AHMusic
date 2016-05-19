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
}
