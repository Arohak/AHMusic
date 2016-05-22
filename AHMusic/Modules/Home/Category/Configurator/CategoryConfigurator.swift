//
//  CategoryConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class CategoryModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? CategoryPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: CategoryPresenter) {
        
        let viewController = CategoryViewController()
        let interactor = CategoryInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
