//
//  FavoriteInteractorOutput.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol FavoriteInteractorOutput: BaseInteratosOutput {

    func getDBResultIsReady(items: Array<Track>)
}
