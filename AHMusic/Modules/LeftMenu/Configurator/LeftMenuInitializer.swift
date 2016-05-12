//
//  LeftMenuInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LeftMenuModuleInitializer: NSObject {

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = LeftMenuModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
