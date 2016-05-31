//
//  AlbumPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class AlbumPresenter -
class AlbumPresenter {

    weak var view: AlbumViewInput!
    var interactor: AlbumInteractorInput!
}

//MARK: - extension for AlbumViewOutput -
extension AlbumPresenter: AlbumViewOutput {
    
    func viewIsReady(keyword: String) {
        interactor.searchAlbum(keyword)
    }

    func openLink(album: Album) {
        let vc = WebViewController(resourceName: album.title, url: NSURL(string: album.link)!)
        UIHelper.root().presentViewController(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    func openDetail(album: Album) {
        interactor.getAlbum("\(album.id)")
    }
}

//MARK: - extension for AlbumInteractorOutput -
extension AlbumPresenter: AlbumInteractorOutput {
 
    func searchResultIsReady(items: Array<Album>) {
        view.setupInitialState(items)
    }
    
    func getResultIsReady(album: Album) {
        let json = JSON(["imageURL" : album.coverBig, "tracks" : Array(album.tracks), "info" : "Name:\t\(album.title)\nTracks:\t\(album.nbTracks)\nFans:\t\(album.fans)"])
        let detail = Detail(data: json)
        
        let vc = DetailViewController(title: "Album", detail: detail)
        _ = DetailModuleInitializer(viewController: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
}