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
        let categories = ["Pop", "Rock", "Methal", "", "", "", "", ""]
        var temp = Array<Category>()
        for item in categories {
            temp.append(Category(data: JSON(["name" : item, "image" : ""])))
        }
        
        output.dataIsReady(temp)
    }
}
