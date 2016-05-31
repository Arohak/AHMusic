//
//  FavoriteConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class FavoriteModuleConfigurator {
    
    func configureModuleForController(viewController: AnyObject) {
        
        if let viewController = viewController as? FavoriteViewController {
            configure(viewController)
        }
    }
    
    private func configure(viewController: FavoriteViewController) {
        
        let presenter = FavoritePresenter()
        let interactor = FavoriteInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
