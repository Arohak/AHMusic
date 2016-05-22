//
//  SignUpInitializer.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SignUpModuleInitializer: NSObject {

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = SignUpModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
