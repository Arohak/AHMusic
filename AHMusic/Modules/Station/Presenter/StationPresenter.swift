//
//  StationPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class StationPresenter: StationModuleInput, StationViewOutput, StationInteractorOutput{

    var view: StationViewInput!
    var interactor: StationInteractorInput!
    var router: StationRouterInput!

    func viewIsReady() {

    }
}
