//
//  AHPlayerProtocol.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/18/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol PlayerActionProtocol {
    
    func volumeSliderValue(value: Float)
    func progressSliderValue(value: Float)
    func playPause()
    func prev()
    func next()
    func stop()
    func replay()
}

protocol PlayerOutputProtocol {
    
    func reset()
    
    func didLoadItem(jukebox: Jukebox, item: JukeboxItem)
    func playback(currentTime: Double, duration: Double)
    func stateDidChange(jukebox: Jukebox)
}