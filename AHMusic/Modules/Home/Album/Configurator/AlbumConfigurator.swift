//
//  AlbumConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class AlbumModuleConfigurator {

    func configureModuleForController(viewController: AnyObject) {
        
        if let viewController = viewController as? AlbumViewController {
            configure(viewController)
        }
    }
    
    private func configure(viewController: AlbumViewController) {
        
        let presenter = AlbumPresenter()
        let interactor = AlbumInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
