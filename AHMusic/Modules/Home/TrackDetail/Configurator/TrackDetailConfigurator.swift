//
//  TrackDetailConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 17/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class TrackDetailModuleConfigurator {
    
    func configureModuleForViewController(viewController: AnyObject) {
        
        if let viewController = viewController as? TrackDetailViewController {
            configure(viewController)
        }
    }
    
    private func configure(viewController: TrackDetailViewController) {
        
        let presenter = TrackDetailPresenter()
        let interactor = TrackDetailInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
