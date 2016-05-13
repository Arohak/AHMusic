//
//  Results.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class Results : Object {

    dynamic var id = 0
    dynamic var readable = true
    dynamic var title = ""
    dynamic var titleShort = ""
    dynamic var titleVersion = ""
    dynamic var link = ""
    dynamic var duration = 0
    dynamic var rank = 0
    dynamic var releaseDate = ""
    dynamic var explicitLyrics = false
    dynamic var preview = ""
    dynamic var type = ""

    dynamic var track: Track!
    dynamic var artist: Artist!
    dynamic var album: Album!


    convenience init(data: JSON) {
        self.init()
        
        self.id = data["id"].intValue
        self.readable = data["readable"].boolValue
        self.title = data["title"].stringValue
        self.titleShort = data["title_short"].stringValue
        self.titleVersion = data["title_version"].stringValue
        self.link = data["link"].stringValue
        self.duration = data["duration"].intValue
        self.rank = data["rank"].intValue
        self.releaseDate = data["release_date"].stringValue
        self.explicitLyrics = data["explicit_lyrics"].boolValue
        self.preview = data["preview"].stringValue
        self.type = data["type"].stringValue
        
        self.track = Track(data: data)
        self.artist = Artist(data: data["artist"])
        self.album = Album(data: data["album"])
}
    
    override static func primaryKey() -> String {
        return "id"
    }
}
