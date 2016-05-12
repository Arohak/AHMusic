//
//  ArtistConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class ArtistModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? ArtistPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: ArtistPresenter) {
        
        let viewController = ArtistViewController()
        let interactor = ArtistInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
