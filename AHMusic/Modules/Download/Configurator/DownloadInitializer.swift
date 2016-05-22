//
//  DownloadInitializer.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DownloadModuleInitializer: NSObject {

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = DownloadModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
