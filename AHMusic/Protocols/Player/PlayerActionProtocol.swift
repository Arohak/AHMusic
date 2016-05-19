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
    func playPauseAtIndex(index: Int)
    func playPause()
    func prev()
    func next()
    func stop()
    func replay()
}