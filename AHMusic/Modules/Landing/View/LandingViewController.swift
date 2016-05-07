//
//  LandingViewController.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LandingViewController: UIViewController, LandingViewInput {

    var output: LandingViewOutput!
    var items = NSArray()
    var carbonTabSwipeNavigation = CarbonTabSwipeNavigation()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        baseConfig()
        
        output.viewIsReady()
    }


    // MARK: LandingViewInput
    func setupInitialState() {
        
    }
    
    // MARK: Private Method
    private func baseConfig() {
        self.title = "CarbonKit"
        items = ["Categories", "Albums", "Playlists", "Stations"]
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items as [AnyObject], delegate: self)
        carbonTabSwipeNavigation.insertIntoRootViewController(self)
        
        self.style()
    }
    
    private func style() {
        let color = UIColor(red: 24.0 / 255, green: 75.0 / 255, blue: 152.0 / 255, alpha: 1)
        self.navigationController!.navigationBar.translucent = false
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.barTintColor = color
        self.navigationController!.navigationBar.barStyle = .BlackTranslucent
        carbonTabSwipeNavigation.toolbar.translucent = false
        carbonTabSwipeNavigation.setIndicatorColor(color)
        carbonTabSwipeNavigation.setTabExtraWidth(30)
        carbonTabSwipeNavigation.carbonSegmentedControl!.setWidth(200, forSegmentAtIndex: 0)
        
        carbonTabSwipeNavigation.setNormalColor(UIColor.blackColor().colorWithAlphaComponent(0.6))
        carbonTabSwipeNavigation.setSelectedColor(color, font: UIFont.boldSystemFontOfSize(14))
    }
}

extension LandingViewController: CarbonTabSwipeNavigationDelegate  {
    
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

