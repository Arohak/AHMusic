//
//  SettingsConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SettingsModuleConfigurator {

    func configureModuleForController(_ viewController: AnyObject) {
        
        if let viewController = viewController as? SettingsViewController {
            configure(viewController)
        }
    }
    
    fileprivate func configure(_ viewController: SettingsViewController) {
        
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
