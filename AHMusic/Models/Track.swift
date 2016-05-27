//
//  Track.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class Track : Object {

    dynamic var id = 0
    dynamic var readable = true
    dynamic var title = ""
    dynamic var titleShort = ""
    dynamic var titleVersion = ""
    dynamic var isrc = ""
    dynamic var link = ""
    dynamic var share = ""
    dynamic var duration = 0
    dynamic var trackPosition = 0
    dynamic var diskNumber = 0
    dynamic var rank = 0
    dynamic var releaseDate = ""
    dynamic var explicitLyrics = false
    dynamic var preview = ""
    dynamic var bpm = 0
    dynamic var gain = 0.0
    
    dynamic var album: Album!
    dynamic var artist: Artist!
    
    dynamic var download = false
    dynamic var favorite = false
    dynamic var played = false

    convenience init(data: JSON) {
        self.init()
        
        self.id = data["id"].intValue
        self.readable = data["readable"].boolValue
        self.title = data["title"].stringValue
        self.titleShort = data["title_short"].stringValue
        self.titleVersion = data["title_version"].stringValue
        self.isrc = data["isrc"].stringValue
        self.link = data["link"].stringValue
        self.share = data["share"].stringValue
        self.duration = data["duration"].intValue
        self.trackPosition = data["track_position"].intValue
        self.diskNumber = data["disk_number"].intValue
        self.rank = data["rank"].intValue
        self.releaseDate = data["release_date"].stringValue
        self.explicitLyrics = data["explicit_lyrics"].boolValue
        self.preview = data["preview"].stringValue
        self.bpm = data["bpm"].intValue
        self.gain = data["gain"].doubleValue
        
        self.album = Album(data: data["album"])
        self.artist = Artist(data: data["artist"])
}
    
    override static func primaryKey() -> String {
        return "id"
    }
}

//class FileInfo {
//    
//    var dealId: String
//    var date: String
//    var name: String
//    var size: Int
//    var uploaded: String
//    var typeIcon: String
//    var type: String
//    var request: Alamofire.Request!
//    var index: Int = 0
//    
//    init(value: File, info: JSON) {
//        self.dealId = value.dealId
//        self.date = value.asOfDate
//        self.name = info["filePath"].stringValue
//        self.size = info["fileSize"].intValue
//        self.uploaded = info["uploadedTs"].stringValue
//        self.typeIcon = self.name.substringFromIndex(self.name.endIndex.advancedBy(-3))
//        self.type = info["type"].stringValue
//    }
//    
//    init(info: FileDownloaded) {
//        self.dealId = info.dealId
//        self.date = info.date
//        self.name = info.name
//        self.typeIcon = info.typeIcon
//        self.type = info.type
//        self.size = Int(info.size)!
//        self.uploaded = info.uploaded
//    }
//}
