//
//  PlaylistConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class PlaylistModuleConfigurator {
    
    func configureModuleForController(_ viewController: AnyObject) {
        
        if let viewController = viewController as? PlaylistViewController {
            configure(viewController)
        }
    }
    
    fileprivate func configure(_ viewController: PlaylistViewController) {
        
        let presenter = PlaylistPresenter()
        let interactor = PlaylistInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
