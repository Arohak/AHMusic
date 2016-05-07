//
//  AlbumPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class AlbumPresenter: AlbumModuleInput, AlbumViewOutput, AlbumInteractorOutput{

    weak var view: AlbumViewInput!
    var interactor: AlbumInteractorInput!
    var router: AlbumRouterInput!

    func viewIsReady() {

    }
}
