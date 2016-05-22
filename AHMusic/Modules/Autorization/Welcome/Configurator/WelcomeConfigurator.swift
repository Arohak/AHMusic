//
//  WelcomeConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 23/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class WelcomeModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? WelcomePresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: WelcomePresenter) {
        
        let viewController = WelcomeViewController()
        let interactor = WelcomeInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
