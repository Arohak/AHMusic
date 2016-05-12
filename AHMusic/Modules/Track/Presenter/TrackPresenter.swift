//
//  TrackPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class TrackPresenter
class TrackPresenter: NSObject {

    var view: TrackViewInput!
    var interactor: TrackInteractorInput!
    
    var items = Array<Track>()
    
    //MARK: - Initilize
    init(items: Array<Track>) {
        super.init()
        
        self.items = items
    }
}

//MARK: - extension for TrackModuleInput
extension TrackPresenter: TrackModuleInput {

}

//MARK: - extension for TrackViewOutput
extension TrackPresenter: TrackViewOutput {
    
    func viewIsReady() {
        view.setupInitialState(self.items)
    }
}

//MARK: - extension for TrackInteractorOutput
extension TrackPresenter: TrackInteractorOutput {
 
}