//
//  PlayerOutputProtocol.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/18/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol PlayerOutputProtocol {
    
    func reset()
    
    func didLoadItem(jukebox: Jukebox, item: JukeboxItem)
    func playback(currentTime: Double, duration: Double)
    func stateDidChange(jukebox: Jukebox)
}