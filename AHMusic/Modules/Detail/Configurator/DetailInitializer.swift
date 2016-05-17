//
//  DetailInitializer.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailModuleInitializer {

    init(presentor: AnyObject) {
        let configurator = DetailModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
    
    init(vc: AnyObject) {
        let configurator = DetailModuleConfigurator()
        configurator.configureModuleForViewController(vc)
    }
}
