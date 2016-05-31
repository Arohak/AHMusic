//
//  BaseEventViewOutput.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 06/05/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol BaseEventViewOutput: OpenTrackLinkProtocol, OpenTrackDetailProtocol, FavoriteProtocol, DownloadProtocol, MiniPlayerPlayProtocol, SearchTrackProtocol {
    
    func viewIsReady()
    
}