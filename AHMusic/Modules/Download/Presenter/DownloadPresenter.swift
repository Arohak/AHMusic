//
//  DownloadPresenter.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DownloadPresenter -
class DownloadPresenter {

    var view: DownloadViewInput!
    var interactor: DownloadInteractorInput!
}

//MARK: - extension for DownloadModuleInput -
extension DownloadPresenter: DownloadModuleInput {

}

//MARK: - extension for DownloadViewOutput -
extension DownloadPresenter: DownloadViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for DownloadInteractorOutput -
extension DownloadPresenter: DownloadInteractorOutput {
 
}