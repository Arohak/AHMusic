//
//  ArtistConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class ArtistModuleConfigurator {

    func configureModuleForController(viewController: AnyObject) {
        
        if let viewController = viewController as? ArtistViewController {
            configure(viewController)
        }
    }
    
    private func configure(viewController: ArtistViewController) {
        
        let presenter = ArtistPresenter()
        let interactor = ArtistInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
