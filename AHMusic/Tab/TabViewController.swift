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

    //MARK: - Initilize
    init(data: Array<Result>) {
        super.init(nibName: nil, bundle: nil)
        
        for item in data {
            tracks.append(item.track)
            artists.append(item.artist)
            albums.append(item.album)
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
        let items = ["Tracks", "Artists", "Albums", "Playlists", "Stations"]
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
            let track = TrackPresenter(items: tracks)
            _ = TrackModuleInitializer(presentor: track)
            
            return track.view as! UIViewController
        case 1:
            let artist = ArtistPresenter()
            _ = ArtistModuleInitializer(presentor: artist)
            
            return artist.view as! UIViewController
        case 2:
            let album = AlbumPresenter()
            _ = AlbumModuleInitializer(presentor: album)
            
            return album.view as! UIViewController
        case 3:
            let playlist = PlaylistPresenter()
            _ = PlaylistModuleInitializer(presentor: playlist)
            
            return playlist.view as! UIViewController
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
