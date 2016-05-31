//
//  SettingsInitializer.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SettingsModuleInitializer {
    
    init(viewController: AnyObject) {
        let configurator = SettingsModuleConfigurator()
        configurator.configureModuleForController(viewController)
    }
}
