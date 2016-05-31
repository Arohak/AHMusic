//
//  TrackPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackPresenter -
class TrackPresenter {

    weak var view: TrackViewInput!
    var interactor: TrackInteractorInput!
}

//MARK: - extension for TrackViewOutput -
extension TrackPresenter: TrackViewOutput {
    
    func viewIsReady(keyword: String) {
        interactor.searchTrack(keyword)
    }

    func playTrack(index: Int, tracks: Array<Track>) {
        UIHelper.showMiniPlayer(index, tracks: tracks)
    }
    
    func openLink(track: Track) {
        let vc = WebViewController(resourceName: track.title, url: NSURL(string: track.link)!)
        UIHelper.root().presentViewController(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    func openDetail(album: Album) {
        interactor.getAlbum("\(album.id)")
    }
    
    func openDetail(artist: Artist) {
        interactor.getArtist("\(artist.id)")
    }
    
    func openTrackDetail(track: Track, items: Array<Track>) {
        interactor.getTrack("\(track.id)", tracks: items)
    }
}

//MARK: - extension for TrackInteractorOutput -
extension TrackPresenter: TrackInteractorOutput {
 
    func searchResultIsReady(items: Array<Track>) {
        view.setupInitialState(items)
    }
    
    func getAlbumResultIsReady(album: Album) {
        let json = JSON(["imageURL" : album.coverBig, "tracks" : Array(album.tracks), "info" : "Name:\t\(album.title)\nTracks:\t\(album.nbTracks)\nFans:\t\(album.fans)"])
        let detail = Detail(data: json)
        
        let vc = DetailViewController(title: "Album", detail: detail)
        _ = DetailModuleInitializer(viewController: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
    
    func getArtistResultIsReady(artist: Artist, tracks: Array<Track>) {
        let json = JSON(["imageURL" : artist.pictureBig, "tracks" : tracks, "info" : "Name:\t\(artist.name)\nAlbums:\t\(artist.nbAlbum)\nFans:\t\(artist.nbFan)"])
        let detail = Detail(data: json)
        
        let vc = DetailViewController(title: "Artist", detail: detail)
        _ = DetailModuleInitializer(viewController: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
    
    func getTrackResultIsReady(track: Track, tracks: Array<Track>) {
        let vc = TrackDetailViewController(title: "Track", items: tracks, track: track)
        _ = TrackDetailModuleInitializer(viewController: vc)
        UIHelper.root().pushViewController(vc, animated: true)
    }
}