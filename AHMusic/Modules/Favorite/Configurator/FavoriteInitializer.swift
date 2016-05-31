//
//  FavoriteInitializer.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class FavoriteModuleInitializer {

    init(viewController: AnyObject) {
        let configurator = FavoriteModuleConfigurator()
        configurator.configureModuleForController(viewController)
    }
}
