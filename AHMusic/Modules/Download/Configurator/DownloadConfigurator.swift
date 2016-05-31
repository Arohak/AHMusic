//
//  DownloadConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DownloadModuleConfigurator {

    func configureModuleForController(viewController: AnyObject) {
        
        if let viewController = viewController as? DownloadViewController {
            configure(viewController)
        }
    }
    
    private func configure(viewController: DownloadViewController) {
        
        let presenter = DownloadPresenter()
        let interactor = DownloadInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
