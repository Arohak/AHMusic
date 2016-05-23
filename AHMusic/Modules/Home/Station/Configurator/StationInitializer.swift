//
//  StationInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class StationModuleInitializer {

    init(presentor: AnyObject) {        
        let configurator = StationModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}