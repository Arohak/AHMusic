//
//  PlaylistInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class PlaylistModuleInitializer {

    init(presentor: AnyObject) {
        let configurator = PlaylistModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
