//
//  TabViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.


class TabViewController: UIViewController  {
    
    var tabNavigation: CarbonTabSwipeNavigation!

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
    }

    //MARK: -  Private Methods
    private func baseConfig() {
        let items = ["Categories", "Albums", "Playlists", "Stations"]
        tabNavigation = CarbonTabSwipeNavigation(items: items as [AnyObject], delegate: self)
        tabNavigation.insertIntoRootViewController(self)
        
        styleTab()
    }
    
    private func styleTab() {
        tabNavigation.setIndicatorColor(BLUE)
        tabNavigation.toolbar.translucent = false
        tabNavigation.setTabExtraWidth(30)
        tabNavigation.carbonSegmentedControl!.setWidth(200, forSegmentAtIndex: 0)
        tabNavigation.setNormalColor(BLACK.colorWithAlphaComponent(0.6))
        tabNavigation.setSelectedColor(BLUE, font: UIFont.boldSystemFontOfSize(14))
    }
}

extension TabViewController: CarbonTabSwipeNavigationDelegate {
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAtIndex index: UInt) -> UIViewController {
        switch index {
        case 0:
            let category = CategoryPresenter()
            _ = CategoryModuleInitializer(presentor: category)
            
            return category.view as! UIViewController
        case 1:
            let album = AlbumPresenter()
            _ = AlbumModuleInitializer(presentor: album)
            
            return album.view as! UIViewController
        case 2:
            let playlist = PlaylistPresenter()
            _ = PlaylistModuleInitializer(presentor: playlist)
            
            return playlist.view as! UIViewController
        case 3:
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
