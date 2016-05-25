//
//  FavoritePresenter.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class FavoritePresenter -
class FavoritePresenter: BasePresenter {

    var view: FavoriteViewInput!
    var interactor: FavoriteInteractorInput!
}

//MARK: - extension for FavoriteModuleInput -
extension FavoritePresenter: FavoriteModuleInput {

}

//MARK: - extension for FavoriteViewOutput -
extension FavoritePresenter: FavoriteViewOutput {
    
    func viewIsReady() {
        interactor.getTrackDB()
    }
    
    func search(keyword: String) {
        interactor.searchTrackDB(keyword)
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

//MARK: - extension for FavoriteInteractorOutput -
extension FavoritePresenter: FavoriteInteractorOutput {
    
    func dbResultIsReady(items: Array<Track>) {
        view.setupInitialState(items)
    }
    
    func getTrackResultIsReady(track: Track, tracks: Array<Track>) {
        let vc = TrackDetailViewController(title: "Track", items: tracks, track: track)
        _ = TrackDetailModuleInitializer(vc: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
}