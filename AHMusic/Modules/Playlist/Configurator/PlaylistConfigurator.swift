//
//  PlaylistConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
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
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
