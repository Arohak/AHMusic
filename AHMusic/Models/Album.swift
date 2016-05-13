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
    dynamic var nbTracks = 0
    dynamic var duration = 0
    dynamic var fans = 0
    dynamic var rating = 0
    dynamic var releaseDate = ""
    dynamic var tracklist = ""
    dynamic var type = ""
    
    dynamic var artist: Artist!
    var tracks: List<Track>!
    var categories: List<Category>!

    convenience init(data: JSON) {
        self.init()
        
        self.id = data["id"].intValue
        self.title = data["title"].stringValue
        self.link = data["link"].stringValue
        self.cover = data["cover"].stringValue
        self.coverBig = data["cover_big"].stringValue
        self.duration = data["duration"].intValue
        self.rating = data["rating"].intValue
        self.nbTracks = data["nb_tracks"].intValue
        self.fans = data["fans"].intValue
        self.releaseDate = data["release_date"].stringValue
        self.tracklist = data["tracklist"].stringValue
        self.type = data["type"].stringValue
        
        self.artist = Artist(data: data["artist"])
        
        let tr = data["tracks"]["data"].arrayValue
        if tr.isEmpty {
            self.tracks = List<Track>()
            for item in tr {
                self.tracks.append(Track(data: item))
            }
        }
        
        let genres = data["genres"]["data"].arrayValue
        if genres.isEmpty {
            self.categories = List<Category>()
            for item in genres {
                self.categories.append(Category(data: item))
            }
        }
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
}