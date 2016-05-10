//
//  CategoryInteractor.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class CategoryInteractor: CategoryInteractorInput {

    weak var output: CategoryInteractorOutput!
    
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
}
