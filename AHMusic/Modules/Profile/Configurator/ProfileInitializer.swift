//
//  ProfileInitializer.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class ProfileModuleInitializer: NSObject {

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = ProfileModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
