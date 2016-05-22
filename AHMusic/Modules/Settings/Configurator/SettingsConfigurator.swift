//
//  SettingsConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SettingsModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? SettingsPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: SettingsPresenter) {
        
        let viewController = SettingsViewController()
        let interactor = SettingsInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
