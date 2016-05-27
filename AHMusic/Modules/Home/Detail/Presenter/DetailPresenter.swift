//
//  DetailPresenter.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DetailPresenter -
class DetailPresenter {

    var view: BaseEventViewInput!
    var interactor: DetailInteractorInput!
}

//MARK: - extension for DetailModuleInput -
extension DetailPresenter: DetailModuleInput {

}

//MARK: - extension for DetailViewOutput -
extension DetailPresenter: DetailViewOutput {
    
    func viewIsReady() {
        
    }
        
    func search(keyword: String) {
        
    }
    
    func openLink(track: Track) {
        let vc = WebViewController(resourceName: track.title, url: NSURL(string: track.link)!)
        UIHelper.root().presentViewController(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    func openTrackDetail(track: Track, items: Array<Track>) {
        interactor.getTrack("\(track.id)", tracks: items)
    }
    
    func playTrack(index: Int, tracks: Array<Track>) {
        UIHelper.showMiniPlayer(index, tracks: tracks)
    }
    
    func favoriteTrack(state: Bool, track: Track) {
        interactor.addOrDeleteFavoriteTrack(state, track: track)
    }
    
    func downloadTrack(state: Bool, track: Track) {
        interactor.addOrDeleteDownloadTrack(state, track: track)
    }
}

//MARK: - extension for DetailInteractorOutput -
extension DetailPresenter: DetailInteractorOutput {
 
    func getTrackResultIsReady(track: Track, tracks: Array<Track>) {
        let vc = TrackDetailViewController(title: "Track", items: tracks, track: track)
        _ = TrackDetailModuleInitializer(vc: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
}