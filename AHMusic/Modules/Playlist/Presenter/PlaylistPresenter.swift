//
//  PlaylistPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class PlaylistPresenter
class PlaylistPresenter {

    var view: PlaylistViewInput!
    var interactor: PlaylistInteractorInput!
    
    var keyword: String!

    //MARK: - Initilize
    init(name: String) {
        self.keyword = name
    }
}

//MARK: - extension for PlaylistModuleInput
extension PlaylistPresenter: PlaylistModuleInput {

}

//MARK: - extension for PlaylistViewOutput
extension PlaylistPresenter: PlaylistViewOutput {
    
    func viewIsReady() {
        interactor.searchPlaylist(keyword)
    }
    
    func openLink(playlist: Playlist) {
        let vc = WebViewController(resourceName: playlist.title, url: NSURL(string: playlist.link)!)
        rootVC.presentViewController(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
}

//MARK: - extension for PlaylistInteractorOutput
extension PlaylistPresenter: PlaylistInteractorOutput {
 
    func searchResultIsReady(items: Array<Playlist>) {
        view.setupInitialState(items)
    }
}