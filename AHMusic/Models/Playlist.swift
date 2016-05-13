//
//  Playlist.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class Playlist : Object {

    dynamic var id = 0
    dynamic var title = ""
    dynamic var desc = ""
    dynamic var duration = 0
    dynamic var publice = true
    dynamic var isLovedTrack = false
    dynamic var collaborative = false
    dynamic var rating = 0
    dynamic var nbTracks = 0
    dynamic var fans = 0
    dynamic var link = ""
    dynamic var share = ""
    dynamic var picture = ""
    dynamic var pictureBig = ""
    dynamic var creationDate = ""
    dynamic var type = ""

    var tracks: List<Track>!

    convenience init(data: JSON) {
        self.init()
        
        self.id = data["id"].intValue
        self.title = data["title"].stringValue
        self.desc = data["description"].stringValue
        self.duration = data["duration"].intValue
        self.publice = data["publice"].boolValue
        self.isLovedTrack = data["is_loved_track"].boolValue
        self.collaborative = data["collaborative"].boolValue
        self.rating = data["rating"].intValue
        self.nbTracks = data["nb_tracks"].intValue
        self.fans = data["fans"].intValue
        self.link = data["link"].stringValue
        self.share = data["share"].stringValue
        self.picture = data["picture"].stringValue
        self.pictureBig = data["picture_big"].stringValue
        self.creationDate = data["creation_date"].stringValue
        self.type = data["type"].stringValue
        
        let tr = data["tracks"]["data"].arrayValue
        if tr.isEmpty {
            self.tracks = List<Track>()
            for item in data["tracks"]["data"].arrayValue {
                self.tracks.append(Track(data: item))
            }
        }
}
    
    override static func primaryKey() -> String {
        return "id"
    }
}
