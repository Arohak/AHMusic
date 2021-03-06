//
//  ArtistPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class ArtistPresenter -
class ArtistPresenter {

    weak var view: ArtistViewInput!
    var interactor: ArtistInteractorInput!
}

//MARK: - extension for ArtistViewOutput -
extension ArtistPresenter: ArtistViewOutput {
    
    func viewIsReady(keyword: String) {
        interactor.searchArtist(keyword)
    }
    
    func openDetail(artist: Artist) {
        interactor.getArtist("\(artist.id)")
    }
}

//MARK: - extension for ArtistInteractorOutput -
extension ArtistPresenter: ArtistInteractorOutput {
 
    func searchResultIsReady(items: Array<Artist>) {
        view.setupInitialState(items)
    }
    
    func getResultIsReady(artist: Artist, tracks: Array<Track>) {
        let json = JSON(["imageURL" : artist.pictureBig, "tracks" : tracks, "info" : "Name:\t\(artist.name)\nAlbums:\t\(artist.nbAlbum)\nFans:\t\(artist.nbFan)"])
        let detail = Detail(data: json)
        
        let vc = DetailViewController(title: "Artist", detail: detail)
        _ = DetailModuleInitializer(viewController: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
}