//
//  SettingsConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SettingsModuleConfigurator {

    func configureModuleForController(viewController: AnyObject) {
        
        if let viewController = viewController as? SettingsViewController {
            configure(viewController)
        }
    }
    
    private func configure(viewController: SettingsViewController) {
        
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
