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

//MARK: - extension for DetailViewOutput -
extension DetailPresenter: DetailViewOutput {
    
    func viewIsReady() {
        
    }
    
    func search(_ keyword: String) {
        
    }
    
    func openLink(_ track: Track) {
        let vc = WebViewController(resourceName: track.title, url: NSURL(string: track.link)!)
        UIHelper.root().present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    func openTrackDetail(_ track: Track, items: Array<Track>) {
        interactor.getTrack("\(track.id)", tracks: items)
    }
    
    func playTrack(_ index: Int, tracks: Array<Track>) {
        UIHelper.showMiniPlayer(index, tracks: tracks)
    }
    
    func favoriteTrack(_ state: Bool, track: Track) {
        interactor.addOrDeleteFavoriteTrack(state, track: track)
    }
    
    func downloadTrack(_ state: Bool, track: Track) {
        interactor.addOrDeleteDownloadTrack(state, track: track)
    }
}

//MARK: - extension for DetailInteractorOutput -
extension DetailPresenter: DetailInteractorOutput {
 
    func getTrackResultIsReady(_ track: Track, tracks: Array<Track>) {
        let vc = TrackDetailViewController(title: "Track", items: tracks, track: track)
        _ = TrackDetailModuleInitializer(viewController: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
}
