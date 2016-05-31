//
//  ProfileInitializer.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class ProfileModuleInitializer {

    init(viewController: AnyObject) {
        let configurator = ProfileModuleConfigurator()
        configurator.configureModuleForController(viewController)
    }
}
