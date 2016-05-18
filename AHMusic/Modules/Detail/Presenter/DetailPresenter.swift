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
        rootVC.presentViewController(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    func playTrack(index: Int, tracks: Array<Track>) {        
        let vc = MiniPlayerViewController(index: index, items: tracks, output: view)
        
        vc.modalPresentationStyle = .OverCurrentContext
        vc.modalTransitionStyle = .CrossDissolve
        
        rootVC.presentViewController(vc, animated: true, completion: nil)
    }
}

//MARK: - extension for DetailInteractorOutput -
extension DetailPresenter: DetailInteractorOutput {
 
}