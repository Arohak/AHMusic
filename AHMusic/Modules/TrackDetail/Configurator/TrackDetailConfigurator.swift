//
//  TrackDetailConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 17/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class TrackDetailModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? TrackDetailPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: TrackDetailPresenter) {
        
        let viewController = TrackDetailViewController()
        let interactor = TrackDetailInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
    
    func configureModuleForViewController(vc: AnyObject) {
        
        if let vc = vc as? TrackDetailViewController {
            configure(vc)
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
