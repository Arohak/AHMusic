//
//  DetailPresenter.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DetailPresenter -
class DetailPresenter {

    var view: DetailViewInput!
    var interactor: DetailInteractorInput!
}

//MARK: - extension for DetailModuleInput -
extension DetailPresenter: DetailModuleInput {

}

//MARK: - extension for DetailViewOutput -
extension DetailPresenter: DetailViewOutput {
    
    func viewIsReady() {
        
    }
    
    func openLink(track: Track) {
        let vc = WebViewController(resourceName: track.title, url: NSURL(string: track.link)!)
        UIHelper.root().presentViewController(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    func openTrackDetail(track: Track, items: Array<Track>) {
        interactor.getTrack("\(track.id)", tracks: items)
    }
    
    func playTrack(index: Int, tracks: Array<Track>) {        
        let vc = MiniPlayerViewController(index: index, items: tracks, output: view)
        vc.modalPresentationStyle = .OverCurrentContext
        vc.modalTransitionStyle = .CrossDissolve
        UIHelper.root().presentViewController(vc, animated: true, completion: nil)
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