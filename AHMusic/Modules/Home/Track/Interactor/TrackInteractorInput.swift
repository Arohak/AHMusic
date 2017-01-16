//
//  TrackInteractorInput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol TrackInteractorInput: GetAlbumProtocol, GetArtistProtocol, GetTrackProtocol {

    func searchTrack(_ name: String)
}
