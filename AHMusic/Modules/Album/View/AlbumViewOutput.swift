//
//  AlbumViewOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 12/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol AlbumViewOutput {

    func viewIsReady()
    func openLink(album: Album)
    func openDetail(album: Album)
}
