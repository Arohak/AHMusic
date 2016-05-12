//
//  PlaylistPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class PlaylistPresenter
class PlaylistPresenter {

    var view: PlaylistViewInput!
    var interactor: PlaylistInteractorInput!
}

//MARK: - extension for PlaylistModuleInput
extension PlaylistPresenter: PlaylistModuleInput {

}

//MARK: - extension for PlaylistViewOutput
extension PlaylistPresenter: PlaylistViewOutput {
    
    func viewIsReady() {

    }
}

//MARK: - extension for PlaylistInteractorOutput
extension PlaylistPresenter: PlaylistInteractorOutput {
 
}