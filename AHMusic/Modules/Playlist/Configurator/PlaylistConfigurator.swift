//
//  PlaylistConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class PlaylistModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? PlaylistPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: PlaylistPresenter) {
        
        let viewController = PlaylistViewController()
        let interactor = PlaylistInteractor()
        let router = PlaylistRouter()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
