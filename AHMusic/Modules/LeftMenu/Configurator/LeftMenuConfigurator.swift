//
//  LeftMenuConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 08/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LeftMenuModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? LeftMenuPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: LeftMenuPresenter) {
        
        let viewController = LeftMenuViewController()
        let interactor = LeftMenuInteractor()
        let router = LeftMenuRouter()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
