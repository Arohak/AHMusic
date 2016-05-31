//
//  TabViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.

//MARK: - class TabViewController -
class TabViewController: UIViewController  {
    
    var tabNavigation: CarbonTabSwipeNavigation!
    
    var viewControllers = [BaseViewController]()
    var selectedViewController: BaseViewController!
    var keyword: String!

    //MARK: - Initilize -
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
    
    //MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
    }

    //MARK: -  Private Methods -
    private func baseConfig() {
        addViewControllers()

        let items = ["Albums", "Artists", "Playlists", "Tracks", "Stations"]
        tabNavigation = CarbonTabSwipeNavigation(items: items as [AnyObject], delegate: self)
        tabNavigation.insertIntoRootViewController(self)
        
        styleTab()
    }
    
    private func styleTab() {
        tabNavigation.setIndicatorColor(RED)
        tabNavigation.toolbar.translucent = false
        tabNavigation.setTabExtraWidth(40)
        tabNavigation.setNormalColor(BLACK.colorWithAlphaComponent(0.6))
        tabNavigation.setSelectedColor(RED, font: UIFont.boldSystemFontOfSize(14))
    }
    
    private func addViewControllers() {
        let album = AlbumViewController(title: "Albums", keyword: keyword)
        _ = AlbumModuleInitializer(viewController: album)
        viewControllers.append(album)
        
        let artist = ArtistViewController(title: "Artists", keyword: keyword)
        _ = ArtistModuleInitializer(viewController: artist)
        viewControllers.append(artist)
        
        let playlist = PlaylistViewController(title: "Playlists", keyword: keyword)
        _ = PlaylistModuleInitializer(viewController: playlist)
        viewControllers.append(playlist)
        
        let track = TrackViewController(title: "Tracks", keyword: keyword)
        _ = TrackModuleInitializer(viewController: track)
        viewControllers.append(track)
        
        let station = StationViewController(title: "Stations", keyword: keyword)
        _ = StationModuleInitializer(viewController: station)
        viewControllers.append(station)
    }
}

//MARK: - extension for CarbonTabSwipeNavigationDelegate -
extension TabViewController: CarbonTabSwipeNavigationDelegate {
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAtIndex index: UInt) -> UIViewController {
        
        return viewControllers[Int(index)]
    }
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAtIndex index: UInt) {
        
        selectedViewController = viewControllers[Int(index)]
    }
}
