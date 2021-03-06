//
//  CategoryConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class CategoryModuleConfigurator {

    func configureModuleForController(viewController: AnyObject) {
        
        if let viewController = viewController as? CategoryViewController {
            configure(viewController)
        }
    }
    
    private func configure(viewController: CategoryViewController) {
        
        let presenter = CategoryPresenter()
        let interactor = CategoryInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
