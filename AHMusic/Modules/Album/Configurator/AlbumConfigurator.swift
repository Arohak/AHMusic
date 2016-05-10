//
//  AlbumConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class AlbumModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? AlbumPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: AlbumPresenter) {
        
        let viewController = AlbumViewController()
        let interactor = AlbumInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
