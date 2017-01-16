//
//  DownloadConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DownloadModuleConfigurator {

    func configureModuleForController(_ viewController: AnyObject) {
        
        if let viewController = viewController as? DownloadViewController {
            configure(viewController)
        }
    }
    
    fileprivate func configure(_ viewController: DownloadViewController) {
        
        let presenter = DownloadPresenter()
        let interactor = DownloadInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
