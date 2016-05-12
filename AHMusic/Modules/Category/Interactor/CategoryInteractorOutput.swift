//
//  CategoryInteractorOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol CategoryInteractorOutput: class {

    func dataIsReady(items: Array<Category>)
    func searchDataIsReady(items: Array<Result>)
}
