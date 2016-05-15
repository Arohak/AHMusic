//
//  Header.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class Detail {
    
    var imageStr: String?
    var imageURL: String?
    var info: String?
    var tracks: Array<Track>?

    init(data: JSON) {
        self.imageStr = data["image"].string
        self.imageURL = data["imageURL"].string
        self.info = data["info"].string
        self.tracks = data["tracks"].arrayObject as? Array<Track>
    }
}
