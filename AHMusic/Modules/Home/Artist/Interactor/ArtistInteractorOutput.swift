//
//  ArtistInteractorOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol ArtistInteractorOutput: class {

    func searchResultIsReady(_ items: Array<Artist>)
    func getResultIsReady(_ artist: Artist, tracks: Array<Track>)
}
