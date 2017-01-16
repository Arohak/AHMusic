//
//  ProfileConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class ProfileModuleConfigurator {

    func configureModuleForController(_ viewController: AnyObject) {
        
        if let viewController = viewController as? ProfileViewController {
            configure(viewController)
        }
    }
    
    fileprivate func configure(_ viewController: ProfileViewController) {
        
        let presenter = ProfilePresenter()
        let interactor = ProfileInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
