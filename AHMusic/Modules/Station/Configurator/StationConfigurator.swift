//
//  StationConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class StationModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? StationPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: StationPresenter) {
        
        let viewController = StationViewController()
        let interactor = StationInteractor()
        let router = StationRouter()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
