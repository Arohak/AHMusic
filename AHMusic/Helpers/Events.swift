//
//  Events.swift
//  AHMusic
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

enum MPState {
    case Play
    case Pause
    case Stop
    case Change
}

struct MiniPlayerEvent {
    
    var result: Track!
    var state: MPState = .Pause
    
    init(result: Track, state: MPState) {
        self.result = result
        self.state = state
    }
}