//
//  CategoryPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class CategoryPresenter: CategoryModuleInput, CategoryViewOutput, CategoryInteractorOutput {

    var view: CategoryViewInput!
    var interactor: CategoryInteractorInput!
    var router: CategoryRouterInput!

    func viewIsReady() {
        
    }
}
