//
//  AlbumInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class AlbumModuleInitializer: NSObject {

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = AlbumModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
