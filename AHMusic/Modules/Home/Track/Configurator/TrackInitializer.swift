//
//  TrackInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class TrackModuleInitializer {

    init(viewController: AnyObject) {
        let configurator = TrackModuleConfigurator()
        configurator.configureModuleForController(viewController)
    }

}
