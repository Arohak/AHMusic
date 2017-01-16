//
//  StationConfigurator.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class StationModuleConfigurator {

    func configureModuleForController(_ viewController: AnyObject) {
        
        if let viewController = viewController as? StationViewController {
            configure(viewController)
        }
    }
    
    fileprivate func configure(_ viewController: StationViewController) {
        
        let presenter = StationPresenter()
        let interactor = StationInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
