//
//  TabViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.

//MARK: - class TabViewController
class TabViewController: UIViewController  {
    
    var tabNavigation: CarbonTabSwipeNavigation!
    
    var presenters = Array<BasePresenter>()
    var selectedPresenter: BasePresenter!
    var keyword: String!

    //MARK: - Initilize
    init() {
        super.init(nibName: nil, bundle:nil)
    }
    
    convenience init(keyword: String) {
        self.init()
        
        self.keyword = keyword
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
        addPresenters()

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
    
    private func addPresenters() {
        let album = AlbumPresenter(name: keyword)
        _ = AlbumModuleInitializer(presentor: album)
        presenters.append(album)
        
        let artist = ArtistPresenter(name: keyword)
        _ = ArtistModuleInitializer(presentor: artist)
        presenters.append(artist)
        
        let playlist = PlaylistPresenter(name: keyword)
        _ = PlaylistModuleInitializer(presentor: playlist)
        presenters.append(playlist)
        
        let track = TrackPresenter(name: keyword)
        _ = TrackModuleInitializer(presentor: track)
        presenters.append(track)
        
        let station = StationPresenter(name: "")
        _ = StationModuleInitializer(presentor: station)
        presenters.append(station)
    }
}

//MARK: - extension for CarbonTabSwipeNavigationDelegate
extension TabViewController: CarbonTabSwipeNavigationDelegate {
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAtIndex index: UInt) -> UIViewController {
        switch index {
        case 0:
            let album = presenters[0] as! AlbumPresenter
            
            return album.view as! UIViewController
        case 1:
            let artist = presenters[1] as! ArtistPresenter

            return artist.view as! UIViewController
        case 2:
            let playlist = presenters[2] as! PlaylistPresenter

            return playlist.view as! UIViewController
        case 3:
            let track = presenters[3] as! TrackPresenter

            return track.view as! UIViewController
        case 4:
            let station = presenters[4] as! StationPresenter

            return station.view as! UIViewController
        default:
            return UIViewController()
        }
    }
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAtIndex index: UInt) {
        selectedPresenter = presenters[Int(index)]
    }
}
