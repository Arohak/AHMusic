//
//  DownloadInitializer.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DownloadModuleInitializer {

    init(viewController: AnyObject) {
        let configurator = DownloadModuleConfigurator()
        configurator.configureModuleForController(viewController)
    }
}
