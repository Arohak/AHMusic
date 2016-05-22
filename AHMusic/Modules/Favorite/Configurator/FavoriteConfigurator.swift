//
//  FavoriteConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class FavoriteModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? FavoritePresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: FavoritePresenter) {
        
        let viewController = FavoriteViewController()
        let interactor = FavoriteInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
