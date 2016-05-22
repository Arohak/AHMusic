//
//  DownloadConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DownloadModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? DownloadPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: DownloadPresenter) {
        
        let viewController = DownloadViewController()
        let interactor = DownloadInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
