//
//  ArtistPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class ArtistPresenter
class ArtistPresenter: NSObject {

    var view: ArtistViewInput!
    var interactor: ArtistInteractorInput!
    
    var items = Array<Artist>()
    
    //MARK: - Initilize
    init(items: Array<Artist>) {
        super.init()
        
        self.items = items
    }
}

//MARK: - extension for ArtistModuleInput
extension ArtistPresenter: ArtistModuleInput {

}

//MARK: - extension for ArtistViewOutput
extension ArtistPresenter: ArtistViewOutput {
    
    func viewIsReady() {
        view.setupInitialState(items)
    }
}

//MARK: - extension for ArtistInteractorOutput
extension ArtistPresenter: ArtistInteractorOutput {
 
}