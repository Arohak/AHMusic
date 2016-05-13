//
//  TabViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.

//MARK: - class TabViewController
class TabViewController: UIViewController  {
    
    var tabNavigation: CarbonTabSwipeNavigation!
    
    var tracks = Array<Track>()
    var artists = Array<Artist>()
    var albums = Array<Album>()
    var playlists = Array<String>()
    var stations = Array<String>()
    
    var keyword: String!

    //MARK: - Initilize
    init() {
        super.init(nibName: nil, bundle:nil)
    }
    
    convenience init(keyword: String) {
        self.init()
        
        self.keyword = keyword
    }
    
    convenience init(data: Array<Results>) {
        self.init()
        
        for item in data {
            tracks.append(item.track)
            
            let inExistArtist = artists.filter() {$0.id == item.artist.id}.first
            if inExistArtist == nil { artists.append(item.artist) }
            
            let inExistAlbum = albums.filter() {$0.id == item.album.id}.first
            if inExistAlbum == nil { albums.append(item.album) }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
    }

    //MARK: -  Private Methods
    private func baseConfig() {
        let items = ["Albums", "Artists", "Playlists", "Tracks", "Stations"]
        tabNavigation = CarbonTabSwipeNavigation(items: items as [AnyObject], delegate: self)
        tabNavigation.insertIntoRootViewController(self)
        
        styleTab()
    }
    
    private func styleTab() {
        tabNavigation.setIndicatorColor(BLUE)
        tabNavigation.toolbar.translucent = false
        tabNavigation.setTabExtraWidth(30)
//        tabNavigation.carbonSegmentedControl!.setWidth(200, forSegmentAtIndex: 0)
        tabNavigation.setNormalColor(BLACK.colorWithAlphaComponent(0.6))
        tabNavigation.setSelectedColor(BLUE, font: UIFont.boldSystemFontOfSize(14))
    }
}

//MARK: - extension for CarbonTabSwipeNavigationDelegate
extension TabViewController: CarbonTabSwipeNavigationDelegate {
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAtIndex index: UInt) -> UIViewController {
        switch index {
        case 0:
            let album = AlbumPresenter(name: keyword)
            _ = AlbumModuleInitializer(presentor: album)
            
            return album.view as! UIViewController
        case 1:
            let artist = ArtistPresenter(name: keyword)
            _ = ArtistModuleInitializer(presentor: artist)
            
            return artist.view as! UIViewController
        case 2:
            let playlist = PlaylistPresenter(name: keyword)
            _ = PlaylistModuleInitializer(presentor: playlist)
            
            return playlist.view as! UIViewController
        case 3:
            let track = TrackPresenter(name: keyword)
            _ = TrackModuleInitializer(presentor: track)
            
            return track.view as! UIViewController
        case 4:
            let station = StationPresenter()
            _ = StationModuleInitializer(presentor: station)
            
            return station.view as! UIViewController
        default:
            return UIViewController()
        }
    }
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAtIndex index: UInt) {
        NSLog("Did move at index: %ld", index)
    }
}
