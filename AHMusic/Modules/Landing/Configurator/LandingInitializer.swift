//
//  LandingInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LandingModuleInitializer: NSObject {

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = LandingModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
