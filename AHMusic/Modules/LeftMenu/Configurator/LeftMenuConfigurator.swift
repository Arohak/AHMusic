//
//  LeftMenuConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LeftMenuModuleConfigurator {

    func configureModuleForController(viewController: AnyObject) {
        
        if let viewController = viewController as? LeftMenuViewController {
            configure(viewController)
        }
    }
    
    private func configure(viewController: LeftMenuViewController) {
        
        let presenter = LeftMenuPresenter()
        let interactor = LeftMenuInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
