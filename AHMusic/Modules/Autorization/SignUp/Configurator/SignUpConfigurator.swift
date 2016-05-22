//
//  SignUpConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SignUpModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? SignUpPresenter {
            configure(presenter)
        }
    }

    private func configure(presenter: SignUpPresenter) {
        
        let viewController = SignUpViewController()
        let interactor = SignUpInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
