//
//  PlaylistViewOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol PlaylistViewOutput {

    func viewIsReady()
    func openLink(playlist: Playlist)
    func openDetail(playlist: Playlist)
}
