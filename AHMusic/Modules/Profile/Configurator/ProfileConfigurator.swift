//
//  ProfileConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class ProfileModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? ProfilePresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: ProfilePresenter) {
        
        let viewController = ProfileViewController()
        let interactor = ProfileInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
