//
//  Events.swift
//  AHMusic
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

struct TrackEvent {
    
    var result: Track!
    
    init(result: Track) {
        self.result = result
    }
    
    struct DealRunID {
        var dealRunID: String
        
        init(dealRunID: String) {
            self.dealRunID = dealRunID
        }
    }
}