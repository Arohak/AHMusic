//
//  DownloadPresenter.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DownloadPresenter -
class DownloadPresenter {

    weak var view: BaseEventViewInput!
    var interactor: DownloadInteractorInput!
}

//MARK: - extension for DownloadViewOutput -
extension DownloadPresenter: BaseEventViewOutput {
    
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
        UIHelper.showMiniPlayer(index, tracks: tracks, isOffline: true)
    }
    
    func favoriteTrack(_ state: Bool, track: Track) {
        interactor.addOrDeleteFavoriteTrack(state, track: track)
    }
    
    func downloadTrack(_ state: Bool, track: Track) {
        interactor.addOrDeleteDownloadTrack(state, track: track)
    }
}

//MARK: - extension for DownloadInteractorOutput -
extension DownloadPresenter: DownloadInteractorOutput {
 
    func dbResultIsReady(_ items: Array<Track>) {
        view.setupInitialState(items)
    }
    
    func getTrackResultIsReady(_ track: Track, tracks: Array<Track>) {
        let vc = TrackDetailViewController(title: "Track", items: tracks, track: track)
        _ = TrackDetailModuleInitializer(viewController: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
}
