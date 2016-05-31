//
//  TrackDetailInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 17/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class TrackDetailModuleInitializer: NSObject {
    
    init(viewController: AnyObject) {
        let configurator = TrackDetailModuleConfigurator()
        configurator.configureModuleForViewController(viewController)
    }
}
