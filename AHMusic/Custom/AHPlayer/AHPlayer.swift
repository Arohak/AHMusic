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
    var tracks: [Track]!
    var isOffline = false

    //MARK: - Initilize -
    init(tracks: Array<Track>, playerOutput: PlayerOutputProtocol, isOffline: Bool = false) {
        self.tracks = tracks
        self.playerOutput = playerOutput
        self.isOffline = isOffline

        self.setTrackers(tracks)
    }
    
    //MARK: - Public Method -
//    func setTrackers(_ tracks: Array<Track>) {
//        let other = "http://megdadhashem.wapego.ru/files/56727/tubidy_mp3_e2afc5.mp3"
//        let my = "https://demo-api.foneo.com/uploads/voicemail/voice_message_2017-06-07_12-57-42.snd"
//        if let url = URL(string: my) {
//            let item = JukeboxItem(URL: url)
//            self.jukebox = Jukebox(delegate: self, items: [item])
//        }
//    }
    
    func setTrackers(_ tracks: Array<Track>) {
        if let jukebox = jukebox {
            jukebox.removeAllItems()
            
            for track in tracks {
                if isOffline {
                    let name = track.preview.components(separatedBy: "/").last!
                    let path = Utils.getDocumentsFolderPath() + "/" + name
                    let url = URL(fileURLWithPath: path)
                    jukebox.append(item: JukeboxItem(URL: url), loadingAssets: false)
                    
                } else {
                    if let url = URL(string: track.preview) {
                        jukebox.append(item: JukeboxItem(URL: url), loadingAssets: true)
                    }
                }
            }
        } else {
            var jukeboxItems = Array<JukeboxItem>()
            
            for track in tracks {
                if isOffline {
                    let name = track.preview.components(separatedBy: "/").last!
                    let path = Utils.getDocumentsFolderPath() + "/" + name
                    let url = URL(fileURLWithPath: path)
                    jukeboxItems.append(JukeboxItem(URL: url))
                    
                } else {
                    if let url = URL(string: track.preview) {
                        jukeboxItems.append(JukeboxItem(URL: url))
                    }
                }
            }
            self.jukebox = Jukebox(delegate: self, items: jukeboxItems)
        }
    }
}

// MARK:- extension for PlayerActionProtocol -
extension AHPlayer: PlayerActionProtocol {
    
    func volumeSliderValue(_ value: Float) {
        if let jk = self.jukebox {
            jk.volume = value
        }
    }
    
    func progressSliderValue(_ value: Float) {
        if let duration = self.jukebox.currentItem?.meta.duration {
            self.jukebox.seek(toSecond: Int(Double(value) * duration))
        }
    }
    
    func playPause() {
        switch self.jukebox.state {
        case .ready :
            self.jukebox.play(atIndex: 0)
        case .playing :
            self.jukebox.pause()
        case .paused :
            self.jukebox.play()
        default:
            self.jukebox.stop()
        }
    }
    
    func playOrPause(atIndex: Int) {
        switch self.jukebox.state {
        case .ready :
            self.jukebox.play(atIndex: atIndex)
        case .playing :
            self.jukebox.pause()
        case .paused :
            self.jukebox.play()
        default:
            self.jukebox.stop()
        }
    }
    
    func prev() {
        if Int((self.jukebox.currentItem?.currentTime)!) > 5 || self.jukebox.playIndex == 0 {
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
        self.jukebox.pause()
        self.jukebox.replay()
    }
}

// MARK:- extension for JukeboxDelegate -
extension AHPlayer: JukeboxDelegate {
    
    public func jukeboxDidUpdateMetadata(_ jukebox: Jukebox, forItem: JukeboxItem) {
        
    }

    
    func jukeboxDidLoadItem(_ jukebox: Jukebox, item: JukeboxItem) {
        playerOutput.didLoadItem(jukebox, item: item)
    }
    
    func jukeboxPlaybackProgressDidChange(_ jukebox: Jukebox) {
        if let currentTime = jukebox.currentItem?.currentTime, let duration = jukebox.currentItem?.meta.duration  {
            playerOutput.playback(currentTime, duration: duration)
        }
    }
    
    func jukeboxStateDidChange(_ jukebox: Jukebox) {
        playerOutput.stateDidChange(jukebox)
    }
}
