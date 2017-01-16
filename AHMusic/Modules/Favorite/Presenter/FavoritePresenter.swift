//
//  FavoritePresenter.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class FavoritePresenter -
class FavoritePresenter: BasePresenter {

    weak var view: BaseEventViewInput!
    var interactor: FavoriteInteractorInput!
}

//MARK: - extension for FavoriteViewOutput -
extension FavoritePresenter: FavoriteViewOutput {
    
    func viewIsReady() {
        interactor.getTrackDB()
    }
    
    func search(_ keyword: String) {
        interactor.searchTrackDB(keyword)
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

//MARK: - extension for FavoriteInteractorOutput -
extension FavoritePresenter: FavoriteInteractorOutput {
    
    func dbResultIsReady(_ items: Array<Track>) {
        view.setupInitialState(items)
    }
    
    func getTrackResultIsReady(_ track: Track, tracks: Array<Track>) {
        let vc = TrackDetailViewController(title: "Track", items: tracks, track: track)
        _ = TrackDetailModuleInitializer(viewController: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
}
