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
        interactor.searchItems(item.name)
    }
    
    //MARK: - CategoryInteractorOutput
    func dataIsReady(items: Array<Category>) {
        view.categoryDataIsReady(items)
    }
    
    func searchDataIsReady(items: Array<Category>) {
        let vc = view as! UIViewController
        vc.slideMenuController()!.changeMainViewController(TabViewController(),  close: true)
    }
}
