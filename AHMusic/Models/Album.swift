//
//  Album.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class Album : Object {

    dynamic var id = 0
    dynamic var title = ""
    dynamic var link = ""
    dynamic var cover = ""
    dynamic var coverBig = ""
    dynamic var releaseDate = ""
    dynamic var tracklist = ""
    dynamic var type = ""
    
    convenience init(data: JSON) {
        self.init()
        
        self.id = data["id"].intValue
        self.title = data["title"].stringValue
        self.link = data["link"].stringValue
        self.cover = data["cover"].stringValue
        self.coverBig = data["cover_big"].stringValue
        self.releaseDate = data["release_date"].stringValue
        self.tracklist = data["tracklist"].stringValue
        self.type = data["type"].stringValue
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
}