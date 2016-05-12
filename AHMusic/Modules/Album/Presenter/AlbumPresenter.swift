//
//  AlbumPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class AlbumPresenter
class AlbumPresenter {

    var view: AlbumViewInput!
    var interactor: AlbumInteractorInput!
}

//MARK: - extension for AlbumModuleInput
extension AlbumPresenter: AlbumModuleInput {

}

//MARK: - extension for AlbumViewOutput
extension AlbumPresenter: AlbumViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for AlbumInteractorOutput
extension AlbumPresenter: AlbumInteractorOutput {
 
}