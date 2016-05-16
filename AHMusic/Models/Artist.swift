//
//  Artist.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class Artist : Object {

    dynamic var id = 0
    dynamic var name = ""
    dynamic var link = ""
    dynamic var share = ""
    dynamic var picture = ""
    dynamic var pictureBig = ""
    dynamic var nbAlbum = 0
    dynamic var nbFan = 0
    dynamic var radio = true
    dynamic var tracklist = ""
    dynamic var type = ""
    
    convenience init(data: JSON) {
        self.init()
        
        self.id = data["id"].intValue
        self.name = data["name"].stringValue
        self.link = data["link"].stringValue
        self.share = data["share"].stringValue
        self.picture = data["picture"].stringValue
        self.pictureBig = data["picture_big"].stringValue
        self.nbAlbum = data["nb_album"].intValue
        self.nbFan = data["nb_fan"].intValue
        self.radio = data["radio"].boolValue
        self.tracklist = data["tracklist"].stringValue
        self.type = data["type"].stringValue
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
}
