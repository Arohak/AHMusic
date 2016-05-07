//
//  PlaylistPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class PlaylistPresenter: PlaylistModuleInput, PlaylistViewOutput, PlaylistInteractorOutput{

    var view: PlaylistViewInput!
    var interactor: PlaylistInteractorInput!
    var router: PlaylistRouterInput!

    func viewIsReady() {

    }
}
