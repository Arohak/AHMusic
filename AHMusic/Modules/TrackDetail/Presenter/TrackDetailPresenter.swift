//
//  TrackDetailPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 17/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackDetailPresenter -
class TrackDetailPresenter {

    var view: TrackDetailViewInput!
    var interactor: TrackDetailInteractorInput!

    var player: AHPlayer!
}

//MARK: - extension for TrackDetailModuleInput -
extension TrackDetailPresenter: TrackDetailModuleInput {

}

//MARK: - extension for TrackDetailViewOutput -
extension TrackDetailPresenter: TrackDetailViewOutput {
    
    func viewIsReady(items: Array<Track>) {
        player = AHPlayer(items: items, playerOutput: view)
    }
    
    func remoteControlReceivedWithEvent(event: UIEvent?) {
        let jukebox = player.jukebox
        if event?.type == .RemoteControl {
            switch event!.subtype {
            case .RemoteControlPlay :
                jukebox.play()
            case .RemoteControlPause :
                jukebox.pause()
            case .RemoteControlNextTrack :
                jukebox.playNext()
            case .RemoteControlPreviousTrack:
                jukebox.playPrevious()
            default:
                break
            }
        } else {
            print("NO EVENT!!!")
        }
    }
    
    func volumeSliderValue(value: Float) {
        player.volumeSliderValue(value)
    }
    
    func progressSliderValue(value: Float) {
        player.progressSliderValue(value)
    }
    
    func playPauseAtIndex(index: Int) {
        player.playPauseAtIndex(index)
    }
    
    func playPause() {
        player.playPause()
    }
    
    func prev() {
        player.prev()
    }
    
    func next() {
        player.next()
    }
    
    func replay() {
        player.replay()
    }
    
    func stop() {
       player.stop()
    }
    
    func openActionSheet(tracks: Array<Track>) {
        
    }
}

//MARK: - extension for TrackDetailInteractorOutput -
extension TrackDetailPresenter: TrackDetailInteractorOutput {
 
}