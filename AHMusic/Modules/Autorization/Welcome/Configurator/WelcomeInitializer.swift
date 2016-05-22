//
//  WelcomeInitializer.swift
//  AHMusic
//
//  Created by AroHak on 23/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class WelcomeModuleInitializer: NSObject {

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = WelcomeModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
