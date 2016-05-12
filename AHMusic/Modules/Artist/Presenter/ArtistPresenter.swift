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
}

//MARK: - extension for ArtistModuleInput
extension ArtistPresenter: ArtistModuleInput {

}

//MARK: - extension for ArtistViewOutput
extension ArtistPresenter: ArtistViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for ArtistInteractorOutput
extension ArtistPresenter: ArtistInteractorOutput {
 
}