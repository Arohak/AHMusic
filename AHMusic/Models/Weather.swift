//
//  Weather.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//class Weather : Object {
//    
//    dynamic var name = ""
//    dynamic var location: Location!
//    dynamic var current: Current!
//    
//    convenience init(data: JSON) {
//        self.init()
//        
//        self.location = Location(data: data["location"])
//        self.current = Current(data: data["current"])
//        self.name = location.name
//    }
//    
//    override static func primaryKey() -> String {
//        return "name"
//    }
//}
//
//class Location : Object {
//    
//    dynamic var name: String!
//    dynamic var lat: String!
//    dynamic var lon: String!
//    dynamic var localTime: String!
//    
//    convenience init(data: JSON) {
//        self.init()
//        
//        self.name = data["name"].stringValue
//        self.lon = data["lon"].stringValue
//        self.lat = data["lat"].stringValue
//        self.localTime = data["localtime"].stringValue
//    }
//}
//
//class Current : Object {
//    
//    dynamic var lastUpdated: String!
//    dynamic var tempC: String!
//    dynamic var tempF: String!
//    dynamic var mphW: String!
//    dynamic var kphW: String!
//    dynamic var mbP: String!
//    dynamic var inP: String!
//    dynamic var feelslikeC: String!
//    dynamic var feelslikeF: String!
//    dynamic var condition: Condition!
//    
//    convenience init(data: JSON) {
//        self.init()
//        
//        self.lastUpdated = data["last_updated"].stringValue
//        self.tempC = Utils.formateString(data["temp_c"].stringValue)
//        self.tempF = Utils.formateString(data["temp_f"].stringValue)
//        self.mphW = Utils.formateString(data["wind_mph"].stringValue)
//        self.kphW = Utils.formateString(data["wind_kph"].stringValue)
//        self.mbP = Utils.formateString(data["pressure_mb"].stringValue)
//        self.inP = Utils.formateString(data["pressure_in"].stringValue)
//        self.feelslikeC = Utils.formateString(data["feelslike_c"].stringValue)
//        self.feelslikeF = Utils.formateString(data["feelslike_f"].stringValue)
//        self.condition = Condition(data: data["condition"])
//    }
//}
//
//class Condition : Object {
//    
//    dynamic var text: String!
//    dynamic var icon: String!
//    dynamic var code: String!
//    
//    convenience init(data: JSON) {
//        self.init()
//        
//        self.text = data["text"].stringValue
//        self.icon = data["icon"].stringValue
//        self.code = data["code"].stringValue
//    }
//}
