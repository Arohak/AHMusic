//
//  Category.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class Category : Object {
    
    dynamic var id = 0
    dynamic var name = ""
    dynamic var picture = ""
    dynamic var type = ""

    convenience init(data: JSON) {
        self.init()
        
        self.id = data["id"].intValue
        self.name = data["name"].stringValue
        self.picture = data["picture"].stringValue
        self.type = data["type"].stringValue
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
}
