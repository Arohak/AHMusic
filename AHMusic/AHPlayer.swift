//
//  AHPlayer.swift
//  AHMusic
//
//  Created by Hakobyan Ara on 5/18/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - AHPlayer -
class AHPlayer {
    
    var jukebox : Jukebox!
    var playerOutput: PlayerOutputProtocol!
    var items: Array<Track>!
    
    //MARK: - Initilize -
    init() {
        
    }
    
    init(items: Array<Track>, playerOutput: PlayerOutputProtocol) {
        self.items = items
        self.playerOutput = playerOutput
        
        var jukeboxItems = Array<JukeboxItem>()
        for item in items {
            jukeboxItems.append(JukeboxItem(URL: NSURL(string: item.preview)!))
        }
        self.jukebox = Jukebox(delegate: self, items: jukeboxItems)
    }
}

// MARK:- extension for PlayerActionProtocol -
extension AHPlayer: PlayerActionProtocol {
    
    func volumeSliderValue(value: Float) {
        if let jk = self.jukebox {
            jk.volume = value
        }
    }
    
    func progressSliderValue(value: Float) {
        if let duration = self.jukebox.currentItem?.duration {
            self.jukebox.seekToSecond(Int(Double(value) * duration))
        }
    }
    
    func playPause() {
        switch self.jukebox.state {
        case .Ready :
            self.jukebox.playAtIndex(0)
        case .Playing :
            self.jukebox.pause()
        case .Paused :
            self.jukebox.play()
        default:
            self.jukebox.stop()
        }
    }
    
    func prev() {
        if self.jukebox.currentItem?.currentTime > 5 || self.jukebox.playIndex == 0 {
            self.jukebox.replayCurrentItem()
        } else {
            self.jukebox.playPrevious()
        }
    }
    
    func next() {
        self.jukebox.playNext()
    }
    
    func stop() {
        self.jukebox.stop()
        playerOutput.reset()
    }
    
    func replay() {
        self.jukebox.replay()
        playerOutput.reset()
    }
}

// MARK:- extension for JukeboxDelegate -
extension AHPlayer: JukeboxDelegate {
    
    func jukeboxDidLoadItem(jukebox: Jukebox, item: JukeboxItem) {
        playerOutput.didLoadItem(jukebox, item: item)
    }
    
    func jukeboxPlaybackProgressDidChange(jukebox: Jukebox) {
        if let currentTime = jukebox.currentItem?.currentTime, let duration = jukebox.currentItem?.duration  {
            playerOutput.playback(currentTime, duration: duration)
        }
    }
    
    func jukeboxStateDidChange(jukebox: Jukebox) {
        playerOutput.stateDidChange(jukebox)
    }
}