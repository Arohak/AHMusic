//
//  CategoryPresenter.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class CategoryPresenter -
class CategoryPresenter  {

    weak var view: CategoryViewInput!
    var interactor: CategoryInteractorInput!
    
    var keyword: String!
}

//MARK: - extension for CategoryViewOutput -
extension CategoryPresenter: CategoryViewOutput {
    
    func viewIsReady() {
        interactor.getCategoryItems()
    }
    
    func viewIsSelectItem(_ item: Category) {
        keyword = item.name
        interactor.searchItems(item.name)
    }
}

//MARK: - extension for CategoryInteractorOutput -
extension CategoryPresenter: CategoryInteractorOutput {
 
    func dataIsReady(_ items: Array<Category>) {
        view.categoryDataIsReady(items)
    }
    
    func searchDataIsReady(_ items: Array<Result>) {
        if let slide = UIHelper.root().viewControllers[0] as? SlideViewController {
            let tab = TabViewController(keyword: keyword)
            slide.changeMainViewController(tab,  close: true)
            slide.tab = tab
        }
    }
}
