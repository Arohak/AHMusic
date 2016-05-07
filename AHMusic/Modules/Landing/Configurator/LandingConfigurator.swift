//
//  LandingConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LandingModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? LandingPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: LandingPresenter) {
        
        let viewController = LandingViewController()
        let interactor = LandingInteractor()
        let router = LandingRouter()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
