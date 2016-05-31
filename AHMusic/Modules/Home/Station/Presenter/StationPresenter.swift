//
//  StationPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class StationPresenter -
class StationPresenter {

    weak var view: StationViewInput!
    var interactor: StationInteractorInput!
}

//MARK: - extension for StationViewOutput -
extension StationPresenter: StationViewOutput {
    
    func viewIsReady(keyword: String) {

    }
}

//MARK: - extension for StationInteractorOutput -
extension StationPresenter: StationInteractorOutput {
 
}