//
//  StationInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class StationModuleInitializer: NSObject {

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = StationModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
