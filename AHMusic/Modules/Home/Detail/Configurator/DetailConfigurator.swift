//
//  DetailConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailModuleConfigurator {
    
    func configureModuleForViewController(viewController: AnyObject) {
        
        if let viewController = viewController as? DetailViewController {
            configure(viewController)
        }
    }
    
    private func configure(viewController: DetailViewController) {
        
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
