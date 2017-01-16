//
//  CategoryInteractor.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - class CategoryInteractor -
class CategoryInteractor {

    weak var output: CategoryInteractorOutput!
    
}

//MARK: - extension for CategoryInteractorInput -
extension CategoryInteractor: CategoryInteractorInput {
    
    func getCategoryItems() {
        _ = apiHelper.rx_GetCategories()
            .subscribe(onNext: { result in
                var temp = Array<Category>()
                for item in result["data"].arrayValue {
                    let result = Category(data: item)
                    temp.append(result)
                }
                
                self.output.dataIsReady(temp)
            })
    }
    
    func searchItems(_ name: String) {
        _ = apiHelper.rx_Search(name: name)
            .subscribe(onNext: { result in
                var temp = Array<Result>()
                for item in result["data"].arrayValue {
                    let result = Result(data: item)
                    temp.append(result)
                }
                
                self.output.searchDataIsReady(temp)
            })
    }
}
