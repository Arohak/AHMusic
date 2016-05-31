//
//  FavoriteInteractorOutput.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol FavoriteInteractorOutput: class {

    func dbResultIsReady(items: Array<Track>)
    func getTrackResultIsReady(track: Track, tracks: Array<Track>)
}
