//
//  DetailConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailModuleConfigurator {
    
    func configureModuleForViewController(vc: AnyObject) {
        
        if let vc = vc as? DetailViewController {
            configure(vc)
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
