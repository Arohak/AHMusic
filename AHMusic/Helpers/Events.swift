//
//  Events.swift
//  AHMusic
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

enum MPState {
    case play
    case pause
    case stop
    case change
}

struct MiniPlayerEvent {
    
    var result: Track!
    var state: MPState = .pause
    
    init(result: Track, state: MPState) {
        self.result = result
        self.state = state
    }
}
