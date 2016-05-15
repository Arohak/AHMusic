//
//  DetailPresenter.swift
//  AHMusic
//
//  Created by AroHak on 15/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class DetailPresenter
class DetailPresenter {

    var view: DetailViewInput!
    var interactor: DetailInteractorInput!
}

//MARK: - extension for DetailModuleInput
extension DetailPresenter: DetailModuleInput {

}

//MARK: - extension for DetailViewOutput
extension DetailPresenter: DetailViewOutput {
    
    func viewIsReady() {
        
    }
}

//MARK: - extension for DetailInteractorOutput
extension DetailPresenter: DetailInteractorOutput {
 
}