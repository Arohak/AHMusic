//
//  SettingsPresenter.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class SettingsPresenter -
class SettingsPresenter {

    var view: SettingsViewInput!
    var interactor: SettingsInteractorInput!
}

//MARK: - extension for SettingsModuleInput -
extension SettingsPresenter: SettingsModuleInput {

}

//MARK: - extension for SettingsViewOutput -
extension SettingsPresenter: SettingsViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for SettingsInteractorOutput -
extension SettingsPresenter: SettingsInteractorOutput {
 
}