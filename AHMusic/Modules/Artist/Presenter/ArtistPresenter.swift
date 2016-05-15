//
//  ArtistPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class ArtistPresenter
class ArtistPresenter {

    var view: ArtistViewInput!
    var interactor: ArtistInteractorInput!
    
    var keyword: String!
    var items = Array<Artist>()
    
    //MARK: - Initilize
    init(name: String) {
        self.keyword = name
    }
    
    init(items: Array<Artist>) {        
        self.items = items
    }
}

//MARK: - extension for ArtistModuleInput
extension ArtistPresenter: ArtistModuleInput {

}

//MARK: - extension for ArtistViewOutput
extension ArtistPresenter: ArtistViewOutput {
    
    func viewIsReady() {
        interactor.searchArtist(keyword)
    }
}

//MARK: - extension for ArtistInteractorOutput
extension ArtistPresenter: ArtistInteractorOutput {
 
    func searchResultIsReady(items: Array<Artist>) {
        view.setupInitialState(items)
    }
}