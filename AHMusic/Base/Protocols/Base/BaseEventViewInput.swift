//
//  BaseEventViewInput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol BaseEventViewInput: class {
    
    func setupInitialState(items: Array<Track>)
}