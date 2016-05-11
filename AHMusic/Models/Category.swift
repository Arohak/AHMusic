//
//  Category.swift
//  AHMusic
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class Category : Object {
    
    dynamic var name = ""
    dynamic var image = ""
    
    convenience init(data: JSON) {
        self.init()
        
        self.name = data["name"].stringValue
        self.image = data["image"].stringValue
    }
    
    override static func primaryKey() -> String {
        return "name"
    }
}
