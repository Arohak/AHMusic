//
//  SettingsPresenter.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SettingsPresenter -
class SettingsPresenter {

    weak var view: SettingsViewInput!
    weak var viewDetail: SettingsDetailViewInput!
    var interactor: SettingsInteractorInput!
}

//MARK: - extension for SettingsModuleInput -
extension SettingsPresenter: SettingsModuleInput {

}

//MARK: - extension for SettingsViewOutput -
extension SettingsPresenter: SettingsViewOutput {
    
    func viewIsReady() {
        
    }
    
    func detail() {
//        let vc = SettingsDetailViewController()
//        viewDetail = vc
//        (viewDetail as! SettingsDetailViewController).output = self
//        
//        UIHelper.root().pushViewController(vc, animated: true)
    }
}

//MARK: - extension for SettingsDetailViewOutput -
extension SettingsPresenter: SettingsDetailViewOutput {
    
    func viewDetailIsReady() {
       viewDetail.setupInitialState("Test _AAA_ Test")
    }
    
    func alert() {
        interactor.showAlert()
    }
}

//MARK: - extension for SettingsInteractorOutput -
extension SettingsPresenter: SettingsInteractorOutput {
 
    func showAlertIsReady() {
        print("__ OK __")
    }
}