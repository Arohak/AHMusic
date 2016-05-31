//
//  PlaylistInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class PlaylistModuleInitializer {

    init(viewController: AnyObject) {
        let configurator = PlaylistModuleConfigurator()
        configurator.configureModuleForController(viewController)
    }
}
