//
//  CategoryInitializer.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class CategoryModuleInitializer {

    init(presentor: AnyObject) {        
        let configurator = CategoryModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
