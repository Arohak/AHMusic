//
//  FavoriteInteractorOutput.swift
//  AHMusic
//
//  Created by AroHak on 22/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol FavoriteInteractorOutput: class {

    func dbResultIsReady(_ items: Array<Track>)
    func getTrackResultIsReady(_ track: Track, tracks: Array<Track>)
}
