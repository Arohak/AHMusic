//
//  CategoryInteractor.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class CategoryInteractor
class CategoryInteractor {

    weak var output: CategoryInteractorOutput!
    
}

//MARK: - extension for CategoryInteractorInput
extension CategoryInteractor: CategoryInteractorInput {
    
    func getCategoryItems() {
        let items: Array<(String, String)> = [("Rock", "img_ca_rock"),
                                              ("Blue", "img_ca_blue"),
                                              ("Classic Rock", "img_ca_classic"),
                                              ("Jazz", "img_ca_jazz"),
                                              ("Soul", "img_ca_soul"),
                                              ("Pop", "img_ca_pop")]
        var temp = Array<Category>()
        for item in items {
            temp.append(Category(data: JSON(["name" : item.0, "image" : item.1])))
        }
        
        output.dataIsReady(temp)
    }
    
    func searchItems(name: String) {
        _ = apiHelper.rx_Search(name)
            .subscribeNext({ data in
                var temp = Array<Category>()
                self.output.searchDataIsReady(temp)
            })
    }
}
