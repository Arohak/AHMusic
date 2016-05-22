//
//  SettingsInitializer.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SettingsModuleInitializer: NSObject {

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = SettingsModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
