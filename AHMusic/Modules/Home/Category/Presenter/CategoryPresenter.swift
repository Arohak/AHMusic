//
//  CategoryPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class CategoryPresenter -
class CategoryPresenter  {

    var view: CategoryViewInput!
    var interactor: CategoryInteractorInput!
    
    var keyword: String!
}

//MARK: - extension for CategoryModuleInput -
extension CategoryPresenter: CategoryModuleInput {

}

//MARK: - extension for CategoryViewOutput -
extension CategoryPresenter: CategoryViewOutput {
    
    func viewIsReady() {
        interactor.getCategoryItems()
    }
    
    func viewIsSelectItem(item: Category) {
        keyword = item.name
        interactor.searchItems(item.name)
    }
}

//MARK: - extension for CategoryInteractorOutput -
extension CategoryPresenter: CategoryInteractorOutput {
 
    func dataIsReady(items: Array<Category>) {
        view.categoryDataIsReady(items)
    }
    
    func searchDataIsReady(items: Array<Results>) {
        if let slide = UIHelper.root().viewControllers[0] as? SlideViewController {
            let tab = TabViewController(keyword: keyword)
            slide.changeMainViewController(tab,  close: true)
            slide.tab = tab
        }
    }
}