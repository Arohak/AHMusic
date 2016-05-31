//
//  ArtistInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class ArtistModuleInitializer {

    init(viewController: AnyObject) {
        let configurator = ArtistModuleConfigurator()
        configurator.configureModuleForController(viewController)
    }
}
