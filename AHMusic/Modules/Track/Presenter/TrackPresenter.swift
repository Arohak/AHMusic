//
//  TrackPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import AVFoundation

//MARK: - class TrackPresenter
class TrackPresenter {

    var view: TrackViewInput!
    var interactor: TrackInteractorInput!
    
    var items = Array<Track>()
    var player: AVPlayer!
    var keyword: String!
    
    //MARK: - Initilize
    init(name: String) {        
        self.keyword = name
    }
    
    init(items: Array<Track>) {
        self.items = items
    }
}

//MARK: - extension for TrackModuleInput
extension TrackPresenter: TrackModuleInput {

}

//MARK: - extension for TrackViewOutput
extension TrackPresenter: TrackViewOutput {
    
    func viewIsReady() {
        interactor.searchTrack(keyword)
    }
    
    func playSound(track: Track) {
        let url = NSURL(string: track.preview)!
        player = AVPlayer(URL: url)
        player.play()
    }
    
    func pauseSound() {
        player.pause()
    }
    
    func openLink(track: Track) {
        let vc = WebViewController(resourceName: track.title, url: NSURL(string: track.link)!)
        rootVC.presentViewController(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
}

//MARK: - extension for TrackInteractorOutput
extension TrackPresenter: TrackInteractorOutput {
 
    func searchResultIsReady(items: Array<Track>) {
        view.setupInitialState(items)
    }
}