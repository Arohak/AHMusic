//
//  StationConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class StationModuleConfigurator {

    func configureModuleForController(viewController: AnyObject) {
        
        if let viewController = viewController as? StationViewController {
            configure(viewController)
        }
    }
    
    private func configure(viewController: StationViewController) {
        
        let presenter = StationPresenter()
        let interactor = StationInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
