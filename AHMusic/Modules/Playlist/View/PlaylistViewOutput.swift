//
//  PlaylistViewOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol PlaylistViewOutput: BaseViewOutput {

    func openLink(playlist: Playlist)
    func openDetail(playlist: Playlist)
}
