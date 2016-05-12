//
//  LeftMenuConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
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
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
