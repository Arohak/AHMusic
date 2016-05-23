//
//  TrackInteractorOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol TrackInteractorOutput: BaseInteratosOutput {

    func searchResultIsReady(items: Array<Track>)
}
