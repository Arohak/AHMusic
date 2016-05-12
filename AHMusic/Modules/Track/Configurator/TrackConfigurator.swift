//
//  TrackConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class TrackModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? TrackPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: TrackPresenter) {
        
        let viewController = TrackViewController()
        let interactor = TrackInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
