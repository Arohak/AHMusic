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

//MARK: - extension for TrackDetailViewOutput -
extension TrackDetailPresenter: TrackDetailViewOutput {
    
    func viewIsReady(_ items: Array<Track>) {
        UIHelper.closeMiniPlayer()
        
        player = AHPlayer(items: items, playerOutput: view)
    }
    
    func remoteControlReceivedWithEvent(_ event: UIEvent?) {
        let jukebox = player.jukebox
        if event?.type == .remoteControl {
            switch event!.subtype {
            case .remoteControlPlay :
                jukebox?.play()
            case .remoteControlPause :
                jukebox?.pause()
            case .remoteControlNextTrack :
                jukebox?.playNext()
            case .remoteControlPreviousTrack:
                jukebox?.playPrevious()
            default:
                break
            }
        } else {
            print("NO EVENT!!!")
        }
    }
    
    func volumeSliderValue(_ value: Float) {
        player.volumeSliderValue(value)
    }
    
    func progressSliderValue(_ value: Float) {
        player.progressSliderValue(value)
    }
    
    func playPauseAtIndex(_ index: Int) {
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
    
    func openActionSheet(_ items: Array<Track>) {
        var temp = Array<String>()
        for item in items { temp.append(item.title) }
        let vc = ActionSheetPickerViewController(values: temp) { value in
            let index = items.index {$0.title == value }
            self.player.jukebox.play(atIndex: index!)
        }
        vc.pickerView.selectRow(player.jukebox.playIndex, inComponent: 0, animated: true)
        
        UIHelper.root().present(vc, animated: true, completion: nil)
    }
    
    func shareTrack(_ sourceView: UIView, items: Array<Track>) {
        let track = items[player.jukebox.playIndex]
        let textToShare = track.title
        let myWebsite = NSURL(string: track.share)!
        let objectsToShare = [textToShare, myWebsite] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
        activityVC.popoverPresentationController?.sourceView = sourceView
        
        UIHelper.root().present(activityVC, animated: true, completion: nil)
    }
    
    func favoriteTrack(_ state: Bool, track: Track) {
        interactor.addOrDeleteFavoriteTrack(state, track: track)
    }
    
    func downloadTrack(_ state: Bool, track: Track) {
        interactor.addOrDeleteDownloadTrack(state, track: track)
    }
}

//MARK: - extension for TrackDetailInteractorOutput -
extension TrackDetailPresenter: TrackDetailInteractorOutput {
 
}
