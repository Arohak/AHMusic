//
//  PlayerOutputProtocol.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/18/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol PlayerOutputProtocol {
    
    func reset()
    
    func didLoadItem(_ jukebox: Jukebox, item: JukeboxItem)
    func playback(_ currentTime: Double, duration: Double)
    func stateDidChange(_ jukebox: Jukebox)
}
