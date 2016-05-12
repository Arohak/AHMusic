//
//  CategoryPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class CategoryPresenter
class CategoryPresenter  {

    var view: CategoryViewInput!
    var interactor: CategoryInteractorInput!
}

//MARK: - extension for CategoryModuleInput
extension CategoryPresenter: CategoryModuleInput {

}

//MARK: - extension for CategoryViewOutput
extension CategoryPresenter: CategoryViewOutput {
    
    func viewIsReady() {
        interactor.getCategoryItems()
    }
    
    func viewIsSelectItem(item: Category) {
        interactor.searchItems(item.name)
    }
}

//MARK: - extension for CategoryInteractorOutput
extension CategoryPresenter: CategoryInteractorOutput {
 
    func dataIsReady(items: Array<Category>) {
        view.categoryDataIsReady(items)
    }
    
    func searchDataIsReady(items: Array<Result>) {
        if let firstVC = rootVC.viewControllers[0] as? SlideViewController {
            firstVC.slideMenuController()!.changeMainViewController(TabViewController(data: items),  close: true)
        }
    }
}