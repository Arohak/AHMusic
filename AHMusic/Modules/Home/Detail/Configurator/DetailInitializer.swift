//
//  DetailInitializer.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailModuleInitializer {

    init(viewController: AnyObject) {
        let configurator = DetailModuleConfigurator()
        configurator.configureModuleForViewController(viewController)
    }
}
