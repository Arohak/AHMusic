//
//  StationInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class StationModuleInitializer {

    init(viewController: AnyObject) {
        let configurator = StationModuleConfigurator()
        configurator.configureModuleForController(viewController)
    }
}
