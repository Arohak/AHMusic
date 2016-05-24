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
        interactor.addOrDeleteTrack(state, track: track)
    }
    
    func downloadTrack(state: Bool, track: Track) {
        
    }
}

//MARK: - extension for FavoriteInteractorOutput -
extension FavoritePresenter: FavoriteInteractorOutput {
    
    func getDBResultIsReady(items: Array<Track>) {
        view.setupInitialState(items)
    }
    
    func getAlbumResultIsReady(album: Album) {
        let json = JSON(["imageURL" : album.coverBig, "tracks" : Array(album.tracks), "info" : "Name:\t\(album.title)\nTracks:\t\(album.nbTracks)\nFans:\t\(album.fans)"])
        let detail = Detail(data: json)
        
        let vc = DetailViewController(title: "Album", detail: detail)
        _ = DetailModuleInitializer(vc: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
    
    func getArtistResultIsReady(artist: Artist, tracks: Array<Track>) {
        let json = JSON(["imageURL" : artist.pictureBig, "tracks" : tracks, "info" : "Name:\t\(artist.name)\nAlbums:\t\(artist.nbAlbum)\nFans:\t\(artist.nbFan)"])
        let detail = Detail(data: json)
        
        let vc = DetailViewController(title: "Artist", detail: detail)
        _ = DetailModuleInitializer(vc: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
    
    func getTrackResultIsReady(track: Track, tracks: Array<Track>) {
        let vc = TrackDetailViewController(title: "Track", items: tracks, track: track)
        _ = TrackDetailModuleInitializer(vc: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
}