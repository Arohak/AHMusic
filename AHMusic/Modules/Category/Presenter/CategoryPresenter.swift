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

    //MARK: - CategoryViewOutput
    func viewIsReady() {
        interactor.getCategoryItems()
    }
    
    func viewIsSelectItem(item: Category) {
//        let detailPresenter = DetailPresenter(city: item.name)
//        _ = DetailModuleInitializer(presentor: detailPresenter)
        
        let nav = appDelegate.window?.rootViewController as! UINavigationController
//        view.push(nav, toVC: detailPresenter.view as! UIViewController)
    }
    
    //MARK: - CategoryInteractorOutput
    func dataIsReady(items: Array<Category>) {
        view.categoryDataIsReady(items)
    }
}
