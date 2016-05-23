//
//  FavoriteViewInput.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol FavoriteViewInput: MiniPlayerProtocol {

    func setupInitialState(items: Array<Track>)
}