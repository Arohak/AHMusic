//
//  SignInConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SignInModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? SignInPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: SignInPresenter) {
        
        let viewController = SignInViewController()
        let interactor = SignInInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
