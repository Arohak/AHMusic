//
//  SignUpConfigurator.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class SignUpModuleConfigurator {

    func configureModuleForPresenter(_ presenter: AnyObject) {
        
        if let presenter = presenter as? SignUpPresenter {
            configure(presenter)
        }
    }

    fileprivate func configure(_ presenter: SignUpPresenter) {
        
        let viewController = SignUpViewController()
        let interactor = SignUpInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
