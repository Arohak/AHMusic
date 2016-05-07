//
//  CategoryPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class CategoryPresenter: NSObject, CategoryModuleInput, CategoryViewOutput, CategoryInteractorOutput{

    var view: CategoryViewInput!
    var interactor: CategoryInteractorInput!
    var router: CategoryRouterInput!

    var tab: CarbonTabSwipeNavigation!
    
    //MARK: - Initialize
    override init() {
        super.init()
        
        //tab
        let items = ["Categories", "Albums", "Playlists", "Stations"]
        tab = CarbonTabSwipeNavigation(items: items as [AnyObject], delegate: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewIsReady() {
        tab.insertIntoRootViewController(view as! CategoryViewController)
    }
}

extension CategoryPresenter: CarbonTabSwipeNavigationDelegate {
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAtIndex index: UInt) -> UIViewController {
        switch index {
        case 0:
            let station = StationPresenter()
            _ = StationModuleInitializer(presentor: station)
            
            return station.view as! UIViewController
        case 1:
            let playlist = PlaylistPresenter()
            _ = PlaylistModuleInitializer(presentor: playlist)
            
            return playlist.view as! UIViewController
        default:
            let station = StationPresenter()
            _ = StationModuleInitializer(presentor: station)
            
            return station.view as! UIViewController
        }
        
    }
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAtIndex index: UInt) {
        NSLog("Did move at index: %ld", index)
    }
}
