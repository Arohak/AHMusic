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
        UIHelper.closeMiniPlayer()
        
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
    
    func openActionSheet(items: Array<Track>) {
        var temp = Array<String>()
        for item in items { temp.append(item.title) }
        let vc = ActionSheetPickerViewController(values: temp) { value in
            let index = items.indexOf {$0.title == value }
            self.player.jukebox.playAtIndex(index!)
        }
        vc.pickerView.selectRow(player.jukebox.playIndex, inComponent: 0, animated: true)
        
        UIHelper.root().presentViewController(vc, animated: true, completion: nil)
    }
    
    func shareTrack(sourceView: UIView, items: Array<Track>) {
        let track = items[player.jukebox.playIndex]
        let textToShare = track.title
        let myWebsite = NSURL(string: track.share)!
        let objectsToShare = [textToShare, myWebsite]
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
        activityVC.popoverPresentationController?.sourceView = sourceView
        
        UIHelper.root().presentViewController(activityVC, animated: true, completion: nil)
    }
    
    func favoriteTrack(state: Bool, track: Track) {
        interactor.addOrDeleteFavoriteTrack(state, track: track)
    }
    
    func downloadTrack(state: Bool, track: Track) {
        interactor.addOrDeleteDownloadTrack(state, track: track)
    }
}

//MARK: - extension for TrackDetailInteractorOutput -
extension TrackDetailPresenter: TrackDetailInteractorOutput {
 
}