//
//  AlbumInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class AlbumModuleInitializer {

    init(presentor: AnyObject) {        
        let configurator = AlbumModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
