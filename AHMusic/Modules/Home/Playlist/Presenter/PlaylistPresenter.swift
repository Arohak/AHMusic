//
//  PlaylistPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class PlaylistPresenter -
class PlaylistPresenter {

    weak var view: PlaylistViewInput!
    var interactor: PlaylistInteractorInput!
}

//MARK: - extension for PlaylistViewOutput -
extension PlaylistPresenter: PlaylistViewOutput {
    
    func viewIsReady(_ keyword: String) {
        interactor.searchPlaylist(keyword)
    }
    
    func openLink(_ playlist: Playlist) {
        let vc = WebViewController(resourceName: playlist.title, url: NSURL(string: playlist.link)!)
        UIHelper.root().present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    func openDetail(_ playlist: Playlist) {
        interactor.getPlaylist("\(playlist.id)")
    }
}

//MARK: - extension for PlaylistInteractorOutput -
extension PlaylistPresenter: PlaylistInteractorOutput {
 
    func searchResultIsReady(_ items: Array<Playlist>) {
        view.setupInitialState(items)
    }
    
    func getResultIsReady(_ playlist: Playlist) {
        let json = JSON(["imageURL" : playlist.pictureBig,
                         "tracks" : Array(playlist.tracks),
            "info" : "Name:\t\(playlist.title)\nTracks:\t\(playlist.nbTracks)\nFans:\t\(playlist.fans)\nRatings:\t\(playlist.rating)"])
        let detail = Detail(data: json)
        
        let vc = DetailViewController(title: "Playlist", detail: detail)
        _ = DetailModuleInitializer(viewController: vc)
        
        UIHelper.root().pushViewController(vc, animated: true)
    }
}
